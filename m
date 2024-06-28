Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0E51CB306
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 16:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719593000; cv=none; b=mfhMLwDegsBes9xf92os1eZX3k9Bp8UYZo2HlZi3J9swy/xnaHNNUM/w1wjslkNX14Zo7nKRVAhPwmr3qrdhtGYaQMR22NEujOMvzxMUlTH4roASLYVmY+sAlloPKEOyby17CDjUnk120/3Zd9L817JyThAqi0UkVZAKXSuYhpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719593000; c=relaxed/simple;
	bh=z/4L0eSVXccZMgMN7BJeINBr5OhRIa0BBq4tYtQTIaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uRHQRofCmARinLdaPS2FN4fCHy6prEmYjNMmZFtCvio0vbprxczVCNFkIp3SmFaOIRbSYSIicDX/H6ZwF+6SPfGtDtlASneya4xxVZiv12j3HLr6ueGf06iG7CGdOBFxRK/bYPICMyl0LsQNKDJRFt6RCV235NXCYSUE9Ze9v8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ks+8exVq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ks+8exVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719592999; x=1751128999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/4L0eSVXccZMgMN7BJeINBr5OhRIa0BBq4tYtQTIaQ=;
  b=Ks+8exVqWX1VHZNGXWHxNIAWnZWUjb+sT51jr+dy0E540Ulpc+SGaDBf
   6vS6TqbDW1hdbRK+smOeTVRG/kz8ksZEqfUKRWqAaovYES7E4Ol67/tVR
   NThdN5NNcHTklpFkoLdP4wdnxUKuSjg4aBgwZdMLsuBu/ARj1A0SbfDRH
   YoItKHhUFE9sM1P3/683j+2guxv6FlK+z82X4fot3mUQiJr1hgPIWxImI
   m86SX4C1MQ726OWAkLpWnk5w7wOjnbn2stU57V13xWkYdOU+nA4lV0ONK
   3SHFghJ1mbcVBbEYhEUufWNhjiedZn78FaXATGp8NhcFspefxPVjYiDX2
   A==;
X-CSE-ConnectionGUID: w34+yNd8QJCMiQTuzULdOQ==
X-CSE-MsgGUID: Wg+ewTY9SMG5QfgUV1Z4kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16917659"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16917659"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 09:43:19 -0700
X-CSE-ConnectionGUID: auo8GXtFSbGMDmQdAs82Nw==
X-CSE-MsgGUID: B0XYjkOpRTuMN5wPKfJgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49404640"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jun 2024 09:43:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNEgt-000HS9-2W;
	Fri, 28 Jun 2024 16:43:15 +0000
Date: Sat, 29 Jun 2024 00:43:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 11/11] sh4-linux-ld: inode.c:undefined reference to
 `__cmpxchg_called_with_bad_pointer'
Message-ID: <202406290019.2WssYvJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   a69a9862e4b4e57bfe4ec489196208bbb81c08b4
commit: a69a9862e4b4e57bfe4ec489196208bbb81c08b4 [11/11] fs: add percpu counters to count fine vs. coarse timestamps
config: sh-randconfig-002-20240628 (https://download.01.org/0day-ci/archive/20240629/202406290019.2WssYvJX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290019.2WssYvJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290019.2WssYvJX-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/inode.o: in function `inode_set_ctime_current':
   inode.c:(.text+0x40d0): undefined reference to `__cmpxchg_called_with_bad_pointer'
>> sh4-linux-ld: inode.c:(.text+0x42a0): undefined reference to `__cmpxchg_called_with_bad_pointer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
