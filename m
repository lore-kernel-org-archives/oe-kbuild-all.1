Content-Type: multipart/mixed; boundary="===============6443422822891790263=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 1155/11283] arch/arm/kernel/patch.c:40:2: error: implicit declaration of function 'set_fixmap'; did you mean 'set_fs'?
Date: Thu, 06 Feb 2020 16:56:06 +0100
Message-ID: <20200206155606.GY14879@hirez.programming.kicks-ass.net>
In-Reply-To: <202001280600.uXI3EGA6%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6443422822891790263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 06:03:06AM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   702ccea170f07783bd002055a353a0866c062267
> commit: 5a735583b764750726621b0396d03e4782911b77 [1155/11283] arm/ftrace:=
 Use __patch_text()
> config: arm-randconfig-a001-20200126 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 5a735583b764750726621b0396d03e4782911b77
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>    arch/arm/kernel/patch.c: In function 'patch_map':
> >> arch/arm/kernel/patch.c:40:2: error: implicit declaration of function =
'set_fixmap'; did you mean 'set_fs'? [-Werror=3Dimplicit-function-declarati=
on]
>      set_fixmap(fixmap, page_to_phys(page));
>      ^~~~~~~~~~
>      set_fs

Something like so I suppose..


diff --git a/arch/arm/kernel/patch.c b/arch/arm/kernel/patch.c
index d0a05a3bdb96..e9e828b6bb30 100644
--- a/arch/arm/kernel/patch.c
+++ b/arch/arm/kernel/patch.c
@@ -16,10 +16,10 @@ struct patch {
 	unsigned int insn;
 };
 =

+#ifdef CONFIG_MMU
 static DEFINE_RAW_SPINLOCK(patch_lock);
 =

 static void __kprobes *patch_map(void *addr, int fixmap, unsigned long *fl=
ags)
-	__acquires(&patch_lock)
 {
 	unsigned int uintaddr =3D (uintptr_t) addr;
 	bool module =3D !core_kernel_text(uintaddr);
@@ -34,8 +34,6 @@ static void __kprobes *patch_map(void *addr, int fixmap, =
unsigned long *flags)
 =

 	if (flags)
 		raw_spin_lock_irqsave(&patch_lock, *flags);
-	else
-		__acquire(&patch_lock);
 =

 	set_fixmap(fixmap, page_to_phys(page));
 =

@@ -43,15 +41,19 @@ static void __kprobes *patch_map(void *addr, int fixmap=
, unsigned long *flags)
 }
 =

 static void __kprobes patch_unmap(int fixmap, unsigned long *flags)
-	__releases(&patch_lock)
 {
 	clear_fixmap(fixmap);
 =

 	if (flags)
 		raw_spin_unlock_irqrestore(&patch_lock, *flags);
-	else
-		__release(&patch_lock);
 }
+#else
+static void __kprobes *patch_map(void *addr, int fixmap, unsigned long *fl=
ags)
+{
+	return addr;
+}
+static void __kprobes patch_unmap(int fixmap, unsigned long *flags) { }
+#endif
 =

 void __kprobes __patch_text_real(void *addr, unsigned int insn, bool remap)
 {
@@ -64,8 +66,6 @@ void __kprobes __patch_text_real(void *addr, unsigned int=
 insn, bool remap)
 =

 	if (remap)
 		waddr =3D patch_map(addr, FIX_TEXT_POKE0, &flags);
-	else
-		__acquire(&patch_lock);
 =

 	if (thumb2 && __opcode_is_thumb16(insn)) {
 		*(u16 *)waddr =3D __opcode_to_mem_thumb16(insn);
@@ -102,8 +102,7 @@ void __kprobes __patch_text_real(void *addr, unsigned i=
nt insn, bool remap)
 	if (waddr !=3D addr) {
 		flush_kernel_vmap_range(waddr, twopage ? size / 2 : size);
 		patch_unmap(FIX_TEXT_POKE0, &flags);
-	} else
-		__release(&patch_lock);
+	}
 =

 	flush_icache_range((uintptr_t)(addr),
 			   (uintptr_t)(addr) + size);
--===============6443422822891790263==--

