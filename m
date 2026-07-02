Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723122E718F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 03:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782962353; cv=none; b=fL9EM+lfhMzn/kEVte0KMGKDE/gssJWDCAcPoIdur9Lzoe2FQixKOZRKcgi1T74tBTGSrsIXJoYIgwDSdmUQc+48ju4LNxdraZfdeNdg8Wip82JPppiqe5ZQMgHRPMxyWi20xVwukWkRG0EoCxo5ldmvVtxWiTiHcSH2K1XIo/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782962353; c=relaxed/simple;
	bh=n1Rk1oypQ2cnrcLJ44HvShEOS09x2AbEWlVUP7osiMA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l6TuAhuYK65w8Bow7BDJEMuBYQhYiQvtmkIBQVjOdBnwwsrBxp1Yh8Ui9AmkaGuhzpMLG9I4lfIdPv4OzV2b4axlM4G3WPKHu7AwIgIfpz2cpHm7UCx6ssVXpwy0gBiDZaYk0XOx3G86eoI+lu8IkKY1/QMVMPLuObY7Z+zJBvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVidC7dR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVidC7dR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782962352; x=1814498352;
  h=date:from:to:cc:subject:message-id;
  bh=n1Rk1oypQ2cnrcLJ44HvShEOS09x2AbEWlVUP7osiMA=;
  b=jVidC7dRw6HbTaxbBFp6HpqT6ri/0h5hUBKM8E6GC6SemxoU4g8nAO08
   GWg08t7CucOWuC+UBAnLLhz6JY0kh9miPfdW+Vcfj7hSz8qQzYdcHesBb
   p4oGE+cI9Sz4DfKDaEWdoOTjiq+Zv4PKzodTQaOjCWIR1er9tMgFpQyAL
   APROpOSGHemhRL15O6IwK7EOy/AJRjl3PmPqkWXqBYx5gCTvfBgh0iWuR
   cV3iuCkGwtVazA9QS/3U8AFJBfODLPG5rnzvB3MosOodGgHXRo3yyaZRl
   zyoYZ60Mg+xsv0HAhY9/k/4tJdVVF+06Tzvo+H2oay+y8omaHyD2ty5j/
   g==;
X-CSE-ConnectionGUID: 5NlLs6QRQ3isMtCwbI5dWw==
X-CSE-MsgGUID: HUuREDw7Qd6dWWb0k6tE0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="94860542"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="94860542"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:19:12 -0700
X-CSE-ConnectionGUID: 4tywjbTWTTKBLZVvnEZ/PA==
X-CSE-MsgGUID: ffdvy13jSGyO7gaN9ExYMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="277050682"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 01 Jul 2026 20:19:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf7xE-000000009w1-1zui;
	Thu, 02 Jul 2026 03:19:08 +0000
Date: Thu, 02 Jul 2026 11:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] fs/fs-writeback.c:138:6:
 warning: no previous prototype for 'wb_wakeup'
Message-ID: <202607021123.hgAEHA4i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bo,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   030ed2af4ba8ba50d5f3cbbc704bc93df568d84e
commit: 55cf94258af72fd493779ab2b7a4278d5c8d1d21 [0/1] ANDROID: writeback: export symbols to do a hierarchical writeback control
config: x86_64-randconfig-006-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021123.hgAEHA4i-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021123.hgAEHA4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021123.hgAEHA4i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fs-writeback.c:138:6: warning: no previous prototype for 'wb_wakeup' [-Wmissing-prototypes]
     138 | void wb_wakeup(struct bdi_writeback *wb)
         |      ^~~~~~~~~
>> fs/fs-writeback.c:1349:6: warning: no previous prototype for 'redirty_tail_locked' [-Wmissing-prototypes]
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         |      ^~~~~~~~~~~~~~~~~~~


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
