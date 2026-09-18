Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F69522699
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 19:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789759721; cv=none; b=bzYmNY65m9fnPWr0/sXJVRyqm1WhYlsMdgf6JU0l8a3GC0SMc5S50G+wG4mCB/lqwxVrVofbc9bo1Ik+lb8AMKHlGjkSXPaELdJX8iAtQHLR5NZ6TDt+Lf0nQZqQ0Szt6TqHRtRGk9WvSeukVAAVBD8R/QCKT3ch7orf8RgmQnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789759721; c=relaxed/simple;
	bh=XRRAGW7nfHyvnxShnTY5M4TQNNQusDIx2ZQHwWUcilI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YSQawbIDBR2zQkLonL3sU3u37s+MydWoPtWOcGj56X5pSbwN9v35DscuF/SSouMfw4uCCnLo7kN56UJtARTVlbpTJ3/nO58R6y5PEoIgiFEmo3J+pQlvI3cp4POMQ5xcEmDrPi00cxEDWcNbZLROA5Ta1Z74LxOI6egKY7CtI5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M3gLhff2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M3gLhff2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789759718; x=1821295718;
  h=date:from:to:cc:subject:message-id;
  bh=XRRAGW7nfHyvnxShnTY5M4TQNNQusDIx2ZQHwWUcilI=;
  b=M3gLhff280Q2WANqkrbTyOnDHSRALbKtW4j8lGMU9LwIY8Alxp3bt7Zz
   1j6+6w1/XXnQK7N1Yajlzyi8IfQmxpJITXL51O2S1lRCyoMI2sMkN65GN
   Z43tk6nqBzhwteSy4kGe2/8zPf1T87hCk1Pw2YoxXkCXtA0ftzvHytwJm
   6S/RrYlPM3c5Sl4o0PMZ4jzSY1FTya3sFK/rJjak4VJUDMMQEH4gHaLEm
   U63KCZCT/7H+5wavv2BGI8AFrV2dgqQ8kfumn1Ggd5KLn5lnJND3SiYJx
   2m7/XqraaezIHg4SCicOR2ITvg0eKW+AswoC1iO5Nmkn3NUDdomItDTE1
   g==;
X-CSE-ConnectionGUID: /1M2wEC/T5CY5hL7z7M2dg==
X-CSE-MsgGUID: FAjAeu/ATqqzFGv5d2UCxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="101638356"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="101638356"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 12:28:33 -0700
X-CSE-ConnectionGUID: bCrF9/t8R4ymQNb/xRrg2A==
X-CSE-MsgGUID: 6Up02cdQScGnf9wfPuh+xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="270835404"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2026 12:28:32 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7eG1-00000000AF7-0MLW;
	Fri, 18 Sep 2026 19:28:25 +0000
Date: Sat, 19 Sep 2026 03:28:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>
Subject: fs/bpf_fs_kfuncs.c:377:26: sparse: sparse: symbol
 'bpf_real_data_inode' was not declared. Should it be static?
Message-ID: <202609190336.lcB2dCtn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: 3f8c65b06fafc3f779abda5f7b81707411d05d4c bpf: have bpf_real_data_inode() take a struct file
date:   3 months ago
config: arm64-randconfig-r1307-20260918 (https://download.01.org/0day-ci/archive/20260919/202609190336.lcB2dCtn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190336.lcB2dCtn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3f8c65b06faf ("bpf: have bpf_real_data_inode() take a struct file")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190336.lcB2dCtn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bpf_fs_kfuncs.c:377:26: sparse: sparse: symbol 'bpf_real_data_inode' was not declared. Should it be static?

vim +/bpf_real_data_inode +377 fs/bpf_fs_kfuncs.c

   361	
   362	/**
   363	 * bpf_real_data_inode - get the real inode hosting a file's data
   364	 * @file: file to resolve
   365	 *
   366	 * Resolve @file to the inode that hosts its data. For a regular file on a
   367	 * union/overlay filesystem this is the underlying (upper or lower) inode that
   368	 * stores the data, not the overlay inode.
   369	 *
   370	 * Data resolution only applies to regular files. For a non-regular file (e.g.
   371	 * a device node, fifo or socket) on a union/overlay filesystem the overlay
   372	 * inode itself is returned; for any file on a non-union filesystem the inode
   373	 * attached to @file is returned.
   374	 *
   375	 * Return: The inode hosting @file's data, or NULL.
   376	 */
 > 377	__bpf_kfunc struct inode *bpf_real_data_inode(struct file *file)
   378	{
   379		return d_real_inode(file_dentry(file));
   380	}
   381	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
