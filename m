Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC29A31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 04:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695271159; x=1726807159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OfCh0ZhBGVN4FVPJA6JbydVR3yiGmuWglDZBzeNmphQ=;
  b=AugrpWYREnOLi0ZF46uc20tDsmUmobt4KB9OghhOfFnnw/jLfYi8NYUU
   Hnv9ps0Zv0C05rAjzLZRADcu8L7k1O4AZp8KooTvTV3j/R1fYpOKYKzFd
   45yJrT6h4obl61w5Qg9OI6eNm9p9xWUOCjR4GFrS88g+u3JWpB6TfmMP0
   oFLI9DADBP7BikXAvugDLw3uxjcwc83bE0l/y87rc2BLFTsZjcx6e8kO8
   1S2Od7nRM/4nYORSP9Ij+mcXAAGWrXdcUj2ZTipqS+Y5SyV2SVMvk+ari
   gFET/xxVfIvCgMfR9sK8+qTCFor3kRsRobDCXB33QN74uMcn21OO1mTVy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466724788"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="466724788"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 21:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750219478"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; 
   d="scan'208";a="750219478"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2023 21:39:14 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qjBT6-0009VY-0T;
	Thu, 21 Sep 2023 04:39:12 +0000
Date: Thu, 21 Sep 2023 12:36:46 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 1023/1365] ERROR: modpost:
 "ulpi_write" [drivers/usb/dwc3/dwc3.ko] undefined!
Message-ID: <202309211211.xorIf3li-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   008e6788f5aa09862307822bfc396c926dc0dbac
commit: a9a2045ee9fff8975ed0b20887309d5883ef5edb [1023/1365] usb: dwc3: core: Add support for disabling vbus when suspended
config: powerpc-randconfig-003-20230921 (https://download.01.org/0day-ci/archive/20230921/202309211211.xorIf3li-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211211.xorIf3li-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309211211.xorIf3li-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "ulpi_write" [drivers/usb/dwc3/dwc3.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
