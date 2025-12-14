Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05071DE4E1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 19:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765740945; cv=none; b=jkf5udc/Zmq14KDipdLF0NIhoovNV6Zoq3WyPeJ6xUYiGuYV3adPwFXP7mHMAUcWZeN6TlpuNQy/14hZvanYhTnqHwtNu/el+0vi3gmSyktB13Ao9GegchYMBYa48sqDRTdrk9SXXf7u3I6vg9y59nzChIs2mOWrM30gm/h022I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765740945; c=relaxed/simple;
	bh=AguTOqhGTBZt/VpvUNWLPumlhCdC9dnevYbOgmS5eZk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lAIDEFJLgks2YgeGDCw2WbEEB5+pyaeQ4lkx4tSqwhHTTFB+CG4PRNlwG/IyPM4/sVQMUDV3n3MXCa5jSVRGfJM0LhRUas/lJCZkFf6m4EEs4CqElGNXmAFaWY4Pi2kQF3Ww2jtIUIMSrpvFRBxz3T8gdr6nwZTMaRj3O3rbFVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g5Xw5Q42; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g5Xw5Q42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765740942; x=1797276942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AguTOqhGTBZt/VpvUNWLPumlhCdC9dnevYbOgmS5eZk=;
  b=g5Xw5Q42Ge/KHzYmBLjgEi0qKQluBQITAe7s0pOYe6KqvmixAQM6r6Vz
   Dr1jlwW4g9P9c92bhp/UytkefUyy99Y+cX3KcGx7dtWAPGYxmp3UTfGgA
   8IYZNKgmlznk/layuvNJJC3vRQUZWkOrpNjhXfvDIy2mQM67DUuexo13X
   5l/L81Dm6tGAfov5XbPnN+FS9Ar4ko9cOsirRWuuhwg5wUAX+EkqQXw9N
   aqwvGdf2pu+5BkIKXNUfauAp7mdfAUabfeVCXyCSqJIoudCzHN9L7V3zv
   NSWXHa7laRm4dsJzlE2pRkF6PunzG5Yp83iEI06gz7cWk0e7Sp8UjW40i
   g==;
X-CSE-ConnectionGUID: hXRiH02qTYSPlU/hl4cPXg==
X-CSE-MsgGUID: tN0jiNU+S02jeCU590Qm2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67691487"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="67691487"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 11:35:41 -0800
X-CSE-ConnectionGUID: TbPzUY/5QjWmzmGHgPVShQ==
X-CSE-MsgGUID: yhE57HgfRcKo+znXr98MKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="228621682"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Dec 2025 11:35:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUrsY-000000009Jh-0OYj;
	Sun, 14 Dec 2025 19:35:38 +0000
Date: Mon, 15 Dec 2025 03:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/40] io_uring/io_uring.c:498:57:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202512150356.hEoEJed0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: ff46a46b7a30dd59513d7f33dfdd06553843b11d [0/40] io_uring: pass in EPOLL_URING_WAKE for eventfd signaling and wakeups
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251215/202512150356.hEoEJed0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150356.hEoEJed0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150356.hEoEJed0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/io_uring.c: note: in included file (through io_uring/io_uring.h):
   io_uring/slist.h:138:29: sparse: sparse: no newline at end of file
   io_uring/io_uring.c: note: in included file (through include/trace/events/io_uring.h):
   include/linux/io_uring_types.h:151:37: sparse: sparse: array of flexible structures
>> io_uring/io_uring.c:498:57: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int mask @@     got restricted __poll_t [usertype] @@
   io_uring/io_uring.c:498:57: sparse:     expected unsigned int mask
   io_uring/io_uring.c:498:57: sparse:     got restricted __poll_t [usertype]
   io_uring/io_uring.c:534:57: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int mask @@     got restricted __poll_t [usertype] @@
   io_uring/io_uring.c:534:57: sparse:     expected unsigned int mask
   io_uring/io_uring.c:534:57: sparse:     got restricted __poll_t [usertype]
   io_uring/io_uring.c:598:6: sparse: sparse: context imbalance in 'io_cq_unlock_post' - unexpected unlock
   io_uring/io_uring.c:604:13: sparse: sparse: context imbalance in '__io_cqring_overflow_flush' - wrong count at exit
   io_uring/io_uring.c:814:6: sparse: sparse: context imbalance in 'io_post_aux_cqe' - wrong count at exit
   io_uring/io_uring.c:864:6: sparse: sparse: context imbalance in 'io_req_complete_post' - wrong count at exit
   io_uring/io_uring.c:982:13: sparse: sparse: context imbalance in '__io_req_find_next_prep' - wrong count at exit

vim +498 io_uring/io_uring.c

   490	
   491	
   492	static void io_eventfd_ops(struct rcu_head *rcu)
   493	{
   494		struct io_ev_fd *ev_fd = container_of(rcu, struct io_ev_fd, rcu);
   495		int ops = atomic_xchg(&ev_fd->ops, 0);
   496	
   497		if (ops & BIT(IO_EVENTFD_OP_SIGNAL_BIT))
 > 498			eventfd_signal_mask(ev_fd->cq_ev_fd, 1, EPOLL_URING_WAKE);
   499	
   500		/* IO_EVENTFD_OP_FREE_BIT may not be set here depending on callback
   501		 * ordering in a race but if references are 0 we know we have to free
   502		 * it regardless.
   503		 */
   504		if (atomic_dec_and_test(&ev_fd->refs)) {
   505			eventfd_ctx_put(ev_fd->cq_ev_fd);
   506			kfree(ev_fd);
   507		}
   508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
