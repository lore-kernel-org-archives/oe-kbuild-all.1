Content-Type: multipart/mixed; boundary="===============0196733956153464219=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH peterz-queue] sched: sched_cpu_rcu_state can be static
Date: Wed, 20 Jan 2021 05:57:07 +0800
Message-ID: <20210119215707.GA37294@9c635d14d680>
In-Reply-To: <202101200518.tCbOqt8z-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0196733956153464219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 84897bc5a39d ("sched: Fix hotplug vs ttwu race")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ffe003d086b65db..f29b00de25b67ec 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7507,7 +7507,7 @@ int sched_cpu_activate(unsigned int cpu)
 }
 =

 /* Serialized by hotplug lock write side. */
-unsigned long sched_cpu_rcu_state;
+static unsigned long sched_cpu_rcu_state;
 =

 int sched_cpu_deactivate(unsigned int cpu)
 {
--===============0196733956153464219==--

