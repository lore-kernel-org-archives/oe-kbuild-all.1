Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242F215D1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Mar 2025 00:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741134661; cv=none; b=E0KZ0cdzjh1SZzI0ULTl67XVOlD+8w3L2LxIG5THahoq4tF2PCVklPRB/Q7TTHEkuynLmokWW4vJeIcZiAwSOaz5nnOej2YqJ28u6ZvDbDxrRZ4S1xJZZ/biwQkqbKIDAiwFa0+64HP8WmWb2ca2wkH+rHN3Ekqzkbyd6NWXkCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741134661; c=relaxed/simple;
	bh=/eMP7tZnQ3web3aySROeyx2qGCwNxnrmxWWSjJIIh94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qeScKObtakaFkmai8lwUyAscOytW0c7m80Xn8LCCuhsuDMOjm/Wk8gP7zHDOJRiD07VBeq8k6cTyRsjgCsIS6oJ7RFfKyJqGAKM3IGGb9EcWqHj2YKUUmwSpIJPviLZQ1IqljAkpjo5I8Uwy5ymcXp96K6vo5gaGrknpMCNgLsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXLAvR+U; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXLAvR+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741134660; x=1772670660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eMP7tZnQ3web3aySROeyx2qGCwNxnrmxWWSjJIIh94=;
  b=TXLAvR+U2vO0vF7ajzdlo+BFljDeb5IGLxxg/h7aWMb5J+MOzqVvn83U
   LUlQ6yNEG3tI6L88ZV/aZJ1/Q+c75N9HkVaQee68BvfLthOFMzt/9FbFs
   PIzju+A+pQVtO6OBmEZe4bDsQP+NT+fN7tauvDssDHZAqWMIvF1d1hD8r
   zmAWMW943micuy1UpVAQa6mgPisSTC732XFM0VCTy4xt+nNfZ+RvpqbOH
   U+cIWUK3DBkTVcnAq9aFxZo4Bmkk+dD7GsAsicCGl1IFj/OMcvKc9VW4z
   nJ7CALtE4aIGS2NneXOXMXpk/fmHEE9simLiIY78uxcV8+F1KLAEJh7s0
   w==;
X-CSE-ConnectionGUID: /utCbRM8R5Gbif3x9PNrJQ==
X-CSE-MsgGUID: 911HQGRmSjGPuJ4CSPZ9sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52714410"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="52714410"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 16:30:59 -0800
X-CSE-ConnectionGUID: UORwMq2WQLSK9GBB6fb0sA==
X-CSE-MsgGUID: ZPdJOgQCTG2XwnYF6ZmU6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149481398"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2025 16:30:59 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpcez-000KPo-2o;
	Wed, 05 Mar 2025 00:30:54 +0000
Date: Wed, 5 Mar 2025 08:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mem_init/v1 9/13] ERROR: modpost: "high_memory"
 [drivers/mtd/nand/raw/atmel/atmel-nand-controller.ko] undefined!
Message-ID: <202503050803.SzuKqmYS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mem_init/v1
head:   af1481aba4b337d7a9cab9c826c42360853b715f
commit: f7f68ae7847684c3b445546a4aa57be44ed564c1 [9/13] dev: arch, mm: set max_mapnr when allocating memory map
config: arm-randconfig-004-20250305 (https://download.01.org/0day-ci/archive/20250305/202503050803.SzuKqmYS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050803.SzuKqmYS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050803.SzuKqmYS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: vmlinux: 'mem_map' exported twice. Previous export was in vmlinux
ERROR: modpost: "high_memory" [drivers/mtd/nand/raw/nand.ko] undefined!
>> ERROR: modpost: "high_memory" [drivers/mtd/nand/raw/atmel/atmel-nand-controller.ko] undefined!
>> ERROR: modpost: "high_memory" [drivers/mtd/nand/raw/meson_nand.ko] undefined!
>> ERROR: modpost: "high_memory" [drivers/mtd/spi-nor/spi-nor.ko] undefined!
>> ERROR: modpost: "high_memory" [drivers/mtd/hyperbus/hbmc-am654.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
