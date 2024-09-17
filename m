Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83615D5A6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 10:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726568768; cv=none; b=k1fV0IY2+ozVq4Ccuj5HpLGBbnMj93BYFCNg1+96cROohI5tgCogswXGhCve5zKq4lyt2DWsp6Sxy6OI2c3pdYsijBvDYFOQZLG62nWwaH15xqdbjCAif8r4SEdF4K7gkQ3mOrcAW5Efwza1ukeTfHwgULSO/PxpQz9FIFL/o+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726568768; c=relaxed/simple;
	bh=iKN13BcXJcr0NwbSh2K+UINLm8X3rHig5H0nyCccAgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a3hRhaFiKF0Z257a79QBorNvYtNRXb6RcitYsd5psBDnRPAU4EHfUMf6sUVCh8agsC0W3JLCV4hn+3i1lRrQ9yRR8/4uHOlBN1z/ua8Ou0kunlR8D7T75Q0y4WjbYaZXmQOpLZfCYCLBAMZ5z0fswgtZoP9QxN7Uot7D3Qx3K8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXs77KkK; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXs77KkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726568767; x=1758104767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iKN13BcXJcr0NwbSh2K+UINLm8X3rHig5H0nyCccAgg=;
  b=AXs77KkKRRalu82sOGi/Emb5bKYNmffMwXP6VWa7n4i7Hje9CWaXKHcp
   zVwEybmaSPlIWkuKtaxnLQPwKr3qjsjUXO5GWXc+QQ/WwtGMw5yVRxvlf
   FZ+WHLFJ6L5YhMA3wJ7UPlHF3CN7y52QQzAdIQMHDCqs+62DAv0crbuIS
   HknJ3TCXw60ryl/8FLVXJfPzwg2J+RQE3p2SQrxz6r45bIxPNtV8v2hYI
   KjLLjt3n4nxqdmt4wQhZ+Yucom24bsN7JQGgDMimUfyrEzc69rUCvFTxn
   /mfj7NR120pRgIiE31RhiJ6nYnFzACdvRIp/Ixf3s6qg6UReDdKncR60f
   A==;
X-CSE-ConnectionGUID: MAMcpVxgRLGRQ8MKA3CVFQ==
X-CSE-MsgGUID: KvSyXSKDQu6BP9aOUalm1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36554250"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36554250"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 03:26:06 -0700
X-CSE-ConnectionGUID: 9agw7zS0Smi6jaSS+p6DCA==
X-CSE-MsgGUID: iMUdISYMQzqk5k/gf9PCYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69366213"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Sep 2024 03:26:03 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqVPF-000B3y-06;
	Tue, 17 Sep 2024 10:26:01 +0000
Date: Tue, 17 Sep 2024 18:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7251/10952] loongarch64-linux-ld:
 cpuset.c:undefined reference to `get_iowait_time'
Message-ID: <202409171833.WG2q1Apk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   df2c80fc64e69be0095e3315c470353b01ce0c31
commit: 4366f3277270b446deb234bf30fdcfedbc749282 [7251/10952] cpustat: make get_iowait_time external
config: loongarch-randconfig-r064-20240916 (https://download.01.org/0day-ci/archive/20240917/202409171833.WG2q1Apk-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171833.WG2q1Apk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171833.WG2q1Apk-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/cgroup/cpuset.o: in function `cpuset_cgroup_stat_show_comm.constprop.0.isra.0':
   cpuset.c:(.text+0xdd4): undefined reference to `get_idle_time'
>> loongarch64-linux-ld: cpuset.c:(.text+0xdec): undefined reference to `get_iowait_time'
   loongarch64-linux-ld: kernel/cgroup/cpuset.o: in function `.L136':
   cpuset.c:(.text+0x11d0): undefined reference to `get_idle_time'
   loongarch64-linux-ld: kernel/cgroup/cpuset.o: in function `.L137':
>> cpuset.c:(.text+0x11ec): undefined reference to `get_iowait_time'
   loongarch64-linux-ld: drivers/video/fbdev/ls2k500sfb.o: in function `.L152':
   ls2k500sfb.c:(.text+0xfdc): undefined reference to `fg_console'
   loongarch64-linux-ld: ls2k500sfb.c:(.text+0xfe0): undefined reference to `fg_console'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
