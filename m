Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89636318139
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766844316; cv=none; b=gE60ADZmRwy1H5ua9eODCyl+7x3YvvhLs12k30VphX85hAVQ4DWUp7shdNEwctbMQIAsCmZ8EB8OTYqwnOdKppwAdc4ImZLdxIsatg6UQxmcuTUe4UuS98mbxFVszi1BgVt1LSnOPbSR+wv1j9KHGWvolTsmbGQJHx6z6vcTdME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766844316; c=relaxed/simple;
	bh=zuunppJcv02TF+4DuAxrTenuLW4JQ9TUyNnr2HLY1gA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nRVIzfUtlwApoW/spk3Iv9JgNdasMrPFsrrQ89eqcl+2dhFzplejhT2pSlZ5nS4ccteMwxOtB6COycTg9Vlb/5vSFiHbCU61LM9yP8t04FUk9NVKOiSBuU4uxaH3uO8BQp8IxyPSSdXYGOeOQKA0q1jtsauIat0mZqMES4mDAvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kL6LzcVJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kL6LzcVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766844314; x=1798380314;
  h=date:from:to:cc:subject:message-id;
  bh=zuunppJcv02TF+4DuAxrTenuLW4JQ9TUyNnr2HLY1gA=;
  b=kL6LzcVJvTKqNRIgP8hyUnCv2CNp2HSZ7/iG1z945D2o0cLxxyK8bfie
   VfUZylrQJbcTyx64E6koDQMHAp2U8TORwLg6o+2CF1viJwW9JuQ/p7jql
   iyh8U6j5u2E7NmoN+Fwh+9wkcr+WW0pmfgD3R9wmkOQlxnEtda4KruxQj
   EW18T1YWwesxfn+n7uIFDR1Yy5BZmkpWvPTBBSA+HhlRWzoO8QPq7wBQI
   J4TnHwG4ueFSWPhz16rY2WSrRDh9NvwjxZ2qUmpE9F7XZd7fXVOAIe3DA
   VeBksWCvch4J78fkHpJFVfVINjgXDhKN/STuq3WmbEyD6cw7d/IPc18z8
   w==;
X-CSE-ConnectionGUID: +1HeKPJNSjm/IimDkdfCmg==
X-CSE-MsgGUID: UlK+O6FzS0eaN297CtokLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68585876"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68585876"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 06:05:07 -0800
X-CSE-ConnectionGUID: b8VDScDSQxOZWXDXfFFlyQ==
X-CSE-MsgGUID: lZuIZP0MQrq5hQHyFlaOCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200856728"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 Dec 2025 06:05:07 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZUum-000000005s5-3Ozi;
	Sat, 27 Dec 2025 14:05:04 +0000
Date: Sat, 27 Dec 2025 22:04:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/lock_trace 12/12] fs/f2fs/f2fs.h:4945:6:
 warning: no previous prototype for 'f2fs_simulate_lock_timeout'
Message-ID: <202512272244.vmF6BR4b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/lock_trace
head:   a9004baf110bf87f6a75b023c26616d966c93733
commit: a9004baf110bf87f6a75b023c26616d966c93733 [12/12] f2fs: sysfs: introduce inject_lock_timeout
config: arm-randconfig-r072-20251227 (https://download.01.org/0day-ci/archive/20251227/202512272244.vmF6BR4b-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272244.vmF6BR4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512272244.vmF6BR4b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
>> fs/f2fs/f2fs.h:4945:6: warning: no previous prototype for 'f2fs_simulate_lock_timeout' [-Wmissing-prototypes]
    4945 | void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi) { return; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/f2fs/checkpoint.c:22:
>> fs/f2fs/f2fs.h:4945:6: warning: no previous prototype for 'f2fs_simulate_lock_timeout' [-Wmissing-prototypes]
    4945 | void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi) { return; }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/checkpoint.c: In function 'get_sum_exec_runtime':
   fs/f2fs/checkpoint.c:37:25: error: storage size of 'rf' isn't known
      37 |         struct rq_flags rf;
         |                         ^~
   fs/f2fs/checkpoint.c:40:14: error: implicit declaration of function 'task_rq_lock'; did you mean 'task_unlock'? [-Werror=implicit-function-declaration]
      40 |         rq = task_rq_lock(t, &rf);
         |              ^~~~~~~~~~~~
         |              task_unlock
   fs/f2fs/checkpoint.c:42:9: error: implicit declaration of function 'task_rq_unlock'; did you mean 'tasklet_unlock'? [-Werror=implicit-function-declaration]
      42 |         task_rq_unlock(rq, t, &rf);
         |         ^~~~~~~~~~~~~~
         |         tasklet_unlock
   fs/f2fs/checkpoint.c:37:25: warning: unused variable 'rf' [-Wunused-variable]
      37 |         struct rq_flags rf;
         |                         ^~
   cc1: some warnings being treated as errors


vim +/f2fs_simulate_lock_timeout +4945 fs/f2fs/f2fs.h

  4933	
  4934	#ifdef CONFIG_F2FS_FAULT_INJECTION
  4935	extern int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
  4936						unsigned long type, enum fault_option fo);
  4937	extern void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi);
  4938	#else
  4939	static inline int f2fs_build_fault_attr(struct f2fs_sb_info *sbi,
  4940						unsigned long rate, unsigned long type,
  4941						enum fault_option fo)
  4942	{
  4943		return 0;
  4944	}
> 4945	void f2fs_simulate_lock_timeout(struct f2fs_sb_info *sbi) { return; }
  4946	#endif
  4947	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
