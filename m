Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55E436D4F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 22:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763678912; cv=none; b=B/hduj1Q+Xv9lSOxV4lRvck/ile4aJHrgU4KZ/b5DkkNeOCNTT43arLY933b8hVDr/YBn2eC0//tobd1NWOxIfAJUQN8fam+rH5ZdminzBZ5qkb3wsvHEyIEVGQlP4iJW5hCK+Xzws34x3ItWQLzF3GwtOZAZY4GhJAdnbgA9sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763678912; c=relaxed/simple;
	bh=NIEIHPCgxVIf8b8E/7wYqcGaTcFauWawblV1ulzM9MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fj40/QzXPAGDZ7R9BVm8vnwPrlc4kqZSGQw1Whm2EVS7LA1BYJ6NOJHT5RtE9cowKvmytw0MeCZoWBvrCcPmwRD1pzhVIttA5Bzs2Eh9Rg6VqFx6MmL4iHOI8DcF2vdY0qmcwT1bCFRmuzgCQAoDYECmRxKXBQuNP0OxMcLTZg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuX94BJT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuX94BJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763678911; x=1795214911;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NIEIHPCgxVIf8b8E/7wYqcGaTcFauWawblV1ulzM9MA=;
  b=SuX94BJTegcXmHStubpzn6zxHRbmny4+VfZ6jFHUfu7W86m5+1ghk9pN
   XRLYYWitzXK87AHc+DZCWcofuigtK1f5WlwpUOGrKCI53ifEwq9gZNoaq
   azgyFpeyzAAr3aeH21yERhaYmArKHvtgO/X6h0dttBUDPTNwlzy7s4dWO
   Mhp0hDYO+wc6GBxmWsb0ZSTrmy9N9TyDF0gEXU949p6OMCurx+A7nPyNK
   Z9F8NetAQUaNraxxExx4hVqJKO8HD4+U03uc/bQBdAN3e4Gve9FtyqNLt
   2Xn7osWsh7KUSj3LwUFxxjYD/jSvBdrTgGJRhmV3xQeIGdetj1lEsB9l5
   g==;
X-CSE-ConnectionGUID: 4hg9ozf3R3ey5PIYqDqp7Q==
X-CSE-MsgGUID: MtSiLvR/TdaYO5++sGQ63A==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76449190"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="76449190"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 14:48:30 -0800
X-CSE-ConnectionGUID: OLgHdnBiRkSNzUT7Xn0cMA==
X-CSE-MsgGUID: 1KKiWaKwTMu2Bbfxs01h5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191950030"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Nov 2025 14:48:29 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMDRy-0004fH-36;
	Thu, 20 Nov 2025 22:48:26 +0000
Date: Fri, 21 Nov 2025 06:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14 04/16] irq & spin_lock: Add counted interrupt
 disabling/enabling
Message-ID: <202511210609.TbnD3ZYn-lkp@intel.com>
References: <20251120214616.14386-5-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120214616.14386-5-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build errors:

[auto build test ERROR on e5d330e13f67d574f683c052c9a342814fd8fa39]

url:    https://github.com/intel-lab-lkp/linux/commits/Lyude-Paul/preempt-Introduce-HARDIRQ_DISABLE_BITS/20251121-055548
base:   e5d330e13f67d574f683c052c9a342814fd8fa39
patch link:    https://lore.kernel.org/r/20251120214616.14386-5-lyude%40redhat.com
patch subject: [PATCH v14 04/16] irq & spin_lock: Add counted interrupt disabling/enabling
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251121/202511210609.TbnD3ZYn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210609.TbnD3ZYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210609.TbnD3ZYn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:60,
                    from include/linux/sched.h:37,
                    from arch/nios2/kernel/asm-offsets.c:8:
>> include/linux/interrupt_rc.h:16:10: fatal error: asm/smp.h: No such file or directory
      16 | #include <asm/smp.h>
         |          ^~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:182: arch/nios2/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +16 include/linux/interrupt_rc.h

    13	
    14	#include <linux/irqflags.h>
    15	#include <asm/processor.h>
  > 16	#include <asm/smp.h>
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
