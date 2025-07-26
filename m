Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135221D86D6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753528233; cv=none; b=KomkyZ5JXoUh94t0koW0gmCt/Bd7MY1fx4qmIx4JOk80NChPtDYjxoeu6oepydiGFRHJiSWrVh6qS4f8w6CO776YEcPs1+KiVgDllcU+Oz4qAldQrANSs5APPRIrVz8K2ySKLzVlzHa7AyRnJAu64EC7MnSgsJBgAr971teayy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753528233; c=relaxed/simple;
	bh=BsDzL6jUj1vcsiHYQuUaBhwNbzLYvpKYnyq3KRSVMhA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g/BQGj0eymyRKIqElXaLd3v26uE8y8N8g6L9618wfRzwEqsHkDRRvh09pXUMMEo6q6dw5cBpO+ixHk7nvsztFYrrVu6Y4ygynMNzr1VIhaRGkgfVJR1mxenfYA4on73njGl8KyILF0y04Hf/l9ebNvGHL5f9tAYAXyZudQqqesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/a4I00X; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/a4I00X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753528232; x=1785064232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BsDzL6jUj1vcsiHYQuUaBhwNbzLYvpKYnyq3KRSVMhA=;
  b=K/a4I00XVThYVYqzaAy9xbDB1Efw0Qdw4I0p0/tHTT3A81c3yBr/Nfu7
   t9SFi/6kNLzPOkUZvXXp1l7MLhcFDubd6vNw4Z8QKWlUSVNC/LVsdqwFh
   +McMih+AMEUVWNXvZ/6MJAGIe7Lx+GjUGi4agROAnJ6TCDavZbQe2r0xc
   alpGTE8uxcd79p21KWUS7UF7gc++9y/DkAcDL375r3O/u4guIXLyfR67c
   L/YYKeA/JWYgsgLfgUE8pbyO5p/mc275MVF+dDuJt4DmReLAuIawkEBgP
   5K/Ro/eAewTVLQupdAylfOHY2evpt24kQTN2H26+WTBpwAcHWOIq0BH9a
   Q==;
X-CSE-ConnectionGUID: GUbzurT/TFmIP0GfErcoGw==
X-CSE-MsgGUID: utoxWLZhRmqFf9CvqNUkEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="67199195"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67199195"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:10:31 -0700
X-CSE-ConnectionGUID: mrSnGx4WSkquPLniUT7T0Q==
X-CSE-MsgGUID: ywykZxh1RP+0vFoPBzc6Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161844790"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 26 Jul 2025 04:10:30 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcnM-0000Hz-0Q;
	Sat, 26 Jul 2025 11:10:28 +0000
Date: Sat, 26 Jul 2025 13:10:20 +0200
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [akpm-mm:mm-new 351/351] ERROR: modpost: "__vmalloc_node_noprof"
 [mm/zblock.ko] undefined!
Message-ID: <202507261304.kdaDjJq8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   3dcf95fa6b5546e1b9b5a0b5faac4d5fbf1c3722
commit: f800ea402e875e43aa96e1e6887ada1722760395 [351/351] mm: add zblock allocator
config: parisc-randconfig-2004-20250719 (https://download.01.org/0day-ci/archive/20250726/202507261304.kdaDjJq8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261304.kdaDjJq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261304.kdaDjJq8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__vmalloc_node_noprof" [mm/zblock.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
