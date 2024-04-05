Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0F91649D9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712317006; cv=none; b=gUrUJ+y2h6g0fTSoLGLHMEejDw9GaHkKL6AGQpDDGzWpSQ1Bqg+LhzVbRnZS4j6d8HXfr8Y30/oymfr/AdoH0BA1zDEFY81x2KArKGwKKi1kMfrO5AgY3wYdGH7hHRt9wv+ZA0c8QjNSzm2f2baBpr6D7wfxljsZKCCtiTCf+6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712317006; c=relaxed/simple;
	bh=XePYceuBsHE3brnD7rlPnkJNlqRSx6a9miKbqTKS+PE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JcduPuUws/1/KZEfxXorgK9shbq0p42ktVpuSdtPM1oT9QY3pxkRJ005BSdcQOYZCh+eQTlouyP/OG2fo+37mtPIJhlHDVyHURU+M5dL9QerjmGDtQFTgxWYWwxTaK3rQq1GG8x+VxW4GFwU7PuWRkxbLlJ3yqbB8D3SzfBHtRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AkgGsidR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AkgGsidR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712317005; x=1743853005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XePYceuBsHE3brnD7rlPnkJNlqRSx6a9miKbqTKS+PE=;
  b=AkgGsidRjEFLxQjYAVp5ssVmWOKJ4EN+42ONoOCHQu/AtfPskreUfJbX
   Psa04G8nEKC+TZDIgemq+oeY9S/BwLiTbweEwAcABK0aJ7O4zU+NvAhKs
   tC5LrCe3v0NHg2pbP3yhJmap2xWDpdif2bW8iXqQ3xhKIgV3YcBhx9dQW
   DV4wSXBSnpwGuG9wa0gMOP/VWNDW28YKqeHM66fpScdxpuPb0J8qK4Z5R
   AUPeXKwKIF75WauQUeYCh/BN+NGnk57hQ52EutTEHoBqqJd0pvmG/BeVP
   N1eWVjoqebExQqlEseOuwEW8pM3pxXQiM5ndAKWzBEZk+bMnOe8ng1X4G
   Q==;
X-CSE-ConnectionGUID: SA3FAdvVR+qpeJc8me8zOQ==
X-CSE-MsgGUID: hEG+AxWQSNmJZH8E4hxF9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7875557"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7875557"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 04:36:44 -0700
X-CSE-ConnectionGUID: pQudNZyLQ228HUks9b+6ZQ==
X-CSE-MsgGUID: dq2jm8ibSsGoKGQAjzTKsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="56602276"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Apr 2024 04:36:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rshs8-0002DR-1l;
	Fri, 05 Apr 2024 11:36:40 +0000
Date: Fri, 5 Apr 2024 19:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 14/37] fs/ocfs2/cluster/heartbeat.c:1357:40:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404051901.TrkGZ9ay-lkp@intel.com>
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
commit: 2060d8675bc5531f7e3b3f698c5c91045e8d45c6 [14/37] fs: convert remaining users of ->read and ->write to iterator variants
config: i386-randconfig-062-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051901.TrkGZ9ay-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051901.TrkGZ9ay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051901.TrkGZ9ay-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ocfs2/cluster/heartbeat.c:1357:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *private_data @@
   fs/ocfs2/cluster/heartbeat.c:1357:40: sparse:     expected void const [noderef] __user *from
   fs/ocfs2/cluster/heartbeat.c:1357:40: sparse:     got void *private_data
--
>> fs/ocfs2/dlm/dlmdebug.c:343:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *private_data @@
   fs/ocfs2/dlm/dlmdebug.c:343:40: sparse:     expected void const [noderef] __user *from
   fs/ocfs2/dlm/dlmdebug.c:343:40: sparse:     got void *private_data
--
>> fs/ocfs2/super.c:367:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *private_data @@
   fs/ocfs2/super.c:367:40: sparse:     expected void const [noderef] __user *from
   fs/ocfs2/super.c:367:40: sparse:     got void *private_data
   fs/ocfs2/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, fs/ocfs2/ocfs2_trace.h):
   fs/ocfs2/./ocfs2_trace.h:78:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1271:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1404:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1677:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1709:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1709:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1739:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1758:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2007:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2047:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2079:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2099:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2120:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2158:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2203:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2230:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2230:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2259:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2259:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2295:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2331:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2353:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2374:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2395:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2411:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2439:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2453:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2473:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2517:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2539:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/super.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, fs/ocfs2/ocfs2_trace.h):
   fs/ocfs2/./ocfs2_trace.h:78:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1271:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1404:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1677:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1709:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1709:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1739:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:1758:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2007:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2047:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2079:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2099:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2120:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2158:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2203:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2230:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2230:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2259:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2259:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2295:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2331:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2353:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2374:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2395:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2411:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2439:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2453:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2473:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2517:1: sparse: sparse: self-comparison always evaluates to false
   fs/ocfs2/./ocfs2_trace.h:2539:1: sparse: sparse: self-comparison always evaluates to false
--
>> fs/orangefs/orangefs-debugfs.c:350:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[assigned] buf @@
   fs/orangefs/orangefs-debugfs.c:350:40: sparse:     expected void const [noderef] __user *from
   fs/orangefs/orangefs-debugfs.c:350:40: sparse:     got char *[assigned] buf

vim +1357 fs/ocfs2/cluster/heartbeat.c

  1352	
  1353	static ssize_t o2hb_debug_read(struct kiocb *iocb, struct iov_iter *to)
  1354	{
  1355		struct file *file = iocb->ki_filp;
  1356	
> 1357		return simple_copy_to_iter(file->private_data, &iocb->ki_pos,
  1358					       i_size_read(file->f_mapping->host), to);
  1359	}
  1360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
