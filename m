Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A648F11188
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 20:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585070; cv=none; b=VlFfPMjrNRR4SXYa0p+2FXcj08R6E+q4k5ai4++AnDijDa5Pmueopr45ktdc+Fpg9k19/QCaVwCr4C7KsyUe3lUWvnhgclTuIDuROO0eSofXDDv3+ayfG5+zmvjKTQZc9IpU7U3TM6EvzI/LHVPNfEUusi78IcUSMceE0hH82WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585070; c=relaxed/simple;
	bh=6T0OFTuzRH/YWllWgB/Ca97/jWw+yEojRMd8O8sLbWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GX7fAVLTqIsN3Xdm7lUhcVTVXEy0czIc7o9Junhxw8UpBAl4CM248YpD8SZT0Zl2f0Xg5eyR1HjH1Xe8Nvc88ODEYhnRmPLq244igMC8SsF1ZP+otRYq3WVOM5W7TDz2HMJN1yvF+cTLL4ydbJZbP5Lc+mjeFeV6TXk1gxbWf5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+c5/A84; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+c5/A84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709585069; x=1741121069;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6T0OFTuzRH/YWllWgB/Ca97/jWw+yEojRMd8O8sLbWs=;
  b=N+c5/A84OG0aEG6hEr9U+ieaz/UXid/n1OTBThSmZ3W/vLjG3irkbLgB
   XZj5WESou1uh9MBia6Nu9RjD1ZtzGdDlP9wpDFwZ/8YIThYOLxK1a3IbL
   /+p11OVfw1WgS6z4egb3D95yoiFpCRdDtxMyFCEyirEToFsYsRww2eh4G
   hjtGL3UR5GiFEJvhfNlffa6KqD0jqao741DGdabvvuGO/r1kYGaJUbFrB
   iZBy6Ds7EFB6ssQ1wQg+yyot6pOxc7w2u2tAJKCtiFZDzhPtfDBulHxUq
   dGx7L4EDEafC3XEbBFTwysRPZTe5YbEdIe4ts3xjL0ggACDO6qw2J7CUb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14747225"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="14747225"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 12:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="46640076"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Mar 2024 12:44:23 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhFAa-0002kn-0R;
	Mon, 04 Mar 2024 20:44:20 +0000
Date: Tue, 5 Mar 2024 04:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk-pm:opp/linux-next 2/4] drivers/opp/debugfs.c:90:57:
 warning: 'snprintf' output may be truncated before the last format character
Message-ID: <202403050451.4A2vDuYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next
head:   0275dc46489419f34765c6ed389c0e9d6245fd31
commit: 50a1a0f23efdc261844a306f5e611051843b4e52 [2/4] OPP: debugfs: Fix warning with W=1 builds
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240305/202403050451.4A2vDuYM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050451.4A2vDuYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403050451.4A2vDuYM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/opp/debugfs.c: In function 'opp_debug_create_one':
>> drivers/opp/debugfs.c:90:57: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
      90 |                 snprintf(name, sizeof(name), "rate_hz_%d", i);
         |                                                         ^
   In function 'opp_debug_create_clks',
       inlined from 'opp_debug_create_one' at drivers/opp/debugfs.c:162:2:
   drivers/opp/debugfs.c:90:17: note: 'snprintf' output between 10 and 20 bytes into a destination of size 19
      90 |                 snprintf(name, sizeof(name), "rate_hz_%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +90 drivers/opp/debugfs.c

0430b1d5704b0f Viresh Kumar 2020-05-18  76  
2083da24eb56ce Viresh Kumar 2022-06-10  77  static void opp_debug_create_clks(struct dev_pm_opp *opp,
2083da24eb56ce Viresh Kumar 2022-06-10  78  				  struct opp_table *opp_table,
2083da24eb56ce Viresh Kumar 2022-06-10  79  				  struct dentry *pdentry)
2083da24eb56ce Viresh Kumar 2022-06-10  80  {
50a1a0f23efdc2 Viresh Kumar 2023-09-27  81  	char name[19];
2083da24eb56ce Viresh Kumar 2022-06-10  82  	int i;
2083da24eb56ce Viresh Kumar 2022-06-10  83  
2083da24eb56ce Viresh Kumar 2022-06-10  84  	if (opp_table->clk_count == 1) {
2083da24eb56ce Viresh Kumar 2022-06-10  85  		debugfs_create_ulong("rate_hz", S_IRUGO, pdentry, &opp->rates[0]);
2083da24eb56ce Viresh Kumar 2022-06-10  86  		return;
2083da24eb56ce Viresh Kumar 2022-06-10  87  	}
2083da24eb56ce Viresh Kumar 2022-06-10  88  
2083da24eb56ce Viresh Kumar 2022-06-10  89  	for (i = 0; i < opp_table->clk_count; i++) {
2083da24eb56ce Viresh Kumar 2022-06-10 @90  		snprintf(name, sizeof(name), "rate_hz_%d", i);
2083da24eb56ce Viresh Kumar 2022-06-10  91  		debugfs_create_ulong(name, S_IRUGO, pdentry, &opp->rates[i]);
2083da24eb56ce Viresh Kumar 2022-06-10  92  	}
2083da24eb56ce Viresh Kumar 2022-06-10  93  }
2083da24eb56ce Viresh Kumar 2022-06-10  94  

:::::: The code at line 90 was first introduced by commit
:::::: 2083da24eb56ce622332946800a67a7449d85fe5 OPP: Allow multiple clocks for a device

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
