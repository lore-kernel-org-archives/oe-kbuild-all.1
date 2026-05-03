Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94E0495E5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 00:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777766934; cv=none; b=PuaIoI4/Wl93Zg0FjvRU+9+zOcCda7l0CvqKO8VaoN2bahuK/jUj8pmnMtYqL5FVoUSWLFyxDCK+qRxXm+78fAv0IAJe81z+pcRDtOmmQ4kkz+vO7eT5jHE9SFVB+hRDJ/pSaMveVhNdnoWxKzYzYf1HJCoz4GHt/b0iJIwCxC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777766934; c=relaxed/simple;
	bh=VAUfugTBBwJOenIuAopCRp73sTXWLagH6QbVAlFlkzE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z1cv+/hhC3WmF4aa9Lu5ytqH2TiERiu7Pt+Woub7SrEkksmtypknGPv49g0dtbshQHIGYVTAaf8w2gbbx426s8ecxZWG8tYCXV6HmKgvaq9imCRXC6bIu4chjN2A2x+nZpPPc4DVKG1H5TKA2C4XKZFqYYzlXG/zaVMYug15y44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTZVczp7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTZVczp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777766933; x=1809302933;
  h=date:from:to:cc:subject:message-id;
  bh=VAUfugTBBwJOenIuAopCRp73sTXWLagH6QbVAlFlkzE=;
  b=HTZVczp7XINwPVd3S7FFs+bXN4jdgpirqBk8AGaRJRHZjqfNnL0Jz707
   6eG4T4sk/K/nUsAa6Azy6MbeRKXEaBk4Y0B3axlKYEL4MAgDgPt+CNdBO
   lOr4DMqzkjP9lvsJHRmp/u09IeKbszar2VFoigZ5Hs+8va8E84jfHAHzQ
   gSEOXTPlkzImac9lRt97kULan1lsfgfcfDuFuLu5vZ0eDMUNftAf4mjdC
   qd+ym6JQJQgBwUtaOsAZ/oUslZ/yXM/35+n6Lz5pNHDzz6EDc07zciu2P
   22v6/1ep93zr5TwSxnbSNL+2lCo+JCfrNe9wKRAXDoJwPUTPkYZQ2zMVj
   w==;
X-CSE-ConnectionGUID: 3blJ/UjUSLOqiRy58AI2UQ==
X-CSE-MsgGUID: zzazG9qjQcW0b3TFh7gheA==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77842288"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="77842288"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:08:49 -0700
X-CSE-ConnectionGUID: JTGE1h8fR3mzqKSoBVALTQ==
X-CSE-MsgGUID: 8a8/SEx4RJGsT8ez9cAAeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="273281133"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 17:08:47 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJKO4-000000001vl-24PG;
	Sun, 03 May 2026 00:08:44 +0000
Date: Sun, 03 May 2026 08:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 16/72] alpha-linux-ld:
 sound/soc/sof/mediatek/mt8365/mt8365.o:undefined reference to `sof_of_pm'
Message-ID: <202605030716.Z7IesNkX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   aabf79f08acd13f06c13459d5820c252d6bcc698
commit: 4ec3d5795b1b07478113f8e497e69a0709fbe6ea [16/72] ASoC: SOF: mediatek: Add mt8365 support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260503/202605030716.Z7IesNkX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030716.Z7IesNkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030716.Z7IesNkX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> alpha-linux-ld: sound/soc/sof/mediatek/mt8365/mt8365.o:(.data.rel+0xa0): undefined reference to `sof_of_pm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
