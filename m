Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD6E2BEFF6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009484; cv=none; b=jlz3UwSKdmrLlMBZtjfKVRoHte/hJrz1U1n66oeecaitFwoLQBH0K1jfi3fUdEOjvcid1cNjL/TvMND5F+lZsFTrd8TL4I5TIXIO3SZQE+rzUS/OKMKIu6Xcckf+VuDQAELa9bjkAjvLxM904hYlkK5Fgc9rQ+URoVKHF5q/+cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009484; c=relaxed/simple;
	bh=bedhbayu0Z+VVPMCykCwh3LzhMV84tw9YdIzcJkfUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YA8tCWQqXfC96JoGtn6Yyp3drw+uEh0A+RcpiY2AemCpMJKFPUo1tD9+t8LWgeqCoihPGkIavUypNytW+gif6IcXP0lBFpxtBGgduH3urrR0IUw8lPgk32RdDInPBxKFnKWUm0rEQETNcK9k0+INDzRPKqwHWIe0X7xKZ5zv6Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TY0Qs1Zq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TY0Qs1Zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009482; x=1794545482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bedhbayu0Z+VVPMCykCwh3LzhMV84tw9YdIzcJkfUIo=;
  b=TY0Qs1ZqieK5n3JAzyrx/V8gs7NriFxW3KBB6O2j7rBI/72lXwui1ZCg
   lr6CPyj+TusRLa8RpaHmh5ycXX5nGLvz4NIeQvcgP/RBkPsfPiqzDXrpG
   +pezPM8233mPGZbx3I3tHWoHbeYO2dvxLmxTJtYQeY6DLmMWp9KyUR7Gh
   WenXATLrWM16n/EbLHMVsZU9HMCOczo7DtgJDk9Qi8h+XEA+O4HQMVApM
   shilU9Q4LnC0E/XvO2ulY8JxTWRnsGscR57t1kHOfDsJeL+9jSV8rIcCT
   0XDhYULwH0MYR9vl3CqWaaD9JxJlVYilB8bfxgAPjLDUtZWGQcPj2EzrW
   g==;
X-CSE-ConnectionGUID: UHzuOCiHSmKcPUa+n0DB8Q==
X-CSE-MsgGUID: mJj7Lf7yTdir+PLF3nMWuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65008589"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65008589"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:51:22 -0800
X-CSE-ConnectionGUID: bkPcej/KRQWg3aRHyGPMYg==
X-CSE-MsgGUID: 9qgWFJ+xQrCN/HV+5YQRuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="220161053"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Nov 2025 20:51:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPIl-0004tT-0I;
	Thu, 13 Nov 2025 04:51:19 +0000
Date: Thu, 13 Nov 2025 12:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:inode-time-nowait.2 11/13] fs/ubifs/file.c:1386:11: error:
 'EGAIN' undeclared; did you mean 'EAGAIN'?
Message-ID: <202511130648.YYHkcsLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git inode-time-nowait.2
head:   3ce20cca83831d5ac50d07a470dd2fe571df4086
commit: 3e99f13b5e628a98a65cb9825344547599ececac [11/13] fs: add support for non-blocking timestamp updates
config: powerpc-randconfig-r072-20251113 (https://download.01.org/0day-ci/archive/20251113/202511130648.YYHkcsLg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511130648.YYHkcsLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511130648.YYHkcsLg-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ubifs/file.c: In function 'ubifs_update_time':
>> fs/ubifs/file.c:1386:11: error: 'EGAIN' undeclared (first use in this function); did you mean 'EAGAIN'?
    1386 |   return -EGAIN;
         |           ^~~~~
         |           EAGAIN
   fs/ubifs/file.c:1386:11: note: each undeclared identifier is reported only once for each function it appears in


vim +1386 fs/ubifs/file.c

  1363	
  1364	/**
  1365	 * ubifs_update_time - update time of inode.
  1366	 * @inode: inode to update
  1367	 * @flags: time updating control flag determines updating
  1368	 *	    which time fields of @inode
  1369	 *
  1370	 * This function updates time of the inode.
  1371	 *
  1372	 * Returns: %0 for success or a negative error code otherwise.
  1373	 */
  1374	int ubifs_update_time(struct inode *inode, int flags)
  1375	{
  1376		struct ubifs_inode *ui = ubifs_inode(inode);
  1377		struct ubifs_info *c = inode->i_sb->s_fs_info;
  1378		struct ubifs_budget_req req = { .dirtied_ino = 1,
  1379				.dirtied_ino_d = ALIGN(ui->data_len, 8) };
  1380		int err, release;
  1381	
  1382		if (!IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
  1383			return generic_update_time(inode, flags);
  1384	
  1385		if (flags & S_NOWAIT)
> 1386			return -EGAIN;
  1387	
  1388		err = ubifs_budget_space(c, &req);
  1389		if (err)
  1390			return err;
  1391	
  1392		mutex_lock(&ui->ui_mutex);
  1393		inode_update_timestamps(inode, flags);
  1394		release = ui->dirty;
  1395		__mark_inode_dirty(inode, I_DIRTY_SYNC);
  1396		mutex_unlock(&ui->ui_mutex);
  1397		if (release)
  1398			ubifs_release_budget(c, &req);
  1399		return 0;
  1400	}
  1401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
