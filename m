Content-Type: multipart/mixed; boundary="===============5346382977306099416=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH jfern] FIXUP: sched_core_syscall_protected can be static
Date: Fri, 15 Jan 2021 20:56:56 +0800
Message-ID: <20210115125656.GA79726@c9a8167e033b>
In-Reply-To: <202101152015.Ynbe7UUT-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5346382977306099416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 0cae4d526e66 ("FIXUP: Add a ht_protect=3D kernel cmdline option.")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 core.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 87f4d4d502895ca..1da04c7871efa40 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -76,9 +76,9 @@ __read_mostly int scheduler_running;
 =

 #ifdef CONFIG_SCHED_CORE
 =

-DEFINE_STATIC_KEY_FALSE(sched_core_syscall_protected);
-DEFINE_STATIC_KEY_FALSE(sched_core_irq_protected);
-DEFINE_STATIC_KEY_FALSE(sched_core_kvm_protected);
+static DEFINE_STATIC_KEY_FALSE(sched_core_syscall_protected);
+static DEFINE_STATIC_KEY_FALSE(sched_core_irq_protected);
+static DEFINE_STATIC_KEY_FALSE(sched_core_kvm_protected);
 =

 static int __init set_sched_core_ht_protect(char *str)
 {
--===============5346382977306099416==--

