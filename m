Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB04C1649D9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 11:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712316825; cv=none; b=CPTQ+rE98ZNk5gkUgiGbYGuv0AKmCB4i1QoB0t/DvTET5VMVD0Tny82Ic1I/abWo7C0fGv7GqsT4zHaWsD9Yk35p4tbGnFXXBQ4U6LQbXGAj8JEAjYJRdG9qg4DlqG0N5bgQJaM4lc80vQhz0yEd3YiRrR1hVkpp+n8NZt4McFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712316825; c=relaxed/simple;
	bh=wzHiH9Tcskm19SM/G/c8GhyDiKapkaYWqYmWPtLahXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=spzi6wX28iCkzM/siYEny8KEM5gJEuWi+uJ49xynr5bqRYSV1h+ND8M1TiNHHY+BP1jLr59X2Ehecwy7Vua8DNQ07fxE63o/uiCoRn2etO4PksLumz3NWKlTUIgu2rCrFx27t+EHNOhgkfHIBywK7w9kHaHI4Wj/Y4Qw+KnAlO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGIdT4vB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGIdT4vB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712316824; x=1743852824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wzHiH9Tcskm19SM/G/c8GhyDiKapkaYWqYmWPtLahXQ=;
  b=GGIdT4vBiGrTSEoIiYSmNylELJnREe2iG4vfOokuM98ltHCz5mZ2m7V3
   lzaqBepniPzIr22GAn0OH6D7fYisTioNwoKqL+aY/cJPSBnPPDp2Zfk2J
   5zT2peaxr3fUGpwPa3wTPDWU2AKpoygcACJtBkl4nSVW9yQnODnlDu2UI
   4ANjhnanpBlGfRLc1zLpDh+CEECfPutF3OzIIWM+01EOJmokD5COm0cN0
   I4vNtdyTmx7tbfOuN1473mpOFMl0OCDIZGZucVs1jj96eZCP3sF+iI+eq
   kDw8psig8TO9a02kS+cmNwYovpoJrBwzwxjCwgQjgv+wjvvPdgM6XAsip
   g==;
X-CSE-ConnectionGUID: wwkkv/0CQiWQq1tGPU6srg==
X-CSE-MsgGUID: sfpXdSSBSiGvryxTEGJ5ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7524088"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7524088"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 04:33:43 -0700
X-CSE-ConnectionGUID: +eju8EnwRnGmaiTFPGrpXA==
X-CSE-MsgGUID: j3IXOIghQAq7+w1zwGBPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19056688"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Apr 2024 04:33:42 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rshpE-0002D2-1E;
	Fri, 05 Apr 2024 11:33:40 +0000
Date: Fri, 5 Apr 2024 19:32:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 19/37] kernel/locking/lock_events.c:80:36:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404051913.7fmK51rB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   449fd46baa282dd51ed0f757f111cd2cb11d03d9
commit: 02b8fcd817e5dbfce4b90bc975bbb4b7c0934cd9 [19/37] kernel: convert to read/write iterators
config: i386-randconfig-063-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051913.7fmK51rB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051913.7fmK51rB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051913.7fmK51rB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/locking/lock_events.c:80:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/locking/lock_events.c:80:36: sparse:     expected void const [noderef] __user *from
   kernel/locking/lock_events.c:80:36: sparse:     got char *
--
>> kernel/trace/trace_stack.c:332:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char * @@
   kernel/trace/trace_stack.c:332:36: sparse:     expected void const [noderef] __user *from
   kernel/trace/trace_stack.c:332:36: sparse:     got char *

vim +80 kernel/locking/lock_events.c

    58	
    59	/*
    60	 * The lockevent_read() function can be overridden.
    61	 */
    62	ssize_t __weak lockevent_read(struct kiocb *iocb, struct iov_iter *to)
    63	{
    64		char buf[64];
    65		int cpu, id, len;
    66		u64 sum = 0;
    67	
    68		/*
    69		 * Get the counter ID stored in file->f_inode->i_private
    70		 */
    71		id = (long)file_inode(iocb->ki_filp)->i_private;
    72	
    73		if (id >= lockevent_num)
    74			return -EBADF;
    75	
    76		for_each_possible_cpu(cpu)
    77			sum += per_cpu(lockevents[id], cpu);
    78		len = snprintf(buf, sizeof(buf) - 1, "%llu\n", sum);
    79	
  > 80		return simple_copy_to_iter(buf, &iocb->ki_pos, len, to);
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
