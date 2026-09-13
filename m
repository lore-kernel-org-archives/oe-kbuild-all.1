Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEF32EC09B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 05:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789277495; cv=none; b=iQGp9AD+6P+sYkMloUamTDMXmzyI5Hg8BUcuBgoxEiREOysR9UZuZLHTpLKy5sw/4psaiV4Kp1XeT1v6gT/X2RGou29bwPeI9/zujBIC9YPHElrNUKbHE+ckAqoALLnsQTbcH1lcH3oL+Rdd247814bHwkNuoBUcdnGRH2i5WDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789277495; c=relaxed/simple;
	bh=2uvmo5XZq97o0NQccvJflXmvfYV3HnmApOIagKw3wrY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OfVnJaRYW0kYc0fBLpIR4jYQ662B0jEyBBx4MMKo8YvL4WCr4Xa67iv0tkcXoZ9f7Fk/e5LZuK0OX2b2De3Oc11x84P9wGlyaV2Ih+fqGhV7ifwd7pPQj9GPTmT+1fK/SIxw0WxXpeMfCGufOV3xhlY4uGIDZLrB4WXUttNoWIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTkwHp0U; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTkwHp0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789277491; x=1820813491;
  h=date:from:to:cc:subject:message-id;
  bh=2uvmo5XZq97o0NQccvJflXmvfYV3HnmApOIagKw3wrY=;
  b=dTkwHp0Ui0btjaN9UbcVyX3k9fyqzITfdj3o5q1DSEx05uFQpIEigpKj
   2Ff02JgWmdtObKO1iqo8gG0zDVhTXXlcXu4qesDTT3CKjqoj+DEeiwxXL
   MOs1lgZUNJXRjhdAhxkQZF+Qj/dRul3xWG9oZm+Mdhhfi1uSQep1t3bVc
   Eb8TJ4UEnrzJYonASZPbBfPpioS6+pQ/oblqvYrH37M7Oxq3Ed1LzlWBE
   NR9kT/5UmwWt/lWmDLFZehGYVs3knKtsL5RsWbpWpyHdAqyuTItvJFxMn
   kTZuyimglyVqQd4NyMnKVkaa/N3SHIza+Ih9DM7kXRt1pJwK3jkU6EMP2
   w==;
X-CSE-ConnectionGUID: w/lKFLMNSPWkIbC/G3lXNw==
X-CSE-MsgGUID: 51Jrb2bvTfC2LgZRAniT/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="107191346"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="107191346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 22:31:30 -0700
X-CSE-ConnectionGUID: SH6mwDf5QreTxNg6MeP8OA==
X-CSE-MsgGUID: WQwMufeQQSqJgfMJS2HO0Q==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Sep 2026 22:31:29 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5clY-000000003eF-02dZ;
	Sun, 13 Sep 2026 05:29:34 +0000
Date: Sun, 13 Sep 2026 13:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:727:31: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202609131322.cbdmZwBY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   f598b4e36c5884e38780f70315660738694c035d
commit: 0f2d1bcdd01c2b009d6ce688739a3de50bf5e19b [1/1] net/mlx5e: Properly access RCU protected qdisc_sleeping variable
config: arm-randconfig-r121-20260910 (https://download.01.org/0day-ci/archive/20260913/202609131322.cbdmZwBY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609131322.cbdmZwBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609131322.cbdmZwBY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:727:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:727:31: sparse:    struct Qdisc [noderef] __rcu *
   drivers/net/ethernet/mellanox/mlx5/core/en/qos.c:727:31: sparse:    struct Qdisc *

vim +727 drivers/net/ethernet/mellanox/mlx5/core/en/qos.c

   723	
   724	static void mlx5e_reset_qdisc(struct net_device *dev, u16 qid)
   725	{
   726		struct netdev_queue *dev_queue = netdev_get_tx_queue(dev, qid);
 > 727		struct Qdisc *qdisc = rtnl_dereference(dev_queue->qdisc_sleeping);
   728	
   729		if (!qdisc)
   730			return;
   731	
   732		spin_lock_bh(qdisc_lock(qdisc));
   733		qdisc_reset(qdisc);
   734		spin_unlock_bh(qdisc_lock(qdisc));
   735	}
   736	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
