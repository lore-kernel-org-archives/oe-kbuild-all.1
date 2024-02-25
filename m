Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC4B4437
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 02:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708827202; cv=none; b=LFgTHQo0lcF2sEKMkpJpKq4cPqRRtUSYbwF9jTZKgd6l7Bmn0L6YkN2Q7aIfwvAcN+iAHTMFsLe8aje6yw0VAv8MaB3xFq+OoW1DDCJqQTm89yyMmBefXHkxF/FC4zHJmIqFIIJ/yee8Q0223guofAYp3QapA0vrzBZ3/44B3hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708827202; c=relaxed/simple;
	bh=/zkSya93JJCbXTZEFKzzwT/Ler8d7X7v8h950BzlIUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6MfMitiWQVtabeb0vqJhtpFH9fKv97M5Xt7tQtlDYCGIW5z7f1bV8Co300Ip2FaSJpm1ZHSlSnWyX2wHUPGTSJFtKZunvrJxz0KkN+bGBu2pfd2jY++lpXFOymg5mB4z7qApiHHWB/SZsKSsTgrknGh/k4ugkBMU12UoXUw1qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dicQbu6d; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dicQbu6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708827197; x=1740363197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/zkSya93JJCbXTZEFKzzwT/Ler8d7X7v8h950BzlIUg=;
  b=dicQbu6daFSznfimRMIZZrkZj+Ba7LrGLTIOBK6RtlYwEueCG3IEsR0f
   rMIJLOr/G3w92XBk+rCrgSx9yKYj0SbPjzMyz+84ezpk7wui5dASIJnZf
   /ptdZIu8jngwp0T9Qwz9HaYr/BKs47QKJjJDkYxiZNX7KU4QCHRRGHu0i
   y8cqBVuCzgHoMzjQFlNvo/Cy8oErey9EH4XcIGsOBuqbK8+et7UcuhI1O
   hK3qFQuvw6/Qqh3hU6zy1tIEluZaYD7NfFZtm3Xuuopv/c99zs7bQOuE3
   Z7K4ZbDnlMtddzjLqszsKQaXeCrRSGCukKlTeEP1hbWvo49SUJIS3l0W4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="20679592"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="20679592"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 18:13:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6514983"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2024 18:13:15 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re40v-0009Aq-1E;
	Sun, 25 Feb 2024 02:13:13 +0000
Date: Sun, 25 Feb 2024 10:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Ortiz <sameo@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest-rtmr 2/6] drivers/virt/coco/tsm.c:491:31: sparse:
 sparse: symbol 'tsm_rtmr_type' was not declared. Should it be static?
Message-ID: <202402251027.lo70TGFF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-rtmr
head:   1b43408eb53f05877353e5b810826024d63c76db
commit: a317cba140a2cc065fea8995108b9d671943fda1 [2/6] tsm: Add RTMRs to the configfs-tsm hierarchy
config: x86_64-randconfig-121-20240225 (https://download.01.org/0day-ci/archive/20240225/202402251027.lo70TGFF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402251027.lo70TGFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402251027.lo70TGFF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virt/coco/tsm.c:491:31: sparse: sparse: symbol 'tsm_rtmr_type' was not declared. Should it be static?

vim +/tsm_rtmr_type +491 drivers/virt/coco/tsm.c

   490	
 > 491	const struct config_item_type tsm_rtmr_type = {
   492		.ct_owner = THIS_MODULE,
   493		.ct_attrs = tsm_rtmr_attrs,
   494		.ct_item_ops = &tsm_rtmr_item_ops,
   495	};
   496	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
