Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B917226D1E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477502; cv=none; b=jeFsZEZoq/TY4ZDKTShFIaUYpTQ1FNSENW1x9wgdiVa0TcSVqd3ICrXuY5XXb9Qz7OUOBCWH7VMlBAjkdt9nWW7H9kdZvB7PxOLfDZmtmDsl9wQ74i8N4jk+WlIY7IaYzASxAvW/Tn0VcbLzVI8LY3d7kyGTgY3nvCp6Mr/xAqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477502; c=relaxed/simple;
	bh=GP+oIlrdl5GC1ixnceQjSKMiqCJkIxbELw/xB9pgeGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWaB7pyC9SA6YraGHG+UXKSIM55HRvkBbKX/FConFOgLpjDMIjiMAUODaVqG1gjJSG0WV1B5vuZzwm+PfBubA/0PCqmmOI/9meSJJ+8RjM9e7FCYXLlSdFrUshkPSSj+gkRKLhgpfCmfjtOHu998fT9oYU8BxNXi23YWBtKyvpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knmLUw3u; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knmLUw3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763477501; x=1795013501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GP+oIlrdl5GC1ixnceQjSKMiqCJkIxbELw/xB9pgeGU=;
  b=knmLUw3uzxaLlo/JxGFX1odwaG14cRZO2TAiIkBAL7dTv+TvcvODX+ET
   2/ThEwtqLScY0017r9ua0UQl0B06rzgXy2GyKrNmFsmGxPnIbvARDePCS
   3GMP4ERnod6ltXfQ3onQIKlg8AnEwKzXII7V2p2R5lHnMroejUgf5wMhK
   TdOOp73nJWtMyXXJJZIn8SevOSLyuBuZeXaDxA1C61aYEFWrB5qYIpGl3
   CbcZMPrE/YFddZoshJ6vAjkhyL4Nr4XWyVcKJLgadddsKs20HR+uTEUaI
   W1OZdT2uhe0znCTzfXu+JDCqHL6jB+HraLxi8EUIJ8kQoOUnCkiAR75Ca
   g==;
X-CSE-ConnectionGUID: 6VlXnsvJQ+err3N7RbIOQQ==
X-CSE-MsgGUID: FVNTQlMkRFqm1wBg/Rgwvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="64700117"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="64700117"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 06:51:40 -0800
X-CSE-ConnectionGUID: diaN9H0ATySpoFqYV16PZw==
X-CSE-MsgGUID: MPZqoCWSRY6BBE2CboPp1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190584356"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Nov 2025 06:51:38 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLN3Q-0001qp-2r;
	Tue, 18 Nov 2025 14:51:36 +0000
Date: Tue, 18 Nov 2025 22:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3214/3214] block/blk-ioinf.c:530:41: error: array
 type has incomplete element type 'struct blk_mq_debugfs_attr'
Message-ID: <202511182212.yHIyxmau-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b4a3c05741e1650e8bb8399196fb5d7a318a4698
commit: 4192ef0b07762c6dabf617654df442fecffe8510 [3214/3214] blk-ioinf: add rqos/inflight/stat debufs interface
config: x86_64-randconfig-r111-20251118 (https://download.01.org/0day-ci/archive/20251118/202511182212.yHIyxmau-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511182212.yHIyxmau-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511182212.yHIyxmau-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   block/blk-ioinf.c:248:6: warning: no previous prototype for 'ioinf_done' [-Wmissing-prototypes]
     248 | void ioinf_done(struct ioinf *inf, struct ioinf_rq_wait *rqw)
         |      ^~~~~~~~~~
>> block/blk-ioinf.c:530:41: error: array type has incomplete element type 'struct blk_mq_debugfs_attr'
     530 | static const struct blk_mq_debugfs_attr ioinf_debugfs_attrs[] = {
         |                                         ^~~~~~~~~~~~~~~~~~~
   block/blk-ioinf.c:547:5: warning: no previous prototype for 'ioinf_calc_budget' [-Wmissing-prototypes]
     547 | u32 ioinf_calc_budget(struct ioinf_rq_wait *rqw)
         |     ^~~~~~~~~~~~~~~~~
>> block/blk-ioinf.c:530:41: warning: 'ioinf_debugfs_attrs' defined but not used [-Wunused-variable]
     530 | static const struct blk_mq_debugfs_attr ioinf_debugfs_attrs[] = {
         |                                         ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +530 block/blk-ioinf.c

   529	
 > 530	static const struct blk_mq_debugfs_attr ioinf_debugfs_attrs[] = {
   531		{"stat", 0400, ioinf_stat_show},
   532		{},
   533	};
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
