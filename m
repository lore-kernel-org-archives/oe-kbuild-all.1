Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609FDAD23
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732899330; cv=none; b=WHCbcp0e0+GJbbFM4ziAhtJT1HciIzqs3bpUtpxXsSWXIo1zUn4Hww8++fcdmEpIfW8eSgXfY6cOus8TziBXTZWsrRjIFGjtCDwjpeR1L0hws4hweUhd6KnxGsqOobB0+vTh5a/jeRuUm9TKixqr6r3ca5TvYcYqRr5mD4+nAnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732899330; c=relaxed/simple;
	bh=epkuMY2Lehh3se7fGUrVG5wsQT4O8uvdswl0Pyd7vvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=acpS1KNVKxoaa9Os65JOoZkuhYJFtyOecje++oRYzPNXvnQSl/nmQjz0G5UJpsF5VqFyThuerhLb8b8X4qm9pc6RRsic6GKw/2U0IpV/utR9IQKU2RqmUuY8Y/CFJayXHKt2xDDiSoqQkyfbwjHH/kWw1l/OCplc7pzbC/jQgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVM2Ruqs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVM2Ruqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732899329; x=1764435329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=epkuMY2Lehh3se7fGUrVG5wsQT4O8uvdswl0Pyd7vvQ=;
  b=AVM2RuqsxBUcf4rcU/fpYGQFhCWsPhlChG2HSfPf6+I4Lm+zgg06/Zw/
   v+RPHlKV1epuK0yFH8DvFH8FtQaDDh+Qz70P1k8Otr7EChQLKeZHFYrVC
   1Zt/Kjzb9ijI3KSLE1WcNjzeX86CggJ5sb9dCk52nEE2+Fg2HeqWftcl0
   CUySsWmL9IsM1gWKYReR2BP4sLUVXVZDxy5MBmRvSO/rjG0UeFGmUxdbN
   J1QW/OjuFTkctt5nfi0yDxU6k8WPbt6patVPuN2Qgnjd+r0MCUFUk08wM
   T3lXraDVOaGMRL1Y7Shn+42G5vmhqSjRMomzLNB8glQCxzQWic0LtWcY0
   A==;
X-CSE-ConnectionGUID: 7zW6zjzaT+urGL9evRgSOQ==
X-CSE-MsgGUID: qzxEjz79Tnmn90rceeVN8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33069928"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="33069928"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 08:55:26 -0800
X-CSE-ConnectionGUID: 0jAg+bpBTTmh5b3gZ51LMA==
X-CSE-MsgGUID: oOgvudyyQr6PgbpCxZOGbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="123391279"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Nov 2024 08:55:25 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH4H3-0000X1-3A;
	Fri, 29 Nov 2024 16:55:21 +0000
Date: Sat, 30 Nov 2024 00:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.cz>
Subject: [jack-fs:fsnotify_hsm 15/19] mm/filemap.c:3330:13: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202411300049.rMS1Xj2H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify_hsm
head:   4f77d683c51a543a6c6dd64919ca07284a701a81
commit: dc805feb75303c526d1dece80f652c4d38998598 [15/19] fsnotify: generate pre-content permission event on page fault
config: x86_64-randconfig-123-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300049.rMS1Xj2H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300049.rMS1Xj2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300049.rMS1Xj2H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/filemap.c:3330:13: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [usertype] ret @@     got int @@
   mm/filemap.c:3330:13: sparse:     expected restricted vm_fault_t [usertype] ret
   mm/filemap.c:3330:13: sparse:     got int
   mm/filemap.c:3288:18: sparse: sparse: context imbalance in 'filemap_fault_recheck_pte_none' - unexpected unlock
   mm/filemap.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h, include/linux/dax.h):
   include/linux/rcupdate.h:878:9: sparse: sparse: context imbalance in 'filemap_map_pages' - different lock contexts for basic block

vim +3330 mm/filemap.c

  3291	
  3292	/**
  3293	 * filemap_fsnotify_fault - maybe emit a pre-content event.
  3294	 * @vmf:	struct vm_fault containing details of the fault.
  3295	 * @folio:	the folio we're faulting in.
  3296	 *
  3297	 * If we have a pre-content watch on this file we will emit an event for this
  3298	 * range.  If we return anything the fault caller should return immediately, we
  3299	 * will return VM_FAULT_RETRY if we had to emit an event, which will trigger the
  3300	 * fault again and then the fault handler will run the second time through.
  3301	 *
  3302	 * This is meant to be called with the folio that we will be filling in to make
  3303	 * sure the event is emitted for the correct range.
  3304	 *
  3305	 * Return: a bitwise-OR of %VM_FAULT_ codes, 0 if nothing happened.
  3306	 */
  3307	vm_fault_t filemap_fsnotify_fault(struct vm_fault *vmf)
  3308	{
  3309		struct file *fpin = NULL;
  3310		int mask = (vmf->flags & FAULT_FLAG_WRITE) ? MAY_WRITE : MAY_ACCESS;
  3311		loff_t pos = vmf->pgoff >> PAGE_SHIFT;
  3312		size_t count = PAGE_SIZE;
  3313		vm_fault_t ret;
  3314	
  3315		/*
  3316		 * We already did this and now we're retrying with everything locked,
  3317		 * don't emit the event and continue.
  3318		 */
  3319		if (vmf->flags & FAULT_FLAG_TRIED)
  3320			return 0;
  3321	
  3322		/* No watches, we're done. */
  3323		if (likely(!FMODE_FSNOTIFY_HSM(vmf->vma->vm_file->f_mode)))
  3324			return 0;
  3325	
  3326		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
  3327		if (!fpin)
  3328			return VM_FAULT_SIGBUS;
  3329	
> 3330		ret = fsnotify_file_area_perm(fpin, mask, &pos, count);
  3331		fput(fpin);
  3332		if (ret)
  3333			return VM_FAULT_SIGBUS;
  3334		return VM_FAULT_RETRY;
  3335	}
  3336	EXPORT_SYMBOL_GPL(filemap_fsnotify_fault);
  3337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
