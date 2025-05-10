Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD7F158DAC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 02:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746845910; cv=none; b=osXtN3P/G+qIlKh7W3zgQHtAj8l5uEYkw+UZGe3wXpx1iMYyaagKEwaRRa/eMpnxuCVbIuv4bkGieztfYY5ihxKX5Oj5tHjFw6TG6B1wV4qGPxty0K0Ufk+9oOclikVbosYVI1GTlCft0z4V2yxO70EAN2Pqkx6UTge2khY4jGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746845910; c=relaxed/simple;
	bh=efdwOOEYkUTF0yk9SB/oj4uh+bsHyqF/06l7OWqjOBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iGkOPzIi5HX4OfwkEEE//VSkDBPphSi0IJGGE6QB7WsxZSnSJmSBlEiW2cNkkmrYA87y0EbI4+Gj7IHaxxY4W96Ji0XiIX6mxpceD90GLhV8sx6K2KpXVgNx75lWMsmSNYL/Tu1OrgkkV45rjyBdnZZ4Rxy82SEquFKWrFRUa2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mf1dOSVK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mf1dOSVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746845908; x=1778381908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=efdwOOEYkUTF0yk9SB/oj4uh+bsHyqF/06l7OWqjOBo=;
  b=Mf1dOSVKYaHi7/UFNj0vxuecnY+naH2fWvv5XzM+hTh/LbWB7NvpsPe8
   5zZ1LHesiwZh2qdwpWaRUYH6ua/Rgnnqb5fu+o/OB/j4lZlti0Nq9Bna0
   Zkb/ognbYl2Qv2iE8dzs0HQUTBfqpmSQXgaymQstsOxbI361rWlIowhET
   GlOr8KOlowcSuSsXtsQdiCKnadd/jOFPgaQOjRY7TRPtjCKf+OvtCTWA/
   8HtGhlT4Gcfb6yQtlM2MRFqHEhtDvpLBTLOo9b6+pZ1k+5blymAeIrTiB
   nPk9MnU0cfpa9/E4DBhj95EnofTLd6CAOdI5OfOxMw+g5FoLLCxvRPvWf
   A==;
X-CSE-ConnectionGUID: ht/WFv5oS8WNbFkJx9XKIw==
X-CSE-MsgGUID: T6GlH4FyR9Cw9nolAFR2fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58910959"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="58910959"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 19:58:27 -0700
X-CSE-ConnectionGUID: j/Kls0ZHQZisdimLc9SDfg==
X-CSE-MsgGUID: 2T2MhLrVQ/WLNH/r/tR5vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137183890"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2025 19:58:26 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDaPw-000Cip-0U;
	Sat, 10 May 2025 02:58:24 +0000
Date: Sat, 10 May 2025 10:57:51 +0800
From: kernel test robot <lkp@intel.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [netdev-net-next:main 4/35]
 drivers/net/ethernet/freescale/enetc/ntmp.c:203:38: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202505101047.NTMcerZE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   0b28182c73a3d013bcabbb890dc1070a8388f55a
commit: 4701073c3debd16d7f534f3eb808bd9b50601c0c [4/35] net: enetc: add initial netc-lib driver to support NTMP
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250510/202505101047.NTMcerZE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101047.NTMcerZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101047.NTMcerZE-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/freescale/enetc/ntmp.c: In function 'ntmp_fill_request_hdr':
>> drivers/net/ethernet/freescale/enetc/ntmp.c:203:38: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     203 |         cbd->req_hdr.access_method = FIELD_PREP(NTMP_ACCESS_METHOD,
         |                                      ^~~~~~~~~~


vim +/FIELD_PREP +203 drivers/net/ethernet/freescale/enetc/ntmp.c

   191	
   192	static void ntmp_fill_request_hdr(union netc_cbd *cbd, dma_addr_t dma,
   193					  int len, int table_id, int cmd,
   194					  int access_method)
   195	{
   196		dma_addr_t dma_align;
   197	
   198		memset(cbd, 0, sizeof(*cbd));
   199		dma_align = ALIGN(dma, NTMP_DATA_ADDR_ALIGN);
   200		cbd->req_hdr.addr = cpu_to_le64(dma_align);
   201		cbd->req_hdr.len = cpu_to_le32(len);
   202		cbd->req_hdr.cmd = cmd;
 > 203		cbd->req_hdr.access_method = FIELD_PREP(NTMP_ACCESS_METHOD,
   204							access_method);
   205		cbd->req_hdr.table_id = table_id;
   206		cbd->req_hdr.ver_cci_rr = FIELD_PREP(NTMP_HDR_VERSION,
   207						     NTMP_HDR_VER2);
   208		/* For NTMP version 2.0 or later version */
   209		cbd->req_hdr.npf = cpu_to_le32(NTMP_NPF);
   210	}
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
