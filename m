Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC4D3EBF22
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771388856; cv=none; b=SzEY6Yy+y+co6lsBWrSWiiAOOB9PE1k2mCkGxvB6SVGouUNVMpoH6E7yA4QGu6lVaZiRTwUzor3gMz1Rm7foB9Txxa790TWL56ll4zCgBvrnA5VsfwfguOdDjO4MBTRS0snUSWKm03kPIbg2kVFIfMIfpELPjxmPdCDcyld5oCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771388856; c=relaxed/simple;
	bh=Q2DJIScWIkOnSktazSXASekfxg2mQWbxQTyy4Q9sZc4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=asWkxnzfPDWS8RUsO0GWX4c6PtBudEy7H28K7QSOA9qik4Jr18d0tyYBa06KW3gCTBkGB7ALp8S2lMDXxP2qfJqiTw0j0bQKnPvaeV6inEOm0Q0yecxGlQWHNFmlYrVgxcHcXfftsvA+mvsktYytTNBzoJctIaT2zprVhu9Wpi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyktCb/n; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyktCb/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771388856; x=1802924856;
  h=date:from:to:cc:subject:message-id;
  bh=Q2DJIScWIkOnSktazSXASekfxg2mQWbxQTyy4Q9sZc4=;
  b=LyktCb/nvtRCAtM73NSqt7/6nq3K/WbEscDJCWnxrebyaeCpEYtj7Omq
   jrQ/cp1cEEPax2ejSAHAAJUwdWW4VyHawISGmnUqaWQdcQXQPJLN3PUNH
   UaV8QM4epwN4hjPWGyeRI8x6mbXFsxqV8D+wAf3jKxeR0SAm0+SKsrIzw
   pi4dJ8AQ8ZwUZ9o7xQ2fGvtLH/+Gao/QpOc006vUZlOzgIxgHzfVyvKvO
   EfT/bnRySSTBhXjf+jdp8gH8HeAdEZjHeWlkODQh8SfAkDx4TxKAgqeJW
   kLc0tVHY4ui6ZqEb+czpQKrcOnq4I8OyNA4p71tpG+oVfVjUQIzPdYzII
   Q==;
X-CSE-ConnectionGUID: k7pCnXqyRJycWwV78gck1A==
X-CSE-MsgGUID: 5cgBl2iPQiSiEWvAWRobdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83828866"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="83828866"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 20:27:35 -0800
X-CSE-ConnectionGUID: KELQrcZPQISI8q6RLSE1WQ==
X-CSE-MsgGUID: s+WArsLPQYqfbigZ7RUFXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="212781171"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Feb 2026 20:27:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsZ9v-00000001236-3KEA;
	Wed, 18 Feb 2026 04:27:31 +0000
Date: Wed, 18 Feb 2026 12:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 7/8] csky-linux-ld:
 fs/nfsd/netlink.o:undefined reference to `nfsd_nl_svc_export_set_doit'
Message-ID: <202602181223.w8x7DhuA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   67896fe53a48a300b8826416c1b4023d407c852d
commit: 560e6d056acf00eaa6f7ddeaef47f30fbfd2b79d [7/8] nfsd: add new netlink spec for svc_export upcall
config: csky-randconfig-001-20260218 (https://download.01.org/0day-ci/archive/20260218/202602181223.w8x7DhuA-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181223.w8x7DhuA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181223.w8x7DhuA-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/nfsd/netlink.o:(.rodata+0xf0): undefined reference to `nfsd_nl_svc_export_get_doit'
>> csky-linux-ld: fs/nfsd/netlink.o:(.rodata+0x108): undefined reference to `nfsd_nl_svc_export_set_doit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
