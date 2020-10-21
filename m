Content-Type: multipart/mixed; boundary="===============1874583514936737634=="
MIME-Version: 1.0
From: Zhen Lei <thunder.leizhen@huawei.com>
To: kbuild-all@lists.01.org
Subject: [PATCH v2 1/1] clocksource: sp804: add static for functions such as sp804_clockevents_init()
Date: Wed, 21 Oct 2020 09:22:59 +0800
Message-ID: <20201021012259.2067-2-thunder.leizhen@huawei.com>
In-Reply-To: <20201021012259.2067-1-thunder.leizhen@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1874583514936737634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Add static for sp804_clocksource_and_sched_clock_init() and
sp804_clockevents_init(), they are only used in timer-sp804.c now.
Otherwise, the following warning will be reported:

drivers/clocksource/timer-sp804.c:68:12: warning: no previous prototype \
for 'sp804_clocksource_and_sched_clock_init' [-Wmissing-prototypes]
drivers/clocksource/timer-sp804.c:162:12: warning: no previous prototype \
for 'sp804_clockevents_init' [-Wmissing-prototypes]

Fixes: 975434f8b24a ("clocksource/drivers/sp804: Delete the leading "__" of=
 some functions")
Fixes: 65f4d7ddc7b6 ("clocksource/drivers/sp804: Remove unused sp804_timer_=
disable() and timer-sp804.h")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/clocksource/timer-sp804.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/timer-sp804.c b/drivers/clocksource/timer-=
sp804.c
index 6e8ad4a4ea3c737..db5330cc49bca72 100644
--- a/drivers/clocksource/timer-sp804.c
+++ b/drivers/clocksource/timer-sp804.c
@@ -117,10 +117,10 @@ static u64 notrace sp804_read(void)
 	return ~readl_relaxed(sched_clkevt->value);
 }
 =

-int __init sp804_clocksource_and_sched_clock_init(void __iomem *base,
-						  const char *name,
-						  struct clk *clk,
-						  int use_sched_clock)
+static int __init sp804_clocksource_and_sched_clock_init(void __iomem *bas=
e,
+							 const char *name,
+							 struct clk *clk,
+							 int use_sched_clock)
 {
 	long rate;
 	struct sp804_clkevt *clkevt;
@@ -216,8 +216,8 @@ static int sp804_set_next_event(unsigned long next,
 	.rating			=3D 300,
 };
 =

-int __init sp804_clockevents_init(void __iomem *base, unsigned int irq,
-				  struct clk *clk, const char *name)
+static int __init sp804_clockevents_init(void __iomem *base, unsigned int =
irq,
+					 struct clk *clk, const char *name)
 {
 	struct clock_event_device *evt =3D &sp804_clockevent;
 	long rate;
-- =

1.8.3


--===============1874583514936737634==--

