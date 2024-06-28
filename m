Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EB714A82
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 03:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719544363; cv=none; b=cV0hkDFboLW8mgCg+iumMFRnXtkXjgyiD2m4BcetN6ghpdqJ/eAiWAoSI/ezN/mEPKENMY7o4ExRvsOOY3O3Y5FsFIIpbcDHY9VRJShaBVVjoFxV/g00XABOJC4qGzjxV+h5jtmaVfG3a/IUZNrncVs7GExidxgmn46deAr1JuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719544363; c=relaxed/simple;
	bh=1IUiEfV3lAL1ruYALme9i7fUmT03alGKGQ1wa0Eanj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a/ajjIcp3wm361OMNBryqtkBshSXgBJ69QSBrTNJ1N3MfKyq3PSs8QncJjWUhjJMWE/L7gXJoiKl5ZdEHO6A6L2pgxg9XaENuAXjhHJxefcE+SgFmxoOAoQHC512wwFlho9kt8Ljdft1h2+w2L7GHrFYCS6slQ0tIGdY3S8PfcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjA1JcHP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjA1JcHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719544361; x=1751080361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1IUiEfV3lAL1ruYALme9i7fUmT03alGKGQ1wa0Eanj0=;
  b=IjA1JcHPPpyXyOcPdz3ysp6AHgu6k3n6wsO+deJegyUGNVTD7PzzX8te
   8cL6kEUZYNQX+Fm1V/CPVQ1xoG9dyjVj59j2DhzLXjXoTYij+bBwegOiJ
   +eUK3vazp8jRQ12otmsIkTjXIuV0k+NNoIGr2A+ly67EBwO76BYR0eWnD
   HGHzdKeoRjgUkL9jkDXqHlGITPj5nMSNLk4DbodzxDcB6gVJfrtispUG0
   DzMfpO5UFRfCsL1t5CCa41ItftI+Rtbo87XYcXNI558dpNK6Cd2LuE65E
   kBdYvNrd1UP/cWJVqQ+PSQIfVGDylx3UN8vhFgpzBwb2PgWOcpOfrC/yO
   w==;
X-CSE-ConnectionGUID: VrQgmXwCR6aSGFCPF7hfAQ==
X-CSE-MsgGUID: d1RxignHQkm7mKgjaxAjxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="19612028"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="19612028"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 20:12:41 -0700
X-CSE-ConnectionGUID: bx8lOq+MSZiiL0UdKR9cuQ==
X-CSE-MsgGUID: DkBaUEI8Qjm735A9/xSKUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="44689549"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2024 20:12:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN22P-000Gkq-1m;
	Fri, 28 Jun 2024 03:12:37 +0000
Date: Fri, 28 Jun 2024 11:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Roger Quadros <rogerq@kernel.org>
Subject: [rogerq:b4/am65-cpsw-multi-rx-2.0 2/8]
 drivers/net/ethernet/ti/am65-cpsw-nuss.c:1038:34: warning: variable 'rx_chn'
 set but not used
Message-ID: <202406281135.bhPBGfLj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rogerq/linux b4/am65-cpsw-multi-rx-2.0
head:   3d9c49054ad968c08869454695cfcea16c17eced
commit: f0b23508592f67ef8de01e3b6b2b0d0b380d3c93 [2/8] net: ethernet: ti: am65-cpsw: Introduce multi queue Rx
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240628/202406281135.bhPBGfLj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281135.bhPBGfLj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281135.bhPBGfLj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/ti/am65-cpsw-nuss.c: In function 'am65_cpsw_run_xdp':
>> drivers/net/ethernet/ti/am65-cpsw-nuss.c:1038:34: warning: variable 'rx_chn' set but not used [-Wunused-but-set-variable]
    1038 |         struct am65_cpsw_rx_chn *rx_chn;
         |                                  ^~~~~~


vim +/rx_chn +1038 drivers/net/ethernet/ti/am65-cpsw-nuss.c

  1029	
  1030	static int am65_cpsw_run_xdp(struct am65_cpsw_rx_flow *flow,
  1031				     struct am65_cpsw_port *port,
  1032				     struct xdp_buff *xdp,
  1033				     int desc_idx, int cpu, int *len)
  1034	{
  1035		struct am65_cpsw_common *common = flow->common;
  1036		struct net_device *ndev = port->ndev;
  1037		int ret = AM65_CPSW_XDP_CONSUMED;
> 1038		struct am65_cpsw_rx_chn *rx_chn;
  1039		struct am65_cpsw_tx_chn *tx_chn;
  1040		struct netdev_queue *netif_txq;
  1041		struct xdp_frame *xdpf;
  1042		struct bpf_prog *prog;
  1043		struct page *page;
  1044		u32 act;
  1045	
  1046		rx_chn = &common->rx_chns;
  1047		prog = READ_ONCE(port->xdp_prog);
  1048		if (!prog)
  1049			return AM65_CPSW_XDP_PASS;
  1050	
  1051		act = bpf_prog_run_xdp(prog, xdp);
  1052		/* XDP prog might have changed packet data and boundaries */
  1053		*len = xdp->data_end - xdp->data;
  1054	
  1055		switch (act) {
  1056		case XDP_PASS:
  1057			ret = AM65_CPSW_XDP_PASS;
  1058			goto out;
  1059		case XDP_TX:
  1060			tx_chn = &common->tx_chns[cpu % AM65_CPSW_MAX_TX_QUEUES];
  1061			netif_txq = netdev_get_tx_queue(ndev, tx_chn->id);
  1062	
  1063			xdpf = xdp_convert_buff_to_frame(xdp);
  1064			if (unlikely(!xdpf))
  1065				break;
  1066	
  1067			__netif_tx_lock(netif_txq, cpu);
  1068			ret = am65_cpsw_xdp_tx_frame(ndev, tx_chn, xdpf,
  1069						     AM65_CPSW_TX_BUF_TYPE_XDP_TX);
  1070			__netif_tx_unlock(netif_txq);
  1071			if (ret)
  1072				break;
  1073	
  1074			ndev->stats.rx_bytes += *len;
  1075			ndev->stats.rx_packets++;
  1076			ret = AM65_CPSW_XDP_CONSUMED;
  1077			goto out;
  1078		case XDP_REDIRECT:
  1079			if (unlikely(xdp_do_redirect(ndev, xdp, prog)))
  1080				break;
  1081	
  1082			ndev->stats.rx_bytes += *len;
  1083			ndev->stats.rx_packets++;
  1084			ret = AM65_CPSW_XDP_REDIRECT;
  1085			goto out;
  1086		default:
  1087			bpf_warn_invalid_xdp_action(ndev, prog, act);
  1088			fallthrough;
  1089		case XDP_ABORTED:
  1090			trace_xdp_exception(ndev, prog, act);
  1091			fallthrough;
  1092		case XDP_DROP:
  1093			ndev->stats.rx_dropped++;
  1094		}
  1095	
  1096		page = virt_to_head_page(xdp->data);
  1097		am65_cpsw_put_page(flow, page, true, desc_idx);
  1098	
  1099	out:
  1100		return ret;
  1101	}
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
