Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A112E36B909
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 05:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791349710; cv=none; b=Bv6E+93FFDUDpUFZLq0/N96kWeZvPx97nXawRy9EtPQqGuquHHav32KFGXW0Bew0Vm7tR/pU5cGCG7qJhz9MOybo5CQo2RramroXXGhhfiV9/uwuBxglUzDgfpI0YaIp2ZR7V9S87pPz+Pkh1vBZ9KywOOQisA15XwS68p971W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791349710; c=relaxed/simple;
	bh=+VJf9QEA0JfIBBJ6yuZABSlejxzUFl8nvLbA6YfMh7w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mv0/JPydtLwUXbwTkT5N7EMGBrl7EDWvGhwiUibXEZDRyqC8FJnWa9Eyfk430Z4hUrD4Lc6UlVC3v3uRdezuTBgD6Q1d2qrowrrEXkiXaUuKYZXa/pDRte6ciEwonMgIxPGudvNNhbIQJtCY652iYrdYc3eGLAdQUOH94Atz0rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Md2w+wKD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md2w+wKD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791349708; x=1822885708;
  h=date:from:to:cc:subject:message-id;
  bh=+VJf9QEA0JfIBBJ6yuZABSlejxzUFl8nvLbA6YfMh7w=;
  b=Md2w+wKDZgHkObGC1QCvsJLWinYj7YibFvfD7evz2Nctzfv8zjypBFKg
   qe/Z1BMd+iggJPjXNaSKzqoWO/8UhsCe5yA3utzy3h1WIZGaQeWjX4g17
   Do5GBIZqSwCexlJOtt9kh+GHtQfr/pEOE5FTxYPomDIptmawlGcHzG09k
   pGA5ZAQD8RYfX2srNKeaRgObjrw1ehFBFJyfV4Y6Tuhx8AHeWZ4hWNf6z
   Z7X1XxuwGrNebJA9Tmhv9lRsaOYDz18EMvfqIEf+6aHxKB9yjU9u/3PuR
   H0F59LP+Le0xjo37qNFkCI9FXF9ROorY4yAnXJ4zcqhMgonPaZ2YvzmYh
   w==;
X-CSE-ConnectionGUID: aRTQhsyaRdCotkteU6WEmA==
X-CSE-MsgGUID: cvFNDBXCS2mCXLxYuWMIzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="201824"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="201824"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 22:08:27 -0700
X-CSE-ConnectionGUID: tYac21gYRDWBv90eo56/BA==
X-CSE-MsgGUID: /4dNaU4bRJO94NLj9uFJuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285443303"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Oct 2026 22:08:26 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEJt9-000000002WB-3S58;
	Wed, 07 Oct 2026 05:08:23 +0000
Date: Wed, 07 Oct 2026 07:08:08 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:extent-map-v3 26/29] aarch64-linux-gnu-ld:
 fs/fuse/backing.c:168:undefined reference to `put_dax'
Message-ID: <202610070703.2ftjZMir-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map-v3
head:   abdbd9557c238384900ebd545f426a609e0162ae
commit: fe425484d457f923142f91e234d8ab6551f2358f [26/29] fuse: add support for opening dax device as backing
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261007/202610070703.2ftjZMir-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070703.2ftjZMir-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070703.2ftjZMir-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-gnu-ld: fs/fuse/backing.o: in function `fuse_backing_open_file':
   fs/fuse/backing.c:156:(.text+0x350): undefined reference to `dax_dev_find'
>> aarch64-linux-gnu-ld: fs/fuse/backing.c:168:(.text+0x378): undefined reference to `put_dax'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
