Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D616C12B17C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 21:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725830084; cv=none; b=sRLxcGy2XClROpVs835FnFU26IIhiJ00gTNDRJv4oiAjBLTd70ncjQ0hh0kaLTUNiRN5zPj8k2xetc0+pGp6HmApwnt42q+RS6jgDvL+XWpZSi0lW1TPnKORfgHHuRQ4YqIQY6sMOEOVVt6W3ZnJfZ/XOavnB7HgfIHOD4K0qsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725830084; c=relaxed/simple;
	bh=1Xk73ax5oKiABCWAg8O8BkxKn6moOYWL1M5Oju+iytE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XRNJ9MsBWHsUZTY3KhOCOLakknpcvaSR0lf8VGW5f0XcoCwUW/TI/XcyyZvq8WFo7QsZRp3RWpGWaUzfK4rbCJzl0ryHNgTWk/INUWwfS4EuZJpFs1v22QaAav3XCgtKABoqEefM23Zh0R3mubBQGvjECwuc1dB2j1G0jRpvZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cmq+zEDX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cmq+zEDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725830082; x=1757366082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Xk73ax5oKiABCWAg8O8BkxKn6moOYWL1M5Oju+iytE=;
  b=Cmq+zEDX1A+XsjGFQGVTiR97sXJf08Dzxf1wZuRtcvCBP9aS8iLVTM5r
   hv5Fz1YwWl9aSFNftWHNJLsa59rP8K8MAQBrWnsJr2RmNCRqIjq4Nc8ac
   mfCls6xnchDhnu0uubIQI/Lht30FK9m8ZZaqQNErerqKKZUaWaEGVH2OS
   vHHTHDFS2rUilkLeOk+lhnv9G9ngafa1Ma6eo2cDcixj1BmaB2V6ZwwqD
   TadmpiSh3f3WctLYBkf3x4HNOKpyjtcdpmQtCMuh2qoX3RN40lw4mKuZ+
   WmVLk3K+qYlXA8mgcohl0omBFQh6qvtw7iyK6mOseQ39sIdr/p5ETEY30
   Q==;
X-CSE-ConnectionGUID: 4lSeB8suQT6z18hx3Nd2EQ==
X-CSE-MsgGUID: xkqAxaQKRruLcCiV/UrJ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35888282"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35888282"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 14:14:41 -0700
X-CSE-ConnectionGUID: ANTTFDpeQpSfPDSwFj96AA==
X-CSE-MsgGUID: MEfXHuPzQ9yESG7SKZ5iYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="67203519"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Sep 2024 14:14:40 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snPEz-000Dyb-2R;
	Sun, 08 Sep 2024 21:14:37 +0000
Date: Mon, 9 Sep 2024 05:14:25 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/3] tsm: Add TVM Measurement Register Support
Message-ID: <202409090445.njWQqnOA-lkp@intel.com>
References: <20240907-tsm-rtmr-v1-1-12fc4d43d4e7@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907-tsm-rtmr-v1-1-12fc4d43d4e7@intel.com>

Hi Cedric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 431c1646e1f86b949fa3685efc50b660a364c2b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-Add-TVM-Measurement-Register-Support/20240908-142434
base:   431c1646e1f86b949fa3685efc50b660a364c2b6
patch link:    https://lore.kernel.org/r/20240907-tsm-rtmr-v1-1-12fc4d43d4e7%40intel.com
patch subject: [PATCH RFC 1/3] tsm: Add TVM Measurement Register Support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240909/202409090445.njWQqnOA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090445.njWQqnOA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090445.njWQqnOA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:6,
                    from include/linux/string.h:374,
                    from include/linux/uuid.h:11,
                    from include/linux/tsm.h:7,
                    from drivers/virt/coco/tsm.c:4:
   drivers/virt/coco/tsm.c: In function '_mr_write':
>> include/linux/kern_levels.h:5:25: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'ssize_t' {aka 'int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:437:25: note: in definition of macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:518:9: note: in expansion of macro 'printk'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:518:16: note: in expansion of macro 'KERN_WARNING'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/virt/coco/tsm.c:632:17: note: in expansion of macro 'pr_warn'
     632 |                 pr_warn(KBUILD_MODNAME ": extending %s/%s failed with %ld\n",
         |                 ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
