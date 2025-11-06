Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78984306489
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 23:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762470631; cv=none; b=skB1KvVPv9HjzIyx4YkpT4K1JeCvhoVVAUOjL4X1TON/14S8R6ZzKES6VkAvm4Tl88GJGmpSVggd6nlpl7I3NDpfkqAdOxcRuLs63L+BvSooRXz0+B93KInnktXr9z6SBxfmgBQc9Yu2Pnw4fE6TK9hqxNiVVUYgoDO4HVcajXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762470631; c=relaxed/simple;
	bh=Qn1cLNw/ZdYkoUu0PFZUu6fhlZmfcJ9+jGdH/jwjq9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4o1eWVayJBuJtKS2KexUDYlO/3sB0y+siswoLt9QPxIKJW5eikofk1BmQiAf3BKMmpVOPcJQnmRlNDewAAUtKhVDltwTzoRfpMkkLBDuDJDfFqHZPo1cFFvxiHXGNYrMEIQTuRiG69f75gGYtWVOcuBrH/Pwn2XYzaT+pzCQ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgBpuBtZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgBpuBtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762470629; x=1794006629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qn1cLNw/ZdYkoUu0PFZUu6fhlZmfcJ9+jGdH/jwjq9Q=;
  b=NgBpuBtZRvGTlBwYartc/v+kIsPoAY8/RoYR4H4gsb3mhOpvCENkY0VU
   dAFwZ5tm0Tt86vAmSLgLZHX6JeVYP6WavtYbQ6rqhcMAQID+R5d8/9Ie7
   OHBjwzYwExoULFsjNtOa6+kMGjsEARN/oCD3hoJlYSMafbP2Kq4WY3Hhq
   aeh+6HkRH5nq3GORW+tbubE5BXb7+vZYPBnFLZZn6jDywTOQJGAzembBx
   wJRSj/xE05pBy5bGDJymKEOGA8IgtdpSDJtWPBXiIekj0jHykKhfiKkkR
   BYjDX4Mb2BeFBJqeLA6zoPyzUhBGgqip7PVNxgoncyZ9Xt62rBGA9nlVE
   A==;
X-CSE-ConnectionGUID: O5kg9SroS3+wR+dYi5HK7w==
X-CSE-MsgGUID: rYnIcLPRRPGfNlWaUfJ8Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="75230959"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="75230959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 15:10:28 -0800
X-CSE-ConnectionGUID: YT3as7ZPR9Sglz5/WbQByA==
X-CSE-MsgGUID: LsWtj38tTaGnpyEZ4i0kXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; 
   d="scan'208";a="193058155"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Nov 2025 15:10:25 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vH97W-000UQi-2I;
	Thu, 06 Nov 2025 23:10:22 +0000
Date: Fri, 7 Nov 2025 07:10:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2 3/3] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <202511070654.mdaukM8U-lkp@intel.com>
References: <20251106050839.3091707-4-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106050839.3091707-4-ekansh.gupta@oss.qualcomm.com>

Hi Ekansh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.18-rc4 next-20251106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Move-fdlist-to-invoke-context-structure/20251106-131118
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20251106050839.3091707-4-ekansh.gupta%40oss.qualcomm.com
patch subject: [PATCH v2 3/3] misc: fastrpc: Add polling mode support for fastRPC driver
config: parisc-randconfig-001-20251107 (https://download.01.org/0day-ci/archive/20251107/202511070654.mdaukM8U-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251107/202511070654.mdaukM8U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511070654.mdaukM8U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/fastrpc.c: In function 'fastrpc_set_option':
>> drivers/misc/fastrpc.c:1883:9: warning: unused variable 'err' [-Wunused-variable]
     int i, err = 0;
            ^~~

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


vim +/err +1883 drivers/misc/fastrpc.c

  1879	
  1880	static int fastrpc_set_option(struct fastrpc_user *fl, char __user *argp)
  1881	{
  1882		struct fastrpc_ioctl_set_option opt = {0};
> 1883		int i, err = 0;
  1884	
  1885		if (copy_from_user(&opt, argp, sizeof(opt)))
  1886			return -EFAULT;
  1887	
  1888		for (i = 0; i < ARRAY_SIZE(opt.reserved); i++) {
  1889			if (opt.reserved[i] != 0)
  1890				return -EINVAL;
  1891		}
  1892		if (opt.req != FASTRPC_POLL_MODE)
  1893			return -EINVAL;
  1894	
  1895		if (opt.enable)
  1896			fl->poll_mode = true;
  1897		else
  1898			fl->poll_mode = false;
  1899	
  1900		return 0;
  1901	}
  1902	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
