Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40D01429E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714814486; cv=none; b=H/BOHfa6YkWGaXlGCWkoVFL9TnjoWR0h53lsTZVGe/wqyptC+VsEPZJGQs6cKWyMT9uuvX99outxgZC5Hq8CN2nXPeDT+nbwtQDpKKqf2hPwSiVPf2S4vmdoZyg6A7cr2Ibo9Rhmsgop8k17n8GJ/ZnbAI1zVGt/p9J0kLb2Vnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714814486; c=relaxed/simple;
	bh=cjxnIGnBc86jxKqJ9wdFLc89cWJpjB6nsMWNN8SVWSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZU5zeYtIagBx1FTtu+FvLgDU7X/2STQaT0uSG43xfzynqUS0x+VTVYaBRmz55nc9ySBIhRi3Fz44UMER2b4W2CJ693BjTSe7UE1pLOK5DLANLlstU4f6kt8xn9A1nKoh76Vtm/4Bg+P3HzkFaYhWzPhD6HJhCIfXOk9SW/BAI54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TrXPVsIz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TrXPVsIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714814485; x=1746350485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjxnIGnBc86jxKqJ9wdFLc89cWJpjB6nsMWNN8SVWSg=;
  b=TrXPVsIzc8oW/2iy3w/oYa7GAgdLy1LxI7toTsj5iJPe27pJNA0ECznt
   zQAYgaE/JENERsekRAuCj/oIDYfvRYOz4mDIy/g5tJ10/0P1ZSBeJkFO6
   1phsj9ZktLswfD7B4tBRQDUasACXwqAuMdqL9BOSgcOEFog2W6nAaqHey
   X4o+Eqv9+LJ5hDJTS8YsJ9/mLGR1L9gI6bs2meg2PGp658a/C3NkMq0iF
   eupnxTVTp9KE486Co4paCmHsOzsJrndYshNhp5pGwyHnYr5z2ZrsDdx3U
   DFHalgE8w4VTBAO7kviFAmrnIipB3ztthsCX1GDkE8bOPz2E5zZqfly/7
   g==;
X-CSE-ConnectionGUID: Gx8o0HNyRsC5vJoI7MB+uA==
X-CSE-MsgGUID: 4vKWCJ/3Tx+X4yBUnaas7A==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="22032530"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="22032530"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 02:21:24 -0700
X-CSE-ConnectionGUID: Z0MQD0idRZOIRJ7vgCRwfQ==
X-CSE-MsgGUID: s085B9fxSCCAsOg5JLsBsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="27789069"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 May 2024 02:21:22 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3Ba4-000Cc8-1k;
	Sat, 04 May 2024 09:21:20 +0000
Date: Sat, 4 May 2024 17:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 12/45]
 drivers/net/ethernet/mediatek/mtk_wed.c:86:23: error: invalid application of
 'sizeof' to an incomplete type 'struct mtk_wed_bm_desc'
Message-ID: <202405041726.zEbvkXJU-lkp@intel.com>
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
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240504/202405041726.zEbvkXJU-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041726.zEbvkXJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041726.zEbvkXJU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_wed.c:86:23: error: invalid application of 'sizeof' to an incomplete type 'struct mtk_wed_bm_desc'
      86 |         .tx_ring_desc_size = sizeof(struct mtk_wed_bm_desc),
         |                              ^     ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mediatek/mtk_wed.c:86:37: note: forward declaration of 'struct mtk_wed_bm_desc'
      86 |         .tx_ring_desc_size = sizeof(struct mtk_wed_bm_desc),
         |                                            ^
   1 error generated.


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
