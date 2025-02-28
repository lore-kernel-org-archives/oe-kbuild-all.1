Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77721A4F22
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 05:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740720049; cv=none; b=rNehvXz5+F5ayUCyKWIpvR9sgooaKZxkjdesCx4Iykx5u+i2vLMtqe1xSk78nULsfT/Ip74RP4kKEpUx+bDWuLJAq4IFT8irRhZ3fQvmjJ4TgQhA+HABiAbbcTTqps/0sa2PXYR8K1oiy5OCdi7IxWWqi7LPrKMOY51QJoDOB6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740720049; c=relaxed/simple;
	bh=aPoJF0hbZz8XyewNwqunIbkZBehdNSL3Tc9e9NeOK84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jHBV42+QUZEK3aBwJaFNdWphMp6FyVphVjWCEtoeF5ytg8Jru7GPjj8RapBN/XZ1nA5GQ/76lgrnKok5oyDtBcX2lMCubjBe2epNqJ3as+FY4scMJViR6Gxr0D8oKEfZEhDE7+BkzZ6kVT+OIX028yGUsm2vj66lB0agpvcxH9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5N/LTn9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5N/LTn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740720047; x=1772256047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPoJF0hbZz8XyewNwqunIbkZBehdNSL3Tc9e9NeOK84=;
  b=d5N/LTn971Q8dS84CLk6CvKNf6v9NvaYr2fIQJfMubOCaSW5zhLgiY4V
   WvVUYKqr+sylsOSQt+qVjYrxyi3a9j8iYt1STZF1Z2jHQTciHOBw5NMNV
   zQPmFE5NYSvgvs6UWbeSOVKb5iwoj2Hco0eOiPSLXwxQakulwsGrUptq6
   ij4hKLsV3oa/pKvq24/HOL1+cwtOC0F7akqC+m0zoHsn6nb/wQ92TtHqY
   zFbeWgMY1/soTwf+g4q3GDVI8NDg4kyAMq/8aZKZPUI1ylFkdVG3rZoYg
   gNibqIbK80cJpPIvjw0RBBlLLjB2UCtcHTfcbykZhjECGfknsjrOKztnj
   w==;
X-CSE-ConnectionGUID: rROymeeeRQO86e2MB+mcRA==
X-CSE-MsgGUID: ILg9KuAHQfKd34ZailxGsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41892159"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="41892159"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 21:20:46 -0800
X-CSE-ConnectionGUID: HTglwK4uRquAb9pPMsXe0g==
X-CSE-MsgGUID: xYsfWWiNR4OFhDlhjZGsqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="117267400"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Feb 2025 21:20:45 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnsnC-000ES2-2q;
	Fri, 28 Feb 2025 05:20:26 +0000
Date: Fri, 28 Feb 2025 13:19:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 2/2] net/smc/smc_sysctl.c:27:18:
 warning: 'net_smc_rmem_init' defined but not used
Message-ID: <202502281319.af2bmYMw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   3f4a1c56702ff1c8fc29efeaf5b07b6e9821f19a
commit: 4df7307b00f1f9f9872662927bee77ff0a82688d [2/2] anolis: net/smc: Unbind {w|r}mem from TCP and change the default values
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250228/202502281319.af2bmYMw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281319.af2bmYMw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281319.af2bmYMw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/smc/smc_sysctl.c:27:18: warning: 'net_smc_rmem_init' defined but not used [-Wunused-const-variable=]
      27 | static const int net_smc_rmem_init = (64 * 1024);
         |                  ^~~~~~~~~~~~~~~~~
>> net/smc/smc_sysctl.c:26:18: warning: 'net_smc_wmem_init' defined but not used [-Wunused-const-variable=]
      26 | static const int net_smc_wmem_init = (64 * 1024);
         |                  ^~~~~~~~~~~~~~~~~


vim +/net_smc_rmem_init +27 net/smc/smc_sysctl.c

462791bbfa3501 Dust Li        2022-03-01  21  
0227f058aa29f5 Tony Lu        2022-09-20  22  static int min_sndbuf = SMC_BUF_MIN_SIZE;
0227f058aa29f5 Tony Lu        2022-09-20  23  static int min_rcvbuf = SMC_BUF_MIN_SIZE;
833bac7ec392bf Gerd Bayer     2023-08-04  24  static int max_sndbuf = INT_MAX / 2;
833bac7ec392bf Gerd Bayer     2023-08-04  25  static int max_rcvbuf = INT_MAX / 2;
833bac7ec392bf Gerd Bayer     2023-08-04 @26  static const int net_smc_wmem_init = (64 * 1024);
833bac7ec392bf Gerd Bayer     2023-08-04 @27  static const int net_smc_rmem_init = (64 * 1024);
f8e4a5b883c7b5 Guangguan Wang 2023-11-22  28  static int links_per_lgr_min = SMC_LINKS_ADD_LNK_MIN;
f8e4a5b883c7b5 Guangguan Wang 2023-11-22  29  static int links_per_lgr_max = SMC_LINKS_ADD_LNK_MAX;
acc27019c3a219 Guangguan Wang 2023-11-22  30  static int conns_per_lgr_min = SMC_CONN_PER_LGR_MIN;
acc27019c3a219 Guangguan Wang 2023-11-22  31  static int conns_per_lgr_max = SMC_CONN_PER_LGR_MAX;
0227f058aa29f5 Tony Lu        2022-09-20  32  

:::::: The code at line 27 was first introduced by commit
:::::: 833bac7ec392bf75053c8a4fa4c36d4148dac77d net/smc: Fix setsockopt and sysctl to specify same buffer size again

:::::: TO: Gerd Bayer <gbayer@linux.ibm.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
