Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C57233945
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 May 2026 17:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779556961; cv=none; b=NPiqVRLXMXmJxjhgJqJNDjK0rGptkivEo1ZzJ3Eu/OeuZGdm02aH7QS94L95v0Aalwkjagt77N2Od/Y4VeTH1Rrbqo1y+ArmQyBtlGmcLyLu6Ln5yPvM+ff7tWUqa9Ef7+UWlppBsXsr7is8xCsoVRHF2Te84CN+0nvJpw72hFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779556961; c=relaxed/simple;
	bh=zn9drDzghDn3wrr8K3bIC/CXauOReiXa13bViQ5Zylk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZSV3saaaDJxd7aIk7jWJu1JQZtJHJOMT/xAwyYKrh/86ZTLJMwGZFIX0mi6lSxMTMrg/Hxs9cIzhbTxJFvcPz/MVb8YF4OudPQFC/9azccJXEh4j1jwMI1mIhABhRT4ly5J2XP+5PzrAUQL2u4egaCu1hfynhM8I8vzBgIkxJWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMELzn3K; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMELzn3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779556957; x=1811092957;
  h=date:from:to:cc:subject:message-id;
  bh=zn9drDzghDn3wrr8K3bIC/CXauOReiXa13bViQ5Zylk=;
  b=eMELzn3KX4G6t2vMHRteu241qgUEBGkj4lA8fDGZDfdJ27shZA4YTJcO
   wXGyTs0i2lUtxQxKWn7hSYEP488HV3CdJqp76Cv4cbnTFhXMEuhvtjZlU
   yyeYvN9xKYZy66eN1SF3frxrjuWrKD6eeeLLfxiyi1+CqhnEr7VfDJr8e
   x9Xj+Jqglny77kCUdFTVA4+f6CkNeJXnpkUc8xIcgkTQRwNg8Ta4MYuOU
   /diWdLB+Y7zO6ewtbiQ5P6fVNEYqKjIFUPjbvRseNxiyVAq0hDRw5SmXP
   pkID5LQ2WSuU+fA7nZmF/scDzyS5RuWa3YNXge5uN1U0C1sTIP3v59tb8
   Q==;
X-CSE-ConnectionGUID: 3LoJ7ha7R/CoqVJSpl2cNw==
X-CSE-MsgGUID: CVX0MguCTuyJVzku58EXnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91921520"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="91921520"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 10:22:37 -0700
X-CSE-ConnectionGUID: 2GPdUlzrT6uMjMIVO6+B8A==
X-CSE-MsgGUID: aA78nokwRHmd+WarD/IN1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="236768789"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 May 2026 10:22:35 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQq3V-000000000Dl-115G;
	Sat, 23 May 2026 17:22:33 +0000
Date: Sun, 24 May 2026 01:21:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 235/235]
 kernel/power/swap.c:645: warning: Function parameter or member 'data' not
 described in 'compress_threadfn'
Message-ID: <202605240153.lVFbyjkK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nikhil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   8c66939857f7c1785dcf957b4374265db31c6af5
commit: 31414b7c10febdb2006bacd5de9de2f63785ac58 [235/235] BACKPORT: PM: hibernate: Rename lzo* to make it generic
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260524/202605240153.lVFbyjkK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240153.lVFbyjkK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240153.lVFbyjkK-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CRYPTO_CURVE25519_NEON
   Depends on [n]: CRYPTO [=y] && ARM_CRYPTO [=y] && KERNEL_MODE_NEON [=y] && !CPU_BIG_ENDIAN [=y]
   Selected by [y]:
   - WIREGUARD [=y] && NETDEVICES [=y] && NET_CORE [=y] && NET [=y] && INET [=y] && (IPV6 [=y] || !IPV6 [=y]) && ARM [=y] && KERNEL_MODE_NEON [=y]


vim +645 kernel/power/swap.c

081a9d043c983f Bojan Smojver  2011-10-13  640  
081a9d043c983f Bojan Smojver  2011-10-13  641  /**
081a9d043c983f Bojan Smojver  2011-10-13  642   * Compression function that runs in its own thread.
081a9d043c983f Bojan Smojver  2011-10-13  643   */
31414b7c10febd Nikhil V       2024-01-22  644  static int compress_threadfn(void *data)
081a9d043c983f Bojan Smojver  2011-10-13 @645  {
081a9d043c983f Bojan Smojver  2011-10-13  646  	struct cmp_data *d = data;
081a9d043c983f Bojan Smojver  2011-10-13  647  
081a9d043c983f Bojan Smojver  2011-10-13  648  	while (1) {
981a31b7547af4 Hongchen Zhang 2023-11-16  649  		wait_event(d->go, atomic_read_acquire(&d->ready) ||
081a9d043c983f Bojan Smojver  2011-10-13  650  		                  kthread_should_stop());
081a9d043c983f Bojan Smojver  2011-10-13  651  		if (kthread_should_stop()) {
081a9d043c983f Bojan Smojver  2011-10-13  652  			d->thr = NULL;
081a9d043c983f Bojan Smojver  2011-10-13  653  			d->ret = -1;
981a31b7547af4 Hongchen Zhang 2023-11-16  654  			atomic_set_release(&d->stop, 1);
081a9d043c983f Bojan Smojver  2011-10-13  655  			wake_up(&d->done);
081a9d043c983f Bojan Smojver  2011-10-13  656  			break;
081a9d043c983f Bojan Smojver  2011-10-13  657  		}
081a9d043c983f Bojan Smojver  2011-10-13  658  		atomic_set(&d->ready, 0);
081a9d043c983f Bojan Smojver  2011-10-13  659  
081a9d043c983f Bojan Smojver  2011-10-13  660  		d->ret = lzo1x_1_compress(d->unc, d->unc_len,
31414b7c10febd Nikhil V       2024-01-22  661  					  d->cmp + CMP_HEADER, &d->cmp_len,
081a9d043c983f Bojan Smojver  2011-10-13  662  		                          d->wrk);
981a31b7547af4 Hongchen Zhang 2023-11-16  663  		atomic_set_release(&d->stop, 1);
081a9d043c983f Bojan Smojver  2011-10-13  664  		wake_up(&d->done);
081a9d043c983f Bojan Smojver  2011-10-13  665  	}
081a9d043c983f Bojan Smojver  2011-10-13  666  	return 0;
081a9d043c983f Bojan Smojver  2011-10-13  667  }
f996fc9671d088 Bojan Smojver  2010-09-09  668  

:::::: The code at line 645 was first introduced by commit
:::::: 081a9d043c983f161b78fdc4671324d1342b86bc PM / Hibernate: Improve performance of LZO/plain hibernation, checksum image

:::::: TO: Bojan Smojver <bojan@rexursive.com>
:::::: CC: Rafael J. Wysocki <rjw@sisk.pl>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
