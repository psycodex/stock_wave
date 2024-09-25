import json
import random
from datetime import datetime
from pathlib import Path

from constants import USER_AGENTS


class DateEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, datetime):
            return o.isoformat()
        return super().default(o)


def random_user_agent():
    """
    This function selects a random User-Agent from the User-Agent list, . User-Agents are used in
    order to avoid the limitations of the requests to morningstar.com. The User-Agent is
    specified on the headers of the requests and is different for every request.

    Returns:
        :obj:`str` - user_agent:
            The returned :obj:`str` is the name of a random User-Agent, which will be passed on the
            headers of a request so to avoid restrictions due to the use of multiple requests from the
            same User-Agent.

    """
    return random.choice(USER_AGENTS)


def load_json(f_path: Path):
    return json.loads(f_path.read_bytes())


def write_json(f_path: Path, data):
    f_path.write_text(json.dumps(data, indent=3, cls=DateEncoder))
