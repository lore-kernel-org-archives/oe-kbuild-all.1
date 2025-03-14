Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546BA5223
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 02:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741920453; cv=none; b=p93z5dM+BOeJPMu5KDEuKzd/CuQUkCBH4tlGTZq8nnhoqhxlfl45yprfbjL9mrSjAQY4lt+dlqo985qT+ozSpntVuekno5rihLGdWqS8eTIBXsJPk3oIi/aaB5BcCz0lSU3/Pm8IdHO+ZxAXo3pU7ucZ5uoWiacgtbi3rK36xEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741920453; c=relaxed/simple;
	bh=VDxRePHNKzeZPTVE2DTaokNrP1a/uWrDhLYMVG/8vuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XzvQEcOTz0N/6hQ9u8YJdxFR4xG4+kKVtvModDNw3H6uyB4blYlFXXyuqBiAdIVX9QeLC8irOtBcLnR7YO/KjMfHr4s8cfYZM//Wk6SNKnE8dnQk5q+RpngK8J5UExeycDWh6K4cGr7xkFCkmR7SW+Jo/6/7I3io0Yjiu0F0g4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6YtbXK6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6YtbXK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741920451; x=1773456451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VDxRePHNKzeZPTVE2DTaokNrP1a/uWrDhLYMVG/8vuc=;
  b=N6YtbXK65h35Foc/6l7ZAXT3rd0WDfXGvjhq1b6Bv5magfM31qb/zoDF
   s7AGOV02v/mL0iGWAA7qEpDL7LzVvF4RUPFu5Z1UDbJ1u8PVWwqQGuxq8
   u32h5xUZY8XpSBNuc9rD1ONOeB/aU4OXypMfDw4SkS/JNYNuQlX53fzQd
   lrXjQFgq6khj7Bmk2g1WNiAzpUN+bosOfZynYEQ6Mgo9YU+j6GZlyw8D4
   h9EWloJHL+9ggGAJPzooA3QUWnGybir2IjfGDuJxoDkj50PrJRu9fQoSQ
   O4GrGzL1f1Ctpjw9ucPiI7Gq2L/bRRtM15muorEuwVICjSCugyY5MdJpW
   Q==;
X-CSE-ConnectionGUID: AsTQpU6FQhmkkEE+adGyLg==
X-CSE-MsgGUID: JgH8gB9iTEy4NSUCrmXjEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53701209"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="53701209"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 19:47:30 -0700
X-CSE-ConnectionGUID: miV86RwWR1eZNcL6NIMsMA==
X-CSE-MsgGUID: kG24nNYyS7K9+xIHrDAKGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121094490"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Mar 2025 19:47:29 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsv55-000A5E-16;
	Fri, 14 Mar 2025 02:47:27 +0000
Date: Fri, 14 Mar 2025 10:46:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 3/3] fs/fs-writeback.c:138:6:
 warning: no previous prototype for function 'wb_wakeup'
Message-ID: <202503141058.rXAD8cSK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   ca5266bc32d9bcf538401ef062b30e072e28c88a
commit: 55cf94258af72fd493779ab2b7a4278d5c8d1d21 [3/3] ANDROID: writeback: export symbols to do a hierarchical writeback control
config: arm-randconfig-001-20250314 (https://download.01.org/0day-ci/archive/20250314/202503141058.rXAD8cSK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503141058.rXAD8cSK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503141058.rXAD8cSK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs-writeback.c:138:6: warning: no previous prototype for function 'wb_wakeup' [-Wmissing-prototypes]
     138 | void wb_wakeup(struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:138:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     138 | void wb_wakeup(struct bdi_writeback *wb)
         | ^
         | static 
>> fs/fs-writeback.c:1349:6: warning: no previous prototype for function 'redirty_tail_locked' [-Wmissing-prototypes]
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:1349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         | ^
         | static 
   2 warnings generated.


vim +/wb_wakeup +138 fs/fs-writeback.c

   137	
 > 138	void wb_wakeup(struct bdi_writeback *wb)
   139	{
   140		spin_lock_irq(&wb->work_lock);
   141		if (test_bit(WB_registered, &wb->state))
   142			mod_delayed_work(bdi_wq, &wb->dwork, 0);
   143		spin_unlock_irq(&wb->work_lock);
   144	}
   145	EXPORT_SYMBOL_GPL(wb_wakeup);
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
