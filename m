Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C02D237707
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 01:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770774912; cv=none; b=Er5lDBrinQ5UxbtFn2RBJE8/91eeotInh1kXD6w5muWV5U2HLkOkhoQQxE7LkzY1173Ual9+GaPoiwn8zi7KYXQNqh0vw9hSDHOpJNvwoRcGBPEBlDiwdcMLOPAwgB+SzYf+IldW22GmZ+fNmT1xcNGbQCzwlfMkZeMCX7SAHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770774912; c=relaxed/simple;
	bh=FSxMN2Kp0jXsI+7W/PmEwyHXs08/DzJomTpthDQs0P0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Bg88jpen77an8RbvxByoC16nJ4N5FDGgOllrpp64RFVL7BbS20eij8JpzNExNbDVwUVrW6sn568Ayaqcy40EYuotHvjaBJu4Az1JDCQIXvZyKzXaFbTzmj333HVPGuwz2boQ2EMHwB4lj16zirdxCLAfTypTRvBsJiJvYkJmOSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E8ocJsa5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E8ocJsa5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770774910; x=1802310910;
  h=date:from:to:cc:subject:message-id;
  bh=FSxMN2Kp0jXsI+7W/PmEwyHXs08/DzJomTpthDQs0P0=;
  b=E8ocJsa5jWQbj1p8jHu4MR9EfzpvwS0F+/XE6/QHs7FiRkxO/Ye+UHc9
   py3AhJ7OhgiBNJ6OuwexuY1EDfj44l7dA7i/sFpyS/P6pps2icNgfNgCc
   tRe5dtYBXTh9rThHPBBdLauLGKdstc5aOAhInskD7bjv6bI6pTE1HWJ0I
   oQ3kqN1NqknzGXvoPU1CFVSW8uxG6Dp5/idyOdR30UYEUMrfc8Nw/L2AF
   lsIc1/sU/htebpMKu1cMSaJwl6PwFrnkz7jAiGBRd8PKKu0FIl7WaLCI0
   U8/dFKLqlF92e+v1EbXF3+EglCBT8tDH7vL569/ZaGvwQLEVKrbVeeJsL
   g==;
X-CSE-ConnectionGUID: 2WtORKXsQd+iGi9s0H3EoA==
X-CSE-MsgGUID: I+oiy/vOQfGN/rHu8uplKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="97372737"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97372737"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 17:55:09 -0800
X-CSE-ConnectionGUID: +8qFISBQTDivRq3j2AHvXQ==
X-CSE-MsgGUID: I0scHodEREO/mh2EZXm1tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="212190565"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Feb 2026 17:55:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpzRa-00000000pZo-0IKF;
	Wed, 11 Feb 2026 01:55:06 +0000
Date: Wed, 11 Feb 2026 09:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 203/203]
 kernel/power/swap.c:645: warning: Function parameter or member 'data' not
 described in 'compress_threadfn'
Message-ID: <202602110944.XJzsRYmZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Nikhil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   35927ff8df047b269c671535118aa0046a689a6d
commit: 31414b7c10febdb2006bacd5de9de2f63785ac58 [203/203] BACKPORT: PM: hibernate: Rename lzo* to make it generic
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260211/202602110944.XJzsRYmZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110944.XJzsRYmZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110944.XJzsRYmZ-lkp@intel.com/

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

081a9d043c983f Bojan Smojver  2011-10-13  596  
081a9d043c983f Bojan Smojver  2011-10-13  597  /**
081a9d043c983f Bojan Smojver  2011-10-13  598   * CRC32 update function that runs in its own thread.
081a9d043c983f Bojan Smojver  2011-10-13  599   */
081a9d043c983f Bojan Smojver  2011-10-13  600  static int crc32_threadfn(void *data)
081a9d043c983f Bojan Smojver  2011-10-13 @601  {
081a9d043c983f Bojan Smojver  2011-10-13  602  	struct crc_data *d = data;
081a9d043c983f Bojan Smojver  2011-10-13  603  	unsigned i;
081a9d043c983f Bojan Smojver  2011-10-13  604  
081a9d043c983f Bojan Smojver  2011-10-13  605  	while (1) {
981a31b7547af4 Hongchen Zhang 2023-11-16  606  		wait_event(d->go, atomic_read_acquire(&d->ready) ||
081a9d043c983f Bojan Smojver  2011-10-13  607  		                  kthread_should_stop());
081a9d043c983f Bojan Smojver  2011-10-13  608  		if (kthread_should_stop()) {
081a9d043c983f Bojan Smojver  2011-10-13  609  			d->thr = NULL;
981a31b7547af4 Hongchen Zhang 2023-11-16  610  			atomic_set_release(&d->stop, 1);
081a9d043c983f Bojan Smojver  2011-10-13  611  			wake_up(&d->done);
081a9d043c983f Bojan Smojver  2011-10-13  612  			break;
081a9d043c983f Bojan Smojver  2011-10-13  613  		}
081a9d043c983f Bojan Smojver  2011-10-13  614  		atomic_set(&d->ready, 0);
081a9d043c983f Bojan Smojver  2011-10-13  615  
081a9d043c983f Bojan Smojver  2011-10-13  616  		for (i = 0; i < d->run_threads; i++)
081a9d043c983f Bojan Smojver  2011-10-13  617  			*d->crc32 = crc32_le(*d->crc32,
081a9d043c983f Bojan Smojver  2011-10-13  618  			                     d->unc[i], *d->unc_len[i]);
981a31b7547af4 Hongchen Zhang 2023-11-16  619  		atomic_set_release(&d->stop, 1);
081a9d043c983f Bojan Smojver  2011-10-13  620  		wake_up(&d->done);
081a9d043c983f Bojan Smojver  2011-10-13  621  	}
081a9d043c983f Bojan Smojver  2011-10-13  622  	return 0;
081a9d043c983f Bojan Smojver  2011-10-13  623  }
081a9d043c983f Bojan Smojver  2011-10-13  624  /**
31414b7c10febd Nikhil V       2024-01-22  625   * Structure used for data compression.
081a9d043c983f Bojan Smojver  2011-10-13  626   */
081a9d043c983f Bojan Smojver  2011-10-13  627  struct cmp_data {
081a9d043c983f Bojan Smojver  2011-10-13  628  	struct task_struct *thr;                  /* thread */
081a9d043c983f Bojan Smojver  2011-10-13  629  	atomic_t ready;                           /* ready to start flag */
081a9d043c983f Bojan Smojver  2011-10-13  630  	atomic_t stop;                            /* ready to stop flag */
081a9d043c983f Bojan Smojver  2011-10-13  631  	int ret;                                  /* return code */
081a9d043c983f Bojan Smojver  2011-10-13  632  	wait_queue_head_t go;                     /* start compression */
081a9d043c983f Bojan Smojver  2011-10-13  633  	wait_queue_head_t done;                   /* compression done */
081a9d043c983f Bojan Smojver  2011-10-13  634  	size_t unc_len;                           /* uncompressed length */
081a9d043c983f Bojan Smojver  2011-10-13  635  	size_t cmp_len;                           /* compressed length */
31414b7c10febd Nikhil V       2024-01-22  636  	unsigned char unc[UNC_SIZE];              /* uncompressed buffer */
31414b7c10febd Nikhil V       2024-01-22  637  	unsigned char cmp[CMP_SIZE];              /* compressed buffer */
081a9d043c983f Bojan Smojver  2011-10-13  638  	unsigned char wrk[LZO1X_1_MEM_COMPRESS];  /* compression workspace */
081a9d043c983f Bojan Smojver  2011-10-13  639  };
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
