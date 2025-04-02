Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6588627452
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 02:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743562055; cv=none; b=LK8xWgnlKCuX70B674KJUdsQniKvy9m+mgk1Mdst5k0XTP6piMhEi/PlzEwUxjKzYqz2qR/XUjLw8eku3ADc3STQVwzwr4AJ8r9Tzuy+pHu8NNhqWEXfH03pTOWB7M8GC+v8w+ctMAKkRkvQX9MofTMdrENleO1kutFOdj2p1/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743562055; c=relaxed/simple;
	bh=gxvhhJjo2Pa/10wA1wlby2S5/yG7CACJhhADphyGPG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=saTIN6Mg141j/2i4bPYsRMuLhTWRNWof7XQS42t7jd7YffEXlOW6PD/PQShvaclJICtDmQso2EWzqBhrH622ONtsEAt/JDWZuqZZUJGht7L2DB/Q0+nsUAiP8/DeEayKzXe1c2MJPtu0fJGqFnL91XrmgNPAeM5WELxhYEQnkVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PUbJwa7Z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PUbJwa7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743562053; x=1775098053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gxvhhJjo2Pa/10wA1wlby2S5/yG7CACJhhADphyGPG8=;
  b=PUbJwa7Z2UIK4lqkb7WwzX66Bj5FeXsVNT0TUlp3UVo55h2semjJF8vL
   kVo0IBYzd1rzLuRiRQYZOeUqg1b55CitYqeX0G5/3ozNii1mfDkkf09BX
   GWfnEIwT1Wc5sOqFAaWC6lwH3p4ebpnU9QuQhzMdfXfrdVkD9FqQ9vfot
   TixO+Pv6ShUqT7nrKoqoJGekpM4zVt22l4DjwhJthyqAXWRRwmVjkHySN
   YC2OVYSf9ptYXUNdFxJjd7ZZ2bPu2ZsVzGXI7VHLWSfK6MVlH0XZMkyTt
   JLpichRIXt7pFpADHqtHhojGLmadx7Cw2k3xK1Wvo/rxzHzZe8MlqsBhM
   w==;
X-CSE-ConnectionGUID: +t4TnAlRQjmOY/dtMoAP2w==
X-CSE-MsgGUID: 0EIYRts9Q3+HkIjn/yGuxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45006763"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="45006763"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 19:47:32 -0700
X-CSE-ConnectionGUID: qs2lUnrpQMO92iQGvOEMVg==
X-CSE-MsgGUID: k5ENovE9TuWbzXqrr6QsKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="157543884"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2025 19:47:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzo8W-000AM4-25;
	Wed, 02 Apr 2025 02:47:28 +0000
Date: Wed, 2 Apr 2025 10:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2830/2830] fs/xfs/libxfs/xfs_da_btree.o:
 warning: objtool: xfs_da3_split()+0x787: unreachable instruction
Message-ID: <202504021010.h7TdpCwx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   411f2e6e24ad11083d85f2ab7324b1f77ad0d371
commit: f2c902d8c653f8021f9761092a27f7b9db42b662 [2830/2830] tracing: Make tracepoint lockdep check actually test something
config: x86_64-buildonly-randconfig-004-20250331 (https://download.01.org/0day-ci/archive/20250402/202504021010.h7TdpCwx-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504021010.h7TdpCwx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504021010.h7TdpCwx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_da_btree.o: warning: objtool: xfs_da3_split()+0x787: unreachable instruction
--
>> fs/xfs/libxfs/xfs_attr_leaf.o: warning: objtool: xfs_attr3_leaf_split()+0x2da: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
