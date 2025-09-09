Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A8470830
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 01:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757382769; cv=none; b=jumsDRjYNqcXJ0tw6pqzUQmx2jvuApedjIY8jy+KZAB/KVIusQoilCWRn0WzDcV72tuA5jSfNwI2EXx7rrhKo36tbVrEUFsW455CiMwucInwP4VwgNRIy3aHRp0namoG9YKsv+CwZ7a6jao9VEISQKjJcQ94bHTdweVIvbizs3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757382769; c=relaxed/simple;
	bh=B9S2zJkUgA7Gb3glcZpcazSTxL59xj86siXZPNaVkfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rb6wEHbEWJhHDuGszZY1uBbKXgL6LMYgVp4qpzEVGOKTMN1xG3wQffHoTYuUSYgWePt5rUvDe535zNcVDQQ4S5Iyb00PpCjugTFRfz5QBo8+UUhql8UCQNUsJm+L4ynZqjUplP0nUQmC6PSUM9miPFCf67AJZR61t9U466b5NpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAAhQ2RY; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAAhQ2RY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757382768; x=1788918768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B9S2zJkUgA7Gb3glcZpcazSTxL59xj86siXZPNaVkfA=;
  b=gAAhQ2RYt0OiCLzXvr04Rm5FPEjk79L9NYJNY2QHJEwJiPyRk+bDxv1q
   qxO6ZmmM/zdN/O3lmSI6FOryDDeU0+NtkNl2tl74RXiXgGZ19uGLzxK04
   76jz+rB1EFI4lOYCilTJB5l/IxNgGiFfl/8KBDlXLyeFVx/KkoTvzMpEd
   d+XZCydhcz2gLSv6012vKzu6OyJauakrUrBqAApk6Tchhv+0RAksaGa1K
   H58/+VEdmTH53o6JbE9kxiuZkbqTcRr4MKeCesFc9E+4UVwHmOcFh9tPX
   QEUuHBxx9pXD43bwwLHCmpjy6pckCrjXIQehrTEFc1BZLlJgoUcEDmgq8
   A==;
X-CSE-ConnectionGUID: 8bsMZTW4QuKn2P2g8rVB7w==
X-CSE-MsgGUID: 4SBpjmTzTlKtA3MvVcDNAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="47230751"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="47230751"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 18:52:47 -0700
X-CSE-ConnectionGUID: SEq9HuMTSzeTIaYVRc3fjg==
X-CSE-MsgGUID: uL3aHLzDTnOAWt9Wtj0e8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172533674"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Sep 2025 18:52:47 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvnXI-0004Jx-04;
	Tue, 09 Sep 2025 01:52:44 +0000
Date: Tue, 9 Sep 2025 09:52:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 320/388]
 fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to
 integer
Message-ID: <202509090923.26KdFSVG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   fe7eb7dac39e94bb0542dfcd5ff88ad3af9be3a7
commit: aa8c3edd73b9e5a2d9134211fb47a74bf68e2b32 [320/388] bcachefs: Print sb_field_errors sorted by datetime
config: hexagon-randconfig-r113-20250909 (https://download.01.org/0day-ci/archive/20250909/202509090923.26KdFSVG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
reproduce: (https://download.01.org/0day-ci/archive/20250909/202509090923.26KdFSVG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090923.26KdFSVG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer
>> fs/bcachefs/sb-errors.c:62:17: sparse: sparse: restricted __le64 degrades to integer

vim +62 fs/bcachefs/sb-errors.c

    56	
    57	static int error_entry_cmp(const void *_l, const void *_r)
    58	{
    59		const struct bch_sb_field_error_entry *l = _l;
    60		const struct bch_sb_field_error_entry *r = _r;
    61	
  > 62		return -cmp_int(l->last_error_time, r->last_error_time);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
