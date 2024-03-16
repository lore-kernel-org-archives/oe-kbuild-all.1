Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51B01CD2C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 23:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710632229; cv=none; b=LgkzOV4QmM9IM5iiCw2H555CsTg2Y4/N+pQbxxQQMJBMPw6kti6hn+h/tkxeakM7bMPFAX7EKg1D4u0UqCF+W5zD8+D1lvm4xO/qCdXqfCtZK69PJ9S3RFCi/VgdzLSTp073nQc9NLeuNlKd8UsTdA1O9o4aAQnJmDgvZL/cnHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710632229; c=relaxed/simple;
	bh=qMFjlE5Pp7fliN9L+q1SCwN119ms+eOCYSKkZgn8NpA=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZwVAbdvPJyjDXLk8FYVp0vLMhQeTjoaatPLtnCmras2Z47rS6SK1Uhvgc+Pw1ukBka1XUtzw79NO5ZrzdbNG+fqVdPO04n5MAHyJ32PCE6P9TXRpu7rByhpMQdhytGIWejjcFQMwm/7kFQn+AWw8yOhriF/1AMbf8hpOT4MN/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnHjyciJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnHjyciJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710632226; x=1742168226;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qMFjlE5Pp7fliN9L+q1SCwN119ms+eOCYSKkZgn8NpA=;
  b=TnHjyciJqNRqNpwMGt7PT1g6BsaMiBdHxEgdB91Wjbb6GEdY4MEqp4vm
   bg2b7zgu8KxGlbEak5jL+Ef1u2Ns9QaQCPA+Y4PnfoL0LuzslfPo9XlVv
   N0YfNo+n7z+f+eR0OQFnvRrxcO9QYKgmNz2+Y0+JMAwOBdq4+GoL1qtT/
   0NZivlVIZNq8oimmQc3baIm57OVuyiMTAtzTX/Lh2CJ/1Np5oMhr2vidG
   PXYSNe3EhoiCHNc0OtwCJwQSdekuKBs00y1/u4u3+VeqzTpZxqPAJuSfl
   Db63zqSbh+HiXwKDu3No33g9Yqblw8v2TT/4DNkm0NdMIA+fuOVHWV0xn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11015"; a="8418846"
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="8418846"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2024 16:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,131,1708416000"; 
   d="scan'208";a="17748001"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Mar 2024 16:37:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rldaI-000Fs1-0Z;
	Sat, 16 Mar 2024 23:37:02 +0000
Date: Sun, 17 Mar 2024 07:36:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 56/79]
 crc32c-pcl-intel-asm_64.o:undefined reference to
 `pinconf_generic_dt_free_map'
Message-ID: <202403170703.WEn0E3QG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   871d5629a0ee4ae82d0caf8d57d4f711d54e1465
commit: 7cda4826851d6659c41427fe84be1084c5aa15c1 [56/79] pinctrl: tps6594: add pinmux and gpio for TPS6594 PMIC
config: x86_64-buildonly-randconfig-005-20240316 (https://download.01.org/0day-ci/archive/20240317/202403170703.WEn0E3QG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240317/202403170703.WEn0E3QG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403170703.WEn0E3QG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `pinconf_generic_dt_node_to_map_group':
   pinctrl-tps6594.c:(.text+0x18e6fc4): undefined reference to `pinconf_generic_dt_node_to_map'
   ld: vmlinux.o: in function `K_table':
>> crc32c-pcl-intel-asm_64.o:(.rodata+0x47f4a0): undefined reference to `pinconf_generic_dt_free_map'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [y]:
   - TEST_MAPLE_TREE [=y] && RUNTIME_TESTING_MENU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
