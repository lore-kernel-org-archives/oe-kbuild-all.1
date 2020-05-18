Content-Type: multipart/mixed; boundary="===============7312219390435553589=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH linus] RISC-V: gp_in_global can be static
Date: Mon, 18 May 2020 13:02:27 +0800
Message-ID: <20200518050227.GA13086@f1dbffaf4744>
In-Reply-To: <202005181328.2fITyRLh%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7312219390435553589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 52e7c52d2ded ("RISC-V: Stop relying on GCC's register allocator's hu=
eristics")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 process.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 610c11e916068..3b2933839d492 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -22,7 +22,7 @@
 #include <asm/switch_to.h>
 #include <asm/thread_info.h>
 =

-unsigned long gp_in_global __asm__("gp");
+static unsigned long gp_in_global __asm__("gp");
 =

 extern asmlinkage void ret_from_fork(void);
 extern asmlinkage void ret_from_kernel_thread(void);
--===============7312219390435553589==--

