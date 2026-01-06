Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165222154F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 06:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767682791; cv=none; b=IbbTQpB/WpQbEj3G+zGTaCcxAEDXCyj0D2PZy+nucDqDUsn+xlEFQVfzjm9Fo9KCMfV/l12B45/yYm7HhOQTwHfR00EG5zeN9QMeE/LHG4+YtPwGhPPKcAVRHpG7pl0INwOP+DZxNOv3XIoQ9NcNIO6AMysjBFAAOEO5YHO4yow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767682791; c=relaxed/simple;
	bh=X6XNI+JfpUchj0SMUb8ED1vj8lRlybUEMcqR56hkQDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SAEvImQJXannrS4Cw9sSG4zsTRSGT+BBrO78U0rsrPjXuEtRKCGqYbFHKMeAlMkvWutIXrP3XyLXImJ5Mb3z2SubFy1RCeiNyTmCMKgbJuvoi+m4pZmbos01NldhW9+eqTzubDL7VGM1a+fszoscSLTvRRyhRzkIKb5xaVcOrRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k9/GPttn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9/GPttn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767682790; x=1799218790;
  h=date:from:to:cc:subject:message-id;
  bh=X6XNI+JfpUchj0SMUb8ED1vj8lRlybUEMcqR56hkQDY=;
  b=k9/GPttnd2irWhocp3Q0/PGBfpZZSEJWMxpUGA9g224sjM485A2qpu6C
   vyP5pJG/Hcg4JZYgmPq4ggQn1hHnH/fGiA1bqJ9QDXko/v6+p1L9FJsKn
   qBqkCyKuqqHSSMvAop65qz4okSRVMfbym/YFRp8KtoQKgMBSOXfiZjpwr
   1QUmGtSmJ2fPMisangnK7WAl1g97/OPSM3yisWtKFoe6cZKBpORA/tsjl
   lweAXan3axkSRZmG3++KigkhbvX6oiUfYJFj/dygWYuPqm1dHxVOZub3W
   83OZtp7vOqfoUaCh4D4lxWMKUGVis8WXxSK5r7tCqwqzNyVhpxSwOe5jH
   Q==;
X-CSE-ConnectionGUID: GIBZv30XQGaU/Dax+c2gJA==
X-CSE-MsgGUID: UHcK789IThS3CXQNx/JfcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71626790"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="71626790"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 22:59:49 -0800
X-CSE-ConnectionGUID: 2sJiHZLISciNZq/CJp9Zog==
X-CSE-MsgGUID: PNczqcr3QGO+iYnsYQxgXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="233719776"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jan 2026 22:59:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd12f-000000001jd-2Dea;
	Tue, 06 Jan 2026 06:59:45 +0000
Date: Tue, 06 Jan 2026 14:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2634/3725] fs/ntfs3/inode.c:972:34:
 sparse: sparse: symbol 'ntfs_writeback_ops' was not declared. Should it be
 static?
Message-ID: <202601061424.nbKLNwC5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6cd6c12031130a349a098dbeb19d8c3070d2dfbe
commit: 099ef9ab9203dff327f2d61e44773f9acbc01f13 [2634/3725] fs/ntfs3: implement iomap-based file operations
config: x86_64-randconfig-123-20260105 (https://download.01.org/0day-ci/archive/20260106/202601061424.nbKLNwC5-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061424.nbKLNwC5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061424.nbKLNwC5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ntfs3/inode.c:972:34: sparse: sparse: symbol 'ntfs_writeback_ops' was not declared. Should it be static?

vim +/ntfs_writeback_ops +972 fs/ntfs3/inode.c

   970	
   971	
 > 972	const struct iomap_writeback_ops ntfs_writeback_ops = {
   973		.writeback_range = ntfs_writeback_range,
   974		.writeback_submit = iomap_ioend_writeback_submit,
   975	};
   976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
