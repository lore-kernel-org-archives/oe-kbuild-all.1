Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F86717A2FC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785892966; cv=none; b=ZJbGJMX4cNBGcy2iqz8cQdoEdtUAKnbOnzKA0FHMn+aQHA+eTaYUpgTtB46rvpG+nB94WvSC54j7z2T3nXUfd7t7GHqo4L1iZolqXFmceJSPsdYWQkV0H4xWoznbX3/wAIaV7MUwn4Ha3MFIflM9jfHZn9e6HVtRisJS2CuYO6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785892966; c=relaxed/simple;
	bh=HeHeP9QsFn1XQrqSd0WgCNcvezGW/66yOVQI7nAlAhw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XWm1AIVEh2F++zVDgbMAEOybaFo7gdDOTCzuwoeu7yAd3Ee6/16eCFYRi9W9ZPLGC7tYbRMjdHS6HBDM70NbeE4617wt1oucj0H+s3ti5SHd6tyPOotNbZYAEnKOp8jiXtdXiM4y1uoF9HvlLQv1Bkjub63YQdoMrQLEAc1dRxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k75eDFW6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k75eDFW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785892964; x=1817428964;
  h=date:from:to:cc:subject:message-id;
  bh=HeHeP9QsFn1XQrqSd0WgCNcvezGW/66yOVQI7nAlAhw=;
  b=k75eDFW6ny7k2mKCc698li7/lhwezP6GexoruQVD+VyRigNGXKt4MeXz
   zbqukzJ2hsQtwUN6puVoEhmBDBu3eSFf0duvHkS2PCLy1qfMz5j+E04js
   d7xsJbfcpbalo9OWL3+hLwMhTxuRpOLJaxmX0hu+JKsDlkaAGSLRsCtR6
   HrLTR2cTl9r2n67hEdVGtssIfRgclmLD5nXnr5/LnyGNff5hpHXbm7Wla
   pYtv4wDaY15uy9X0/7VT4WjzLZbbnx3lj6IfBQnPVButV/g7reul+7hFG
   62zwzUSAzfJut3yRJNe6VftBYcWENj8IL1w2fzGAibkplW0trUa+Y1Tbn
   w==;
X-CSE-ConnectionGUID: CuUAB9y6TK+TNdnZaFcqLQ==
X-CSE-MsgGUID: d+pjHXSTQ6KJPt6oi21qng==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90132257"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="90132257"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 18:22:43 -0700
X-CSE-ConnectionGUID: veprSvQWRSmmyFu98bcV/w==
X-CSE-MsgGUID: fBZ55GynRsCbT7K4UxTyFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="261096109"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Aug 2026 18:22:42 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrQL9-00000000BAN-2Ao6;
	Wed, 05 Aug 2026 01:22:39 +0000
Date: Wed, 05 Aug 2026 09:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [peterz-queue:locking/core 17/21]
 arch/x86/include/asm/cpufeatures.h:228:68: error: "/*" within comment
Message-ID: <202608050957.enB62Jir-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   098a858bcdad1b6327e23274626c9fb36c5932fc
commit: 6cbc4e025e8c31cdc861ad9f2f53dc0eb290d586 [17/21] x86/paravirt: Use static_call() for the paravirt spinlock ops
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050957.enB62Jir-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050957.enB62Jir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050957.enB62Jir-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from lib/test_bitops.c:10:
>> arch/x86/include/asm/cpufeatures.h:228:68: error: "/*" within comment [-Werror=comment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   cc1: all warnings being treated as errors
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from drivers/input/joystick/a3d.c:10:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   drivers/input/joystick/a3d.c: In function 'a3d_connect':
   drivers/input/joystick/a3d.c:287:51: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     287 |         snprintf(a3d->phys, sizeof(a3d->phys), "%s/input0", gameport->phys);
         |                                                   ^~~~~~~
   drivers/input/joystick/a3d.c:287:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     287 |         snprintf(a3d->phys, sizeof(a3d->phys), "%s/input0", gameport->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from drivers/input/joystick/adi.c:10:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   drivers/input/joystick/adi.c: In function 'adi_init_input':
   drivers/input/joystick/adi.c:395:60: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 55 [-Wformat-truncation=]
     395 |         snprintf(adi->name, ADI_MAX_NAME_LENGTH, "Logitech %s [%s]", buf, adi->cname);
         |                                                            ^~        ~~~
   drivers/input/joystick/adi.c:395:9: note: 'snprintf' output between 13 and 91 bytes into a destination of size 64
     395 |         snprintf(adi->name, ADI_MAX_NAME_LENGTH, "Logitech %s [%s]", buf, adi->cname);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from drivers/input/joystick/analog.c:10:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   drivers/input/joystick/analog.c: In function 'analog_init_device':
   drivers/input/joystick/analog.c:371:21: warning: '/input' directive output may be truncated writing 6 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     371 |                  "%s/input%d", port->gameport->phys, index);
         |                     ^~~~~~
   drivers/input/joystick/analog.c:371:18: note: directive argument in the range [0, 1]
     371 |                  "%s/input%d", port->gameport->phys, index);
         |                  ^~~~~~~~~~~~
   drivers/input/joystick/analog.c:370:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     370 |         snprintf(analog->phys, sizeof(analog->phys),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     371 |                  "%s/input%d", port->gameport->phys, index);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from drivers/input/joystick/cobra.c:10:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   drivers/input/joystick/cobra.c: In function 'cobra_connect':
   drivers/input/joystick/cobra.c:184:29: warning: '/input' directive output may be truncated writing 6 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     184 |                          "%s/input%d", gameport->phys, i);
         |                             ^~~~~~
   drivers/input/joystick/cobra.c:184:26: note: directive argument in the range [0, 1]
     184 |                          "%s/input%d", gameport->phys, i);
         |                          ^~~~~~~~~~~~
   drivers/input/joystick/cobra.c:183:17: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     183 |                 snprintf(cobra->phys[i], sizeof(cobra->phys[i]),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     184 |                          "%s/input%d", gameport->phys, i);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from arch/x86/include/asm/div64.h:8,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:12,
                    from drivers/input/joystick/gf2k.c:10:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   drivers/input/joystick/gf2k.c: In function 'gf2k_connect':
   drivers/input/joystick/gf2k.c:281:53: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     281 |         snprintf(gf2k->phys, sizeof(gf2k->phys), "%s/input0", gameport->phys);
         |                                                     ^~~~~~~
   drivers/input/joystick/gf2k.c:281:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     281 |         snprintf(gf2k->phys, sizeof(gf2k->phys), "%s/input0", gameport->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from drivers/input/joystick/grip.c:10:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   drivers/input/joystick/grip.c: In function 'grip_connect':
   drivers/input/joystick/grip.c:337:29: warning: '/input' directive output may be truncated writing 6 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     337 |                          "%s/input%d", gameport->phys, i);
         |                             ^~~~~~
   drivers/input/joystick/grip.c:337:26: note: directive argument in the range [0, 1]
     337 |                          "%s/input%d", gameport->phys, i);
         |                          ^~~~~~~~~~~~
   drivers/input/joystick/grip.c:336:17: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     336 |                 snprintf(grip->phys[i], sizeof(grip->phys[i]),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     337 |                          "%s/input%d", gameport->phys, i);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from drivers/input/joystick/guillemot.c:10:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   drivers/input/joystick/guillemot.c: In function 'guillemot_connect':
   drivers/input/joystick/guillemot.c:203:63: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     203 |         snprintf(guillemot->phys, sizeof(guillemot->phys), "%s/input0", gameport->phys);
         |                                                               ^~~~~~~
   drivers/input/joystick/guillemot.c:203:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     203 |         snprintf(guillemot->phys, sizeof(guillemot->phys), "%s/input0", gameport->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from drivers/input/joystick/interact.c:13:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   drivers/input/joystick/interact.c: In function 'interact_connect':
   drivers/input/joystick/interact.c:232:61: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     232 |         snprintf(interact->phys, sizeof(interact->phys), "%s/input0", gameport->phys);
         |                                                             ^~~~~~~
   drivers/input/joystick/interact.c:232:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     232 |         snprintf(interact->phys, sizeof(interact->phys), "%s/input0", gameport->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/include/asm/arch_hweight.h:5,
                    from arch/x86/include/asm/bitops.h:419,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from drivers/input/joystick/magellan.c:10:
>> arch/x86/include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   drivers/input/joystick/magellan.c: In function 'magellan_connect':
   drivers/input/joystick/magellan.c:141:61: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
     141 |         snprintf(magellan->phys, sizeof(magellan->phys), "%s/input0", serio->phys);
         |                                                             ^~~~~~~
   drivers/input/joystick/magellan.c:141:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
     141 |         snprintf(magellan->phys, sizeof(magellan->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +228 arch/x86/include/asm/cpufeatures.h

   222	
   223	#define X86_FEATURE_VMMCALL		( 8*32+15) /* "vmmcall" Prefer VMMCALL to VMCALL */
   224	#define X86_FEATURE_XENPV		( 8*32+16) /* Xen paravirtual guest */
   225	#define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
   226	#define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
   227	#define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
 > 228	/* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   229	#define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
   230	#define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
   231	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
