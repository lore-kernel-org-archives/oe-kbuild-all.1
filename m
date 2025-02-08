Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF212500C8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029458; cv=none; b=q6dywqg8vp7dg0mRwI368+52QkX/S3Q9qCk6w4AL9rRjWy6IvoD+Hh6T1gcJJQlhXKNJvyZ+8My9u7l8dcyw7DguuXKPLvIavCnuYZbWyLRyKoI0n5MXcG0AFliWPBX/l4WwYL3YXHzu74p8ZgtuIwzGpjeJTsjlwiWsug9M56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029458; c=relaxed/simple;
	bh=gg/aTutgnrBvWC2/k6IJC2XRjM6AvZgnGMQycZH7fuE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKlDEwsIF9HyTigbh9XzLXBJCMVr2QTnKQxSKHRqY/maFEIsNcx5svsbnW/t0taZWuKe40KlKjQCsDGjYL+twDWNjF/XXCAqBSrqLc2bkwZu30CKWVs2e3DIxCX4n1TuzUnjf3u6TNbOOsSibVpjLPO+edNV4zrZoz74lnqYt28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7RUy03G; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7RUy03G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739029457; x=1770565457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gg/aTutgnrBvWC2/k6IJC2XRjM6AvZgnGMQycZH7fuE=;
  b=V7RUy03GHvVb+dDKmE9vkOleRB4Km3p44zn3HUftz0ggv9Mf0HEs4dg5
   oD/SsvswUO8F8C43r2TGBhQ89kCLuJ2d7Q1r5G5Kzb3hX4Fa9uevmk31A
   vK0aOG+6vGm6UUEwrQ39uAXzPU9rE74RbG1SINMoNB+6oOPetocwnTxSg
   vGrDJA/9zM/pKN/E8wAadQGnhH4kx/lANphAnzcEDhGTDh5XX5z5HS+gs
   Mmr8IGI3P4eMCqRjez6laVAkeGW2ppk/KdME9qiEbYNxnPSLoCu5CmrRh
   lkc2JD53Z4njN6x9259ZQNhCd2HMgEGfgisvrwuwsrMZOqTxLBHvYcWz8
   A==;
X-CSE-ConnectionGUID: 9W4tqBo5QdaXyJ/+LFKxLg==
X-CSE-MsgGUID: 7BxLD6E5S46ApugTMSneIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50285376"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50285376"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:44:16 -0800
X-CSE-ConnectionGUID: Q13YIxvlRwi6Qs/kmrKI6g==
X-CSE-MsgGUID: 0jpzbQ8zTtWEyUgJzmgEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112682429"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Feb 2025 07:44:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgn08-0010E6-2J;
	Sat, 08 Feb 2025 15:44:12 +0000
Date: Sat, 8 Feb 2025 23:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zizhi Wo <wozizhi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2722/2722] fs/ceph/snap.o: warning: objtool:
 ceph_update_snap_trace()+0xb8c: unreachable instruction
Message-ID: <202502082313.lZnwkvkI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   263072f655dcd6fd63f7d5dd1f9c5553134982fa
commit: 4925e6790b8bb3d912820724a224fbe9bf7ad4cf [2722/2722] ceph: blocklist the kclient when receiving corrupted snap trace
config: x86_64-buildonly-randconfig-002-20250205 (https://download.01.org/0day-ci/archive/20250208/202502082313.lZnwkvkI-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082313.lZnwkvkI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082313.lZnwkvkI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/snap.o: warning: objtool: ceph_update_snap_trace()+0xb8c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
