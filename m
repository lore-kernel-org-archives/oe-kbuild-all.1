Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3EF440C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 13:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735047313; cv=none; b=hWaJhK+YrJIpZS7kU/hOk/WYrOvUt42Y8IU9ELx0kjXwVi0AeFydEfMwlyQ7Ervih4LfoM6VC0FsCzHdXaP3WdjVbKgICktv8bENXPUJbfw9VGXPj7vxoue2kZ7oIrvV6ZhIZ64zVXaORKPouxLKNH1vfmaEmK1CkxVrtNnTI7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735047313; c=relaxed/simple;
	bh=YjkMTxFCd1SLbh27JxMvpJYT/MVv4teXQpXRT1wdN7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uTfi78LhmCWPvbKwpTgvMlsYCFRMbqV5LH4buFEOp44vSSjpF3rWdFB0Y30CSK8nOY6kENbknVUua7YeERwTAj+k3OO5oqxqTYIBgqiZsAL841nwEsytRae/LhK9fg2xZ5XqukWJCmY0IXKdWlpPyIQwuH+hDf8EhvjQsu36604=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYUCo6jz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYUCo6jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735047311; x=1766583311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjkMTxFCd1SLbh27JxMvpJYT/MVv4teXQpXRT1wdN7k=;
  b=mYUCo6jzzhD5orFzIKhws+/NP2xZg+0FXb1giKBwGkPSg/OEhRbOM7fF
   G9Yid8PPRzBmF0UxIgqxHl7cJm6qL8hMOCGct2ZnsQWRVHqsqMejtq0e3
   fXugj2eduYYWl98833Nkz1XQImSAbYvWh105g57V+j8P4qgIzgSqSO0Yg
   ZGXyD+AVvFd3hbMNkIwlln9bE3sVKWeRXAHgi2h/zij2NddRVtc8z+xJw
   Nu+q890kbbuF/bwI+h1zBElxSzeDJNPnZjorh+1A1LYPiWnBT5h59jjHj
   IypkdLjY+a81HGXkKmIfDs6RfhpXIGin6PazOE8ZupKxQechdfz+y4yQM
   Q==;
X-CSE-ConnectionGUID: 00vCAppBRz2EAiWVtUDBbw==
X-CSE-MsgGUID: YWvTxI9wQG2Nko8aBTb7yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35655740"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="35655740"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 05:35:11 -0800
X-CSE-ConnectionGUID: n+iYHbDYTOGf3I06ICp3OA==
X-CSE-MsgGUID: X+VjRmMiRx2e8jzXf79Www==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122763988"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Dec 2024 05:35:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ53z-0001AN-1u;
	Tue, 24 Dec 2024 13:35:07 +0000
Date: Tue, 24 Dec 2024 21:34:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 197/197] drivers/md/dm-user.c:364
 bio_flags_to_user_flags() warn: unsigned 'out' is never less than zero.
Message-ID: <202412242101.KnyNZ87y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   1e9745a1ca80aa1eaa5db90d17ed4dbbf6ef1bbb
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [197/197] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: i386-randconfig-141-20241219 (https://download.01.org/0day-ci/archive/20241224/202412242101.KnyNZ87y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412242101.KnyNZ87y-lkp@intel.com/

smatch warnings:
drivers/md/dm-user.c:364 bio_flags_to_user_flags() warn: unsigned 'out' is never less than zero.

vim +/out +364 drivers/md/dm-user.c

   279	
   280	static inline long bio_flags_to_user_flags(struct bio *bio)
   281	{
   282		u64 out = 0;
   283		typeof(bio->bi_opf) opf = bio->bi_opf & ~REQ_OP_MASK;
   284	
   285		if (opf & REQ_FAILFAST_DEV) {
   286			opf &= ~REQ_FAILFAST_DEV;
   287			out |= DM_USER_REQ_MAP_FLAG_FAILFAST_DEV;
   288		}
   289	
   290		if (opf & REQ_FAILFAST_TRANSPORT) {
   291			opf &= ~REQ_FAILFAST_TRANSPORT;
   292			out |= DM_USER_REQ_MAP_FLAG_FAILFAST_TRANSPORT;
   293		}
   294	
   295		if (opf & REQ_FAILFAST_DRIVER) {
   296			opf &= ~REQ_FAILFAST_DRIVER;
   297			out |= DM_USER_REQ_MAP_FLAG_FAILFAST_DRIVER;
   298		}
   299	
   300		if (opf & REQ_SYNC) {
   301			opf &= ~REQ_SYNC;
   302			out |= DM_USER_REQ_MAP_FLAG_SYNC;
   303		}
   304	
   305		if (opf & REQ_META) {
   306			opf &= ~REQ_META;
   307			out |= DM_USER_REQ_MAP_FLAG_META;
   308		}
   309	
   310		if (opf & REQ_PRIO) {
   311			opf &= ~REQ_PRIO;
   312			out |= DM_USER_REQ_MAP_FLAG_PRIO;
   313		}
   314	
   315		if (opf & REQ_NOMERGE) {
   316			opf &= ~REQ_NOMERGE;
   317			out |= DM_USER_REQ_MAP_FLAG_NOMERGE;
   318		}
   319	
   320		if (opf & REQ_IDLE) {
   321			opf &= ~REQ_IDLE;
   322			out |= DM_USER_REQ_MAP_FLAG_IDLE;
   323		}
   324	
   325		if (opf & REQ_INTEGRITY) {
   326			opf &= ~REQ_INTEGRITY;
   327			out |= DM_USER_REQ_MAP_FLAG_INTEGRITY;
   328		}
   329	
   330		if (opf & REQ_FUA) {
   331			opf &= ~REQ_FUA;
   332			out |= DM_USER_REQ_MAP_FLAG_FUA;
   333		}
   334	
   335		if (opf & REQ_PREFLUSH) {
   336			opf &= ~REQ_PREFLUSH;
   337			out |= DM_USER_REQ_MAP_FLAG_PREFLUSH;
   338		}
   339	
   340		if (opf & REQ_RAHEAD) {
   341			opf &= ~REQ_RAHEAD;
   342			out |= DM_USER_REQ_MAP_FLAG_RAHEAD;
   343		}
   344	
   345		if (opf & REQ_BACKGROUND) {
   346			opf &= ~REQ_BACKGROUND;
   347			out |= DM_USER_REQ_MAP_FLAG_BACKGROUND;
   348		}
   349	
   350		if (opf & REQ_NOWAIT) {
   351			opf &= ~REQ_NOWAIT;
   352			out |= DM_USER_REQ_MAP_FLAG_NOWAIT;
   353		}
   354	
   355		if (opf & REQ_NOUNMAP) {
   356			opf &= ~REQ_NOUNMAP;
   357			out |= DM_USER_REQ_MAP_FLAG_NOUNMAP;
   358		}
   359	
   360		if (unlikely(opf)) {
   361			pr_warn("unsupported BIO type %x\n", opf);
   362			return -EOPNOTSUPP;
   363		}
 > 364		WARN_ON(out < 0);
   365		return out;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
