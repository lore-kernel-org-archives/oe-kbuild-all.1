Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71823185B68
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 01:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854803; cv=none; b=i8Vkcf8WoPmXvVCP3iOOX8M/QTSHlLZ4x6A9N46ZAcOeF7rz2CHySeHMuebgstnxsz+E4vH7dpPbjnt7sqwiXb5YhHlfdzP4PooP5+PBhWXO25WCelgq6oaTvsUlGZcEASAPF8nfbgx2aKl9m0hLfwpvA8u0ceNuEs+3/18FGCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854803; c=relaxed/simple;
	bh=HBj6T1QLfyIddv12UCXHwkN6Bj8t48lvMJ5K6ZvgZkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mEvSpDtQnKQzCNU+zxs1/0yor+qPQzMhavJe8BehrFYpGeo0M0hNim6wV/obi982KY69p75RA7WOKpTInGGStLov3GIzpMsQkwPUQz3i7+sldCpry62ZBTrSdWefF/pGcFQn0M1O3YDSzH7TqtIc6q1Jl6uWovQYH4HMW/7jRtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qbcom1pt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qbcom1pt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730854801; x=1762390801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HBj6T1QLfyIddv12UCXHwkN6Bj8t48lvMJ5K6ZvgZkg=;
  b=Qbcom1ptZebP4i4gbpFXc7rgFfjnPUYR5ap9s+5NlzVvzXX/OH3lne3i
   GuJNDeRjlzWNU7kj/umbjQqaC/zGCYpykbjSXj7V1ML+5AM746zv9hzNk
   rUPytnGeazOyMuJwJm/P/ZfjRm7exsVQEaK7LyoNQQ2i4x8X7FmOKelia
   0xooqACPDsHgV0AC8dGUgmB0ea4/nQTAlEzic3knQi04/VT9CdsJVKmI4
   hkv8O6+eMCtQEWMu3wxv8gij42B2fOrP57LEkmDclEkjG+OYJ2GdbFamc
   l8VOkSwqT/GAhOCutlvf2+0bh5HbEeeCFvFVRosLWb++9OHtxU8zPy8Gv
   A==;
X-CSE-ConnectionGUID: cbvqr5n7RraPj9bFAxQyNw==
X-CSE-MsgGUID: erH2VAD+TgeSjLdjgSGcIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30061066"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="30061066"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 16:59:58 -0800
X-CSE-ConnectionGUID: KU1U4o2kT02OARSOvni6tg==
X-CSE-MsgGUID: wt+znGxESKSMfB4mgQqwAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88803338"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Nov 2024 16:59:55 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8UOm-000mfp-2A;
	Wed, 06 Nov 2024 00:59:52 +0000
Date: Wed, 6 Nov 2024 08:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c:736:45: sparse:
 sparse: cast to restricted __le16
Message-ID: <202411060844.OCb6ySqA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 880b3ca5043d16c887cc8ad22eb6831cace048b9 [1/1] net: aquantia: vlan offloads logic in datapath
config: x86_64-randconfig-123-20241028 (https://download.01.org/0day-ci/archive/20241106/202411060844.OCb6ySqA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060844.OCb6ySqA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060844.OCb6ySqA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c:736:45: sparse: sparse: cast to restricted __le16

vim +736 drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_b0.c

   683	
   684	static int hw_atl_b0_hw_ring_rx_receive(struct aq_hw_s *self,
   685						struct aq_ring_s *ring)
   686	{
   687		for (; ring->hw_head != ring->sw_tail;
   688			ring->hw_head = aq_ring_next_dx(ring, ring->hw_head)) {
   689			struct aq_ring_buff_s *buff = NULL;
   690			struct hw_atl_rxd_wb_s *rxd_wb = (struct hw_atl_rxd_wb_s *)
   691				&ring->dx_ring[ring->hw_head * HW_ATL_B0_RXD_SIZE];
   692	
   693			unsigned int is_rx_check_sum_enabled = 0U;
   694			unsigned int pkt_type = 0U;
   695			u8 rx_stat = 0U;
   696	
   697			if (!(rxd_wb->status & 0x1U)) { /* RxD is not done */
   698				break;
   699			}
   700	
   701			buff = &ring->buff_ring[ring->hw_head];
   702	
   703			buff->flags = 0U;
   704			buff->is_hash_l4 = 0U;
   705	
   706			rx_stat = (0x0000003CU & rxd_wb->status) >> 2;
   707	
   708			is_rx_check_sum_enabled = (rxd_wb->type >> 19) & 0x3U;
   709	
   710			pkt_type = (rxd_wb->type & HW_ATL_B0_RXD_WB_STAT_PKTTYPE) >>
   711				   HW_ATL_B0_RXD_WB_STAT_PKTTYPE_SHIFT;
   712	
   713			if (is_rx_check_sum_enabled & BIT(0) &&
   714			    (0x0U == (pkt_type & 0x3U)))
   715				buff->is_ip_cso = (rx_stat & BIT(1)) ? 0U : 1U;
   716	
   717			if (is_rx_check_sum_enabled & BIT(1)) {
   718				if (0x4U == (pkt_type & 0x1CU))
   719					buff->is_udp_cso = (rx_stat & BIT(2)) ? 0U :
   720							   !!(rx_stat & BIT(3));
   721				else if (0x0U == (pkt_type & 0x1CU))
   722					buff->is_tcp_cso = (rx_stat & BIT(2)) ? 0U :
   723							   !!(rx_stat & BIT(3));
   724			}
   725			buff->is_cso_err = !!(rx_stat & 0x6);
   726			/* Checksum offload workaround for small packets */
   727			if (unlikely(rxd_wb->pkt_len <= 60)) {
   728				buff->is_ip_cso = 0U;
   729				buff->is_cso_err = 0U;
   730			}
   731	
   732			if (self->aq_nic_cfg->is_vlan_rx_strip &&
   733			    ((pkt_type & HW_ATL_B0_RXD_WB_PKTTYPE_VLAN) ||
   734			     (pkt_type & HW_ATL_B0_RXD_WB_PKTTYPE_VLAN_DOUBLE))) {
   735				buff->is_vlan = 1;
 > 736				buff->vlan_rx_tag = le16_to_cpu(rxd_wb->vlan);
   737			}
   738	
   739			if ((rx_stat & BIT(0)) || rxd_wb->type & 0x1000U) {
   740				/* MAC error or DMA error */
   741				buff->is_error = 1U;
   742			}
   743			if (self->aq_nic_cfg->is_rss) {
   744				/* last 4 byte */
   745				u16 rss_type = rxd_wb->type & 0xFU;
   746	
   747				if (rss_type && rss_type < 0x8U) {
   748					buff->is_hash_l4 = (rss_type == 0x4 ||
   749					rss_type == 0x5);
   750					buff->rss_hash = rxd_wb->rss_hash;
   751				}
   752			}
   753	
   754			if (HW_ATL_B0_RXD_WB_STAT2_EOP & rxd_wb->status) {
   755				buff->len = rxd_wb->pkt_len %
   756					AQ_CFG_RX_FRAME_MAX;
   757				buff->len = buff->len ?
   758					buff->len : AQ_CFG_RX_FRAME_MAX;
   759				buff->next = 0U;
   760				buff->is_eop = 1U;
   761			} else {
   762				buff->len =
   763					rxd_wb->pkt_len > AQ_CFG_RX_FRAME_MAX ?
   764					AQ_CFG_RX_FRAME_MAX : rxd_wb->pkt_len;
   765	
   766				if (HW_ATL_B0_RXD_WB_STAT2_RSCCNT &
   767					rxd_wb->status) {
   768					/* LRO */
   769					buff->next = rxd_wb->next_desc_ptr;
   770					++ring->stats.rx.lro_packets;
   771				} else {
   772					/* jumbo */
   773					buff->next =
   774						aq_ring_next_dx(ring,
   775								ring->hw_head);
   776					++ring->stats.rx.jumbo_packets;
   777				}
   778			}
   779		}
   780	
   781		return aq_hw_err_from_flags(self);
   782	}
   783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
