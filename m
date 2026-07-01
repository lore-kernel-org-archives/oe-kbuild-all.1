Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624803947B5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 05:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884449; cv=none; b=ncyGK1gk/8xctFEmvSFe8Hs6ZyzzLJBIp8ZihYEQTrq9/fRXFSrqYVqjBEeLpSO6W7rDK5mpKlcTOu+Cj753Khqiab5Mf9QYBzyitJCfuavUawE7fa1E4vi7cvs+r3BeJ60CpLMDWF/gukP2zw+5wHacHKxAvqPg8EfkXtRGxAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884449; c=relaxed/simple;
	bh=253pPL5C12XiryvC3uMWjZpXZVPX4zu9JwvqgxbopzM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rS0CW4FnKcdTMZSfX7C2Y4fSAV6Ovnl3ADX+pC6fiDomPZKSPus09YeWlXj493TjuF5uAfGwh7g1POw0nzvdS8ti8FpMlSWqjEgykkLy4l09EENakJSzVzuLinqmdZIgDIq4ibCpHGxSWlrn89ZO9Gl32UOPxz1WCQTulYxHPdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzEcJ0Km; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzEcJ0Km"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782884442; x=1814420442;
  h=date:from:to:cc:subject:message-id;
  bh=253pPL5C12XiryvC3uMWjZpXZVPX4zu9JwvqgxbopzM=;
  b=nzEcJ0Kmq0mh+SA39Sjx/IBQ5XB71VfnRG7hemP2+cCbS2eE3SZZz5pn
   /srrHNKzZRc9oqS/fIgP/6XLtLTLp51R9qk6mVs9rtaQps1F+SIVFq5dk
   qsTe63+pkobamhjdaMfxXkoqdyxeCF6A2AJz3SSWq9+5BQtDVrqu1xX6A
   xwYBZtiiGlIZxCRR4Jl7y9CKo70uJ1r6ZnOQ/0sLir2HO9I8FILvwtIdL
   tId8Fvvxh9iV6x2U5s/FhCY+qRb+jqME5IF2MDBIDtHcPtB9Ubi5rR255
   6zZWhIlg0cFEEYslACLjAEPnhZKe3AwBk1ljhNgZFZ3oDY21G1nrMDwIv
   g==;
X-CSE-ConnectionGUID: 4Oj2SoW7RBqYuiuObsB41g==
X-CSE-MsgGUID: H7myrQ3yTuyqHHOei/Re/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83805029"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="83805029"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 22:40:33 -0700
X-CSE-ConnectionGUID: djqC+9mUTH+o+6znge5MwA==
X-CSE-MsgGUID: MZhudkX7RlO192k2oyfSDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="254382617"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Jun 2026 22:40:31 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wengT-000000000gJ-1qyR;
	Wed, 01 Jul 2026 05:40:29 +0000
Date: Wed, 01 Jul 2026 07:40:26 +0200
From: kernel test robot <lkp@intel.com>
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_txrx_lib.c:618:44: error:
 request for member 'wb' in something not a structure or union
Message-ID: <202607010724.hsXtxSGm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Vladimir-Vdovin/xdp-let-XDP-programs-assert-the-RX-checksum-over-redirect/20260701-032331
head:   346975980761957300c1f7931bbbf1d97df1d5e6
commit: ce9d0ecf93e84f1be1508b5741e4510dd3df4203 ice: support the rx_csum XDP metadata hint
date:   10 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260701/202607010724.hsXtxSGm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607010724.hsXtxSGm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607010724.hsXtxSGm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/x86/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/qrwlock_types.h:6,
                    from arch/x86/include/asm/spinlock_types.h:7,
                    from include/linux/spinlock_types_raw.h:7,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/atomic.h:7,
                    from include/linux/atomic.h:7,
                    from include/linux/filter.h:8,
                    from drivers/net/ethernet/intel/ice/ice_txrx_lib.c:4:
   drivers/net/ethernet/intel/ice/ice_txrx_lib.c: In function 'ice_xdp_rx_csum':
>> drivers/net/ethernet/intel/ice/ice_txrx_lib.c:618:44: warning: dereferencing 'void *' pointer
     618 |         status0 = le16_to_cpu(xdp_ext->desc->wb.status_error0);
         |                                            ^~
   include/uapi/linux/byteorder/little_endian.h:37:51: note: in definition of macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   drivers/net/ethernet/intel/ice/ice_txrx_lib.c:618:19: note: in expansion of macro 'le16_to_cpu'
     618 |         status0 = le16_to_cpu(xdp_ext->desc->wb.status_error0);
         |                   ^~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_txrx_lib.c:618:44: error: request for member 'wb' in something not a structure or union
     618 |         status0 = le16_to_cpu(xdp_ext->desc->wb.status_error0);
         |                                            ^~
   include/uapi/linux/byteorder/little_endian.h:37:51: note: in definition of macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   drivers/net/ethernet/intel/ice/ice_txrx_lib.c:618:19: note: in expansion of macro 'le16_to_cpu'
     618 |         status0 = le16_to_cpu(xdp_ext->desc->wb.status_error0);
         |                   ^~~~~~~~~~~


vim +/wb +618 drivers/net/ethernet/intel/ice/ice_txrx_lib.c

   596	
   597	/**
   598	 * ice_xdp_rx_csum - RX checksum XDP hint handler
   599	 * @ctx: XDP buff pointer
   600	 * @csum_status: destination for the checksum verdict
   601	 *
   602	 * Report whether the hardware validated the packet's L4 checksum, mirroring
   603	 * the verdict ice_rx_csum() uses for CHECKSUM_UNNECESSARY.  Return -ENODATA
   604	 * when RX checksum offload is disabled, since the status bits are not
   605	 * meaningful then.
   606	 */
   607	static int ice_xdp_rx_csum(const struct xdp_md *ctx,
   608				   enum xdp_csum_status *csum_status)
   609	{
   610		const struct libeth_xdp_buff *xdp_ext = (void *)ctx;
   611		struct ice_rx_ring *rx_ring;
   612		u16 status0;
   613	
   614		rx_ring = libeth_xdp_buff_to_rq(xdp_ext, typeof(*rx_ring), xdp_rxq);
   615		if (!(rx_ring->netdev->features & NETIF_F_RXCSUM))
   616			return -ENODATA;
   617	
 > 618		status0 = le16_to_cpu(xdp_ext->desc->wb.status_error0);
   619		if ((status0 & BIT(ICE_RX_FLEX_DESC_STATUS0_L3L4P_S)) &&
   620		    !(status0 & BIT(ICE_RX_FLEX_DESC_STATUS0_XSUM_L4E_S)))
   621			*csum_status = XDP_CSUM_VERIFIED;
   622		else
   623			*csum_status = XDP_CSUM_NONE;
   624	
   625		return 0;
   626	}
   627	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
