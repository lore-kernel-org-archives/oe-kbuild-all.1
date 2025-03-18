Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F63157E6B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Mar 2025 10:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292624; cv=none; b=AbMDTYbPr+5UNgJbBT0s2LjJwXk58aKpjtqKprm17crqecV1PSJSpykh2N6O5ugpNn/Fk6sH2Ix/QirMBa4PuChEUqoEWRF/mrxpDr+cv2DQtLpflkpitdds82cRs6Szkr0+T6PEDFzQmxoAKn9luHsLWrZ2T0Ehg5ezkvbFweQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292624; c=relaxed/simple;
	bh=KA9EW6lgmgDiJqWF/iEa4ri7QJ4gu2mD+eL+0a+ao4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKp7hGyZRTVd3E1IpoTsHFN/Oa6nI+DVwF4/jCCVSeJzdJjqAxxtt10qRXkkDFmOhHo/jHesEHUF4Tsfk7AFEONOt7K6YiRl6pqZ68XzX9C+L2SnLuR+f+pbvfIcaPvNgaEWJw9t12N4J+mnZImNqKMXY+JIAQLYjwFMjx4n9/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6CtcczS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6CtcczS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742292623; x=1773828623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KA9EW6lgmgDiJqWF/iEa4ri7QJ4gu2mD+eL+0a+ao4s=;
  b=j6CtcczSfplkrsHe29QQZYB4yeUOs0yN3PRsr8QqyK/v+L5Es3mWYzXB
   ncpKhejtzK7/93Cb5L2uNiSC9DklL0xeXp/SqTkUxOTMSgTLCaWVUlA01
   4zCbaaA1qyE2EtIhaw8rPnBU/D1KNsQ+dfMkPm8ReT0otwbm9xDcLzU0T
   K8Oxg/jI7MjP8b1Zy+vpGtuZCFwrdpGlllYUL+Y+UKzjq2lzJlL6eQYJw
   Gvfo9USjuzXfuPDS/t+FBMPJqDrPU30GLs0IkEO55oBQ2GLeemeKyIeGg
   jXU1B6LJL40zVS16R2E7Cldp6jkWBwpwzlwtOvI1/Ttu2oQp/xYq9BAB6
   Q==;
X-CSE-ConnectionGUID: vTCbfSPaQUyoucLt7tI3Ag==
X-CSE-MsgGUID: e+es5vK2TbyLulGNCLxRYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="68777075"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="68777075"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 03:10:22 -0700
X-CSE-ConnectionGUID: 0I35za4BRoiweHBUXFOM/A==
X-CSE-MsgGUID: kOUOFvHhTFGVuhDNZic0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; 
   d="scan'208";a="145396801"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2025 03:10:21 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuTtr-000Des-05;
	Tue, 18 Mar 2025 10:10:19 +0000
Date: Tue, 18 Mar 2025 18:09:29 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Kubiak <michal.kubiak@intel.com>
Subject: [alobakin:libeth 14/16]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:3173:1: warning: 'static' is not
 at beginning of declaration
Message-ID: <202503181707.GJ4PGu7C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux libeth
head:   d30f2a7c2cffda9961eef59b3d87fce758cb4446
commit: bcf748d4002122d24097ef1f29f5f827066b6461 [14/16] idpf: add support for XDP on Rx
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20250318/202503181707.GJ4PGu7C-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503181707.GJ4PGu7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503181707.GJ4PGu7C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3173:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    LIBETH_XDP_DEFINE_RUN(static idpf_xdp_run_pass, idpf_xdp_run_prog,
    ^~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/intel/idpf/xdp.h:7:0,
                    from drivers/net/ethernet/intel/idpf/idpf_txrx.c:6:
>> include/net/libeth/xdp.h:1642:42: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    name(struct libeth_xdp_buff *xdp, struct libeth_xdp_tx_bulk *bq)       \
                                             ^
   include/net/libeth/xdp.h:1639:7: note: in expansion of macro '__LIBETH_XDP_DEFINE_RUN_PROG'
     bool __LIBETH_XDP_DEFINE_RUN_PROG(name, flush, xdp)
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/xdp.h:1676:2: note: in expansion of macro 'LIBETH_XDP_DEFINE_RUN_PROG'
     LIBETH_##pfx##_DEFINE_RUN_PROG(static run, flush);        \
     ^~~~~~~
   include/net/libeth/xdp.h:1673:2: note: in expansion of macro '__LIBETH_XDP_DEFINE_RUN'
     __LIBETH_XDP_DEFINE_RUN(name, run, flush, populate, XDP)
     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:3173:1: note: in expansion of macro 'LIBETH_XDP_DEFINE_RUN'
    LIBETH_XDP_DEFINE_RUN(static idpf_xdp_run_pass, idpf_xdp_run_prog,
    ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.c:3175:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
    LIBETH_XDP_DEFINE_FINALIZE(static idpf_xdp_finalize_rx, idpf_xdp_tx_flush_bulk,
    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/static +3173 drivers/net/ethernet/intel/idpf/idpf_txrx.c

  3171	
  3172	LIBETH_XDP_DEFINE_START();
> 3173	LIBETH_XDP_DEFINE_RUN(static idpf_xdp_run_pass, idpf_xdp_run_prog,
  3174			      idpf_xdp_tx_flush_bulk, idpf_rx_process_skb_fields);
  3175	LIBETH_XDP_DEFINE_FINALIZE(static idpf_xdp_finalize_rx, idpf_xdp_tx_flush_bulk,
  3176				   idpf_xdp_tx_finalize);
  3177	LIBETH_XDP_DEFINE_END();
  3178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
