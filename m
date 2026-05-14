Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB91531C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 00:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778720214; cv=none; b=aSagxS8XTiKtGV+ogxUupKNCLsiKqqoWuYNlorC+PdxVNJ1gqbRB493yzTU39Z37ZoPC1TRqb6jHxvCTCi00byt0b0sesvQ/mVi2yBSOP34kPn7x2AJMeyo8GMXyomkQjvJW8axBX2p81HWL7HHRm59UTJ3fQSpZJSdGuYdQGIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778720214; c=relaxed/simple;
	bh=PK55sNVn9g9xCJQ+t+8OHS11PLjicNIE+5316Yv6Nmc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVLHOVi0fXLC97ejbFiCKH5EZ+FjyIuNCknNzKf3oZlGuQ1vIMHK39+/fAv9gFlulVW5+iMhUM58LZJJfU7LgwFAw+T7Qia4r2t1Dyop+DzKf3pMxMXbAbBp4VeVPM9wWaTEhUtDnPtPDnPlwT8YenWQRzON2YZwsVXGTsKndIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6qFXgQx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6qFXgQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778720213; x=1810256213;
  h=date:from:to:cc:subject:message-id;
  bh=PK55sNVn9g9xCJQ+t+8OHS11PLjicNIE+5316Yv6Nmc=;
  b=f6qFXgQxEU4S9aS4Fr/4vXKInOWabuIQD9qi66m38FJeWmGb8DHuc3+0
   auANaYttAQd81qWcLhT23V/pg1FgVnA7V4tmYguThT8IssEqSzCJ8rmt1
   TTDZwTVcQyZhZB+QFAP/4STm34cPUuGx8OJFeoxFLM9jz7GbX34QoOO5N
   oY5hNCUgCOiUVBc5MNvdMx3yDCjL8FG//sYcoDcKVs8ihdsFSSooimfo+
   UsMVSQfKA2w9frST+eoKJi61f9sUH0q1NDZLUehOg1LYZDrLhaPDgYPXK
   78zfAdtPwse4iMM5qw1FuTfIbPaf7zQ7eRGmNJIidBYiZozNiCibbOTx3
   w==;
X-CSE-ConnectionGUID: UxYrYlUBSIKtYcyCFPX/VA==
X-CSE-MsgGUID: WedFXAlpRaSGtlBdNq0wzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83507940"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="83507940"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 17:56:52 -0700
X-CSE-ConnectionGUID: G9UOpdG+TNiBzO2atQQt5Q==
X-CSE-MsgGUID: VDYdbAY5THGs45O0R9Tn9Q==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 May 2026 17:56:51 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNKNd-000000005S5-0pmW;
	Thu, 14 May 2026 00:56:49 +0000
Date: Thu, 14 May 2026 08:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linuxsecuritymodule:next 7/11]
 security/hornet/hornet_lsm.c:51:20: error: no member named 'security' in
 'struct bpf_prog_aux'
Message-ID: <202605140858.Tv1hXx2p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LinuxSecurityModule/kernel next
head:   7cd0da3c29d22e2a8dcbc995b12199bc3d2704a8
commit: c62310df81899f7e14d632271aba08d0a55e2318 [7/11] lsm: introduce the Hornet LSM
config: hexagon-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140858.Tv1hXx2p-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140858.Tv1hXx2p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140858.Tv1hXx2p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/hornet/hornet_lsm.c:51:20: error: no member named 'security' in 'struct bpf_prog_aux'
      51 |         return prog->aux->security + hornet_blob_sizes.lbs_bpf_prog;
         |                ~~~~~~~~~  ^
   1 error generated.


vim +51 security/hornet/hornet_lsm.c

    47	
    48	static inline struct hornet_prog_security_struct *
    49	hornet_bpf_prog_security(struct bpf_prog *prog)
    50	{
  > 51		return prog->aux->security + hornet_blob_sizes.lbs_bpf_prog;
    52	}
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
