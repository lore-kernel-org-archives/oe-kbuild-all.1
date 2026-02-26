Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F3E2C0F6C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 18:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772131741; cv=none; b=K7XUuooQLPJcADG/ffCP35ynJ5S9JzF+vb4AxQfCGqosZY3ScHaHhP0rfh5+djAbWeyY6A5OVM2o9uuvKCBDKapmfon8YTcdZw6Q59BcWVjq0cocjf1Ttif53ZWhRqdN0Z2X+j7fzJ2ddcdfs7travfkkyW0pQW0HDjYUhphtlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772131741; c=relaxed/simple;
	bh=aaUwglovVx9b3wegUcFfTTaXwhs99OzFx74DPA8teCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GSivZCCUa2o7ZiER43M65lbZmhkQRUxcInsYWlu50ZQMQbRvxxZZsH2J/IP4ISOrb5yPotK1EcwZAS1xWx7hdTfDLARBBpXlT4xxZJloOnEfP0KypL296nlqL8se9gYPOQ249E5Y4YoKGmF2OKsbhkrYHSqoYO5H42YqpXPVnpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HX1WVN6T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HX1WVN6T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C00C116C6;
	Thu, 26 Feb 2026 18:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772131741;
	bh=aaUwglovVx9b3wegUcFfTTaXwhs99OzFx74DPA8teCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HX1WVN6T29OR1Qn7mMCu8US8QuPzcjwY6UC/jDrlVFItPlkTCUkjBUfxBfwVOSqCR
	 FHJslrhxiH6tfLIXl99V8DW2jEd+c7CWOKaCqEX5+twpFIy3Nu6wV41svPdq9JkArv
	 DF2jGX5OUphcY4zJYCJU8GgbyxPtUHUkkckwgOUeWx4Jbp6Q67iKHaUYqTuRNDBNAx
	 YSI9BEd/Z9qqLkiPoBSKcDeWoCksonzjf+XDSPHcHqPvuPPIq3lvh/Vk2WC92Ec+aC
	 jlHTRxub7dJPtLWtMeCV3T71jpo54H9TrzlPjefZCallccAytqDLGCqD/enHozo3tT
	 bLGMzImLq/6Ww==
Date: Thu, 26 Feb 2026 11:48:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Nicolas Schier <nsc@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sam Creasey <sammy@sammy.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [PATCH] kbuild: Split .modinfo out from ELF_DETAILS
Message-ID: <20260226184853.GA3276361@ax162>
References: <20260225-separate-modinfo-from-elf-details-v1-1-387ced6baf4b@kernel.org>
 <202602261957.dducGrGl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602261957.dducGrGl-lkp@intel.com>

On Thu, Feb 26, 2026 at 07:10:23PM +0800, kernel test robot wrote:
> Hi Nathan,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/kbuild-Split-modinfo-out-from-ELF_DETAILS/20260226-060503
> base:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> patch link:    https://lore.kernel.org/r/20260225-separate-modinfo-from-elf-details-v1-1-387ced6baf4b%40kernel.org
> patch subject: [PATCH] kbuild: Split .modinfo out from ELF_DETAILS
> config: arm-randconfig-003-20260226 (https://download.01.org/0day-ci/archive/20260226/202602261957.dducGrGl-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261957.dducGrGl-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602261957.dducGrGl-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/workqueue.o' being placed in section `.modinfo'
> >> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/locking/locktorture.o' being placed in section `.modinfo'
> >> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/locking/test-ww_mutex.o' being placed in section `.modinfo'
> >> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/printk/printk.o' being placed in section `.modinfo'
> >> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/irq/spurious.o' being placed in section `.modinfo'

Whoops, I missed arch/arm because ELF_DETAILS is in ARM_DETAILS and I
wasn't paying attention... I will squash the following change.

Cheers,
Nathan

diff --git a/arch/arm/boot/compressed/vmlinux.lds.S b/arch/arm/boot/compressed/vmlinux.lds.S
index d411abd4310e..2d916647df03 100644
--- a/arch/arm/boot/compressed/vmlinux.lds.S
+++ b/arch/arm/boot/compressed/vmlinux.lds.S
@@ -21,6 +21,7 @@ SECTIONS
     COMMON_DISCARDS
     *(.ARM.exidx*)
     *(.ARM.extab*)
+    *(.modinfo)
     *(.note.*)
     *(.rel.*)
     *(.printk_index)
diff --git a/arch/arm/kernel/vmlinux-xip.lds.S b/arch/arm/kernel/vmlinux-xip.lds.S
index f2e8d4fac068..5afb725998ec 100644
--- a/arch/arm/kernel/vmlinux-xip.lds.S
+++ b/arch/arm/kernel/vmlinux-xip.lds.S
@@ -154,6 +154,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ARM_DETAILS
 
 	ARM_ASSERTS
diff --git a/arch/arm/kernel/vmlinux.lds.S b/arch/arm/kernel/vmlinux.lds.S
index d592a203f9c6..c07843c3c53d 100644
--- a/arch/arm/kernel/vmlinux.lds.S
+++ b/arch/arm/kernel/vmlinux.lds.S
@@ -153,6 +153,7 @@ SECTIONS
 
 	STABS_DEBUG
 	DWARF_DEBUG
+	MODINFO
 	ARM_DETAILS
 
 	ARM_ASSERTS
