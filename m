Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F4426E6F3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825887; cv=none; b=ltVBsVQME+FbJeoQl8riMP6nUfD6bOexiJU45o9A/Htc/ECWViKjoj5/06NEgS00LYHxmj40yOwoFafnpZDUk4KZXaeFeUNso8v2mN6CDcFoiEPHNKmzFMHzubvDdA41DdBMRl1+e3f2CqeOcfwAyaFvOeUSO4PFP65p6PIy+8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825887; c=relaxed/simple;
	bh=F4HqSZNUOfXymGiHZKV/BpdAStXqg9WU83eTkoWIlqs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AZmJi5m8VXgEPo6LZ7t/3J8MUMEavisOv/oIqwaAFP+bDnO2SfzY1rYW1Qf00rLww0PCQl8SKiBHCXJ0TPgoLoGB8sgUy+b3BhmSM8BjLb/txpqhgvQJQSOipZu3Ga//Frp61WBxMrx+7mdku5d4k6TgYjE4nbwq9SktWP4ZGY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCxc6Pyp; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCxc6Pyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777825886; x=1809361886;
  h=date:from:to:cc:subject:message-id;
  bh=F4HqSZNUOfXymGiHZKV/BpdAStXqg9WU83eTkoWIlqs=;
  b=UCxc6Pypg9CaP1vVtsMjOWVcP8uVjyfQ4xRFPkBoe6ZMc5S7vcQQMnAH
   HNc6OISzoqkrMSGgWNrvY1TB0tJRZk4K+IpxRAjVdx/OteLT1sUodkQgU
   fqoMKkT70RlGeQrPIb5kV2nrhJYkk12Ybb0gXKyK6w+hWJR85oDFnIG4M
   6W0kRW0iZO2FB4hbt1K74AerkHhVfSnRS3aqOoaiG4QNrgU+h28LHtSsK
   LA/Z6SRWEVnvLsK2SNU1FwT2DgrXPbjskDzXMB4qt9uLgOZ4+Mr8+hZ9m
   gt/uejCX28LTFKjVzezmZpfmHp+ZF7/8mVhic1bBGh2+AfOKGSnVwVKKE
   Q==;
X-CSE-ConnectionGUID: F5LvlU9LTy+LGKfmwN41gg==
X-CSE-MsgGUID: VfQTonYJQb+JfkwonCPDow==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96269621"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="96269621"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 09:31:26 -0700
X-CSE-ConnectionGUID: gT1xsTffRTm6LYk+FpiDAA==
X-CSE-MsgGUID: 2cFl5AMtTu6UBA93PlnkZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="258672823"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2026 09:31:24 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJZiq-000000002lF-45he;
	Sun, 03 May 2026 16:31:15 +0000
Date: Mon, 04 May 2026 00:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 4/4] Warning:
 drivers/net/pcs/pcs-xpcs.c:1523 function parameter 'skip_reset' not described
 in 'xpcs_create_mdiodev'
Message-ID: <202605040022.7JPteciQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Michael,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   3cfe7560e41c022de7b71f73434e1336140dd737
commit: 8bc3d99d56e4782d8249523be7ea84dc6c27b4c2 [4/4] net: pcs: xpcs: enable xpcs reset skipping
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260504/202605040022.7JPteciQ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040022.7JPteciQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040022.7JPteciQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/pcs/pcs-xpcs.c:1523 function parameter 'skip_reset' not described in 'xpcs_create_mdiodev'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
