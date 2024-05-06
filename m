Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333D13D2BC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 22:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715033314; cv=none; b=dW7Fgb1DPAWTuzOyNClDGX+rzaN4h4QbSHhDq/3LwUHWzaKV9eKV488b8MRZWMAwzKEbBTd2F//nTRkc0MAvajyO330qUgb31LJcRDvvpsye+T5Cio2jr7lJcqR+o8YBqgrvf1gBcrTY6QpqBj/8HOxCPicTOA5gSowVO704xyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715033314; c=relaxed/simple;
	bh=KgJjuyclIH3jya0/zfE+qznSZjYFRUL2i44agzeYuHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgvyWX93biSGw2NMh0enpeJjAURsU7WE6jIKH11AL6N5jmYcZCIX7WrbqArbkYvIkykA3HFdqedMRFzVXx9fAZl7kCi2roqPWcpUDR/2gwkcWbe8b0NLu+dHj1Afzd1IHCugdRVxMVtmNehhb9g07DUyQg97sNfJRNQqGCtI7t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dYwvBgqX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dYwvBgqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715033311; x=1746569311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KgJjuyclIH3jya0/zfE+qznSZjYFRUL2i44agzeYuHY=;
  b=dYwvBgqXoIyxid2fsVxVBD9Q2/beWPWkjSvZFcDADX0hKSvMCMQZpG6O
   +3UvG1g89DU/dI00HPG6jc/wcPlmB+6ugwYAJAcxvw+sWzErPr7ucRGUb
   ryUZJcKrST4771+oCdLXPrAyC0Sx/43pIU22F3WJkLyd69IDD+znu24lf
   tMZKwjSOfOi6Ul+1q6Pn9AzhrRV3jJpHPgCw9mQJMX9DgfCx+Kd5C5sUF
   MJqgbDTzTvSxSE0XYIA7OATHH/G7iLGQTDYO/WT6yZMh2TKwTDvOvy+E9
   iogQ9eW/lUXK6AKZiZJuguft3XLDxJYdHvkXvWObsKK0I8CYISwWbKlBi
   g==;
X-CSE-ConnectionGUID: P3U2S3G/TIiecqJS5hNGSw==
X-CSE-MsgGUID: xAWrUdqvQR+ahBN1MJevCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10654814"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="10654814"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 15:08:30 -0700
X-CSE-ConnectionGUID: djRZcdkFSriYwMjNa5xz/w==
X-CSE-MsgGUID: zjRz62lnRLWOIT67dinxsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="28691444"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2024 15:08:29 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s46VX-00015E-03;
	Mon, 06 May 2024 22:08:27 +0000
Date: Tue, 7 May 2024 06:08:23 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 40/42] fs/f2fs/f2fs.h:4607: multiple definition
 of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined
 here
Message-ID: <202405070649.jVUhtxD4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   6fd891b7248d0b825dbff6454be21f60c7ba1fb0
commit: 28a4fc03f837d64c67eeeba5ef226dbed4b369dc [40/42] f2fs: check validation of fault attrs in f2fs_build_fault_attr()
config: i386-randconfig-014-20240507 (https://download.01.org/0day-ci/archive/20240507/202405070649.jVUhtxD4-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070649.jVUhtxD4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070649.jVUhtxD4-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/f2fs/file.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/inode.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/namei.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/hash.o: in function `f2fs_build_fault_attr':
   fs/f2fs/hash.c:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/super.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/inline.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/checkpoint.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/gc.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/data.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/node.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/segment.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/recovery.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/shrinker.o: in function `f2fs_build_fault_attr':
   fs/f2fs/shrinker.c:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/extent_cache.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/sysfs.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/xattr.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/acl.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here
   ld: fs/f2fs/verity.o: in function `f2fs_build_fault_attr':
>> fs/f2fs/f2fs.h:4607: multiple definition of `f2fs_build_fault_attr'; fs/f2fs/dir.o:fs/f2fs/f2fs.h:4607: first defined here


vim +4607 fs/f2fs/f2fs.h

  4600	
  4601	#ifdef CONFIG_F2FS_FAULT_INJECTION
  4602	extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
  4603								unsigned long type);
  4604	#else
  4605	int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
  4606								unsigned long type)
> 4607	{
  4608		return 0;
  4609	}
  4610	#endif
  4611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
