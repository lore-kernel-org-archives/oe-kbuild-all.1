Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E392727FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760779082; cv=none; b=DUXlddFTOdHN4+hual5rJxF56/MTgsPTh97GOq8RLQm8OjRwL9YnK8BKjzUelpBu1y7ZK96XxzsnUi/7HnFTlk3V8sfm1bmenBuZQt3NlflQKk06kYUQa9TLqc2eXCSIOcC1wD0OaD+jUP85jnPhfbbyqtmn8b/ZGB+4JzYHvCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760779082; c=relaxed/simple;
	bh=XTSX1Upd0GI/jdaXj/GZ4oBi1qFzi7P5y9M1R7nAR1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mtzCOMZ+Qk9FGmfjbx1KBxfSBsisJLuQYOul2+AzXoA4Y5weMeqCIMWCyB94kpOorrvulGlL3Heh8LiSeRR7QV3ayKbqAwkKUL0jVlF22DzAxp1bUCh/isUMH7M1jrjNg3HYZrl//rnO90MDtCDdQLW8h0rELRpyGwoxy/SxNhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Za7w2vB7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Za7w2vB7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760779080; x=1792315080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XTSX1Upd0GI/jdaXj/GZ4oBi1qFzi7P5y9M1R7nAR1s=;
  b=Za7w2vB7lY1qpyj+8TVh9jSIkGgHKWed2z9D2zYJphNV2Ngog6A9lHNM
   HLMAus4+lRMwlN9Dzk+8YSzDTfgeSN0N78QnfL0lEU9HxH+rua/RW2eOx
   LjvxUFg+ycCqX9UApIxJ7hAsG2Odx/BDJicNbKDYD3Ffa50m/WNzVCRl2
   d09h27Pab5iyj+64YPt61ywvz0WBCsdEjIOp5hoe4zG9bI6zLyxL2+LAM
   UzQ9yXtoyiIthaKHgkxGFvzVW3EaLD/dWLmo1kLkx4823V2DyDE7S624p
   220+KobppYEftYK7QPAnauGpo4uWcqpn+9zl2TB6A0n8Qyulp5q63uy+A
   g==;
X-CSE-ConnectionGUID: Wjva9uyfSqG2X5YZpIXE/A==
X-CSE-MsgGUID: 2FkYWuwVQr2skOQP4MuGqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="63074342"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="63074342"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 02:17:59 -0700
X-CSE-ConnectionGUID: rim53xKXTbelxqak1DzIbw==
X-CSE-MsgGUID: JUZxYRoIT4WKWjTBV1mAlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="182117792"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2025 02:17:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA34W-0008Bx-2Q;
	Sat, 18 Oct 2025 09:17:56 +0000
Date: Sat, 18 Oct 2025 17:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.6 19/21] cgroup.c:undefined reference to
 `bpf_psi_cgroup_offline'
Message-ID: <202510181737.cmund8aS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.6
head:   3f3d45da5408178ed67987b86fa78d5706771389
commit: 87528dbb6f12e6c89f6545260cfcc51833e5e004 [19/21] sched: psi: implement bpf_psi struct ops
config: i386-buildonly-randconfig-002-20251018 (https://download.01.org/0day-ci/archive/20251018/202510181737.cmund8aS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510181737.cmund8aS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510181737.cmund8aS-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/cgroup.o: in function `cgroup_bpf_lifetime_notify':
>> cgroup.c:(.text+0x1edb): undefined reference to `bpf_psi_cgroup_offline'
>> ld: cgroup.c:(.text+0x1efb): undefined reference to `bpf_psi_cgroup_online'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
