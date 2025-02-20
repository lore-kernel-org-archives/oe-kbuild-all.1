Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375DF1D8A14
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 18:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740074924; cv=none; b=o4R6op0dM1L8K3KQtDCQnMcWNmChkSSXlujSzkeUDYc9zzBTZ93LRGTNNK0TUcGA9VOVKt8QRddvc5A7hgRKCu2/kLQ/wis3J2UpvL542sZt7SgmdX7jsnC1t8GFMRKcPK4I1a8BahEBgdZBJHMhsNToTpigpiFmC0+XxGH2fXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740074924; c=relaxed/simple;
	bh=l0WssEPwzQ2dk++aKKLOnTqlS4Z+Ssx4Zdw2/9+HInU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7cWfT1UXxY1C6LjqheFxRxYIitOdBSSVutOwVBDoy7FO2XFhK5olmCV4U0O7Sfa+131FW4iTJQ/4PZOErWWx2M/2JvxPdXPtZIS3BH6vV7oofkZyDONr3swdUsKpAeYB6LRQqPHTrVVQH0nKAvn3oYLVjnEUSZaZOqdk6h4nh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YdKWqVfj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YdKWqVfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740074923; x=1771610923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0WssEPwzQ2dk++aKKLOnTqlS4Z+Ssx4Zdw2/9+HInU=;
  b=YdKWqVfjevxO8085v4sZ0/vkKZH+1umufbCcNvtjbAeJcwgfGEO5AdTW
   BSVuCd8BhCdPcF/rfO4A/7hr0a2Eap7alif2mRj1tT4h9KlRkfwKmW++m
   +I3cMZpogHpxmXw6pc/Nh8oK5omYiEMi7qOPNR3EAcp4LJL3iFOzbglG3
   2c5PnLwaRo98StxoEWK9zC6NqxT2kyazjeXr1F46ErZCaa3giwy0gul6w
   i1UdPEspp2VkbG2wlbS2n7kuJsbmBbXsHgvTHjNqecS3XGNyQpbgBm0sX
   /a2HNfj3HYIUmYkLJ3anVVvpwgsZEcuoI3PKwzNcSZ+HpxtMfFg86Ey7L
   g==;
X-CSE-ConnectionGUID: CGpS8ggURfCEEsdDsZ5yEw==
X-CSE-MsgGUID: LTzDwFk3T66crGUOMgm05Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44653363"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="44653363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 10:08:42 -0800
X-CSE-ConnectionGUID: dtHoWVwMSD+GirqEKfEWgw==
X-CSE-MsgGUID: xLCeSwt4RA60VNcHuCv0xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="120096732"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2025 10:08:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlAyU-0004d5-2l;
	Thu, 20 Feb 2025 18:08:38 +0000
Date: Fri, 21 Feb 2025 02:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 5/32]
 include/linux/device.h:381:16: warning: returning 'int' from a function with
 return type 'void *' makes pointer from integer without a cast
Message-ID: <202502210251.RZwPO8Hk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-testing
head:   820252db26434126c85a78027a1bcbe9c0903204
commit: cd29796e495160c05a672f3098dffe0fb6ae9daf [5/32] driver core: device.h: fix incorrect type in return expression
config: um-randconfig-002-20250220 (https://download.01.org/0day-ci/archive/20250221/202502210251.RZwPO8Hk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210251.RZwPO8Hk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210251.RZwPO8Hk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/tick-common.c:11:
   include/linux/device.h: In function 'devm_ioremap_resource':
   include/linux/device.h:381:16: error: implicit declaration of function 'IOMEM_ERR_PTR' [-Werror=implicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~
>> include/linux/device.h:381:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h: In function 'devm_ioremap_resource_wc':
   include/linux/device.h:388:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h: In function 'devm_of_iomap':
   include/linux/device.h:396:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   include/linux/device.h: In function 'devm_ioremap_resource':
   include/linux/device.h:381:16: error: implicit declaration of function 'IOMEM_ERR_PTR' [-Werror=implicit-function-declaration]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~
>> include/linux/device.h:381:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     381 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h: In function 'devm_ioremap_resource_wc':
   include/linux/device.h:388:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     388 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h: In function 'devm_of_iomap':
   include/linux/device.h:396:16: warning: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     396 |         return IOMEM_ERR_PTR(-EINVAL);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:125:35: warning: initialized field overwritten [-Woverride-init]
     125 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:125:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:126:35: warning: initialized field overwritten [-Woverride-init]
     126 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:126:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:127:35: warning: initialized field overwritten [-Woverride-init]
     127 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:127:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   cc1: some warnings being treated as errors


vim +381 include/linux/device.h

   376	
   377	static inline
   378	void __iomem *devm_ioremap_resource(struct device *dev,
   379					    const struct resource *res)
   380	{
 > 381		return IOMEM_ERR_PTR(-EINVAL);
   382	}
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
