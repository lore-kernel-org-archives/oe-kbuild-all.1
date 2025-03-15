Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482818E377
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Mar 2025 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742031255; cv=none; b=QNQHXx4+O84G0W7lOazTfGY3uAU/xVXphSklEacw/bgee5WsXUUCUutMyaHdgLojUYCnBkv7hsjd/r+8zcpqerOr+zzg8D5NEFx07r1Y7KbiH71kGI9OYx2Gf0JoUGh255cC2ijmNJXPIhGHwCqynNwoCNRvs61jx++rv+qbSg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742031255; c=relaxed/simple;
	bh=6Zyfai0r0hQ4fKE7Bp4TxFjH/r0vlCky6W1+mdOC1jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=emtIyLRMmq38ZXdq4y72lPsBm4Iqahcy5irUWBDhrTV/KUFw3/lwMYud5iSfP1PoEdg+KqNs0W3i+l4Li+6zYGxJuQytOss5YfGvVsQ2sPxOPwiuwpdZoukG++WctSyMKPI/dk8iclV95nvGZCRUIlxei10puvY64fxodTErLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVcdlwPS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVcdlwPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742031254; x=1773567254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Zyfai0r0hQ4fKE7Bp4TxFjH/r0vlCky6W1+mdOC1jo=;
  b=iVcdlwPSvSGtYwPxnXJUUsBJ2Iqk4d3eYNIaNxvWH7yyS65TLkJpoYEO
   +rj1ub0b2ju1PsL7zGMD4Urf0d/5ULbGfSYERkLHjAiWjsznieOftb+Sg
   05l9Af5jX1JpWYtbu72+4zYeiX4ryCC6YhP61WJ7o8hgXM/ksEvMTMVYF
   EDNxlDT2c1tzEs9hTfgpwbC9VI+JjNs6EZRKzuJAP0HtTrS1QSE0UtUGA
   /cmoEcqtcupTuwDgtiwcHW9I9Aj8xc35TSYy+gEO14FpmtsYybzme3kaG
   w3/wxlOxVP/RFaq07dFEb42vOMVDYOM9rDOK/E5oZIUvD4h75bnMUYahQ
   g==;
X-CSE-ConnectionGUID: KdJJ/WM7TCiSFG+2g9jkCw==
X-CSE-MsgGUID: 9/aDasM7TTGG2u9Nfie42g==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54179095"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="54179095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 02:34:13 -0700
X-CSE-ConnectionGUID: hpuSxF7WRIacdX2H/tjsvw==
X-CSE-MsgGUID: 3V26JL2STZWIIQN1seH3Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="158653055"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Mar 2025 02:34:12 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttNuD-000BDt-1Z;
	Sat, 15 Mar 2025 09:34:09 +0000
Date: Sat, 15 Mar 2025 17:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [btrfs:pr/1157 153/155] extent_io.c:undefined reference to
 `__udivdi3'
Message-ID: <202503151741.3rChx4vg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git pr/1157
head:   ba17f60c94e718376b5573cced1493563b1d4300
commit: 49c863d9d6690e1ba2ffa093994e03a0cefd50ad [153/155] btrfs: prepare extent_io.c for future large folio support
config: i386-buildonly-randconfig-001-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151741.3rChx4vg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151741.3rChx4vg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151741.3rChx4vg-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/btrfs/extent_io.o: in function `writepage_delalloc':
>> extent_io.c:(.text+0x3095): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
