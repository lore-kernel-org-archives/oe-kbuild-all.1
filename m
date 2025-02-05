Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3D2193436
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 16:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774758; cv=none; b=LWVB1ayPjg3OPMSUMGGe6LZZo5DRsMPLsb7csS/jmNJXhf34K9sRgcNLxlg2Tyj9Z2zcx51nuIATqtfFDg01ra9OyrPExFmFnUPCjJGxVOMH0mPxHSc9nFeXMkzLOH+bmhTviJKV3NmQYOA/vRUgB6jBDxkaudRBU+LXHZL+or8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774758; c=relaxed/simple;
	bh=rNQWGae/FAPU/SUbDOCt+b6sHNcMzGnS/0dBxhdIH7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gd7r6iWSw42JogGbFMSiWNc0e+QQL9URXF9PpAnouoJPQB0hek8wsbTlrk8tYgSEIcFhg1WkKwjROrM3qUfHqtFQnpDzZIUBiCaMLICm2+iO2VFF88mbN52iuYunLBLG2Ied/1DN7gldpuStRBKdtuHoeGWXyyZRa2uN2sdLvTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiHF68Wd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiHF68Wd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738774757; x=1770310757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rNQWGae/FAPU/SUbDOCt+b6sHNcMzGnS/0dBxhdIH7U=;
  b=PiHF68WdlzBuxt++brBUt30lorI7eSqThD0bAV7yXWNaWQ4uSAMs4OBl
   TC4r19O4vaMS4YrXH6SJrF/5NHfgc+psE8Uxe6aDtXVqRMM8n19h1kQYj
   lYwPggDwgY038RXqbAT0WXNmCJ92AaR9uPyCqvthzl4gZJjnu4u2PRp/i
   1UDpEantn1yDENM36yMBr/IvRs+ZVvzFqdoLEZdofnXnjGfl5uS5cBnny
   9P4PAKGHEPMac/K5JkrdEMvT6GJkIF2mZI3u7gTeICl+SQXPXyKrcwErN
   alBWKuGq2pEwU6SvrkVSzh4lhg3xEmvXeetsi2zA6n2Z0crWOuGfAttqg
   w==;
X-CSE-ConnectionGUID: 2dllmDskSFKYEXpKjA9wXg==
X-CSE-MsgGUID: X3NE9tw/SV+2/cTWwLkgLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39247198"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="39247198"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 08:59:16 -0800
X-CSE-ConnectionGUID: OrtAeOLgQVqL5x4R671omQ==
X-CSE-MsgGUID: 7Kmrdm2XRtO46Tjtg6h5NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="111134624"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Feb 2025 08:59:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfik2-000voZ-2L;
	Wed, 05 Feb 2025 16:59:10 +0000
Date: Thu, 6 Feb 2025 00:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192]
 drivers/thermal/mediatek/soc_temp_lvts_mt8196.c:230:6: warning: no previous
 prototype for function 'lvts_wait_for_all_sensing_point_idle'
Message-ID: <202502060037.eHmmnb8J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: da40e24aff5b36a331b3113fa10dcc46a6cdda9b [192/192] CHROMIUM: thermal/mediatek: add thermal driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250206/202502060037.eHmmnb8J-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060037.eHmmnb8J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060037.eHmmnb8J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/mediatek/soc_temp_lvts_mt8196.c:74:21: warning: variable 's_index' set but not used [-Wunused-but-set-variable]
      74 |         unsigned int i, j, s_index, msr_raw;
         |                            ^
>> drivers/thermal/mediatek/soc_temp_lvts_mt8196.c:230:6: warning: no previous prototype for function 'lvts_wait_for_all_sensing_point_idle' [-Wmissing-prototypes]
     230 | void lvts_wait_for_all_sensing_point_idle(struct lvts_data *lvts_data)
         |      ^
   drivers/thermal/mediatek/soc_temp_lvts_mt8196.c:230:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     230 | void lvts_wait_for_all_sensing_point_idle(struct lvts_data *lvts_data)
         | ^
         | static 
   drivers/thermal/mediatek/soc_temp_lvts_mt8196.c:860:20: warning: variable 'lvts_data' set but not used [-Wunused-but-set-variable]
     860 |         struct lvts_data *lvts_data;
         |                           ^
   3 warnings generated.


vim +/lvts_wait_for_all_sensing_point_idle +230 drivers/thermal/mediatek/soc_temp_lvts_mt8196.c

   229	
 > 230	void lvts_wait_for_all_sensing_point_idle(struct lvts_data *lvts_data)
   231	{
   232		struct device *dev = lvts_data->dev;
   233		int cnt = 0, i, error_code, mask;
   234		int temp;
   235		void __iomem *base;
   236	
   237		mask = BIT(10) | BIT(7) | BIT(0);
   238		/*
   239		 * Wait until all sensoring points idled.
   240		 * No need to check LVTS status when suspend/resume,
   241		 * this will spend extra 100us of suspend flow.
   242		 * LVTS status will be reset after resume.
   243		 */
   244		while (cnt < 80) {
   245			temp = lvts_thermal_check_all_sensing_point_idle(lvts_data);
   246			if (temp == 0)
   247				goto TAIL;
   248	
   249			udelay(2);
   250			cnt++;
   251		}
   252		for (i = 0; i < lvts_data->num_tc; i++) {
   253			base = GET_BASE_ADDR(i);
   254			temp = readl(LVTSMSRCTL1_0 + base);
   255			if ((temp & mask) != 0) {
   256				error_code = ((temp & BIT(10)) >> 8) +
   257					((temp & BIT(7)) >> 6) +
   258					(temp & BIT(0));
   259	
   260				dev_info(dev, "Error LVTS %d sensing points aren't idle, error_code %d\n",
   261					i, error_code);
   262			}
   263		}
   264	TAIL:
   265		return;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
