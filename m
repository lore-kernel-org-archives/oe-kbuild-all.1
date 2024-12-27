Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DA412BF24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 04:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272488; cv=none; b=LUsKwtBUiDvl697tupmQJP3NDeOBg/i8SwKtcvgro9E09dDw0YkcWPgNnQwvHZfpuKQ3FM4Q9MFsonLXesnF7gwDjplGV+2FJi4jL9gKVb4dfF4sr824sJz6n5ivIyYz1mMAFn4C4bDifIO5xQHXIrGYCx6LuKr85aLwDuJBGX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272488; c=relaxed/simple;
	bh=mSWe1/snjljagFhAv7RfQi+q1qvEB201iEFPTX256OM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LrsVR5fx0GGPdc/gpYWvkGK1gtfl+zg0MkdSMjIZ9k8PbAtLEavwv3l5mmCNuB5v38DLmJXYVG5gdj3WQovoO+jhV3wQVJXTNaGR8Aelfrgfb9OhZhLe8qo1LcMnHAiU/jis+9/6mXx7NtyKchMFQU9uAt9l5t4fRaoh7+fRylI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V1sy5SYS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V1sy5SYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735272486; x=1766808486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mSWe1/snjljagFhAv7RfQi+q1qvEB201iEFPTX256OM=;
  b=V1sy5SYS3Nfd7AMunF2Emh9IOWCfFEgrAa/pwlkt7oDfbihbWQd7ORFU
   YMEanvFQDLPiYv8EThpvSzZ2tQ/uOdZjF487+jLxiPE6FpRUAVZjjBHZM
   kpbQ2s3+6DwyTgoUwXWLEHiz1sgyPc9BzOYoRrPbKNLQ+zv4Ahx7nwl6c
   0CeEYx/OGhaZozefCsL8yZ5ahAuCTtaLLNoZcpfFg1LKHZfdqjg1y8egb
   GPHBI7sZ/VeNmwugDnwzKOalWVZVpfO9LK+X6rB80moYPCCxA3x9vC9wt
   dotAKwYaP1e3g0TQprZ/XqxjvrWEDzqxfD0zS3NtlGq6RLb2EAtLpSff7
   Q==;
X-CSE-ConnectionGUID: UBeWGhmRTFGtf0t8esQlCA==
X-CSE-MsgGUID: hD79Q6XHSRGfLVFlNgy/0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11297"; a="39370640"
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="39370640"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2024 20:08:05 -0800
X-CSE-ConnectionGUID: F02UEBShRYeGZzC5G2S0og==
X-CSE-MsgGUID: HbiO8sMtSvWkL22yq21Thg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,268,1728975600"; 
   d="scan'208";a="99820315"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Dec 2024 20:08:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR1dq-0002xi-0U;
	Fri, 27 Dec 2024 04:08:02 +0000
Date: Fri, 27 Dec 2024 12:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2589/2589] fs/btrfs/file-item.o: warning:
 objtool: btrfs_csum_one_bio()+0x5e6: unreachable instruction
Message-ID: <202412271119.g81AT8wi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   951151c7a27bc2a9436c2c49ae12510c82137ec1
commit: 2f922250bd7fb299dbad240497e488b48ece9198 [2589/2589] btrfs: replace BUG_ON() in btrfs_csum_one_bio() with proper error handling
config: x86_64-buildonly-randconfig-002-20241218 (https://download.01.org/0day-ci/archive/20241227/202412271119.g81AT8wi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271119.g81AT8wi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412271119.g81AT8wi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/file-item.o: warning: objtool: btrfs_csum_one_bio()+0x5e6: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
