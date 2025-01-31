from .base import *


if os.getenv('DEBUG', 'dev') == 'prod':
   from .release import *
else:
   from .dev import *
