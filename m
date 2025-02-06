Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC12188CB1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738873700; cv=none; b=BH3SoJeC6Ll6omROjEfRuPw0+Tnqy5Hi5hmNKjlz0REgv0Ug4PC15KWGSYPbXZnCuu0nDZbEEPAD2y6zHnnjDSmnBN078T7UvCmdn+WGFI0OIMf0MUvmAKxZZed2KbFDY1h+KwJnKLnTvr8Cwz8EIqsOL34FHlDKR/WRYolebMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738873700; c=relaxed/simple;
	bh=VqihgcdMlsacRcS7PsKwWjvZ4VR+GfacBiCcYX3KxWk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxHemyKEN1MtkgV/SVpeHhqy6ISrJR1Uy7DqFxOCayQfplQNrY9tvcBt4CB4M4POUu0MTxkS71Z9vPXkYvyVQsRxZG5f4ptBHV23PWEy9TQz7FUHOj2NPKR+M2e0VRuVP9hS1/0nzpJUC7krUaninzdb9zeJzuyghGKRHA85cnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StzPB1M4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StzPB1M4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738873699; x=1770409699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VqihgcdMlsacRcS7PsKwWjvZ4VR+GfacBiCcYX3KxWk=;
  b=StzPB1M4eOmakMpxHh4E+3BSnDA7elrDvuaEWHhHea43U59ID65mWx8O
   rQbe3We9aSvFiJGFmaQ0U3wHDH+5MX7xqj6eqUus9KdZtqXXaUU5eNa9L
   VUAJ017TPjSyW9yDYDb+pQ6D9Ym4Y//iKXD2zW8t/CrU5fR7WphLmNnAJ
   PcbFY6+wZd3aDEJnVgm14dTgMjwSIkU8XkTb5ypE05F3pg1tgCdZ1IoH/
   Rm1Eiqv7bRDp4vA4R+Xu0am2nhOqAZXNoY+59elnz9pJEGAQTk62odquK
   AVzf149xwr6++u13zqa2MaW2wDAiSd5UBOXtq2jxNMI3XKRn4PZLBDimn
   A==;
X-CSE-ConnectionGUID: iFt0ekLrSkuxpqD2Z5q+sA==
X-CSE-MsgGUID: kVWhTECESbmJWx54HQSnfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50892230"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="50892230"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 12:28:12 -0800
X-CSE-ConnectionGUID: NDwaxwsWTcW09mVVdfNiXg==
X-CSE-MsgGUID: SiogNjw1QzOSyERTGFwBeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111184141"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Feb 2025 12:28:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg8Tn-000xIs-19;
	Thu, 06 Feb 2025 20:28:07 +0000
Date: Fri, 7 Feb 2025 04:27:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 1418/1780] kismet: WARNING: unmet direct
 dependencies detected for FB_DEFERRED_IO when selected by FB_SH_MOBILE_LCDC
Message-ID: <202502070444.GqUqSjo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   808eb958781e4ebb6e9c0962af2e856767e20f45
commit: 236ee083f1b9128fd5bd266054c5b8868f803cee [1418/1780] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU
config: arm-kismet-CONFIG_FB_DEFERRED_IO-CONFIG_FB_SH_MOBILE_LCDC-0-0 (https://download.01.org/0day-ci/archive/20250207/202502070444.GqUqSjo9-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250207/202502070444.GqUqSjo9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070444.GqUqSjo9-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for FB_DEFERRED_IO when selected by FB_SH_MOBILE_LCDC
   WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
     Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=y] && MMU [=n]
     Selected by [y]:
     - FB_SH_MOBILE_LCDC [=y] && FB [=y] && HAVE_CLK [=y] && HAS_IOMEM [=y] && (SUPERH || COMPILE_TEST [=y]) && FB_DEVICE [=y] && BACKLIGHT_CLASS_DEVICE [=y]
     - FB_SYSMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
