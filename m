Content-Type: multipart/mixed; boundary="===============0303733796798414389=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: arch/powerpc/kernel/optprobes.c:34:1: error: unused function 'is_kprobe_ppc_optinsn_slot'
Date: Thu, 13 May 2021 00:06:49 +0900
Message-ID: <20210513000649.23ac7bc69e30d8b9421a6ff6@kernel.org>
In-Reply-To: <20210512215057.6875aeaf67fb31495ab29987@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0303733796798414389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021 21:50:57 +0900
Masami Hiramatsu <mhiramat@kernel.org> wrote:

> On Wed, 12 May 2021 11:52:30 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> > =

> > Le 12/05/2021 =C3=A0 11:36, Christophe Leroy a =C3=A9crit=C2=A0:
> > > =

> > > =

> > > Le 11/05/2021 =C3=A0 20:46, Nathan Chancellor a =C3=A9crit=C2=A0:
> > >> On 5/11/2021 9:47 AM, Christophe Leroy wrote:
> > >>> Hi All,
> > >>>
> > >>> Le 11/05/2021 =C3=A0 18:30, kernel test robot a =C3=A9crit=C2=A0:
> > >>>> Hi Christophe,
> > >>>>
> > >>>> First bad commit (maybe !=3D root cause):
> > >>>>
> > >>>> tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git master
> > >>>> head:=C2=A0=C2=A0 1140ab592e2ebf8153d2b322604031a8868ce7a5
> > >>>> commit: eacf4c0202654adfa94bbb17b5c5c77c0be14af8 powerpc: Enable O=
PTPROBES on PPC32
> > > =

> > > Ok, the problem appears on PPC32 with that patch, but it must have be=
en there on PPC64 since the =

> > > implementation of optprobes with commit 51c9c0843993 ("powerpc/kprobe=
s: Implement Optprobes")
> > > =

> > > =

> > >>>> date:=C2=A0=C2=A0 3 weeks ago
> > >>>> config: powerpc-randconfig-r033-20210511 (attached as .config)
> > >>>> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-proje=
ct =

> > >>>> a0fed635fe1701470062495a6ffee1c608f3f1bc)
> > >>>
> > >>> A clang issue ?
> > >>>
> > >>>
> > >>>> reproduce (this is a W=3D1 build):
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget https://raw.=
githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O =

> > >>>> ~/bin/make.cross
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/ma=
ke.cross
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # install powerpc=
 cross compiling tool for clang build
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # apt-get install=
 binutils-powerpc-linux-gnu
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =

> > >>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/?id=3Deacf4c0202654adfa94bbb17b5c5c77c0be14af8 =

> > >>>>
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add li=
nus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no-ta=
gs linus master
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout eacf=
4c0202654adfa94bbb17b5c5c77c0be14af8
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attach=
ed .config to linux build tree
> > >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_=
PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D1 ARCH=3Dpowerpc
> > >>>>
> > >>>> If you fix the issue, kindly add following tag as appropriate
> > >>>> Reported-by: kernel test robot <lkp@intel.com>
> > >>>>
> > >>>> All errors (new ones prefixed by >>):
> > >>>>
> > >>>>>> arch/powerpc/kernel/optprobes.c:34:1: error: unused function 'is=
_kprobe_ppc_optinsn_slot' =

> > >>>>>> [-Werror,-Wunused-function]
> > >>>> =C2=A0=C2=A0=C2=A0 DEFINE_INSN_CACHE_OPS(ppc_optinsn);
> > >>>> =C2=A0=C2=A0=C2=A0 ^
> > >>>> =C2=A0=C2=A0=C2=A0 include/linux/kprobes.h:306:20: note: expanded =
from macro 'DEFINE_INSN_CACHE_OPS'
> > >>>> =C2=A0=C2=A0=C2=A0 static inline bool is_kprobe_##__name##_slot(un=
signed long addr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > >>>
> > >>> That's a 'static inline', shouldn't generate an 'unused function' w=
arning.
> > >> This is a W=3D1 build, which means that "inline" does not silence un=
used function warnings with =

> > >> clang because of commit 6863f5643dd7 ("kbuild: allow Clang to find u=
nused static inline functions =

> > >> for W=3D1 build").
> > > =

> > > Ok, I didn't know that.
> > =

> > After looking at it in more details, I don't really know what should be=
 done to avoid that.
> =

> Ah, thanks for reporting!
> =

> > =

> > This unused function is defined as part of DEFINE_INSN_CACHE_OPS(ppc_op=
tinsn).
> > =

> > The code uses other items defined by macro DEFINE_INSN_CACHE_OPS, so it=
 cannot be removed.
> > =

> > Solution could be to hide that in a .h, but is that worth it ?
> =

> The best solution is to remove ppc_optinsn, but that is defined in kernel=
/kprobes.c
> just because page allocation is different.
> I think the easiest fix is to add weak alloc_optinsn_page() and override =
it
> in arch/powerpc/kernel/optprobe.c.

Please try this patch.

Thank you,

>From 7782fa154349923ed52baa8843cc1d5eed26e82d Mon Sep 17 00:00:00 2001
From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Wed, 12 May 2021 23:33:10 +0900
Subject: [PATCH] powerpc/kprobes: Define arch specific optinsn memory
 allocation

Define arch specific optinsn memory allocate functions
instead of using arch specific ppc_optinsn_slot.

This fixes the unused function warning on is_kprobe_ppc_optinsn_slot()
when building with W=3D1 and also this makes kernel_text_address()
works correctly on optinsn page.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 arch/powerpc/kernel/optprobes.c | 24 +++++++-----------------
 kernel/kprobes.c                | 15 +++++++++++++--
 2 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobe=
s.c
index cdf87086fa33..aa017ccbd66e 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -31,11 +31,10 @@
 #define TMPL_END_IDX		\
 	(optprobe_template_end - optprobe_template_entry)
 =

-DEFINE_INSN_CACHE_OPS(ppc_optinsn);
-
 static bool insn_page_in_use;
 =

-static void *__ppc_alloc_insn_page(void)
+/* Override optinsn page allocation */
+void *alloc_optinsn_page(void)
 {
 	if (insn_page_in_use)
 		return NULL;
@@ -43,20 +42,11 @@ static void *__ppc_alloc_insn_page(void)
 	return &optinsn_slot;
 }
 =

-static void __ppc_free_insn_page(void *page __maybe_unused)
+void free_optinsn_page(void *page __maybe_unused)
 {
 	insn_page_in_use =3D false;
 }
 =

-struct kprobe_insn_cache kprobe_ppc_optinsn_slots =3D {
-	.mutex =3D __MUTEX_INITIALIZER(kprobe_ppc_optinsn_slots.mutex),
-	.pages =3D LIST_HEAD_INIT(kprobe_ppc_optinsn_slots.pages),
-	/* insn_size initialized later */
-	.alloc =3D __ppc_alloc_insn_page,
-	.free =3D __ppc_free_insn_page,
-	.nr_garbage =3D 0,
-};
-
 /*
  * Check if we can optimize this probe. Returns NIP post-emulation if this=
 can
  * be optimized and 0 otherwise.
@@ -136,7 +126,7 @@ NOKPROBE_SYMBOL(optimized_callback);
 void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 {
 	if (op->optinsn.insn) {
-		free_ppc_optinsn_slot(op->optinsn.insn, 1);
+		free_optinsn_slot(op->optinsn.insn, 1);
 		op->optinsn.insn =3D NULL;
 	}
 }
@@ -203,14 +193,14 @@ int arch_prepare_optimized_kprobe(struct optimized_kp=
robe *op, struct kprobe *p)
 	unsigned long nip, size;
 	int rc, i;
 =

-	kprobe_ppc_optinsn_slots.insn_size =3D MAX_OPTINSN_SIZE;
+	kprobe_optinsn_slots.insn_size =3D MAX_OPTINSN_SIZE;
 =

 	nip =3D can_optimize(p);
 	if (!nip)
 		return -EILSEQ;
 =

 	/* Allocate instruction slot for detour buffer */
-	buff =3D get_ppc_optinsn_slot();
+	buff =3D get_optinsn_slot();
 	if (!buff)
 		return -ENOMEM;
 =

@@ -297,7 +287,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kpro=
be *op, struct kprobe *p)
 	return 0;
 =

 error:
-	free_ppc_optinsn_slot(buff, 0);
+	free_optinsn_slot(buff, 0);
 	return -ERANGE;
 =

 }
diff --git a/kernel/kprobes.c b/kernel/kprobes.c
index 745f08fdd7a6..251fcb9d6c4c 100644
--- a/kernel/kprobes.c
+++ b/kernel/kprobes.c
@@ -321,11 +321,22 @@ int kprobe_cache_get_kallsym(struct kprobe_insn_cache=
 *c, unsigned int *symnum,
 }
 =

 #ifdef CONFIG_OPTPROBES
+
+void * __weak alloc_optinsn_page(void)
+{
+	return alloc_insn_page();
+}
+
+void __weak free_optinsn_page(void *page)
+{
+	free_insn_page(page);
+}
+
 /* For optimized_kprobe buffer */
 struct kprobe_insn_cache kprobe_optinsn_slots =3D {
 	.mutex =3D __MUTEX_INITIALIZER(kprobe_optinsn_slots.mutex),
-	.alloc =3D alloc_insn_page,
-	.free =3D free_insn_page,
+	.alloc =3D alloc_optinsn_page,
+	.free =3D free_optinsn_page,
 	.sym =3D KPROBE_OPTINSN_PAGE_SYM,
 	.pages =3D LIST_HEAD_INIT(kprobe_optinsn_slots.pages),
 	/* .insn_size is initialized later */
-- =

2.25.1
--===============0303733796798414389==--

