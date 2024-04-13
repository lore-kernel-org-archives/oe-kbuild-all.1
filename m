Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199373FB1C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713010498; cv=none; b=KirZX7NZ2mo2QEbnYG4jiDkOb4NEqxDhHWxg/Hg1w8MZPKrSeE4Jd0M2A3jaGbhghEns5URcTLxVEprARTIHLL4DCgujn6YOCRjWyIMDrXsBBj+61j6nnvDMJ83COOKqBh/YED+0q3ZWMc3JyYPAGl8VjT8OzezqDbPZJUvMeCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713010498; c=relaxed/simple;
	bh=3oCh9h34q5V87J3zNQBuxrpPp2YPmv6mahgwfmdw0pM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VEP5Brtgt+ouPAN0P1w32vFJ5BAwH+lod62lr0d9yJQt+kQUx2zmOP/VGg9wozeqV12+f94AfjiP+j3TJKz+fEHbH/Lc1jX15riobfSP7aGBtGQA21sKRyxYvlK/5xFRXDllJ5Vip0uEUljmxxwrzzZXJrbsW+RKy6keDP+pVTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzccLGmp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzccLGmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713010496; x=1744546496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3oCh9h34q5V87J3zNQBuxrpPp2YPmv6mahgwfmdw0pM=;
  b=VzccLGmpuRn1CD4oqG2TNSV5S7eNIe/YB7GiC77/9Vc1ShId3WAOkD43
   G0PVRCqAn7pCqwreDzK8bamQp1y7M8qwGIK57KGGHtyl7K2C9Sp4xd28k
   0vrZbOSh3r5TAcNMUuOrJY45JmrsE5VH2bYCIMXrqv6/BUMLem8Zg4uyv
   7E1/K9L6WshoGYiOiPtFnWBiAL9RA0IALMPHARe0W3tNcchaG3MrK1F5n
   jKEmBmQoSJjkPwnbi9EdNaVXAhw+MmvSngGc8ieu757N0m+mnJZFuQwfx
   qk28fNgz3PSjzZhJ9I4grv/TfIG0Tgt8J9QCZgHhxZoILwwv4fB+CudjG
   A==;
X-CSE-ConnectionGUID: vfhGFhcUQuehYVucir0Zxg==
X-CSE-MsgGUID: D4Sn9d13Somiug8DypBGBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="30938358"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="30938358"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 05:14:56 -0700
X-CSE-ConnectionGUID: Gy+WRNxwR8uC/S4UnkW/hA==
X-CSE-MsgGUID: uflL5hXNQmWj+2r7uz0/LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="21495847"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2024 05:14:54 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvcHP-0002Uo-2U;
	Sat, 13 Apr 2024 12:14:49 +0000
Date: Sat, 13 Apr 2024 20:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 414/457] fs/iomap/buffered-io.c:402:15:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202404132008.NdtiWG9k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   ed4cedcef505729c94212031f8ed784a5fd81ac5
commit: f0eab2ef375fb100ef4441c0e275fd7cfaac65a0 [414/457] iomap: integrate fs-verity verification into iomap's read path
config: hexagon-randconfig-r113-20240413 (https://download.01.org/0day-ci/archive/20240413/202404132008.NdtiWG9k-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404132008.NdtiWG9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404132008.NdtiWG9k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/iomap/buffered-io.c:402:15: sparse: sparse: Using plain integer as NULL pointer

vim +402 fs/iomap/buffered-io.c

   380	
   381	static int iomap_fsverity_init_bioset(void)
   382	{
   383		struct bio_set *bs, *old;
   384		int error;
   385	
   386		bs = kzalloc(sizeof(*bs), GFP_KERNEL);
   387		if (!bs)
   388			return -ENOMEM;
   389	
   390		error = bioset_init(bs, IOMAP_POOL_SIZE,
   391				    offsetof(struct iomap_fsverity_bio, bio),
   392				    BIOSET_NEED_BVECS);
   393		if (error) {
   394			kfree(bs);
   395			return error;
   396		}
   397	
   398		/*
   399		 * This has to be atomic as readaheads can race to create the
   400		 * bioset.  If someone set the pointer before us, we drop ours.
   401		 */
 > 402		old = cmpxchg(&iomap_fsverity_bioset, NULL, bs);
   403		if (old) {
   404			bioset_exit(bs);
   405			kfree(bs);
   406		}
   407	
   408		return 0;
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
