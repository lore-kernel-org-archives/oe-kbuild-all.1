Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72716087B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Nov 2024 22:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730587320; cv=none; b=j0WdEdgZUH5pzWJtZ2eiO01DG4pmgPRA6Hl3A4qC89wAnHRrdSrzO68rBnnp9MfYCV1luMfctyEHJviXWRm2E2KOwQIiBhXIGedY+DQm+Fxh15yu2Q9gKJ43gjZ1yTW5zPivQi8aS7zZVhHoIB3ntDmKHBus2TWVq6jHxCguxf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730587320; c=relaxed/simple;
	bh=7yrLMsQgDbTCQTav7o0L4aMhDbiw6n7Y/kHWFqQ14XI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DQ0J8J7AB6gPngMhx64GEIxGq6RUBmHuWn70Skh4+8Djskrr+78zbCPLRAp0CdNILlGQ36I9qvCKhb7LHw8aZSgtljPVegPQcgDR/o44PFJvsnqZNWsCTHCEoHm7WhGR1TnO+00D688CrAqNEf/j2e+kZkU9fs12zRG+BkRL0rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TicZfrUK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TicZfrUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730587318; x=1762123318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7yrLMsQgDbTCQTav7o0L4aMhDbiw6n7Y/kHWFqQ14XI=;
  b=TicZfrUKaekxafeQMGd9NFl2hfexX6MuZgeFcJ+f5p961EZd/Qvs3Ydr
   QULH4GLd9J4zfheqpcA2JQOXHrJwuhfaZjKGb0w/IBNZwu9SmNiHaFfYI
   evQNHjQesn+LXtNziJUhrJEFDyCbBEP9YNZwnsc+bA+ONhMupHvWtqMeZ
   WWh19yKhs64zI36ZvdZfWa7pybZeKJL5dIBanTqUOvHuyOxIGUkL29qEP
   JgZvT5znnXgowWQgRvznU9KCA8AKgGFuOD7IxYnNFdc6Nop5qT3GUJFyE
   b0QUlmhp/cs/L2KT2c1UiXJ2Tnrx2Ez3HUIm9eepxzkNvZCvk44Er8GaJ
   g==;
X-CSE-ConnectionGUID: 0vTiE0YJSlqVPnBt6aZV5A==
X-CSE-MsgGUID: s8WWhXQsTJmOgcj3g/IhTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="30431288"
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="30431288"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 15:41:57 -0700
X-CSE-ConnectionGUID: T7qQ3uuMTuKwhGn/9wLNIw==
X-CSE-MsgGUID: 3+b6n/avRd6FIFDRFtXyRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,253,1725346800"; 
   d="scan'208";a="82813873"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Nov 2024 15:41:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7Moc-000jPt-1c;
	Sat, 02 Nov 2024 22:41:54 +0000
Date: Sun, 3 Nov 2024 06:40:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1257/1257]
 drivers/staging/erofs/inode.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202411030628.JUVdQYlZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e833cceaa63f729c44be494d90d6ee3bfaf22faf
commit: db0d48554fbadd40a4b6e5e3fbbeae94ff546e53 [1257/1257] staging: erofs: {dir,inode,super}.c: rectify BUG_ONs
config: x86_64-buildonly-randconfig-005-20241102 (https://download.01.org/0day-ci/archive/20241103/202411030628.JUVdQYlZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030628.JUVdQYlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030628.JUVdQYlZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/erofs/inode.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
