Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDA215E90
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 07:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708068680; cv=none; b=pr22cGZsmdLCkXB1ER0+JmmOKc13l2q1bavb1+4D5od5TcrMEQcTSYIxiYS0wVaoGoF7QhWSFX0ma/TBh10IgYQ7fYo3tUA4sYBkvZLcc1aDUA9FK9gjMvScp4kU1u5hPeV3TmgQYGveS0iGT201pRBhk4/BrmdZj/RoGg9YLbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708068680; c=relaxed/simple;
	bh=Az+TnxHUtV/HPgruvbkS2Tt72UfKUCQed5v0QXiGgTs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/vbVZmwJzHSzek33fp0NRTIUT5goD4IVbD0jTulP5BaYtgubCiXN0G0mgpakSJgkE0UFaF6q2zSmyIuZLH7KbxvuojwtqvFR7tPBureecnPfMBGoRYCGyc2Qu9SfFYAjiluAuRc8v2MueY7PKBznsHnPqfCnOZFMdyPfyRF1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hgg/oBmG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hgg/oBmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708068678; x=1739604678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Az+TnxHUtV/HPgruvbkS2Tt72UfKUCQed5v0QXiGgTs=;
  b=hgg/oBmG3h3UoZao+Mz9DVOOX4hkrVAFA5K68ux/W20LssgZ6hQNJUpe
   dR6x29u4V6bbhcFh/obAtnprmGaQ/iBSOadIQGoX/Usx59CNkLyMxei/o
   RaIs7qNwbKDUgHkaKWlUuZTtSquit3eQt0Rq+tz7CcScBQyeF59cTJrhu
   JzyTJVe7wZKplE/7DuYbFqD15av/bCUH178ZE4GXEqHC4bKkLVRbjUu3y
   ETdjwH+L4j1OW16AZksVQ6GEbt9AguAg3946BDhheuvHXmt2s/DJnln+6
   96Er3OaHAlzRJ4qB+nyT7x7hXEn7Xj6KwYqv0Z75965sIL4m9wOnVBlsw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="19712854"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="19712854"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 23:31:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="3745356"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 15 Feb 2024 23:31:17 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rasgj-00014U-2U;
	Fri, 16 Feb 2024 07:31:14 +0000
Date: Fri, 16 Feb 2024 15:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry.memverge@gmail.com>
Subject: [gmprice:weighted_interleave-next 6/6] mempolicy.c:undefined
 reference to `__udivdi3'
Message-ID: <202402161519.lqvpd33a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gmprice/linux weighted_interleave-next
head:   1d29299557d22e404e84cd16f0d08a11497bb9de
commit: 1d29299557d22e404e84cd16f0d08a11497bb9de [6/6] mm/mempolicy: introduce system default interleave weights
config: sh-defconfig (https://download.01.org/0day-ci/archive/20240216/202402161519.lqvpd33a-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161519.lqvpd33a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161519.lqvpd33a-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/mempolicy.o: in function `mempolicy_set_node_perf':
>> mempolicy.c:(.text+0x1c30): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
