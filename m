Content-Type: multipart/mixed; boundary="===============1590049614717183515=="
MIME-Version: 1.0
From: Zhen Lei <thunder.leizhen@huawei.com>
To: kbuild-all@lists.01.org
Subject: [PATCH v2 0/1] clocksource: sp804: add static for functions such as sp804_clockevents_init()
Date: Wed, 21 Oct 2020 09:22:58 +0800
Message-ID: <20201021012259.2067-1-thunder.leizhen@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1590049614717183515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

v1 --> v2:
Add warning information into the description of this patch.  And correct
the commit-id of "Fixes:", the old one is come from linux-next, but it's
changed when merged into v5.10-rc1.


Zhen Lei (1):
  clocksource: sp804: add static for functions such as
    sp804_clockevents_init()

 drivers/clocksource/timer-sp804.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- =

1.8.3


--===============1590049614717183515==--

