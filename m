Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E493B8D7D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765724958; cv=none; b=XoAr+VZTJjQ+vzJ+0nEkI7hmO942uCIpNldAloWZuiWxZfcpAznDxsFLo+UJWOGdBqUvW/6/wiIb2A5wkNeuPC17h9SKM/Dq97i9+5XS8I1S1QQmVcbtNnyo99gy8SmTa3mJfgu05eiG2YiIsmHMuBE9kYEY/UCx27MPTK4Uc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765724958; c=relaxed/simple;
	bh=minqzP1vZUTbLvNiYtPOqvIPIfupAy6iXkuYimMRQMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqbLuAUA3okzHKcVHdmIyLGF+J2wDaN6BDCtjdYTvqwznFXfl7/5NrFgrWc9v30EPkkMSFja/aBIRUbZoHaDr4iq3pZDKlMVEHHeGNdEFu08qQtVzCCKOjZycryy1GJcrPV+seIhn37e08tccvmT8XmTaS1hB9Ni3+HWkqR9hQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXvgS/Ln; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXvgS/Ln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765724956; x=1797260956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=minqzP1vZUTbLvNiYtPOqvIPIfupAy6iXkuYimMRQMs=;
  b=DXvgS/LnmX1k1BY1JgshDnTaG5pzKGnEIXAR2S/wwOAVlohPBcTmqcyM
   wOHAcb6zSh42BS4r6aMDpX6Y87m7oPr4sz1vrPRZg16S1yvXPGnPGcEpZ
   i+mbs2je3ITd/rV3UmvAFa80qAvgQz4KL48F2uAxFjqRAhIs49zJ5rUZ3
   ikfomS0y4rm0wfR1wXia/pu7/P5InHaQeErbzDCMYxMcQybl+0yNds7lq
   rC0rOo+3yendg4ftM2dcq1NXvYMyYKq5Csfzq9Jq+hS+aULCn3krkhah7
   F5DZd05BxUofg+e7U0FjIeTQ/dcS02RxcVgOVwRLUiA2M8prrUdl69Zlp
   w==;
X-CSE-ConnectionGUID: zHdDF+nMRfyDxh/FMI3kxQ==
X-CSE-MsgGUID: 1+F72r3qQS61RzMAHDuVJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="71274387"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="71274387"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 07:09:16 -0800
X-CSE-ConnectionGUID: gn1qLYaKQ5yBOdge0i4Qaw==
X-CSE-MsgGUID: VTBapZimTSOqNXwj0u220w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="202622784"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Dec 2025 07:09:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUnii-0000000096X-3ZHy;
	Sun, 14 Dec 2025 15:09:12 +0000
Date: Sun, 14 Dec 2025 23:08:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/40] io_uring/io_uring.c:498:57:
 sparse: sparse: incorrect type in argument 3 (different base types)
Message-ID: <202512142216.r69mmy0e-lkp@intel.com>
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
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251214/202512142216.r69mmy0e-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512142216.r69mmy0e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512142216.r69mmy0e-lkp@intel.com/

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
