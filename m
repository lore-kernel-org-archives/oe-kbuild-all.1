Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CCC288C25
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 03:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761796585; cv=none; b=R+1/D2w8xyFDodw7t0wLswwg8oVp2TwYWNPR95Sy+1QixV2swBozLAKz75wVFgxIuvHhV7G2c4vdAxW5TJWvBhxfQukrvtJg0wCnJJ8QMfDUNx5ZRksFAlBYdLNSeWMEiaTibwBu7BtE9HG/BPadoI2PefAfI8Qv2rZdiXSFuiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761796585; c=relaxed/simple;
	bh=52yopWMEtj8Upd6ABPAJ88RyWmqJHKn6TDQ2Lj0V6XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ainroeHbWWO5lj/YZz68G6G3utGIr7zaRL5l61tHUdlM5u5YMjVyyUqb/SYPtALXzvWxafje4GMQUY/CPudw3mg6nnpY15HA2HCEiGkGUoU3i5wvRcHlyFkN/ZaAF9WamUXZsubKZvs0BwoC12v+2SGxArny/lD60auAfUY8cbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLx1Frfr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLx1Frfr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761796584; x=1793332584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=52yopWMEtj8Upd6ABPAJ88RyWmqJHKn6TDQ2Lj0V6XE=;
  b=SLx1FrfrZxw48j1A2J5FmJ9kpc135CkTkwefKEmosyYuaywmZVpyQYjI
   44cRd/AXVObjKNGtf/HOIOQD9GJwIuKzNaaM60ocislZBAtbrSuduQxIb
   EMLR8MLK8gE9/5MUWICt5kML2ePYDsei3c4Oc3Myy/uQug7J5XOQA6sOX
   7/mNcixs/aZ/fv+Q1D2uVsUWPRHhjTdAT81e+zoBmo9zjw8oDr/KUkXV8
   lOr7+U4/g5436eOTYS4UzIAWQG+xi6O5HBsFB5uVJFGf7w/kTHXsCFOC6
   vODcyi+ZjYMlqBZOxASbIsYWXV+ALCyk7kckdPOTndJQx2YWY+P3ajsNe
   A==;
X-CSE-ConnectionGUID: KvujfOO6TE2WqRgNo1GeSw==
X-CSE-MsgGUID: R3U1IOM2SO69IkbUFvWdWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81559628"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="81559628"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 20:56:23 -0700
X-CSE-ConnectionGUID: Os6KAYglQo6Py97ufcK/gA==
X-CSE-MsgGUID: e/ba9CuvRTKzbJ+Mlnjg8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="209426786"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2025 20:56:15 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEJku-000LQm-2L;
	Thu, 30 Oct 2025 03:55:43 +0000
Date: Thu, 30 Oct 2025 11:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, xin@zytor.com,
	peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org,
	akpm@linux-foundation.org, nathan@kernel.org,
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de,
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com,
	kees@kernel.org, baohua@kernel.org, vbabka@suse.cz,
	justinstitt@google.com, wangkefeng.wang@huawei.com,
	leitao@debian.org, jan.kiszka@siemens.com,
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com,
	ubizjak@gmail.com, ada.coupriediaz@arm.com,
	nick.desaulniers+lkml@gmail.com, ojeda@kernel.org,
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com,
	glider@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 01/18] kasan: Unpoison pcpu chunks with base address
 tag
Message-ID: <202510301149.BAjyNgKq-lkp@intel.com>
References: <fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman@pm.me>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman@pm.me>

Hi Maciej,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on akpm-mm/mm-everything arm64/for-next/core linus/master v6.18-rc3 next-20251029]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-Unpoison-pcpu-chunks-with-base-address-tag/20251030-041340
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman%40pm.me
patch subject: [PATCH v6 01/18] kasan: Unpoison pcpu chunks with base address tag
config: s390-randconfig-002-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301149.BAjyNgKq-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301149.BAjyNgKq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301149.BAjyNgKq-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: mm/vmalloc.o: in function `pcpu_get_vm_areas':
>> include/linux/kasan.h:621: undefined reference to `__kasan_unpoison_vmap_areas'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - GPIO_TB10X [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && (ARC_PLAT_TB10X || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && OF_GPIO [=y] && HAS_IOMEM [=y]
   WARNING: unmet direct dependencies detected for GPIO_SYSCON
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF [=n]
   Selected by [y]:
   - GPIO_SAMA5D2_PIOBU [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && MFD_SYSCON [=y] && OF_GPIO [=y] && (ARCH_AT91 || COMPILE_TEST [=y])
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +621 include/linux/kasan.h

   616	
   617	void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms);
   618	static __always_inline void kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
   619	{
   620		if (kasan_enabled())
 > 621			__kasan_unpoison_vmap_areas(vms, nr_vms);
   622	}
   623	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
