Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DE1249EB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 06:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727590696; cv=none; b=H8rFc908wZDteRML7YgGrtV5tWD25gZ+5Uvqb2+i3hiyeh926I0k1v99+9nqMm7WNljtZva5lWi4z1SQndicScierxFQuN7HWLSw8nuo2j15xmvvPGmpbfclyGysa3pLj2i/NRZqpxaaQEc69suX+FhlixBSzQJQkoiggdDBi1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727590696; c=relaxed/simple;
	bh=7xFKmgTkH6fzeDFwv+II3Tw2whvUi1wxAekIS3WTxBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O5J/bSujtvvTMRep9CAoYvBUCmhHxojctxTXobvkAa8tgeulQnh+XapdLMV/m3+WbC6tV+P1xvgo/r6U1BYiZ6n6XoXXtXKU3W6G6SUdtvQxroSBvln263UNbWsJrYmr4OmFQzO1Y/tTvpAKmmnzAOtC03FOq5YIUCnoJdaRh48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PikmwrIr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PikmwrIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727590695; x=1759126695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7xFKmgTkH6fzeDFwv+II3Tw2whvUi1wxAekIS3WTxBM=;
  b=PikmwrIrmsNn20pu/8UdkbNGkCeT/VypBqPu3XG1Pi7F1eMvrlWnVPmn
   DEfs1Ta62z9Q8kc9+rpJPmt1wB09xnxr9eHT0BIgDe0N3z3MUxDdyUxW8
   +V7xGz1kxtrqJT62NrUa5+yRye7y0+DoVjhJSh0DFDPXcSnbdoJKyb5nn
   Nv3SsgmsZpz97PLEZcxmjqs/JYooKrEjWuPiMzAriCZ0VU2ZxPJX0R6bC
   IugcB8RrPjSDglDx71VLVjWNvb3nlERGjixvMMHxu3RuQkwLEh9iV2yV4
   f3MUH0MYE9BhIsT/86NPYb7kjGxbiRTwVhYpK30uzL/D5Sum/LhVhPr5w
   Q==;
X-CSE-ConnectionGUID: Z0BcWdH+QiizvNHAd/cuqA==
X-CSE-MsgGUID: aNOFvXkjQF+4fA5j55yflg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26643881"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="26643881"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 23:18:15 -0700
X-CSE-ConnectionGUID: /F7/KL8TTGiecRJ7JXORsw==
X-CSE-MsgGUID: W4wkjhjeQx+tk63wQF80AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73112356"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Sep 2024 23:18:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sunFz-000NwT-0o;
	Sun, 29 Sep 2024 06:18:11 +0000
Date: Sun, 29 Sep 2024 14:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2675/16788]
 drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous
 prototype for 'max11801_read_adc'
Message-ID: <202409291447.QEcxOpl1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: f101b55a17f7b5d6a8feb0c4105138cc57c0cec6 [2675/16788] MLK-11703-1: input: touchscreen: max11801_ts: Add DCM mode for max11801 ADC
config: i386-buildonly-randconfig-004-20240928 (https://download.01.org/0day-ci/archive/20240929/202409291447.QEcxOpl1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291447.QEcxOpl1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291447.QEcxOpl1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/max11801_ts.c:148:5: warning: no previous prototype for 'max11801_read_adc' [-Wmissing-prototypes]
     148 | u32 max11801_read_adc(void)
         |     ^~~~~~~~~~~~~~~~~


vim +/max11801_read_adc +148 drivers/input/touchscreen/max11801_ts.c

   147	
 > 148	u32 max11801_read_adc(void)
   149	{
   150		u32 adc_data;
   151	
   152		if (!max11801_client) {
   153			pr_err("FAIL  max11801_client not initialize\n");
   154			return -1;
   155		}
   156		adc_data = max11801_dcm_sample_aux(max11801_client);
   157	
   158		return adc_data;
   159	}
   160	EXPORT_SYMBOL_GPL(max11801_read_adc);
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
