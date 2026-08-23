Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174EB1D514E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 20:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787517967; cv=none; b=WTthpjrEu5w0L/rFneqqVPPMROjb+obt2aWvKb2w6PWvK9NKzzJGl1hqnCYTGkmsT6linoEEILzGSSxdZgJrRj8zXg+SzrWETbuz33KCeJm7GURVUZ3rJ2W06he0XRjjDXyHNETDz3wQZKYs2r2YroWSkZLdqD2qOfGUHj21KBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787517967; c=relaxed/simple;
	bh=KUIlptW8ufsjjN9kNdTfJizK/3csHtiShUDfaBwxFtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dj+ysmv+ttghfBm3S8rbEhdeOulbABSfzjzPZXQPVd+ts6ro5umtNvvysO/a3MUravQdGhIXFTxx1y5LGd+veNgEX8veJUCGIeGkUvh/y9VlazHB7qtpbzO5QdySvamhCLE19DX/drZnifpSh9YL1W6uLRYnYMozkDVQdnGI99A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IAYrBuXk; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IAYrBuXk"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9E46F40E01B2;
	Sun, 23 Aug 2026 20:39:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iU7bw-Kl_Jz9; Sun, 23 Aug 2026 20:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1787517583; bh=P5OrUb+5lsTJ/jZKxFrBEl6++cMuvpfI0MbLuFWzE68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IAYrBuXkieCe+LVGzjQuxrEgJebyNUR/Lt3U0rcs2GVNZDp1bypTWiJSZs7CAk4qW
	 N/9nSRbLeDfDw82hBlrHRaBC4XLyBoSKbhRLqOWLQ5J5YfRV2PeJJ4UKLWsCTnqniF
	 4sD8BCV0FQHnfeFTsuzDrETgqchRZUhQc/Z2T5INfcG97w7d9ROOZDw1wADdYmGDsM
	 hgpgSZemsJfgpwgb0DYM7BNrV4mj1w8lYlQnA4NS2Jhvamlyr0LD/xv0aRicHi0Si+
	 kvNIbhbWpG8xAVzvtYRtboVEIz6woNdnvUNmvQ39jP5ARyHJf2SbxqRHQ5LySqVbcE
	 nCZ0Rjkudb9Yvdr6jIXpcQySe9zfZpVzOJlSsFALiYqQnt2L2qEm7AweSnbIybWC90
	 GWb8G4mrbXo16ZQ4ZwupRn5eLBhaMTvn2vQrRTduDLgud5nEjk0fJfztA867soUMNc
	 2scw3y2TSsk2shFVrb7MqSJEA32fmNFsSiP8u9f5AB6/uc4yxgXbQrPzQPzo1MkJRO
	 Cvz8XNoSLqJvoj0Dy06ibeEaMmdNGB1+Z4WANUoHBW0nXnArLdzngLOc2Cqf3Wvnsc
	 olH0TP6C+03Na9H/moTYaNGRZLiptNiMRH8rJTRl59GhTl6P2OVpiRJvxHkpCQTP2y
	 UH67M6Nc8JDOE/9BJYhOmaQE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::1a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B7B1240E01AB;
	Sun, 23 Aug 2026 20:39:37 +0000 (UTC)
Date: Sun, 23 Aug 2026 13:39:34 -0700
From: Borislav Petkov <bp@alien8.de>
To: kernel test robot <lkp@intel.com>
Cc: Borislav Petkov <bp@kernel.org>, X86 <x86@kernel.org>,
	oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] x86/CPU/AMD: Fix Zen5 TLB sizes reporting
Message-ID: <20260823203934.GAaotahgOkTBg2eaBT@fat_crate.local>
References: <20260821022031.946311-1-bp@kernel.org>
 <202608240450.3JNf2siz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202608240450.3JNf2siz-lkp@intel.com>

On Mon, Aug 24, 2026 at 04:30:57AM +0800, kernel test robot wrote:
> Hi Borislav,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on tip/x86/core]
> [also build test WARNING on tip/master linus/master v7.2 next-20260821]
> [cannot apply to tip/auto-latest]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Borislav-Petkov/x86-CPU-AMD-Fix-Zen5-TLB-sizes-reporting/20260820-192031
> base:   tip/x86/core
> patch link:    https://lore.kernel.org/r/20260821022031.946311-1-bp%40kernel.org
> patch subject: [PATCH] x86/CPU/AMD: Fix Zen5 TLB sizes reporting
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260824/202608240450.3JNf2siz-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240450.3JNf2siz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608240450.3JNf2siz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    arch/x86/kernel/cpu/common.c: In function 'cpu_detect_cache_sizes':
> >> arch/x86/kernel/cpu/common.c:860:55: warning: variable 'shift' set but not used [-Wunused-but-set-variable]
>      860 |         unsigned int n, dummy, ebx, ecx, edx, l2size, shift;
>          |                                                       ^~~~~


Yah, AI caught it already, try this:

---
From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Thu, 20 Aug 2026 17:02:10 -0700
Subject: [PATCH] x86/CPU/AMD: Fix Zen5 TLB sizes reporting

Starting with Zen5, TLB sizes in CPUID_Fn80000006_E[AB]X are reported
as multiples of 32. There's a CPUID bit which determines that:

  CPUID_Fn80000021_EAX [Extended Feature 2 EAX] (Core::X86::Cpuid::FeatureExt2Eax)
  ...

  14: L2TlbSizeX32. Read-only. Reset: 1. Indicates that L2TLB sizes are encoded as multiples of 32.

Update the places which report that information.

With it, the numbers look correct now:

  -Last level iTLB entries: 4KB 64, 2MB 64, 4MB 32
  -Last level dTLB entries: 4KB 128, 2MB 128, 4MB 64, 1GB 0
  +Last level iTLB entries: 4KB 2048, 2MB 2048, 4MB 1024
  +Last level dTLB entries: 4KB 4096, 2MB 4096, 4MB 2048, 1GB 0

/proc/cpuinfo

  -TLB size        : 192 4K pages
  +TLB size        : 6144 4K pages

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 arch/x86/include/asm/cpufeatures.h |  2 ++
 arch/x86/kernel/cpu/amd.c          | 21 +++++++++++++--------
 arch/x86/kernel/cpu/common.c       |  4 +++-
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 73d5c740202d..46937d15a95a 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -473,6 +473,8 @@
 #define X86_FEATURE_AUTOIBRS		(20*32+ 8) /* Automatic IBRS */
 #define X86_FEATURE_NO_SMM_CTL_MSR	(20*32+ 9) /* SMM_CTL MSR is not present */
 
+#define X86_FEATURE_L2_TLB_SIZE_X32	(20*32+14) /* L2 TLB sizes are encoded as multiples of 32 */
+
 #define X86_FEATURE_GP_ON_USER_CPUID	(20*32+17) /* User CPUID faulting */
 
 #define X86_FEATURE_PREFETCHI		(20*32+20) /* Prefetch Data/Instruction to Cache Level */
diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index 54e14ed276b5..e5279bc648d3 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -1192,7 +1192,7 @@ static unsigned int amd_size_cache(struct cpuinfo_x86 *c, unsigned int size)
 
 static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 {
-	u32 ebx, eax, ecx, edx;
+	u32 ebx, eax, ecx, edx, shift, tmp;
 	u16 mask = 0xfff;
 
 	if (c->x86 < 0xf)
@@ -1201,10 +1201,12 @@ static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 	if (c->extended_cpuid_level < 0x80000006)
 		return;
 
+	shift = !!cpu_has(c, X86_FEATURE_L2_TLB_SIZE_X32) * 5;
+
 	cpuid(0x80000006, &eax, &ebx, &ecx, &edx);
 
-	tlb_lld_4k = (ebx >> 16) & mask;
-	tlb_lli_4k = ebx & mask;
+	tlb_lld_4k = ((ebx >> 16) & mask) << shift;
+	tlb_lli_4k = (ebx & mask) << shift;
 
 	/*
 	 * K8 doesn't have 2M/4M entries in the L2 TLB so read out the L1 TLB
@@ -1216,16 +1218,18 @@ static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 	}
 
 	/* Handle DTLB 2M and 4M sizes, fall back to L1 if L2 is disabled */
-	if (!((eax >> 16) & mask))
+	tmp = ((eax >> 16) & mask) << shift;
+	if (!tmp)
 		tlb_lld_2m = (cpuid_eax(0x80000005) >> 16) & 0xff;
 	else
-		tlb_lld_2m = (eax >> 16) & mask;
+		tlb_lld_2m = tmp;
 
 	/* a 4M entry uses two 2M entries */
 	tlb_lld_4m = tlb_lld_2m >> 1;
 
 	/* Handle ITLB 2M and 4M sizes, fall back to L1 if L2 is disabled */
-	if (!(eax & mask)) {
+	tmp = (eax & mask) << shift;
+	if (!tmp) {
 		/* Erratum 658 */
 		if (c->x86 == 0x15 && c->x86_model <= 0x1f) {
 			tlb_lli_2m = 1024;
@@ -1233,8 +1237,9 @@ static void cpu_detect_tlb_amd(struct cpuinfo_x86 *c)
 			cpuid(0x80000005, &eax, &ebx, &ecx, &edx);
 			tlb_lli_2m = eax & 0xff;
 		}
-	} else
-		tlb_lli_2m = eax & mask;
+	} else {
+		tlb_lli_2m = tmp;
+	}
 
 	tlb_lli_4m = tlb_lli_2m >> 1;
 
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index c7352827f491..3716a6af13cb 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -857,7 +857,7 @@ static void get_model_name(struct cpuinfo_x86 *c)
 
 void cpu_detect_cache_sizes(struct cpuinfo_x86 *c)
 {
-	unsigned int n, dummy, ebx, ecx, edx, l2size;
+	unsigned int n, dummy, ebx, ecx, edx, l2size, shift __maybe_unused;
 
 	n = c->extended_cpuid_level;
 
@@ -877,7 +877,9 @@ void cpu_detect_cache_sizes(struct cpuinfo_x86 *c)
 	l2size = ecx >> 16;
 
 #ifdef CONFIG_X86_64
+	shift = !!cpu_has(c, X86_FEATURE_L2_TLB_SIZE_X32) * 5;
 	c->x86_tlbsize += ((ebx >> 16) & 0xfff) + (ebx & 0xfff);
+	c->x86_tlbsize <<= shift;
 #else
 	/* do processor-specific cache resizing */
 	if (this_cpu->legacy_cache_size)
-- 
2.53.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
