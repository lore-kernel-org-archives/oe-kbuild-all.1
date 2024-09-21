Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6821F957
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 18:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726944666; cv=none; b=KxuDmasbdKapFGL4AZGgDaOQ5yTYWfpM6rVNGV+wAnvlTx3Xggq5OzykBiBccMsoeNSv39KGMf0LPOMyCbQALHvGXCpn6TB17iCOQkX2bzNB+N232YOsWyNBY3zYKUoL1rxYvP4kMoOOixDlLpKvbplQRSF/8JXJk+wYdNZ8qgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726944666; c=relaxed/simple;
	bh=ghbGCx9zItCMJaKe/yAQJ1oMRmyetRMEoX5gsczkouA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rI3M/74WV7kPNm6VgfshPh91MabjiWKyiAdYWYLwGnII8E6J8gtPmBTv5G750HAwllmGE4v8G7O0m1lTnGVTw1CYj46+xUMVRxzefEVQQrTPkBTVn9yKOeD4BnlYxmUQy8MAtZjZ+72qNxj4fhpYj12tDH5YkaZE+7kH5U48PhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mQpNfNjp; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQpNfNjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726944664; x=1758480664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ghbGCx9zItCMJaKe/yAQJ1oMRmyetRMEoX5gsczkouA=;
  b=mQpNfNjpK2tcDFgwUKpy9L7jc0OSTr9HBO54xcRyEOTTNPzO4dJgtuEW
   inR+oQahtRB93YMJecIJLGeNJJhycdyGK9iVdGROJOgJltGpUdFfixMCx
   aj0SBaaTyI1QA914/96syDI88Dy6MGJpG9Z7cnDNp8x5kzA5ybbBWDMJM
   pHSXUR0X5+4BrRn2V33BH8BdLpOEOIcTuxqZ9vVx3/eIwXs7PkgvieR16
   Zf48pUsg2SE/QLtmragxSXZS4ypl7kvWlHwhnuWnacBMhyhe1UBP+4FBD
   2g8w9yieG8kH045sl62tkLxVtqcIoOyci50NW61JcpOcfD0nuRNrvGuqm
   A==;
X-CSE-ConnectionGUID: LdITirYbRBau/KvrvDmq3g==
X-CSE-MsgGUID: NQNBv5bZQ4yMFjoEb2qjtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43402731"
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="43402731"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 11:51:02 -0700
X-CSE-ConnectionGUID: p9ZAWFjLQwGw78+49oYCHQ==
X-CSE-MsgGUID: NZ7v0zmwQVCTEIJ0D8tBQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,247,1719903600"; 
   d="scan'208";a="101486317"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Sep 2024 11:51:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss5C6-000Fi6-3A;
	Sat, 21 Sep 2024 18:50:58 +0000
Date: Sun, 22 Sep 2024 02:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17425/23728]
 drivers/i2c/busses/i2c-hisi.o: warning: objtool: missing symbol for section
 .init.text
Message-ID: <202409220229.dtDgIDDl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3bbb0f885bf0f93bee0bb99c623877588ae005ee
commit: f4c6df89b7d391c38011a39858a84e3d8fbc7ada [17425/23728] i2c: add support for HiSilicon I2C controller
config: x86_64-buildonly-randconfig-002-20240911 (https://download.01.org/0day-ci/archive/20240922/202409220229.dtDgIDDl-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220229.dtDgIDDl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220229.dtDgIDDl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-hisi.o: warning: objtool: missing symbol for section .init.text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
