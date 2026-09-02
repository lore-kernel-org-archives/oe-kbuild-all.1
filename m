Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42411A9F90
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 00:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788307972; cv=none; b=K3KLYAIlLb0c+FnN4Vo/8dh2VdmXhcHRA7S5qlAgBhgtOBYxYrLISHzfnTjgpbUSzRZKKJBX3oAx3XtpbgmHeS1ofSJwppnihraaasT5OR3pN/8KvwrF++LzIheEp9zbnto4OFVJg0XALrKLkjSFPpMGU5+NbFMjS0DrRUziFLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788307972; c=relaxed/simple;
	bh=CimM18uX4qh/baejDBPM5y/KUAYREZwfec6thpykWFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hnnAmgN2BfdlSSCNLAYZfcjYsRP0HFLSJLQzfgyK99vA6diyCkBYrr7Dqo5kAf98JPedXl0qyKlCm9THVSZftsLaeWVHrEOugtoTWw+toqSmKQJElwulln5TlSGG7LCcPTXF6E0o7KB1F+nryMlvYaS6SUdk1M2qSee7wG2yD1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj9xHg4R; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj9xHg4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788307970; x=1819843970;
  h=date:from:to:cc:subject:message-id;
  bh=CimM18uX4qh/baejDBPM5y/KUAYREZwfec6thpykWFA=;
  b=Fj9xHg4RUbLxkdyzit/izIaaS6f1oSrb7RA1ueLXkZ313vt/r73vSaTG
   i+n0q1xwSRTmO3BbSSzQmxHxOKoi+kJb4U30xWMzZQX/YUPm0oCLpyWdl
   l/M4q0GOtdJ6G4RVlOlIFPvxuaO7SxPUadCyHB7F3gwFRYFjHWivpPOfX
   7xrgbkG1+qhGemrscrDXp3ppyKlUUpyRQGi0wd/7bREuFRSAOWA5Zt5KI
   q25FwyJ1gdl3s+TYOR7fZd1qSbS7wHO+ztpKqk2B177oWxUUysfR0C3D8
   tTiXDO1RecJuEjCBsgT8EQ3UG+OEFz6nQG7OP1/9v2bphc4kTAYFHmuTS
   w==;
X-CSE-ConnectionGUID: TdEJPWg1TzedJmOhedWLbA==
X-CSE-MsgGUID: x/99CyZcQAe2aclbVypdnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88634694"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="88634694"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 17:12:49 -0700
X-CSE-ConnectionGUID: L9WNN7sXRgaCW8DrUPqk2A==
X-CSE-MsgGUID: CxEQq1M6Rr6Y8/NnDi3jVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="292768018"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Sep 2026 17:12:47 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1Yar-000000001fe-0qQF;
	Wed, 02 Sep 2026 00:12:45 +0000
Date: Wed, 02 Sep 2026 08:12:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-rt-flush-fix 3/3] fs/xfs/xfs_log.c:1562:17:
 sparse: sparse: cast from restricted blk_status_t
Message-ID: <202609020822.1RPDKsZq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs xfs-rt-flush-fix
head:   975adfe299516fcbebccd1db4abc0fe48db8d355
commit: a47cbb38387feb0268f1b79e699dfa16aa1235e7 [3/3] xfs: flush multiple device caches in parallel
config: parisc-randconfig-r132-20260902 (https://download.01.org/0day-ci/archive/20260902/202609020822.1RPDKsZq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609020822.1RPDKsZq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609020822.1RPDKsZq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_log.c:1562:17: sparse: sparse: cast from restricted blk_status_t
>> fs/xfs/xfs_log.c:1562:17: sparse: sparse: cast from restricted blk_status_t
>> fs/xfs/xfs_log.c:1562:17: sparse: sparse: cast to restricted blk_status_t

vim +1562 fs/xfs/xfs_log.c

  1554	
  1555	static void
  1556	xlog_flush_end_io(
  1557		struct bio		*bio)
  1558	{
  1559		struct xlog_flush_done	*done = bio->bi_private;
  1560	
  1561		if (bio->bi_status)
> 1562			cmpxchg(&done->status, 0, bio->bi_status);
  1563		xlog_flush_done(done);
  1564		bio_put(bio);
  1565	}
  1566	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
