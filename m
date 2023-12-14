Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BD85D90C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 15:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oj0EngGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702569443; x=1734105443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XO3h6U1HRq9iunala1w3xA+lXyyAet3qk30iclvksfQ=;
  b=Oj0EngGNORquTBt8JrXlr1xQiVi51CACrGGfw+knDfiD5TziW44phy+w
   XTNxfi5Ev1XQdyVRedpmikPL+EhGsrRTxQxH6CHpzWGnyZUtAJrXQlSJs
   IvyGrskK9RyCnBPh4Yzv6Jv8EKgJAIJJkXFbzIovS99MVmak7mG74dFAI
   cV1TCa1XiUJOJJTMgUcc2masWXxQu3lpUn058dl1n54wBSdN1142UMJCi
   v6STnfwHJGElcRHfbr02/SZpMj5RinbIbioSXqQEUf7A/TVR/U2OzvipB
   IGuRxwhGBFsSzTREy3vtV2j13T3a9CHK4smVR3wNq7HXOvYR+Fut44ND9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="380123946"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="380123946"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 07:57:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="777938981"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="777938981"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Dec 2023 07:57:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDo5D-000MFU-0F;
	Thu, 14 Dec 2023 15:57:17 +0000
Date: Thu, 14 Dec 2023 23:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/2] kernel/delayacct.c:218:5:
 sparse: sparse: symbol 'delayacct_enabled' was not declared. Should it be
 static?
Message-ID: <202312142342.HLs6BIv6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   8f2960e1d54cb5da6bca923b4c6ffe785e7551f2
commit: bb57557246d39dba8a66df7f43983fe1ec71bff6 [1/2] ANDROID: Add vendor_hooks to workaround CONFIG_TASK_DELAY_ACCT
config: i386-randconfig-061-20231214 (https://download.01.org/0day-ci/archive/20231214/202312142342.HLs6BIv6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142342.HLs6BIv6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142342.HLs6BIv6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/delayacct.c:218:5: sparse: sparse: symbol 'delayacct_enabled' was not declared. Should it be static?

vim +/delayacct_enabled +218 kernel/delayacct.c

   217	
 > 218	int delayacct_enabled __read_mostly;	/* Delay accounting turned on/off */
   219	bool get_delayacct_enabled(void)
   220	{
   221		return delayacct_enabled;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
