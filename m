Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694001AAC4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 04:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712205212; cv=none; b=iEJRyvykdbsVIOCVHBV75VnANPZJ6ivcpx+H8htlwpd56lAzbyyXi+tDoc442a3ZX5dCfHtGzPPYEtjOdPQOpAnOJJGsDxkSDC6GvPPNDMwVHuzWMo1bNsoeDpu6urzFWMZOa2q6bqL9TH3MdqJOfNAT/dcVl0Ff1JmItC3J0cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712205212; c=relaxed/simple;
	bh=T/OeG8fGd79APRyUq8twmz2gSpIOCWo1TzRmTR6T3+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OzXcMn/fUNF8UuUv01jIgIhiKYyC4LEuLNSw+ypjNE9Gdb29rL3dD2/Yn8BSI+HpIXEh1ZWypgc8VIDkwPCFwNjtVrtFGe5zxi02DPIe8tVmBQGHVjC/Tldx2ilf3rrpNjKj+H8IbwmNsYbJdH8fAwMGZ5HPSWM45xB+ckWsnFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYygw1qI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYygw1qI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712205210; x=1743741210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/OeG8fGd79APRyUq8twmz2gSpIOCWo1TzRmTR6T3+I=;
  b=iYygw1qI7HAQpNAvNK661n8c/bCZoD90z9B81+vFKDHB2s3wQj6O7qif
   MmdS3JUJD3t0Uk1Dw9bLofq2ukVdODCPQin37LALhvm6PPpAuogQsglSk
   MU5cDW7q1CfxoXK2u1JHuVWfU9GAZzqaKdbi6jGD568NAbCH4yF26qw2w
   wvnzRPd356B9H8PTek23MWI6DSGH/SA5AORrGsqzPYJUUysbvsc9SxQKv
   oLEG8LfbenO+LNJKMjm4p1O/NLfm2BeNESPQbbxnlFtbBiJXGDjMaleFq
   XYDxDjVpY2fv2FHZNBGvP0cB1NQz7ABbIgu1hAl32RI5rgaJjRl7qNkMt
   w==;
X-CSE-ConnectionGUID: BvzxcBFcSNWP6VYpKA1Ajw==
X-CSE-MsgGUID: lgPUR1jiQk2mu9LhVYIKxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="29943323"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="29943323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 21:33:29 -0700
X-CSE-ConnectionGUID: AXSmWi7RRb+Jb8BHMpQtvA==
X-CSE-MsgGUID: s7UKUH+0TTSYeTQHTsPZ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="56108353"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 03 Apr 2024 21:33:29 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsEn0-0000cY-1V;
	Thu, 04 Apr 2024 04:33:26 +0000
Date: Thu, 4 Apr 2024 12:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 15/18] kernel/trace/trace_hwlat.c:681: warning:
 Function parameter or struct member 'iocb' not described in
 'hwlat_mode_write'
Message-ID: <202404041250.7GJ7Zzyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   687d677fbc087c574563d9dd42b7a3faf1b36c6e
commit: f42048f21805f77541ea738ce4a902a8a9e331a4 [15/18] kernel: convert to read/write iterators
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240404/202404041250.7GJ7Zzyc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041250.7GJ7Zzyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041250.7GJ7Zzyc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_hwlat.c:681: warning: Function parameter or struct member 'iocb' not described in 'hwlat_mode_write'
>> kernel/trace/trace_hwlat.c:681: warning: Function parameter or struct member 'from' not described in 'hwlat_mode_write'
>> kernel/trace/trace_hwlat.c:681: warning: Excess function parameter 'filp' description in 'hwlat_mode_write'
>> kernel/trace/trace_hwlat.c:681: warning: Excess function parameter 'ubuf' description in 'hwlat_mode_write'
>> kernel/trace/trace_hwlat.c:681: warning: Excess function parameter 'cnt' description in 'hwlat_mode_write'
>> kernel/trace/trace_hwlat.c:681: warning: Excess function parameter 'ppos' description in 'hwlat_mode_write'
--
>> kernel/trace/trace_osnoise.c:2212: warning: Function parameter or struct member 'iocb' not described in 'osnoise_options_write'
>> kernel/trace/trace_osnoise.c:2212: warning: Function parameter or struct member 'from' not described in 'osnoise_options_write'
>> kernel/trace/trace_osnoise.c:2212: warning: Excess function parameter 'filp' description in 'osnoise_options_write'
>> kernel/trace/trace_osnoise.c:2212: warning: Excess function parameter 'ubuf' description in 'osnoise_options_write'
>> kernel/trace/trace_osnoise.c:2212: warning: Excess function parameter 'cnt' description in 'osnoise_options_write'
>> kernel/trace/trace_osnoise.c:2212: warning: Excess function parameter 'ppos' description in 'osnoise_options_write'


vim +681 kernel/trace/trace_hwlat.c

8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  664  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  665  /**
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  666   * hwlat_mode_write - Write function for "mode" entry
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  667   * @filp: The active open file structure
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  668   * @ubuf: The user buffer that contains the value to write
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  669   * @cnt: The maximum number of bytes to write to "file"
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  670   * @ppos: The current position in @file
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  671   *
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  672   * This function provides a write implementation for the "mode" interface
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  673   * to the hardware latency detector. hwlatd has different operation modes.
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  674   * The "none" sets the allowed cpumask for a single hwlatd thread at the
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  675   * startup and lets the scheduler handle the migration. The default mode is
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  676   * the "round-robin" one, in which a single hwlatd thread runs, migrating
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  677   * among the allowed CPUs in a round-robin fashion. The "per-cpu" mode
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  678   * creates one hwlatd thread per allowed CPU.
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  679   */
f42048f21805f7 Jens Axboe                 2024-04-03  680  static ssize_t hwlat_mode_write(struct kiocb *iocb, struct iov_iter *from)
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22 @681  {
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  682  	struct trace_array *tr = hwlat_trace;
f42048f21805f7 Jens Axboe                 2024-04-03  683  	size_t cnt = iov_iter_count(from);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  684  	const char *mode;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  685  	char buf[64];
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  686  	int ret, i;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  687  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  688  	if (cnt >= sizeof(buf))
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  689  		return -EINVAL;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  690  
f42048f21805f7 Jens Axboe                 2024-04-03  691  	if (!copy_from_iter(buf, cnt, from))
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  692  		return -EFAULT;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  693  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  694  	buf[cnt] = 0;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  695  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  696  	mode = strstrip(buf);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  697  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  698  	ret = -EINVAL;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  699  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  700  	/*
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  701  	 * trace_types_lock is taken to avoid concurrency on start/stop
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  702  	 * and hwlat_busy.
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  703  	 */
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  704  	mutex_lock(&trace_types_lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  705  	if (hwlat_busy)
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  706  		hwlat_tracer_stop(tr);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  707  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  708  	mutex_lock(&hwlat_data.lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  709  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  710  	for (i = 0; i < MODE_MAX; i++) {
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  711  		if (strcmp(mode, thread_mode_str[i]) == 0) {
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  712  			hwlat_data.thread_mode = i;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  713  			ret = cnt;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  714  		}
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  715  	}
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  716  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  717  	mutex_unlock(&hwlat_data.lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  718  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  719  	if (hwlat_busy)
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  720  		hwlat_tracer_start(tr);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  721  	mutex_unlock(&trace_types_lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  722  
f42048f21805f7 Jens Axboe                 2024-04-03  723  	iocb->ki_pos += cnt;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  724  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  725  	return ret;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  726  }
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  727  

:::::: The code at line 681 was first introduced by commit
:::::: 8fa826b7344d6752f5cfd72380d9fe7bd8c6b928 trace/hwlat: Implement the mode config option

:::::: TO: Daniel Bristot de Oliveira <bristot@redhat.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
