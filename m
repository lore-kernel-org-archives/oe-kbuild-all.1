Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5D815E5C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752846740; cv=none; b=GJJ5AUOtng2UXnHNfljEcaGpGtpBvdauDKeS5vmhguHbuz3uqI3VDGto4TR5pVV96GstZ3KQCz02bi0DihebzNCjfEUQyBXfoKxfta+dn1/Pgxpx3buQRrN3+/YF2lMOOrg6FUox1BN/WxPwQ86bHhzwyBEqPZuStdwoO96HZvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752846740; c=relaxed/simple;
	bh=IXDh2MWbhVfH79Ncia7QedgAVxm1mHV+GSIAkT3G2bc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOXcBD6Fc6rDeDdtxY2mDhEq5Lq16737amv2ODT3WEL0Pme2wtCkCao6yMJfrimu83tOcQs3Qa6NtMZgOW8hs5cD/b1h3xX4q7CMU51VonSKpQL3LWvWWgq9WYrwHVZt9a+NTdldUhqQsmpu6ViDd5jej48GTayZYJztjeTbrbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5l2jbY7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5l2jbY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752846736; x=1784382736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IXDh2MWbhVfH79Ncia7QedgAVxm1mHV+GSIAkT3G2bc=;
  b=l5l2jbY7DBC1vxVk/vE3VgzcRyTE7/aQqRiukI/ysnxN/dWmuw1Ihw79
   sqcsYMNR+C/ILoJzwvHLyFxmPJh5p9L5swxbyUwLkr0VTLO2T2QjKRKkh
   FJByWQEMaUiGoX6wDYnrp0sizEjVAgm40mP24N2TCbG8xaTJv1jfVIvDI
   dbeJJvhbJaAIA5ykP5FONuLoPWBCDYWx75vxnUslnni+57JPf5/T33MXl
   yuo/DhAbSpGHT4zcctKpgdWHQwCl5sFP3UzLNLwEFvt7w1mFH0A+zy1O/
   HHTJXSqDyOcW6ZA9Lh9dlIHvfKWU4K1AvSNkEoWne3BJAHjHQBQvo+hnJ
   A==;
X-CSE-ConnectionGUID: dzy7S+orTaW7AaGijJYOuQ==
X-CSE-MsgGUID: 7QbciA+2QDqxYZ4YtUjL7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="42764920"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="42764920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 06:52:15 -0700
X-CSE-ConnectionGUID: h1pRA3o5Q8uyV52VWYLLiQ==
X-CSE-MsgGUID: lqv4koW9TyCOACbXeVGDYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="157445778"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jul 2025 06:52:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uclVU-000Ej1-1s;
	Fri, 18 Jul 2025 13:52:12 +0000
Date: Fri, 18 Jul 2025 21:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1732/1732]
 drivers/mailbox/phytium_mailbox.c:122:34: warning: unused variable
 'phytium_mbox_of_match'
Message-ID: <202507182149.MLClqzfv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   700db19c02e9c8dcf291aa7a6a29337c97ea1805
commit: 1ae9436b02e93f1f2b9cfc10226812197fbfcd04 [1732/1732] mailbox: add phytium mailbox driver
config: x86_64-buildonly-randconfig-005-20250718 (https://download.01.org/0day-ci/archive/20250718/202507182149.MLClqzfv-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507182149.MLClqzfv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507182149.MLClqzfv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/phytium_mailbox.c:122:34: warning: unused variable 'phytium_mbox_of_match' [-Wunused-const-variable]
     122 | static const struct of_device_id phytium_mbox_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/phytium_mbox_of_match +122 drivers/mailbox/phytium_mailbox.c

   121	
 > 122	static const struct of_device_id phytium_mbox_of_match[] = {
   123		{ .compatible = "phytium,mbox", },
   124		{ },
   125	};
   126	MODULE_DEVICE_TABLE(of, phytium_mbox_of_match);
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
