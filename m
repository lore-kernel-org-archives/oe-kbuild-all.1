Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E1B4C61
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Mar 2024 02:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710556656; cv=none; b=tT7R6t3BkikseSga/u0wve++3kHHo9LCTquzg3EmbeNH3kcsytwrAAHiFdIamAC0IiGNRSQE3VL3ItlQG3Q1l7rHM8ulD9yjBCGAYFyQiVxXGdEia7HEa9Vd6O9kPEiS3cPchpGUr2JvsyZ1+JA3zxE5E5Fr3hsNDJCpmWXnIEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710556656; c=relaxed/simple;
	bh=NE06DapD3dQ2kS7cRxSejDRq+KS9hkmEoWzTYhkDwoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IAwWzpH3wv6zOslY0WmkBEEm1Kgq/0OJ4ZBC2QCcW4K2TYIqCjg80mIRPju2qEF2W8Mtm1Duyid6bdrAb5MxSZgt8PdpgBG9ByZkg9XToDdAWLwYruHchYb7bCEHYV+o2CnnPM3Q9n0YAFZsM1QSiu8rBtltv6GAFaoydRDs12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdC7ZDWR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdC7ZDWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710556654; x=1742092654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NE06DapD3dQ2kS7cRxSejDRq+KS9hkmEoWzTYhkDwoA=;
  b=mdC7ZDWRksym1cTm9YaqC1v9t86He2fWGQrC5ke+8OHjMr5jOXsPsLBB
   jCZVjASW/B4bFttbp8bEOtEbJklfGAmmQ2fIyUH99p+BCdf67iuPu/Jl6
   KiKvNvYNcuXs51pJ9taoSl7v+fQexqrEj9IIQGdkM8/AcsFB+x2JLc/p5
   YT05kV0/mFSr0ZEm2F3Uu/fsn3VMsjPpCat71H1OjRK26ETqhrykMUFX1
   axlEnIgvd7elSDLAdOM6mW6Nwwqa0OPr0kE3epgw1/SG+1JLx/mXEBs3i
   RdxpMIbTsnjCf6/gRiQ1apCdx3fy/vZO0VRrOKDBZofvRvC8IS6INAcJo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="22908418"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="22908418"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 19:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="17468126"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Mar 2024 19:37:32 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlJvN-000Ezh-2T;
	Sat, 16 Mar 2024 02:37:29 +0000
Date: Sat, 16 Mar 2024 10:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Kubiak <michal.kubiak@intel.com>
Subject: [alobakin:idpf-libie-new 55/62]
 drivers/net/ethernet/intel/idpf/idpf_xdp.c:355:1: warning: 'static' is not
 at beginning of declaration
Message-ID: <202403161044.DCwNsGE9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   ee7739a57a467726ba72f74079f3824a6becfa28
commit: 08c6c11b5697262c9a3edda21f01198099a4aea7 [55/62] idpf: add support for XDP on Rx
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240316/202403161044.DCwNsGE9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161044.DCwNsGE9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403161044.DCwNsGE9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_xdp.c:355:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     355 | LIBETH_XDP_DEFINE_TIMER(static idpf_xdp_tx_timer, idpf_clean_xdp_irq);
         | ^~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3247:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    3247 | LIBETH_XDP_DEFINE_RUN(static idpf_xdp_run_pass, idpf_xdp_run_prog,
         | ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/idpf/idpf_xdp.h:7,
                    from drivers/net/ethernet/intel/idpf/idpf_txrx.c:6:
>> include/net/libeth/xdp.h:917:42: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     917 | name(struct libeth_xdp_buff *xdp, struct libeth_xdp_tx_bulk *bq)             \
         |                                          ^~~~~~~~~~~~~~~~~~
   include/net/libeth/xdp.h:922:14: note: in expansion of macro '__LIBETH_XDP_DEFINE_RUN_PROG'
     922 |         bool __LIBETH_XDP_DEFINE_RUN_PROG(name, flush, xdp)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/xdp.h:936:9: note: in expansion of macro 'LIBETH_XDP_DEFINE_RUN_PROG'
     936 |         LIBETH_##pfx##_DEFINE_RUN_PROG(static run, flush);                   \
         |         ^~~~~~~
   include/net/libeth/xdp.h:939:9: note: in expansion of macro '__LIBETH_XDP_DEFINE_RUN'
     939 |         __LIBETH_XDP_DEFINE_RUN(name, run, flush, populate, XDP)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:3247:1: note: in expansion of macro 'LIBETH_XDP_DEFINE_RUN'
    3247 | LIBETH_XDP_DEFINE_RUN(static idpf_xdp_run_pass, idpf_xdp_run_prog,
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:3249:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    3249 | LIBETH_XDP_DEFINE_FINALIZE(static idpf_xdp_finalize_rx, idpf_xdp_tx_flush_bulk,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/static +355 drivers/net/ethernet/intel/idpf/idpf_xdp.c

   354	
 > 355	LIBETH_XDP_DEFINE_TIMER(static idpf_xdp_tx_timer, idpf_clean_xdp_irq);
   356	LIBETH_XDP_DEFINE_FLUSH_TX(idpf_xdp_tx_flush_bulk, idpf_xdp_tx_prep,
   357				   idpf_xdp_tx_xmit);
   358	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
