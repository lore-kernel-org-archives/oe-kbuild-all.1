Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADB237A846
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 07:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420251; cv=none; b=g7vbWZzssP3yWdQCNutabPhNtBBVPFEqa/tukTuctoi1HYIp8ZmYkKupgMNuQsFHTSHfHNB2V+WjAByLtauPZIW+EOc5nrQKXRCo4yTRXzAbfRfZPUiy9GpdDhQH1/+CKo1jxxY4e6FdacnJOwHxq3O8ghfhgmkuMY3XxA5Lsv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420251; c=relaxed/simple;
	bh=h+6KaEJ45iyahZXeDw6nsE7TdAIK7Nabv8duncjT4Ug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YzL43PCnflaBaeXDNXQPsDOuIDlKGgubLB/+y6GZN4JNytxSV4FMX9w9Ljm+h5ug+zC79rkEF+snpu2EVT+Q3L6VRnkKRIXTYiu9PwY5hWrHliFYwf1uDV0esjmTHmArK1R23NeQJlHXHH56gKChp5oaEzMwi5HT8HyIerHSE5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nk8umipJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nk8umipJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788420249; x=1819956249;
  h=date:from:to:cc:subject:message-id;
  bh=h+6KaEJ45iyahZXeDw6nsE7TdAIK7Nabv8duncjT4Ug=;
  b=Nk8umipJ+yntM9UtiukiwWfxcDpwaC4enrd8eqx/P4tlutO9jU3FdA+4
   ni1GM/obYNaV1Y/e0hFbiC8nGHAw4zXyT3y1Ode9HXhyFzYgGsapoG4rY
   0NUlUV8h6sagYV0QEKh6uTjStm5wFG9F/DUhZ7I/jiOI3jeAX2uViCoCx
   hoE2XC3Gl4zWMZrrwG6UHV4FjztB5M2BBwCWGLWm/dxWCosaJGaB/hRkF
   PWCylGmko5Ha0vMdqCSqP5ZNR+57wgyu2yDMy7IqXxlPPJXF8kEN8hI4g
   S7Auc/kuBVcdv84h6PhY/KToGz1AQ2KzLkjQewlUvEiy7xEZLP3uwIBJw
   A==;
X-CSE-ConnectionGUID: 8h8Ip3HIQmi2VT/QZJoF4Q==
X-CSE-MsgGUID: WwYFTwzbSRSRFWT7S0JS9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106412031"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="106412031"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 00:24:08 -0700
X-CSE-ConnectionGUID: 8VG1CvdvTvimyBPwvoWvBQ==
X-CSE-MsgGUID: 9tkIj9OGSoWtXJTp7rilQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="299502687"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Sep 2026 00:24:07 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x21no-000000004IQ-2zhk;
	Thu, 03 Sep 2026 07:24:04 +0000
Date: Thu, 03 Sep 2026 15:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 278/278]
 kernel/power/swap.c:645: warning: Function parameter or member 'data' not
 described in 'compress_threadfn'
Message-ID: <202609031533.Xz9C8rZL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nikhil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   ae917b3c7332e08006443a49c261aa97ce703103
commit: 31414b7c10febdb2006bacd5de9de2f63785ac58 [278/278] BACKPORT: PM: hibernate: Rename lzo* to make it generic
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260903/202609031533.Xz9C8rZL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c2cffa015e9549aafba9e514384b08204c7cc4b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031533.Xz9C8rZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031533.Xz9C8rZL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/power/swap.c:95: warning: cannot understand function prototype: 'struct swap_map_handle '
   kernel/power/swap.c:122: warning: cannot understand function prototype: 'struct swsusp_extent '
   kernel/power/swap.c:177: warning: Function parameter or member 'swap' not described in 'alloc_swapdev_block'
   kernel/power/swap.c:197: warning: Function parameter or member 'swap' not described in 'free_all_swap_pages'
   kernel/power/swap.c:541: warning: Function parameter or member 'handle' not described in 'save_image'
   kernel/power/swap.c:541: warning: Function parameter or member 'snapshot' not described in 'save_image'
   kernel/power/swap.c:541: warning: Function parameter or member 'nr_to_write' not described in 'save_image'
   kernel/power/swap.c:585: warning: cannot understand function prototype: 'struct crc_data '
   kernel/power/swap.c:601: warning: Function parameter or member 'data' not described in 'crc32_threadfn'
   kernel/power/swap.c:627: warning: cannot understand function prototype: 'struct cmp_data '
>> kernel/power/swap.c:645: warning: Function parameter or member 'data' not described in 'compress_threadfn'
   kernel/power/swap.c:891: warning: Function parameter or member 'nr_pages' not described in 'enough_swap'
   kernel/power/swap.c:958: warning: Function parameter or member 'handle' not described in 'release_swap_reader'
   kernel/power/swap.c:1062: warning: Function parameter or member 'handle' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'snapshot' not described in 'load_image'
   kernel/power/swap.c:1062: warning: Function parameter or member 'nr_to_read' not described in 'load_image'
   kernel/power/swap.c:1114: warning: cannot understand function prototype: 'struct dec_data '
>> kernel/power/swap.c:1131: warning: Function parameter or member 'data' not described in 'decompress_threadfn'
   kernel/power/swap.c:1567: warning: Function parameter or member 'mode' not described in 'swsusp_close'


vim +645 kernel/power/swap.c

081a9d043c983f1 Bojan Smojver  2011-10-13  640  
081a9d043c983f1 Bojan Smojver  2011-10-13  641  /**
081a9d043c983f1 Bojan Smojver  2011-10-13  642   * Compression function that runs in its own thread.
081a9d043c983f1 Bojan Smojver  2011-10-13  643   */
31414b7c10febdb Nikhil V       2024-01-22  644  static int compress_threadfn(void *data)
081a9d043c983f1 Bojan Smojver  2011-10-13 @645  {
081a9d043c983f1 Bojan Smojver  2011-10-13  646  	struct cmp_data *d = data;
081a9d043c983f1 Bojan Smojver  2011-10-13  647  
081a9d043c983f1 Bojan Smojver  2011-10-13  648  	while (1) {
981a31b7547af42 Hongchen Zhang 2023-11-16  649  		wait_event(d->go, atomic_read_acquire(&d->ready) ||
081a9d043c983f1 Bojan Smojver  2011-10-13  650  		                  kthread_should_stop());
081a9d043c983f1 Bojan Smojver  2011-10-13  651  		if (kthread_should_stop()) {
081a9d043c983f1 Bojan Smojver  2011-10-13  652  			d->thr = NULL;
081a9d043c983f1 Bojan Smojver  2011-10-13  653  			d->ret = -1;
981a31b7547af42 Hongchen Zhang 2023-11-16  654  			atomic_set_release(&d->stop, 1);
081a9d043c983f1 Bojan Smojver  2011-10-13  655  			wake_up(&d->done);
081a9d043c983f1 Bojan Smojver  2011-10-13  656  			break;
081a9d043c983f1 Bojan Smojver  2011-10-13  657  		}
081a9d043c983f1 Bojan Smojver  2011-10-13  658  		atomic_set(&d->ready, 0);
081a9d043c983f1 Bojan Smojver  2011-10-13  659  
081a9d043c983f1 Bojan Smojver  2011-10-13  660  		d->ret = lzo1x_1_compress(d->unc, d->unc_len,
31414b7c10febdb Nikhil V       2024-01-22  661  					  d->cmp + CMP_HEADER, &d->cmp_len,
081a9d043c983f1 Bojan Smojver  2011-10-13  662  		                          d->wrk);
981a31b7547af42 Hongchen Zhang 2023-11-16  663  		atomic_set_release(&d->stop, 1);
081a9d043c983f1 Bojan Smojver  2011-10-13  664  		wake_up(&d->done);
081a9d043c983f1 Bojan Smojver  2011-10-13  665  	}
081a9d043c983f1 Bojan Smojver  2011-10-13  666  	return 0;
081a9d043c983f1 Bojan Smojver  2011-10-13  667  }
f996fc9671d088b Bojan Smojver  2010-09-09  668  

:::::: The code at line 645 was first introduced by commit
:::::: 081a9d043c983f161b78fdc4671324d1342b86bc PM / Hibernate: Improve performance of LZO/plain hibernation, checksum image

:::::: TO: Bojan Smojver <bojan@rexursive.com>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
