Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAEE28DC3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Aug 2024 10:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722766948; cv=none; b=PHZA9/PTjXBq5n9izn7Z2qSi4msvJWTM9Knexh3GGUyIzyGVBwCwdhZ4IlWGSv0TYHcNqIi7JSgtkDZjRgvwsgKJf2wfjxAi4/2inX6CMGaCfyvuri5ubxf9TRpBuOFpy9cognfSF10ZUHxDIADEBHPyxMXX//AU3pSFbFu/t2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722766948; c=relaxed/simple;
	bh=QjzHo7cCg7SM3/XtaO+ZnI/xg30DD9pnv6FyUhvbGOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCPFYdt8dty0AxNhZFuROk/N4SXedkYXaqx0gXYiXm3Nu8oweDEf049zeVG5ImKnMgFbIp2WEeeFPqOtxOUX591zFgryOomynN1ylbjRyfwzTzMzAJ/Sgcr/5PPOlXglCaW+FneLeOD7VHFTeqMI+t8Ct1c7wCTmmuiVVirFt5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iicAX/YZ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iicAX/YZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722766946; x=1754302946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QjzHo7cCg7SM3/XtaO+ZnI/xg30DD9pnv6FyUhvbGOc=;
  b=iicAX/YZQvnkkHvOGfkAWyD//1ptxoWa8J4Iexxrp8dI+reJ06+1p6a6
   PtiG+3SOjkXLiM+pkE4DxV1rQsPsq9qcqce3nEQjjbXGmH65hZOg/5Hg7
   8Ssg3UpR39dZgaFGPra4hLBfBIuae/3gFirUfbi8uAChhpUelsYfChw14
   mMDEQhvn0IUmLmVTgv5/ajh4Il9oH3PC9Supg16m7vYOK5KcY05RwDXKA
   +qI5OhPeOJ8nUg7H2y6ZpTpkDQLccYqexqLlGLlNOMsczg+tJv3TrHqmo
   FsL9SORO8AGCbcvvZuwPGqMlhnBYhTVBTF0TkjmRTXMHFSMwZFLC9UDgc
   g==;
X-CSE-ConnectionGUID: 2q2n2AgoTH6KwMWhI3ho0g==
X-CSE-MsgGUID: S2dC46qJS3WF7Zar5O++ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="24528037"
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="24528037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 03:22:25 -0700
X-CSE-ConnectionGUID: 7OP6yEHSQsWTxSJY/1UqdA==
X-CSE-MsgGUID: 0DUBnVxvRl+7gktiqD1/Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,262,1716274800"; 
   d="scan'208";a="55558369"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Aug 2024 03:22:24 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saYNZ-0001PC-2f;
	Sun, 04 Aug 2024 10:22:21 +0000
Date: Sun, 4 Aug 2024 18:21:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, NeilBrown <neil@brown.name>
Subject: [snitzer:nfs-localio-for-next 11/19] ld: fs/nfsd/nfssvc.o:undefined
 reference to `localio_version1'
Message-ID: <202408041819.5Sbmo1R2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   3388b2221e086fa4c7fc2da12b4aeeb3a98c4cab
commit: ee893f2827265f8785b461f796eda2c2dadfff94 [11/19] nfsd: implement server support for NFS_LOCALIO_PROGRAM
config: i386-randconfig-052-20240803 (https://download.01.org/0day-ci/archive/20240804/202408041819.5Sbmo1R2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408041819.5Sbmo1R2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408041819.5Sbmo1R2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld: fs/nfsd/nfssvc.o:(.data+0x210): undefined reference to `localio_version1'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
