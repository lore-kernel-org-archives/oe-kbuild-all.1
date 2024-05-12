Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7003233
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 23:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715556526; cv=none; b=ehTzVt2/54P8ahUPgECVIMbQxSOxPScsVJZTwYVAgNSGOwzVKPR+eiE0eiHSqfE74ya0UrJquoVgYgK9yyxanQLDVgN6UsjxftM7mYpMolQz6STmf70AJiWfRY3TjVSOjZkyLC53NrHv8LSLNcF5n5r/fIIojQK3pmhJ594Vo3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715556526; c=relaxed/simple;
	bh=E0nN8H3Pb6/XhK+fQUHxaT13GFRomGucb0tieTr+pbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNxLTwo5gHd8E6Uu5rZzx6p7msgKCivDUMRrAmhTVuCa/0wDC76ogX3b62shpenyVBDNtZVnmH5fS2XS9IZFqeMVthIrVugK16SyGyjf2pQsghTGkCkA8JyXzDDWOYjS6Si30vVq9t9+vcNLutmEwC60JfdMliysVD5ljpJAG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lH9GqPqt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lH9GqPqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715556524; x=1747092524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0nN8H3Pb6/XhK+fQUHxaT13GFRomGucb0tieTr+pbc=;
  b=lH9GqPqtyGHDMvq0ViJqWpGVid5jYKjWJDkuqFnd032YjyfRZ5lHlV+C
   clh4edNzE6qyJtDqZkaT2dcQQsGCfNF13E2uzWMx9+Q2i4BLIDgarcREJ
   8keyv8tyJeUnvQqA3qDOL94TaLgQEe+0ZBXkhgqWD+Nawg+OaOmrsAuBM
   G5cxIRx5qUjpGaFTUBshptPetIUu7o1EZU+o5rqGPK3JI8kx9mxm5K682
   etje4xqPrMcS8Zqh6U9E6zQnEu9UTxRm1cqLgaXYYxjRfoEaAkFpC4ffr
   JzBSeU3ukLw35ZFazzeHelsANKNGiBGig7Et75D9J89wGhdrfhbiwMJOv
   w==;
X-CSE-ConnectionGUID: sDq81Dw6SoORTJ6Apqob5Q==
X-CSE-MsgGUID: a1zBYzQlQfujmPCwmp6Jug==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11633302"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="11633302"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 16:28:44 -0700
X-CSE-ConnectionGUID: w51foNSySwS10xBu0Tifgw==
X-CSE-MsgGUID: tWJ9e8XRQ0yiECzRIaYvWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="34677797"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 May 2024 16:28:43 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6IcS-0009IB-2e;
	Sun, 12 May 2024 23:28:40 +0000
Date: Mon, 13 May 2024 07:27:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.9-netnext 17/17]
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c:640:5: error: conflicting
 types for 'mtk_eth_offload_init'; have 'int(struct mtk_eth *)'
Message-ID: <202405130737.F7f2KWfk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.9-netnext
head:   9469b2a45f7e136361cc2a3ff84b2689e7517611
commit: 9469b2a45f7e136361cc2a3ff84b2689e7517611 [17/17] net: ethernet: mtk_eth_soc: ppe: add support for multiple PPEs
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240513/202405130737.F7f2KWfk-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240513/202405130737.F7f2KWfk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405130737.F7f2KWfk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_ppe_offload.c:640:5: error: conflicting types for 'mtk_eth_offload_init'; have 'int(struct mtk_eth *)'
     640 | int mtk_eth_offload_init(struct mtk_eth *eth)
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/mediatek/mtk_ppe_offload.c:13:
   drivers/net/ethernet/mediatek/mtk_eth_soc.h:1540:5: note: previous declaration of 'mtk_eth_offload_init' with type 'int(struct mtk_eth *, u8)' {aka 'int(struct mtk_eth *, unsigned char)'}
    1540 | int mtk_eth_offload_init(struct mtk_eth *eth, u8 id);
         |     ^~~~~~~~~~~~~~~~~~~~


vim +640 drivers/net/ethernet/mediatek/mtk_ppe_offload.c

502e84e2382d92 Felix Fietkau 2021-03-24  639  
502e84e2382d92 Felix Fietkau 2021-03-24 @640  int mtk_eth_offload_init(struct mtk_eth *eth)

:::::: The code at line 640 was first introduced by commit
:::::: 502e84e2382d92654a2ecbc52cdbdb5a11cdcec7 net: ethernet: mtk_eth_soc: add flow offloading support

:::::: TO: Felix Fietkau <nbd@nbd.name>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
