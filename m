Content-Type: multipart/mixed; boundary="===============7868923374738344475=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] sched/fair: __refill_cfs_bandwidth_runtime() can be static
Date: Thu, 21 Jan 2021 06:01:58 +0800
Message-ID: <20210120220158.GA48439@379ff2649fda>
In-Reply-To: <20210120122715.29493-3-changhuaixin@linux.alibaba.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7868923374738344475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 fair.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8be4651ae482dc..bf2259494136b0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4620,7 +4620,7 @@ static inline u64 sched_cfs_bandwidth_slice(void)
  *
  * requires cfs_b->lock
  */
-void __refill_cfs_bandwidth_runtime(struct cfs_bandwidth *cfs_b, u64 overr=
un)
+static void __refill_cfs_bandwidth_runtime(struct cfs_bandwidth *cfs_b, u6=
4 overrun)
 {
 	u64 refill;
=20
--===============7868923374738344475==--

