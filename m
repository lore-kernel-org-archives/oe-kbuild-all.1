Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F3C1841
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 03:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="Wn9r2B2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1699587663;
	bh=YOCyMuYL5I88d66lN6C2ldLGMCIsUO0ppwylpN45zyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Wn9r2B2oowVuwO3Zl60Sr9Z7DSIDr8i4EJteomcnu3WFRku9t2zjeGtWw/AfYoOq5
	 XerWwP5hl6W2IDQ5oXo+OZXfKtozNy1mBrujHuJp4zzE9/45aaZipxAREYXOxgQXjR
	 xx19dsVEjqqJPfYy9EFUE6ihgIPQKmEaihSxSFNcCQ/L/9u8gV3yA/STX7nGjo0Ay1
	 OCJMdsK73uaxkAAVAiTIRUL555Hy0+R21BiuN73bxY9L0vGIsep9+GApy/PVgwZ/He
	 2F3mvN8a7FGyoZXJ8CxS3uCxTiW7jZu6MLPM2TNQPrzMidLoukJmFiTgUaJ+eTYqfU
	 wzdmlm/HPhRgQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SRPjy5kW7z4x2W;
	Fri, 10 Nov 2023 14:40:54 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Arnd Bergmann <arnd@arndb.de>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Guo
 Ren <guoren@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ard
 Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Greg
 Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen
 <dinguyen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andy Lutomirski
 <luto@kernel.org>
Subject: Re: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
In-Reply-To: <202311090843.b8ISrsV1-lkp@intel.com>
References: <20231108125843.3806765-18-arnd@kernel.org>
 <202311090843.b8ISrsV1-lkp@intel.com>
Date: Fri, 10 Nov 2023 14:40:51 +1100
Message-ID: <87h6lu8ed8.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:
> Hi Arnd,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on next-20231108]
> [cannot apply to v6.6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/ida-make-ida_dump-static/20231109-005742
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20231108125843.3806765-18-arnd%40kernel.org
> patch subject: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
> config: powerpc64-randconfig-001-20231109 (https://download.01.org/0day-ci/archive/20231109/202311090843.b8ISrsV1-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311090843.b8ISrsV1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311090843.b8ISrsV1-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arch/powerpc/platforms/ps3/gelic_udbg.c:59:1: warning: alignment 1 of 'struct debug_block' is less than 32 [-Wpacked-not-aligned]
>       59 | } __packed;
>          | ^
>>> arch/powerpc/platforms/ps3/gelic_udbg.c:240:6: error: redefinition of 'udbg_shutdown_ps3gelic'
>      240 | void udbg_shutdown_ps3gelic(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~~
>    In file included from arch/powerpc/platforms/ps3/gelic_udbg.c:17:
>    arch/powerpc/include/asm/ps3.h:520:20: note: previous definition of 'udbg_shutdown_ps3gelic' with type 'void(void)'
>      520 | static inline void udbg_shutdown_ps3gelic(void) {}
>          |                    ^~~~~~~~~~~~~~~~~~~~~~

As pointed out by Arnd this is due to there being two symbols that
control the gelic_udbg.c code.

I don't see the need for PS3GELIC_UDBG, without PPC_EARLY_DEBUG_PS3GELIC
it just causes gelic_udbg.c to be built, but never called.

The diff below fixes the error AFAICS.

I can just fold it in if you're happy with that Arnd.

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index ea4033abc07d..8c80b154e814 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -271,7 +271,6 @@ config PPC_EARLY_DEBUG_USBGECKO
 config PPC_EARLY_DEBUG_PS3GELIC
 	bool "Early debugging through the PS3 Ethernet port"
 	depends on PPC_PS3
-	select PS3GELIC_UDBG
 	help
 	  Select this to enable early debugging for the PlayStation3 via
 	  UDP broadcasts sent out through the Ethernet port.
diff --git a/arch/powerpc/platforms/ps3/Kconfig b/arch/powerpc/platforms/ps3/Kconfig
index a44869e5ea70..e9c1087dd42e 100644
--- a/arch/powerpc/platforms/ps3/Kconfig
+++ b/arch/powerpc/platforms/ps3/Kconfig
@@ -167,16 +167,4 @@ config PS3_LPM
 	  profiling support of the Cell processor with programs like
 	  perfmon2, then say Y or M, otherwise say N.
 
-config PS3GELIC_UDBG
-	bool "PS3 udbg output via UDP broadcasts on Ethernet"
-	depends on PPC_PS3
-	help
-	  Enables udbg early debugging output by sending broadcast UDP
-	  via the Ethernet port (UDP port number 18194).
-
-	  This driver uses a trivial implementation and is independent
-	  from the main PS3 gelic network driver.
-
-	  If in doubt, say N here.
-
 endmenu
diff --git a/arch/powerpc/platforms/ps3/Makefile b/arch/powerpc/platforms/ps3/Makefile
index 86bf2967a8d4..bc79bb124d1e 100644
--- a/arch/powerpc/platforms/ps3/Makefile
+++ b/arch/powerpc/platforms/ps3/Makefile
@@ -3,7 +3,7 @@ obj-y += setup.o mm.o time.o hvcall.o htab.o repository.o
 obj-y += interrupt.o exports.o os-area.o
 obj-y += system-bus.o
 
-obj-$(CONFIG_PS3GELIC_UDBG) += gelic_udbg.o
+obj-$(CONFIG_PPC_EARLY_DEBUG_PS3GELIC) += gelic_udbg.o
 obj-$(CONFIG_SMP) += smp.o
 obj-$(CONFIG_SPU_BASE) += spu.o
 obj-y += device-init.o


cheers
