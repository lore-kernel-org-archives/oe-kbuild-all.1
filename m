Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6750F824A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712928737; cv=none; b=h71tGx+68h3S3hnsIQVCiKDsevUGb5Ufm97+1Rm3g5Nb9H82L+471/xJ9qBeOY0UeuSKSsrIq8n0apG+VaLZ6cVbPJObECKmwTHsvtPK9qSkeu4VtEYGGlWsVsWcoonjWDm4KOn3i1uzDlIJVvnN6FGcCMTnpoQ3mKCJV94IsZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712928737; c=relaxed/simple;
	bh=CRYSYUtAf2Bs/hqPfN3IeGF/QDDhde8tB5HLIAaJ60A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BjMohtyOmDAAtQOjr9VW+8nIIWazXw0BJqCCSU1UiU5yC0e6tK6uQdVfnDIUA70rpLRfqrYyj4r2C1jxXqmBARDV9zl0avaEztn8hiBhL2NVFP7LeMlqC+u8LYOQlS2Y1XpEpBxXuGkm2QjYSYd2+WgA4EanM+KdEjMOUqLzVYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kooE7ED8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kooE7ED8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712928735; x=1744464735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CRYSYUtAf2Bs/hqPfN3IeGF/QDDhde8tB5HLIAaJ60A=;
  b=kooE7ED8dSroMmDLG5yCtx++5UFQF0gU64e4MjOmSzi1XV4PS5IMRCey
   +y7f8qwcGK4zTHg4e8LUMMo1M9uNjD8doSqYxt3qGDKd5repM/+T2jsER
   RNZQzychF2XzxxE/W2TCS3F3Fr2RgWOmoXDVldPKPWe4cxRnJaG0Bq3Gl
   bM81mvsFFyYDCj7LmgofhvJgWzSJKaYX8rKzbpJ9TAGVPTycKg2an4NhN
   7IpoyAr+vnpu9pVdvc1poiqLinu/ol/85httvW7rGANKiQW+lyQT9D37o
   DlRwt3DVH9apWwHpNKlnXjQM0PAc/4S5M4FCgE/DAUh/bTpmGE2yDbtGY
   A==;
X-CSE-ConnectionGUID: auBRjTGTTjGtV+OA44VlBw==
X-CSE-MsgGUID: H/PzgxQbT3yUeU7KKqV4cg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="33777604"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="33777604"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 06:32:15 -0700
X-CSE-ConnectionGUID: CXGeP4WpS8uQE1HfU0oSag==
X-CSE-MsgGUID: W6El8PHISE+NXdr6fuDYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="25887208"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Apr 2024 06:32:14 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvH0l-0009nZ-2p;
	Fri, 12 Apr 2024 13:32:11 +0000
Date: Fri, 12 Apr 2024 21:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 129/130]
 fs/bcachefs/btree_locking.h:428:49: error: parameter name omitted
Message-ID: <202404122155.G5cpolmA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ecb7f8abc97ccf1ab18363dcd37591329ae42cc2
commit: 60ec285a67d2cdd4ef950a3aed690e8c7f379720 [129/130] bcachefs: Path must be locked if trans->locked && path->should_be_locked
config: x86_64-randconfig-075-20240412 (https://download.01.org/0day-ci/archive/20240412/202404122155.G5cpolmA-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404122155.G5cpolmA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404122155.G5cpolmA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_io.h:7,
                    from fs/bcachefs/alloc_background.c:7:
   fs/bcachefs/btree_locking.h: In function 'bch2_btree_path_verify_locks':
>> fs/bcachefs/btree_locking.h:428:49: error: parameter name omitted
    static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
                                                    ^~~~~~~~~~~~~~~~~~~~


vim +428 fs/bcachefs/btree_locking.h

   423	
   424	#ifdef CONFIG_BCACHEFS_DEBUG
   425	void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *);
   426	void bch2_trans_verify_locks(struct btree_trans *);
   427	#else
 > 428	static inline void bch2_btree_path_verify_locks(struct btree_trans *, struct btree_path *path) {}
   429	static inline void bch2_trans_verify_locks(struct btree_trans *trans) {}
   430	#endif
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
