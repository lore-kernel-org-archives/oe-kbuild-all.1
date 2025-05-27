Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2461D10A1E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 02:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748314099; cv=none; b=bTZF6pNc1F8tT/fDO0BbtZsYpMg3bmk4qEcT045gAEmOO7sNJJficLuElMK/BtyyMmGctXmj4Se1b00JINy3iJXvLDh/z7Lqu0H29CZ5QTfGVf5Gd9lx9U0HCDOwToQ8TTsTFrP1wC8tH8tSmaP6k/IwMUaOAviijw8EjVvLJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748314099; c=relaxed/simple;
	bh=0ZiX44o2Oxbt5fIe3cWGIOyBy+HjjFQCwUc7ovHNU4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=su23czVqIAmsxdA2/fo0pQR/Hli77pnkqD8VcrA/UQjV87FpPxS3Y/opb8VZJqvVer8DBxvdygtttcEmKAUicy+5DklJmjxqbhA6xddLdKtRb7Y1lt9xu6bNcP+JYOvpDc7RBuPP6F94jPEu7P8haBycKG2buzSDtaDgCVn/MXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jrXSXVCX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jrXSXVCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748314098; x=1779850098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZiX44o2Oxbt5fIe3cWGIOyBy+HjjFQCwUc7ovHNU4k=;
  b=jrXSXVCX2BVUXVexrEpHvueVX/HqeXYtYEH7sZrrEY5Z/Dg21CkIarav
   IVnqjuF2wPwz3mtWxneL46qOz+qfXiiKlV8uiUDn4w4Owlgi+bAOGqUBN
   2iCUD+2DM4fzg0hFwgYDyGXqfgKo5rw8D09/4iU4Nz2zLLKqrC/ToAHVa
   Me2T0JAkEsaiZ+hG/OFttWHuRMknVNmv1ZhKHVM15DP3/jWBnukgNXGkq
   a715InGDykXO0V01K9LU6nnGZQVBTnyBArF3VdBu2RSa2uhio/19IReQB
   5QM91a0xc3i9pIzg7dQcA6gnCudbo/BdYexSYAd7zzKiV3wzsrap+hzOY
   w==;
X-CSE-ConnectionGUID: sSY3UyKiSza0BPpxj683eA==
X-CSE-MsgGUID: wEb8YydHRr2lSjmscmMrZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49988252"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="49988252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 19:48:16 -0700
X-CSE-ConnectionGUID: SBVCkv8WRhyUEVg9EdnW7w==
X-CSE-MsgGUID: BRkpWgFXRzmrCNbyNgM1mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="142577737"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 26 May 2025 19:48:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJkMO-000Sps-1k;
	Tue, 27 May 2025 02:48:12 +0000
Date: Tue, 27 May 2025 10:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/4] drivers/md/md.c:564:21-22:
 Unneeded semicolon
Message-ID: <202505271000.MjXIdIck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   9f62a273a8443aa2d97898c5c473974ec3ea77d1
commit: 2d0738a8322bf4e5bfe693d16b3111928a9ccfbf [0/4] md: fix deadlock between mddev_suspend and flush bio
config: i386-randconfig-054-20250527 (https://download.01.org/0day-ci/archive/20250527/202505271000.MjXIdIck-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505271000.MjXIdIck-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/md/md.c:564:21-22: Unneeded semicolon

vim +564 drivers/md/md.c

   532	
   533	static void md_submit_flush_data(struct work_struct *ws)
   534	{
   535		struct mddev *mddev = container_of(ws, struct mddev, flush_work);
   536		struct bio *bio = mddev->flush_bio;
   537	
   538		/*
   539		 * must reset flush_bio before calling into md_handle_request to avoid a
   540		 * deadlock, because other bios passed md_handle_request suspend check
   541		 * could wait for this and below md_handle_request could wait for those
   542		 * bios because of suspend check
   543		 */
   544		spin_lock_irq(&mddev->lock);
   545		mddev->prev_flush_start = mddev->start_flush;
   546		mddev->flush_bio = NULL;
   547		spin_unlock_irq(&mddev->lock);
   548		wake_up(&mddev->sb_wait);
   549	
   550		if (bio->bi_iter.bi_size == 0) {
   551			/* an empty barrier - all done */
   552			bio_endio(bio);
   553		} else {
   554			bio->bi_opf &= ~REQ_PREFLUSH;
   555	
   556			/*
   557			 * make_requst() will never return error here, it only
   558			 * returns error in raid5_make_request() by dm-raid.
   559			 * Since dm always splits data and flush operation into
   560			 * two separate io, io size of flush submitted by dm
   561			 * always is 0, make_request() will not be called here.
   562			 */
   563			if (WARN_ON_ONCE(!mddev->pers->make_request(mddev, bio)))
 > 564				bio_io_error(bio);;
   565		}
   566	
   567		/* The pair is percpu_ref_get() from md_flush_request() */
   568		percpu_ref_put(&mddev->active_io);
   569	}
   570	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
