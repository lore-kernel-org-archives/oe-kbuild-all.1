Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB16E5C8FB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707590270; cv=none; b=IlPxQC9kHeoNtY9ewvdteBI4HfRYQzvIPNdgloFqvGlUyTlJAbOsq2dy/D5MQqneg/7ZIZPFaZ43HKpd7oZ20qRFLQH8M5aMd4jYprbDGafD5Zzz9HVzwDc8wbjZa4NWYyc6y0boor2uLdWEAh9/gaFEhxMUIi9nRfrXb8Y8t9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707590270; c=relaxed/simple;
	bh=uw46nhjlKczG5i1bqGs6LECpWVowjA8oBZmTAGDwMjs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PfJuir+KhzLkknrKvn/kNwj8e2jgsT4xFGwN43VQANTgv8Ou2DVEaYxFSVtggHuUaHjzlCmqeROA+4dYZL+hVU7my6oyzj9vJ+xav/P2VDSVMHwCibntWbf2uhwcGUnd1tYtnDJNJt0O0tvJ9cgxpSQo7NSj11BKPIXqZNBBaxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkF+rCp2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkF+rCp2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707590269; x=1739126269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uw46nhjlKczG5i1bqGs6LECpWVowjA8oBZmTAGDwMjs=;
  b=OkF+rCp206/3HU8/mNETGPq3D2mgHKCiYVG9DIDHiBFUD/6/YZZhd/oN
   B1OrNPuB3AyrVrBfB8qz7REa9Ld7Xfp5omtPlvrwh5Oe53T9DpbRQPtvZ
   nedqLKpwVnQussT6v/7LAm3p7yL8U3Jxb9CJTQ8ghxuJOB6ZfIhxJ7M5h
   20pK2fNj9x1aCRIythLHCVTTNTW02GhTOgHU760jUweBYcs7ijaDaBw69
   o4vaswe+2ncPtNJQoq6NHncYNBaFwTSiBzhceeN9aLPR5UGPY6P7lJIim
   XaFVtEZK5u7w0PKD1yrfnB8NdaSvZUG1cm3zqe4e1vn99DDiA4vx6lxOl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12310863"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="12310863"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 10:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="39655832"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2024 10:37:36 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYsEH-0005z0-0M;
	Sat, 10 Feb 2024 18:37:33 +0000
Date: Sun, 11 Feb 2024 02:36:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-6.9/io_uring 2/26] io_uring/filetable.h:66:35:
 sparse: sparse: restricted io_req_flags_t degrades to integer
Message-ID: <202402110232.mLmSk8Vy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.9/io_uring
head:   ef1186c1a875bfa8a8cbfc2a9670b14b082187a9
commit: 4bcb982cce74e18155fba0d97394ca9634e0d8f0 [2/26] io_uring: expand main struct io_kiocb flags to 64-bits
config: x86_64-randconfig-122-20240210 (https://download.01.org/0day-ci/archive/20240211/202402110232.mLmSk8Vy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110232.mLmSk8Vy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110232.mLmSk8Vy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:341:48: sparse: sparse: array of flexible structures
   io_uring/rsrc.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
>> io_uring/filetable.h:66:35: sparse: sparse: restricted io_req_flags_t degrades to integer
   io_uring/rsrc.c: note: in included file (through include/linux/wait.h, include/linux/wait_bit.h, include/linux/fs.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
>> io_uring/filetable.h:66:35: sparse: sparse: restricted io_req_flags_t degrades to integer
--
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:341:48: sparse: sparse: array of flexible structures
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
>> io_uring/filetable.h:66:35: sparse: sparse: restricted io_req_flags_t degrades to integer

vim +66 io_uring/filetable.h

4bfb0c9af832a1 Christoph Hellwig 2023-06-20  61  
a4ad4f748ea962 Jens Axboe        2022-05-25  62  static inline void io_fixed_file_set(struct io_fixed_file *file_slot,
a4ad4f748ea962 Jens Axboe        2022-05-25  63  				     struct file *file)
a4ad4f748ea962 Jens Axboe        2022-05-25  64  {
8487f083c6ff6e Christoph Hellwig 2023-06-20  65  	file_slot->file_ptr = (unsigned long)file |
8487f083c6ff6e Christoph Hellwig 2023-06-20 @66  		(io_file_get_flags(file) >> REQ_F_SUPPORT_NOWAIT_BIT);
a4ad4f748ea962 Jens Axboe        2022-05-25  67  }
a4ad4f748ea962 Jens Axboe        2022-05-25  68  

:::::: The code at line 66 was first introduced by commit
:::::: 8487f083c6ff6e02b2ec14f22ef2b0079a1b6425 io_uring: return REQ_F_ flags from io_file_get_flags

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
