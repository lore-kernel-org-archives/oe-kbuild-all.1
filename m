Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A22546B9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 03:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMIez4ty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700276667; x=1731812667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Aab+QjyaS16iXiY+4VkheyrQZ36sEnDs6oPmkqtcTZw=;
  b=SMIez4tyKX8eTQrVRLbxyKekYhomuYjuiHuB4kr7hO1FS1Bh0ZfRrEto
   cdidptHo+uKwG1+zlm6uwl5We8hAExpywgFcTDaKZZhcuFOkvNUZWXbHR
   CRisToTk0WsNMck6LTJLwEA+4BhdItjJzGPi8FJUqRFj8pnKqypfTOp/a
   lazCr7BfyNAmr1vQfuW5m0uCSGXFZbtw7bbkyqX4POEQ3Va+Dv50UhLIT
   tI8q/v7nMvui/oiENeOfXjvKPjdBm9AW44Fgr6hV8la+OOCUyEd1NGLHf
   XxZ2EHKjZkqLHZA/2H+LorgD5U3UX3U212Kr8yOePOpckwc6BaWCfdNsK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="4552999"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="4552999"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 19:04:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="1097277639"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="1097277639"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 17 Nov 2023 19:04:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Bd0-0003Sx-11;
	Sat, 18 Nov 2023 03:04:18 +0000
Date: Sat, 18 Nov 2023 11:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:pr/21 8/10]
 drivers/net/ethernet/intel/idpf/idpf_txrx.h:1103:17: error: implicit
 declaration of function 'xdp_do_flush_map'; did you mean 'xdp_do_flush'?
Message-ID: <202311181036.fcwPTKHq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux pr/21
head:   17e2d4276ad07f26ea53c62f51094d0b388aabfb
commit: 182d94b17320b2a4dd20c84605816a1645a85290 [8/10] idpf: add support for XDP_REDIRECT
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231118/202311181036.fcwPTKHq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181036.fcwPTKHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181036.fcwPTKHq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/idpf/idpf.h:27,
                    from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
   drivers/net/ethernet/intel/idpf/idpf_txrx.h: In function 'idpf_finalize_xdp_rx':
>> drivers/net/ethernet/intel/idpf/idpf_txrx.h:1103:17: error: implicit declaration of function 'xdp_do_flush_map'; did you mean 'xdp_do_flush'? [-Werror=implicit-function-declaration]
    1103 |                 xdp_do_flush_map();
         |                 ^~~~~~~~~~~~~~~~
         |                 xdp_do_flush
   cc1: some warnings being treated as errors


vim +1103 drivers/net/ethernet/intel/idpf/idpf_txrx.h

  1090	
  1091	/**
  1092	 * idpf_finalize_xdp_rx - Bump XDP Tx tail and/or flush redirect map
  1093	 * @xdpq: XDP Tx queue
  1094	 * @xdp_act: Logical OR of flags of XDP actions that require finalization
  1095	 *
  1096	 * This function bumps XDP Tx tail and/or flush redirect map, and
  1097	 * should be called when a batch of packets has been processed in the
  1098	 * napi loop.
  1099	 */
  1100	static inline void idpf_finalize_xdp_rx(struct idpf_queue *xdpq, u32 xdp_act)
  1101	{
  1102		if (xdp_act & IDPF_XDP_ACT_FINALIZE_REDIR)
> 1103			xdp_do_flush_map();
  1104		if (xdp_act & IDPF_XDP_ACT_FINALIZE_TX) {
  1105			idpf_set_rs_bit(xdpq);
  1106			idpf_xdpq_update_tail(xdpq);
  1107		}
  1108	}
  1109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
