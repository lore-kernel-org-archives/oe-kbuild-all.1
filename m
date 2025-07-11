Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20021C84A1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 20:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752266357; cv=none; b=GfKcOnPuIMSvq2f695e4iZARO2z0lakyzcsv9QzLuitIIgrbeCh04AHc4xd0SHyqtYR6UKKbAn4IA2mkv9YnRKWQOujZFCN0I1orHCLR8Cayjk3m7Mhks4jx+7GGoQhv3zSeMODTmNxLbYhlzXsa+kLHlrPUw7qdcbSgzllK+HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752266357; c=relaxed/simple;
	bh=r7Djw3h57SvDRHvibbF1TjwD5MLkmaGCkjpkkD4egOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KvIGb+mO3JRFXiC2j+v7+779/D+JCzCnVvaEtdnBDn18PCFITG43mDb4s332dYA3ER9sb4ONLAEKjGcfzsf3Fch0S243c/PZUQpWmVSvqvup6VjaYm32JXWU8ry+qrGMpcD8ZG7qD9AZXOO+SS2jZOKZkwPXqhsmfFZ2NBGlMww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VlAjEuB6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlAjEuB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752266355; x=1783802355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r7Djw3h57SvDRHvibbF1TjwD5MLkmaGCkjpkkD4egOo=;
  b=VlAjEuB6On6tH8JJxjmGZkTy9xDd6gPpC34IZ64xrkmHPl9WKQauMfmK
   VwwRAbaita2c+QG53mrVNBM/Rlqh7f+VMlzmLXsGe8Qnw+PGNRk69dgWt
   GVb8T0tCQy7BQ9WlGf+mYFYC7jbcc/I536ZjHWJ5KCPDKFlL/pzJGI06K
   YvjldFA+B+6Y7pW2HX/AGcF8jmExQJWTd7y7DTsG3iZQdtkidB4J1FsdM
   UKg93wdVE758hrTczRhkoG8S3pdComhJJzXDiHZWAmpYf5Jn4PtwDM9QV
   ZRcoE8oUlZJysCElkXDVlAfeT8lwaOcuB0K+HA71yBaP9sxXwYyEDAbMF
   g==;
X-CSE-ConnectionGUID: 5MAfY1DvTMCfmyu+CF1HFg==
X-CSE-MsgGUID: zE1v+PdtRD+HdRH9cTgciA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65633404"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="65633404"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 13:39:15 -0700
X-CSE-ConnectionGUID: caPe5W9AS52d7BA2ejIH/w==
X-CSE-MsgGUID: 6wIXWRR6SSmpsdPi6nV/+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="161005984"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jul 2025 13:39:15 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaKWW-0006m7-11;
	Fri, 11 Jul 2025 20:39:12 +0000
Date: Sat, 12 Jul 2025 04:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:afs-next 1/1] fs/afs/dir.c:2028:39: warning:
 'afs_rename_replace_operation' defined but not used
Message-ID: <202507120404.1Qp8pgr5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git afs-next
head:   a8c139bea112af3fdec84c44a4e5452564c09788
commit: a8c139bea112af3fdec84c44a4e5452564c09788 [1/1] afs: Add support for RENAME_NOREPLACE and RENAME_EXCHANGE
config: arc-randconfig-002-20250712 (https://download.01.org/0day-ci/archive/20250712/202507120404.1Qp8pgr5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120404.1Qp8pgr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507120404.1Qp8pgr5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/afs/dir.c:2028:39: warning: 'afs_rename_replace_operation' defined but not used [-Wunused-const-variable=]
    2028 | static const struct afs_operation_ops afs_rename_replace_operation = {
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/afs_rename_replace_operation +2028 fs/afs/dir.c

  2027	
> 2028	static const struct afs_operation_ops afs_rename_replace_operation = {
  2029		.issue_afs_rpc	= NULL,
  2030		.issue_yfs_rpc	= yfs_fs_rename_replace,
  2031		.success	= afs_rename_success,
  2032		.edit_dir	= afs_rename_edit_dir,
  2033		.put		= afs_rename_put,
  2034	};
  2035	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
