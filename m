Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5E722615
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 02:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734316465; cv=none; b=NFVR1VxfxMy5jagyGIWci+0AzqOtCwrgwpmOQ9TwMTYhx9PzflRNMht31qHKr8+8XZz2pmt2/GRMNbKfoivv86CCbVb5MiTuuexLQwt90WhuwUHa8sltSShIduJ+czFicypUwsptXUFOd7GVvbtH79Y/7GiJZFNvyktNN5/0K4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734316465; c=relaxed/simple;
	bh=O/LLMBIZ9Ohoijf22tdwCpmWtyUYQ+ots6I25jTg3Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bk/oH1zZYxKUfwJ98AK/zAeHTWEAodKFi1KqOJbqwOsKX9mkFOb8EhRz8Vi7XffV8cKPZk1u+ZID6qYO1sukFCq6XQM3AeXrH1yBXY1FVub59OJijzkNGHgoj9Amzjtt/NE5DXmZ2g0HgK2M+JprgzS+r3FIbxUiO1ddiEvN3Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMSPGR0x; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMSPGR0x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734316462; x=1765852462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O/LLMBIZ9Ohoijf22tdwCpmWtyUYQ+ots6I25jTg3Lk=;
  b=DMSPGR0x2u6gXAjhYPFrcIErUO0Hj+IFpKKcYFOWsb3dBBaDOlnTJEMF
   puDoWlcoLEBo40KR+/IR91dwHRWutizFM7anB0B8TlU3RVRDpNU5rSKU2
   N8CcZwPK+ZKg+Uh9+uyjsDW1CPDU0FZ5sJCRNz/UPmfOiW+zzauZuAykf
   /eoWcdg/OlWAs5xZfTv0zvPMz4zdH1GQ55hiQ9z8P9P9KP8qZ018k4UAG
   qY1521XLHw+NJqT5fnS9t8bl/+koPGBXGSlsQx7X0cztOm7USDJ8Qtsyg
   Ib+wfn/btoBuP5eEA7WiiP2ggShb5D4wYme8oW6R1kRia1kLGdviMVvFb
   g==;
X-CSE-ConnectionGUID: IMdYaClQRQef2+5wh9eFow==
X-CSE-MsgGUID: mM3gd3BqQR2QIVNkhM9xmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="37539203"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="37539203"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 18:34:21 -0800
X-CSE-ConnectionGUID: YFz1vxA+QvyrNCZ0vRD2VQ==
X-CSE-MsgGUID: Rx3M4cWwS6KyX7MFddf56g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="102091533"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Dec 2024 18:34:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tN0w4-000Dx4-38;
	Mon, 16 Dec 2024 02:34:16 +0000
Date: Mon, 16 Dec 2024 10:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yunseong Kim <yskelg@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Steve French <stfrench@microsoft.com>
Subject: fs/smb/server/server.c:283:5-24: WARNING: atomic_dec_and_test
 variation before object free at line 284.
Message-ID: <202412161024.LgGt4s2G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
commit: 9a8c5d89d327ff58e9b2517f8a6afb4181d32c6e ksmbd: fix use-after-free in SMB request handling
date:   3 weeks ago
config: parisc-randconfig-r053-20241215 (https://download.01.org/0day-ci/archive/20241216/202412161024.LgGt4s2G-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412161024.LgGt4s2G-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/server/server.c:283:5-24: WARNING: atomic_dec_and_test variation before object free at line 284.

vim +283 fs/smb/server/server.c

   255	
   256	/**
   257	 * handle_ksmbd_work() - process pending smb work requests
   258	 * @wk:	smb work containing request command buffer
   259	 *
   260	 * called by kworker threads to processing remaining smb work requests
   261	 */
   262	static void handle_ksmbd_work(struct work_struct *wk)
   263	{
   264		struct ksmbd_work *work = container_of(wk, struct ksmbd_work, work);
   265		struct ksmbd_conn *conn = work->conn;
   266	
   267		atomic64_inc(&conn->stats.request_served);
   268	
   269		__handle_ksmbd_work(work, conn);
   270	
   271		ksmbd_conn_try_dequeue_request(work);
   272		ksmbd_free_work_struct(work);
   273		atomic_dec(&conn->mux_smb_requests);
   274		/*
   275		 * Checking waitqueue to dropping pending requests on
   276		 * disconnection. waitqueue_active is safe because it
   277		 * uses atomic operation for condition.
   278		 */
   279		atomic_inc(&conn->refcnt);
   280		if (!atomic_dec_return(&conn->r_count) && waitqueue_active(&conn->r_count_q))
   281			wake_up(&conn->r_count_q);
   282	
 > 283		if (atomic_dec_and_test(&conn->refcnt))
 > 284			kfree(conn);
   285	}
   286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
