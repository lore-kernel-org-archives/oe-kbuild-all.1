Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9BC1B4F09
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 23:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763075782; cv=none; b=mo+lc1tlwppU5ANPzkMLHOHRBVxC7JVWVtJofVJ4GUViJasfdZdO0+CmpRLcOUSa25WmTrhcbHYAUgIUEWJdI4CytAODgp5+0+4MpgnrK+PTzRT4EL6WvUhWmJjtKt4K0nmnnuHQcKnhcBv5xCbaKuJdSgPr7D6Qi55c6VGQDpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763075782; c=relaxed/simple;
	bh=8PF+j5fH3gxCWUMIiN9SmIDtbPZY7h+XPEVx5BDS/Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAUPc8zgK1c9l4+A4xqKD7WhPeolimBtZpQ8zcSRch/tyLoeyCS28p/Dhvs40d7xlQOTtwf6A7ePxjMgeZFvMxLSgZ4Uqb+E+sAuw/yyFVsx0Xf89iGK8SvaPIyYhmmX4bGI+LRFNqD/RmwCHDdeRZqQfDP6ahxSSiTCMccg8gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m5hkPnDw; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5hkPnDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763075780; x=1794611780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8PF+j5fH3gxCWUMIiN9SmIDtbPZY7h+XPEVx5BDS/Zk=;
  b=m5hkPnDwrkI1xoHhNRrvIMA85TDM6OqQVc2GrOon4+nOy2hVhHbiU7Q3
   VWAUjQvYHL5NA/aWFpVM8IYmwYLy0jlbIhPgSoSymPBS9bgfod2ydUx/p
   u51vh5PeansqOwQyeUNIP9Q7Rqv+F9+TrnyhY5U2CiIMZUZiNeVUZ6dbk
   BiXC5FoHiHH2eVvfJB97gQW3z7m1Vfc9CqdvtIYF66zCqkoTRwD/x3U5U
   sCv3Yp7YA+fOYvaoeM5400Ctkq9veBRMxNdbpS4UP18pZlUINtVumhh1J
   XI9Tb+cE4W5iPV2PPYC6tKE8FYiingUalUrbGi4Wel8HcD43wotIo92rN
   g==;
X-CSE-ConnectionGUID: +FVtTMDiTruLFlUwwqKA5w==
X-CSE-MsgGUID: nw23zPAMSkCGVvt2OeA32Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64174003"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="64174003"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 15:16:20 -0800
X-CSE-ConnectionGUID: h+mfI17LQ9OcoxbKSjHGFQ==
X-CSE-MsgGUID: 7CqHhG59SEOly9aleSotQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189467312"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Nov 2025 15:16:19 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJgY5-0005yV-0Y;
	Thu, 13 Nov 2025 23:16:17 +0000
Date: Fri, 14 Nov 2025 07:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 8057/8066] ld: tsm.c:undefined reference to
 `find_tsm_dev'
Message-ID: <202511140712.NubhamPy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
commit: 91d64cb797d3ac5fb0eddabfe2c868c1efdddbf8 [8057/8066] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git
config: x86_64-buildonly-randconfig-003-20251114 (https://download.01.org/0day-ci/archive/20251114/202511140712.NubhamPy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140712.NubhamPy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511140712.NubhamPy-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/pci/ide.o: in function `pci_ide_stream_release':
   ide.c:(.text+0xffb): undefined reference to `tsm_ide_stream_unregister'
   ld: drivers/pci/tsm.o: in function `connect_store':
   tsm.c:(.text+0x1d42): undefined reference to `find_tsm_dev'
>> ld: tsm.c:(.text+0x1e68): undefined reference to `find_tsm_dev'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TSM
   Depends on [n]: VIRT_DRIVERS [=n]
   Selected by [y]:
   - PCI_TSM [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
