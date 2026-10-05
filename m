Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D6C54707F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 00:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791159373; cv=none; b=mN7ML0IuTUO4bjPMpqepW8Un9VDtPLbBppTAN8lvfFF+2u9Jx3HAVQ11aKwWHeZ+CsIgG+z1X2KoPJ+ysTjoz6hs1KVwZtonmwidOmAO3SYXB+JEJQm+/uig+hEZ7MZLzo+aujvECS4qeaf8/D6YAUMPSeGhSd5PS3owhDx2PcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791159373; c=relaxed/simple;
	bh=+IfCCHyNLl9DVMGkaKWaR6R2xMpCSCJMo3i8SOwhR9M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nqoERj3g6g7wSFiOp7aeay/+ceZTPSTkSpJWjijDy8Hx8HSU5rwcgFHCTpIWVI9sOfd5GtIVtOSRbCnQOyTFYVIOEbsVYYLJDQ7u3vY3ckawnYFf9X+TXUp3rnIrSXHSlymtRjTN0nwIuUqKKuSkYQAH1VzBigDVXKxd/HAIMyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZUYRCXm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZUYRCXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791159371; x=1822695371;
  h=date:from:to:cc:subject:message-id;
  bh=+IfCCHyNLl9DVMGkaKWaR6R2xMpCSCJMo3i8SOwhR9M=;
  b=eZUYRCXmrfDAYpW92ow1ZwVsNsZxZXr63xdM5Jri7Cc+XsQbd+WGHqq0
   8/YiL/516xHoKdJ5DDnCLpqZPwnY/lBlUKoi9tlJsoIOTuOLI8alSabzP
   GcCuRcyKdSpcsQp1imcqvcBqYAmBqIHbmNJuc/zI3XOKngv6lc/nh0K2b
   wFUfVnHKHe7d2InMJhUgYx34qE8qZ5Jrb/93rXotogJoMaytTB+lcHQO8
   T+KE52+YsUOAaaIP8TPu1DVEqBOD/TPTgpNc47LnJnTygy7whINWB5QMA
   kxnJ8d7v2Zg7wmUIOJIRPD+4h2HQhmsILk8anLftm17aEAI9vKYNY0ojv
   A==;
X-CSE-ConnectionGUID: 0h2aVD3vQAmLvZrPkFF2lg==
X-CSE-MsgGUID: fk0iUgTGRcqtxTpXBl3I3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109316793"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="109316793"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 17:16:11 -0700
X-CSE-ConnectionGUID: AlBtEwvwRd2+q1Im6FIGqg==
X-CSE-MsgGUID: hpS0tSvyTMqB5CUiGja8BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="302925228"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Oct 2026 17:16:09 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDWND-000000000Uh-1DKn;
	Mon, 05 Oct 2026 00:16:07 +0000
Date: Mon, 05 Oct 2026 02:15:56 +0200
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.all 356/378] fs/nullfs.c:55:14: error:
 'nullfs_nolease' undeclared here (not in a function); did you mean
 'nullfs_nolock'?
Message-ID: <202610050233.dAqZVe1Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   4852668f27dd07a38b753c3ad673ffb0bc3c00ec
commit: 580de1b24ab7a3e0cb73db6c341bf40d7f683797 [356/378] nullfs: add an empty immutable regular file
config: m68k-randconfig-r2201-20261004 (https://download.01.org/0day-ci/archive/20261005/202610050233.dAqZVe1Y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050233.dAqZVe1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610050233.dAqZVe1Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nullfs.c:55:14: error: 'nullfs_nolease' undeclared here (not in a function); did you mean 'nullfs_nolock'?
      55 |  .setlease = nullfs_nolease,
         |              ^~~~~~~~~~~~~~
         |              nullfs_nolock


vim +55 fs/nullfs.c

    47	
    48	/* an empty regular file, with the same refusals as the directory */
    49	static const struct file_operations nullfs_file_operations = {
    50		.llseek		= generic_file_llseek,
    51		.read_iter	= nullfs_file_read_iter,
    52		.fsync		= noop_fsync,
    53		.lock		= nullfs_nolock,
    54		.flock		= nullfs_nolock,
  > 55		.setlease	= nullfs_nolease,
    56	};
    57	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
