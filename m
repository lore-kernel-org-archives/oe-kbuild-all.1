Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5A4C9F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 07:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714808184; cv=none; b=mVaHzSHKRS9NWN/YW/EdrW8loyg4eLAGhs1qfwexjz2w0uMjb0GEif6bHefn4aPufr1GVbKtgoylDS/uQgka8CjT/VOnKw0LUnHPcaMBAeSEsgYk+8QWICgmJAmiPLw5JSE0+y4QSRLppkqkcS3tJXI6+4glL6MKbyRnfhCCCI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714808184; c=relaxed/simple;
	bh=/Ld3DXZNWbJ4+AkgqT74LYfzYWuHqB73lr0LBuW0hOU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oD5iINrIWtkQ5YSPHOsXhGHkYMfrOh8zsc0pEvXIVH9dm2ohvVztZmCOWGWqYFe9ukPH6TkI+WBcFGEvvlfbBlF0LYgvyaNnrVvGpxVm6t90eXc11LaKIxY1qyexnDb8lx2uWRMfADKbt/lz/VNgwvoZU3pFfrkiSYTt4m+FHQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KHJao4qD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KHJao4qD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714808182; x=1746344182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Ld3DXZNWbJ4+AkgqT74LYfzYWuHqB73lr0LBuW0hOU=;
  b=KHJao4qDBWEjo7oernzb1sfBHPvFxI3oYrGIen63wUhXKapmu5nW9WwQ
   k/6lP31JZbzkxef3vat1Kjg8uD9j1+sogmXACXhLCteXzdIhTSYgsGiQX
   lCX9fLJnuALpcJKuEcKBNAztC5tfVAAUZh9cVxSuFRKUh18Z/Q/+kIK9O
   VdJDhmm4AmhoLWKByxQLMCjwE3nG59PLM4V8W4Cr72YBlzJT21+DScWEd
   N4GzLGwLZo61sJq+dfWMqCuEMDMU0GlxFtif0xp1tEaEHLuuxikMLRPJY
   RWIVDowkQ7nxQ4Ec3z+nmMxfslEiQmlj4d/5F8Qe73NZSo2lCuUnWSQOg
   g==;
X-CSE-ConnectionGUID: H4dsPlmETjSXYiFhV/t38Q==
X-CSE-MsgGUID: aVRPgnxeQAuzfiItg7LROQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10468629"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="10468629"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 00:36:21 -0700
X-CSE-ConnectionGUID: cipglMuRR527mbB1vjFPkA==
X-CSE-MsgGUID: 8bUW9DssRBm6lFuhNITPYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="28248615"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 May 2024 00:36:20 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s39wQ-000CXw-0o;
	Sat, 04 May 2024 07:36:18 +0000
Date: Sat, 4 May 2024 15:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 12/45]
 drivers/net/ethernet/mediatek/mtk_wed.c:86:37: error: invalid application of
 'sizeof' to incomplete type 'struct mtk_wed_bm_desc'
Message-ID: <202405041544.QdbG2Wmy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   ba7101f72dd4f7ecfae7894a8aba538755b2b1d8
commit: bb5cac7be66a8ca1fb8321d3d7d09f5fb234f6ca [12/45] UPSTREAM: net: ethernet: mtk_wed: introduce WED support for MT7988
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405041544.QdbG2Wmy-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041544.QdbG2Wmy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041544.QdbG2Wmy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_wed.c:86:37: error: invalid application of 'sizeof' to incomplete type 'struct mtk_wed_bm_desc'
      86 |         .tx_ring_desc_size = sizeof(struct mtk_wed_bm_desc),
         |                                     ^~~~~~


vim +86 drivers/net/ethernet/mediatek/mtk_wed.c

    78	
    79	static const struct mtk_wed_soc_data mt7988_data = {
    80		.regmap = {
    81			.tx_bm_tkid		= 0x0c8,
    82			.wpdma_rx_ring0		= 0x7d0,
    83			.reset_idx_tx_mask	= GENMASK(1, 0),
    84			.reset_idx_rx_mask	= GENMASK(7, 6),
    85		},
  > 86		.tx_ring_desc_size = sizeof(struct mtk_wed_bm_desc),
    87		.wdma_desc_size = 2 * sizeof(struct mtk_wdma_desc),
    88	};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
