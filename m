Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47513C6A57
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727082; cv=none; b=B6ff+oWCSI0Qm8DybvEl1jC51iBwqbXr9hFdly5f/3YdJWP0Yh5V5Ww2Xq7Zyo4wTovcnBw9HTDm2uNMevTXhHfzoM+AQyESce4WeDN8GpjDLnaOrwVLDnI9VZ+oOGLZGXbJJvkzm6WbfbS3GLqTMyTLBb6GIc/rinFYSrWQxmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727082; c=relaxed/simple;
	bh=qgtPpPpUPZYww1DXht3nr4PzZ6q3SSyc6cJiWJDizi4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rAt2uJYxR6z4d3zpdn7/ZVfYIikfiNpjXH6zduVuy15EjQG/2ajQTsdL274kV9NdBoYjXOFdTwqlBBYqcUMS3Sujq1E7gebiLFsZlMbkpCFPbX9wFVuVzJITaLM8MRw9sD8/IGGlSpIyx22aTPgmmvgWT1OwFPFLWg50DMGG64w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/aGxM4/; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/aGxM4/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772727080; x=1804263080;
  h=date:from:to:cc:subject:message-id;
  bh=qgtPpPpUPZYww1DXht3nr4PzZ6q3SSyc6cJiWJDizi4=;
  b=i/aGxM4/FvbshHf/20XAfYIZS2pFZioUUVhG4C+1v+30FnCdlmeuyTYc
   6kqGUrlNDR8/GTUKp5hrsCF6LsZ526LyPenhXc/qH50J/oXnFDuVFb2h/
   eROCkbRezzSDC7FuwB6L+odY69XVfuxARYg++AfesD9FALNlSfywwv++i
   ut05LkACjI43vaIH2RjB7o7woCSR2DLn++KWtBnUZ5erLzmDAA8eFHFs8
   8Uf28U0ogLRuzs1lliUMdxfrhvaDRp+YwAoiK2483U0FArvYwHjh7uaa8
   HdGJP1E1U2bOemMb1JMS4/XBL51mH2/U97aUGu4lwFav4GDfFN6I5VMze
   A==;
X-CSE-ConnectionGUID: au7v4PCRQ/CtZgbQOxiUyA==
X-CSE-MsgGUID: jRNxTtLNRIGQCPgjk347ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84903389"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="84903389"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 08:11:19 -0800
X-CSE-ConnectionGUID: w2V5MCb/SxmhCsQWuhoi0Q==
X-CSE-MsgGUID: q23rwO/uTeG14kweXCXJTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="216998241"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 08:11:18 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyBIC-000000000uA-0zzY;
	Thu, 05 Mar 2026 16:11:16 +0000
Date: Fri, 06 Mar 2026 00:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 147/467]
 drivers/gpu/drm/xe/xe_debugfs.c:332:9: error: 'size' undeclared; did you mean
 'ksize'?
Message-ID: <202603060036.68co3dpq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 2fa2856b312ca24d5289991ad16b1f036ab7c31d [147/467] drm: xe: convert to read/write iterators
config: arc-randconfig-002-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060036.68co3dpq-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060036.68co3dpq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060036.68co3dpq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_debugfs.c: In function 'wedged_mode_set':
>> drivers/gpu/drm/xe/xe_debugfs.c:332:9: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     return size;
            ^~~~
            ksize
   drivers/gpu/drm/xe/xe_debugfs.c:332:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'page_reclaim_hw_assist_set':
   drivers/gpu/drm/xe/xe_debugfs.c:363:9: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     return size;
            ^~~~
            ksize
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'atomic_svm_timeslice_ms_set':
   drivers/gpu/drm/xe/xe_debugfs.c:395:9: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     return size;
            ^~~~
            ksize
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'min_run_period_lr_ms_set':
   drivers/gpu/drm/xe/xe_debugfs.c:427:9: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     return size;
            ^~~~
            ksize
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'min_run_period_pf_ms_set':
   drivers/gpu/drm/xe/xe_debugfs.c:459:9: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     return size;
            ^~~~
            ksize
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'disable_late_binding_set':
   drivers/gpu/drm/xe/xe_debugfs.c:492:9: error: 'size' undeclared (first use in this function); did you mean 'ksize'?
     return size;
            ^~~~
            ksize
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'page_reclaim_hw_assist_set':
>> drivers/gpu/drm/xe/xe_debugfs.c:364:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'disable_late_binding_set':
   drivers/gpu/drm/xe/xe_debugfs.c:493:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'min_run_period_pf_ms_set':
   drivers/gpu/drm/xe/xe_debugfs.c:460:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'min_run_period_lr_ms_set':
   drivers/gpu/drm/xe/xe_debugfs.c:428:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'atomic_svm_timeslice_ms_set':
   drivers/gpu/drm/xe/xe_debugfs.c:396:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^
   drivers/gpu/drm/xe/xe_debugfs.c: In function 'wedged_mode_set':
   drivers/gpu/drm/xe/xe_debugfs.c:333:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +332 drivers/gpu/drm/xe/xe_debugfs.c

0f13dead4e0385 Lukasz Laguna 2026-01-07  309  
2fa2856b312ca2 Jens Axboe    2024-08-02  310  static ssize_t wedged_mode_set(struct kiocb *iocb, struct iov_iter *from)
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  311  {
2fa2856b312ca2 Jens Axboe    2024-08-02  312  	struct xe_device *xe = file_inode(iocb->ki_filp)->i_private;
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  313  	u32 wedged_mode;
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  314  	ssize_t ret;
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  315  
2fa2856b312ca2 Jens Axboe    2024-08-02  316  	ret = kstrtouint_from_iter(from, iov_iter_count(from), 0, &wedged_mode);
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  317  	if (ret)
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  318  		return ret;
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  319  
17d3c3365ba9e5 Lukasz Laguna 2026-01-07  320  	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
17d3c3365ba9e5 Lukasz Laguna 2026-01-07  321  	if (ret)
17d3c3365ba9e5 Lukasz Laguna 2026-01-07  322  		return ret;
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  323  
0f13dead4e0385 Lukasz Laguna 2026-01-07  324  	if (wedged_mode_needs_policy_update(xe, wedged_mode)) {
0f13dead4e0385 Lukasz Laguna 2026-01-07  325  		ret = wedged_mode_set_reset_policy(xe, wedged_mode);
0f13dead4e0385 Lukasz Laguna 2026-01-07  326  		if (ret)
0f13dead4e0385 Lukasz Laguna 2026-01-07  327  			return ret;
0f13dead4e0385 Lukasz Laguna 2026-01-07  328  	}
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  329  
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  330  	xe->wedged.mode = wedged_mode;
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  331  
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23 @332  	return size;
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  333  }
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  334  
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  335  static const struct file_operations wedged_mode_fops = {
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  336  	.owner = THIS_MODULE,
2fa2856b312ca2 Jens Axboe    2024-08-02  337  	.read_iter = wedged_mode_show,
2fa2856b312ca2 Jens Axboe    2024-08-02  338  	.write_iter = wedged_mode_set,
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  339  };
6b8ef44cc0a952 Rodrigo Vivi  2024-04-23  340  
2fa2856b312ca2 Jens Axboe    2024-08-02  341  static ssize_t page_reclaim_hw_assist_show(struct kiocb *iocb, struct iov_iter *to)
13d99b01c0c9d9 Brian Nguyen  2025-12-13  342  {
2fa2856b312ca2 Jens Axboe    2024-08-02  343  	struct xe_device *xe = file_inode(iocb->ki_filp)->i_private;
13d99b01c0c9d9 Brian Nguyen  2025-12-13  344  	char buf[8];
13d99b01c0c9d9 Brian Nguyen  2025-12-13  345  	int len;
13d99b01c0c9d9 Brian Nguyen  2025-12-13  346  
13d99b01c0c9d9 Brian Nguyen  2025-12-13  347  	len = scnprintf(buf, sizeof(buf), "%d\n", xe->info.has_page_reclaim_hw_assist);
2fa2856b312ca2 Jens Axboe    2024-08-02  348  	return simple_copy_to_iter(buf, &iocb->ki_pos, len, to);
13d99b01c0c9d9 Brian Nguyen  2025-12-13  349  }
13d99b01c0c9d9 Brian Nguyen  2025-12-13  350  
2fa2856b312ca2 Jens Axboe    2024-08-02  351  static ssize_t page_reclaim_hw_assist_set(struct kiocb *iocb, struct iov_iter *from)
13d99b01c0c9d9 Brian Nguyen  2025-12-13  352  {
2fa2856b312ca2 Jens Axboe    2024-08-02  353  	struct xe_device *xe = file_inode(iocb->ki_filp)->i_private;
13d99b01c0c9d9 Brian Nguyen  2025-12-13  354  	bool val;
13d99b01c0c9d9 Brian Nguyen  2025-12-13  355  	ssize_t ret;
13d99b01c0c9d9 Brian Nguyen  2025-12-13  356  
2fa2856b312ca2 Jens Axboe    2024-08-02  357  	ret = kstrtobool_from_iter(from, iov_iter_count(from), &val);
13d99b01c0c9d9 Brian Nguyen  2025-12-13  358  	if (ret)
13d99b01c0c9d9 Brian Nguyen  2025-12-13  359  		return ret;
13d99b01c0c9d9 Brian Nguyen  2025-12-13  360  
13d99b01c0c9d9 Brian Nguyen  2025-12-13  361  	xe->info.has_page_reclaim_hw_assist = val;
13d99b01c0c9d9 Brian Nguyen  2025-12-13  362  
13d99b01c0c9d9 Brian Nguyen  2025-12-13  363  	return size;
13d99b01c0c9d9 Brian Nguyen  2025-12-13 @364  }
13d99b01c0c9d9 Brian Nguyen  2025-12-13  365  

:::::: The code at line 332 was first introduced by commit
:::::: 6b8ef44cc0a952549a6773a0233cee853f807a79 drm/xe: Introduce the wedged_mode debugfs

:::::: TO: Rodrigo Vivi <rodrigo.vivi@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
