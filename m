Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B32E1773D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 07:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715153055; cv=none; b=n6L3nJvbBRg4WNNBSaoK6h4Pw03QPp8scezl2qpNw7hldoyha9wKZm/TuqQZb+c8BSFs54efkP0yS4Ud9MAx5V3xNg0kkuYCYQGrWBPdkAhZb1jl4j0SYJ7Q7zHNFsNChwlCCjEPJlwAIATvvswKfvIK5NQA0EugWp5xSzkgz68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715153055; c=relaxed/simple;
	bh=Pkpw29Zp26M15tmH4I3Muhga2RmrSN8tspqX2XBEe9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k/fig3ziDvBgk4Ktju7+4XTCfMXp8gwXOgxtBoM17c8HSHrZUbnOWqAli3r6HMjuz+SRxiQI2O5ecv5fJ4vhjKtMCM8kVnHtMyhONFmxRpgFxhBIKoKx/o4M/06hDXuwf2Bc4H+tIYUeF4yXSq46r35Hz82enm98Vc+anxJUeV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YkXXCquA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YkXXCquA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715153054; x=1746689054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pkpw29Zp26M15tmH4I3Muhga2RmrSN8tspqX2XBEe9A=;
  b=YkXXCquAhwzBVl/elS/NI0TEcT1DmWPgQ134aTYbBdCCBdWy65dxk3t5
   QuvSJzMXJRkg3/3EDa1gLXHlly/uzRzUCM9XTSZjlVvfhCYluX+d2zGyp
   tWsqWEDruUv9FwsCEXI2nq54389eVNZc3T2AqEw78rJyf/0TWd0Ze3BL0
   efOdUNfdqg4hS3lQYOQw9xErSiZmDmJKkDiOAUJbdT1EJVAkczKEVq7zk
   d6gRcGPf//rVRCpq68fiy61hypLI8UfpFmXTpTvuOjfwRrLRBaD1xMuSD
   B1Q4y1Dxt/ZJ7CELYL5Qek+kFOqBuBDK3Re7tJUXDOVfRdAOtDfFfiAa7
   Q==;
X-CSE-ConnectionGUID: AT4GN6W4RnaySqas+u/vSg==
X-CSE-MsgGUID: 9k780zyvSq2DWEUPh2XUDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="13941201"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="13941201"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 00:24:13 -0700
X-CSE-ConnectionGUID: 3b90xFIaRseqo3n+kjQ++A==
X-CSE-MsgGUID: lJT3DJSOQiWqAgHABIBtCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="28882114"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2024 00:24:13 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4bes-00037o-02;
	Wed, 08 May 2024 07:24:10 +0000
Date: Wed, 8 May 2024 15:23:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1625/9446] ld:
 drivers/video/fbdev/ls2k500sfb.c:247:undefined reference to `fg_console'
Message-ID: <202405081542.RUf3xcAg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0993c620607a484e46e5954e6d6b012184a40803
commit: 8248d42b7c5f4338a54f26d8efebec8614b43466 [1625/9446] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: x86_64-randconfig-016-20240508 (https://download.01.org/0day-ci/archive/20240508/202405081542.RUf3xcAg-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081542.RUf3xcAg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081542.RUf3xcAg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `ls2k500sfb_events_fn':
   drivers/video/fbdev/ls2k500sfb.c:247:(.text+0x1225f33): undefined reference to `fg_console'
>> ld: drivers/video/fbdev/ls2k500sfb.c:247:(.text+0x1225f60): undefined reference to `fg_console'
   ld: drivers/video/fbdev/ls2k500sfb.c:247:(.text+0x12261e2): undefined reference to `fg_console'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
