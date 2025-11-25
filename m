Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8ADCA5A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078838; cv=none; b=U65/EM7mujuUAVdNH7kNMnnSs1fOC2BcGlDCsoqWPX1R0COykl3/dEe8RQ6v7+Pt5IlX7P03aRCYtgOoJItxDeRnPGb30STRTd+38Yaeid0Uk94NdJfaG/sHGLXIV5T7rqJGmg8EHrBsoKbk2djgLoTCkmxY92UrfVMzklcijsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078838; c=relaxed/simple;
	bh=7/zs6ZC7xAPXhvXvFECYWNGviFgbRzMxAgFDHGfhTgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g8J0IwLcdNFFIg744gxpiLuHBzIZHGxz3TAO9rN+Tkp2w0lYYZ27aIbZOayzluzYCkuhDBgGzCycBRqW7Kk7bxUW9xfBSWt0Re6IbYsvoMuVrj648ta0b1QOOZUZrt6QgyjYevYwOUQTnoGT4sUPx2lQ0v6WAdZAMl2OJ+MxHAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGZRzMFN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGZRzMFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764078837; x=1795614837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7/zs6ZC7xAPXhvXvFECYWNGviFgbRzMxAgFDHGfhTgQ=;
  b=KGZRzMFNsny5Ktihw1SDZzHG5XhlJyJrFsDfzB/ynthUPkPU/1kV8Qhg
   EvStrNS1+wMOYCZeXMykU3nk40FzNrUACMRVk/Y5E24bw354ksf3kjYCk
   YZ1mLFn0XQaY/hGETvBk6mkyG0Lx3a2rRCPOM4zJZljsbwyOXnqA6mdZU
   y5Vk5ErUNjKOH9DWjRp0dR68LF2cC3aXNaGETiC2SX06G3ue8XFxm1hNg
   0Nv7GNgif0SwnB9OeL0R14AJ4DHSNONU7U3YjmW5oMt9rBz/ggqKq+mQF
   +/BH/XkU0d65AZwefjKHcjmnjvBi2rSOYobqDqdFMzNEwL3DbFR+ClH2U
   Q==;
X-CSE-ConnectionGUID: PGW5i8fqSX2rKkSlpk5Pdw==
X-CSE-MsgGUID: 8r3eOpWlR/616w263HGALg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65802474"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="65802474"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 05:53:49 -0800
X-CSE-ConnectionGUID: /qM3NuomRp+riJGeGF1c8A==
X-CSE-MsgGUID: 1vFy4RlnTXu4GRArsZfpCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="215991424"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2025 05:53:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNtUG-000000001qX-45Qe;
	Tue, 25 Nov 2025 13:53:44 +0000
Date: Tue, 25 Nov 2025 21:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1]
 drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c:718:13: error: variable
 '_wqe_num' set but not used
Message-ID: <202511252130.W71CwEGz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Steven,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   b17ac1b8b619f685007233e0a43f915bbd5d194c
commit: 3f63e55de387ff1ef9405747ecd67ea49dd18ed9 [1/1] Net: ethernet: Support 3snic 3s9xx network card
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20251125/202511252130.W71CwEGz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511252130.W71CwEGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511252130.W71CwEGz-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c: In function 'sss_nic_recv_one_packet':
>> drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c:718:13: error: variable '_wqe_num' set but not used [-Werror=unused-but-set-variable]
     718 |         u16 _wqe_num = 1; \
         |             ^~~~~~~~
   drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c:805:9: note: in expansion of macro 'sss_nic_bpf_prog_run_xdp'
     805 |         sss_nic_bpf_prog_run_xdp(rq_desc, pkt_len, &xdp_result);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/_wqe_num +718 drivers/net/ethernet/3snic/sssnic/nic/sss_nic_rx.c

   712	
   713	#define sss_nic_bpf_prog_run_xdp(rq_desc, pkt_size, result)	\
   714	do { \
   715		struct bpf_prog *xdp_prog = NULL; \
   716		struct sss_nic_rx_desc *rx_desc = NULL; \
   717		struct xdp_buff xdp; \
 > 718		u16 _wqe_num = 1; \
   719		u8 *_data = NULL; \
   720		u32 _ret; \
   721	\
   722		rcu_read_lock(); \
   723	\
   724		xdp_prog = READ_ONCE((rq_desc)->xdp_prog); \
   725		if (!xdp_prog) { \
   726			*(result) = SSSNIC_XDP_PKT_PASS; \
   727		} else if (unlikely((pkt_size) > (rq_desc)->buf_len)) { \
   728			SSSNIC_RQ_STATS_INC((rq_desc), large_xdp_pkts); \
   729			_wqe_num = (u16)((pkt_size) >> (rq_desc)->buff_size_shift) + \
   730				  (((pkt_size) & ((rq_desc)->buf_len - 1)) ? 1 : 0); \
   731			SSSNIC_RQ_STATS_INC((rq_desc), xdp_dropped); \
   732			sss_nic_xdp_update_rx_info((rq_desc), _wqe_num); \
   733			*(result) = SSSNIC_XDP_PKT_DROP; \
   734		} else { \
   735			rx_desc = &(rq_desc)->rx_desc_group[(rq_desc)->ci & (rq_desc)->qid_mask]; \
   736			_data = (u8 *)page_address(rx_desc->page) + rx_desc->page_offset; \
   737			prefetch(_data); \
   738			dma_sync_single_range_for_cpu((rq_desc)->dev, rx_desc->buf_daddr, \
   739						      rx_desc->page_offset, (rq_desc)->buf_len, \
   740						      DMA_FROM_DEVICE); \
   741			xdp.data = _data; \
   742			xdp.data_hard_start = xdp.data; \
   743			xdp.data_end = xdp.data + (pkt_size); \
   744			SSSNIC_SET_XDP_FRAME_SZ(&xdp, (rq_desc)->buf_len); \
   745			SSSNIC_XDP_SET_DATA_META_INVALID(&xdp); \
   746			prefetchw(xdp.data_hard_start); \
   747	\
   748			_ret = bpf_prog_run_xdp(xdp_prog, &xdp); \
   749			if (_ret == XDP_PASS) { \
   750				*(result) = SSSNIC_XDP_PKT_PASS; \
   751			} else { \
   752				*(result) = SSSNIC_XDP_PKT_DROP; \
   753				if (_ret != XDP_DROP) { \
   754					SSSNIC_BDF_WARN_INVALID_XDP_ACTION((rq_desc)->netdev, \
   755						xdp_prog, _ret); \
   756				} \
   757				SSSNIC_RQ_STATS_INC((rq_desc), xdp_dropped); \
   758				sss_nic_xdp_update_rx_info((rq_desc), _wqe_num); \
   759			} \
   760		} \
   761	\
   762		rcu_read_unlock(); \
   763	} while (0)
   764	#endif
   765	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
