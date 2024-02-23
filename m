Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3044B71735
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708715875; cv=none; b=L9eYWuAwnNLZnAco3FWln0BvAhuDxu24ZvXFEQykN7ulqY/gqC+OKaZNFKESPsBewY7/hkBF8nGdZRVBW9Bjj5DACp/NDuk9H78oOmpdM82lLQR3eUh4DSzX7g3LgIfCc/pwpWMAeiYSw8AN7g/PThh5avHFlCoRnOAk+MyORqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708715875; c=relaxed/simple;
	bh=KFFAi5j0ObcP4KE4FGHrT83kkQG4zfaUfck90alezQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkHZfB3ura0X6Du7vL9bdhtGOfgTQZfej9fGUolwwGJTc0Kj/9V/MqvtBsMtMN1AQU7nxKKmcfL+ua5XlWzjpAk3/Q8kZD7elBTjVIZ9XzqMfTpJv2177y/4yT34UMHl1fjL5ETGGx0u+dZebuX9icTr5gNUZsor79SpoCMqL5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faCFXu2B; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faCFXu2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708715873; x=1740251873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFFAi5j0ObcP4KE4FGHrT83kkQG4zfaUfck90alezQ4=;
  b=faCFXu2BSISdodCnJPFAdKiRBbywJ2P09Zr7DvIIOQe4Lg6hSfBYkZUC
   Di66TQWLg7T7kTkdTgsnARx7OqORqOIDpRWPo0YPthQOsUS5yi1mherK0
   X9CvbIT37yq3xHLj24WzqAKvbStcy+0Pagjk1jma5flQU5kXsb1GZyqeL
   xZL1afaaLvFN78o9EzV2SpZI4Tq6wLsdxpMwx9lJAbg8jSOgkWtSEAHGe
   kdNGT4r4/ZkhKRuI3Tcus7cHbrnpQeyZHXjYsiJwzZ6dt05Ko9UGR5jJY
   /PRI6r4csRRqsLLZw/3kRBi2t3mA5RFhr/iZCIMe5zEdtOtJdNX918aQb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6832676"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6832676"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 11:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5884298"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 11:17:39 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdb3A-0007oy-2T;
	Fri, 23 Feb 2024 19:17:36 +0000
Date: Sat, 24 Feb 2024 03:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 13/15] drivers/net/veth.c:1068:55: error:
 'io_uring_pp_zc_ops' undeclared
Message-ID: <202402240351.Yyhi5XQR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   422e699712a532c85e16c4e6afda9d4d4164bdf3
commit: 82e6260191c8e37a99dec6445e1f1ff1e0394ef3 [13/15] veth: add support for io_uring zc rx
config: i386-randconfig-002-20240223 (https://download.01.org/0day-ci/archive/20240224/202402240351.Yyhi5XQR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402240351.Yyhi5XQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402240351.Yyhi5XQR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/veth.c: In function 'veth_xdp_rcv':
>> drivers/net/veth.c:1068:55: error: 'io_uring_pp_zc_ops' undeclared (first use in this function)
    1068 |                         if (rq->page_pool->mp_ops == &io_uring_pp_zc_ops) {
         |                                                       ^~~~~~~~~~~~~~~~~~
   drivers/net/veth.c:1068:55: note: each undeclared identifier is reported only once for each function it appears in
   drivers/net/veth.c: In function 'veth_create_page_pool':
   drivers/net/veth.c:1145:34: error: 'io_uring_pp_zc_ops' undeclared (first use in this function)
    1145 |                 rq->rq.pp_ops = &io_uring_pp_zc_ops;
         |                                  ^~~~~~~~~~~~~~~~~~


vim +/io_uring_pp_zc_ops +1068 drivers/net/veth.c

  1035	
  1036	static int veth_xdp_rcv(struct veth_rq *rq, int budget,
  1037				struct veth_xdp_tx_bq *bq,
  1038				struct veth_stats *stats)
  1039	{
  1040		int i, done = 0, n_xdpf = 0;
  1041		void *xdpf[VETH_XDP_BATCH];
  1042	
  1043		for (i = 0; i < budget; i++) {
  1044			void *ptr = __ptr_ring_consume(&rq->xdp_ring);
  1045	
  1046			if (!ptr)
  1047				break;
  1048	
  1049			if (veth_is_xdp_frame(ptr)) {
  1050				/* ndo_xdp_xmit */
  1051				struct xdp_frame *frame = veth_ptr_to_xdp(ptr);
  1052	
  1053				stats->xdp_bytes += xdp_get_frame_len(frame);
  1054				frame = veth_xdp_rcv_one(rq, frame, bq, stats);
  1055				if (frame) {
  1056					/* XDP_PASS */
  1057					xdpf[n_xdpf++] = frame;
  1058					if (n_xdpf == VETH_XDP_BATCH) {
  1059						veth_xdp_rcv_bulk_skb(rq, xdpf, n_xdpf,
  1060								      bq, stats);
  1061						n_xdpf = 0;
  1062					}
  1063				}
  1064			} else {
  1065				/* ndo_start_xmit */
  1066				struct sk_buff *skb = ptr;
  1067	
> 1068				if (rq->page_pool->mp_ops == &io_uring_pp_zc_ops) {
  1069					skb = veth_iou_rcv_skb(rq, skb);
  1070				} else {
  1071					stats->xdp_bytes += skb->len;
  1072					skb = veth_xdp_rcv_skb(rq, skb, bq, stats);
  1073				}
  1074	
  1075				if (skb) {
  1076					if (skb_shared(skb) || skb_unclone(skb, GFP_ATOMIC))
  1077						netif_receive_skb(skb);
  1078					else
  1079						napi_gro_receive(&rq->xdp_napi, skb);
  1080				}
  1081			}
  1082			done++;
  1083		}
  1084	
  1085		if (n_xdpf)
  1086			veth_xdp_rcv_bulk_skb(rq, xdpf, n_xdpf, bq, stats);
  1087	
  1088		u64_stats_update_begin(&rq->stats.syncp);
  1089		rq->stats.vs.xdp_redirect += stats->xdp_redirect;
  1090		rq->stats.vs.xdp_bytes += stats->xdp_bytes;
  1091		rq->stats.vs.xdp_drops += stats->xdp_drops;
  1092		rq->stats.vs.rx_drops += stats->rx_drops;
  1093		rq->stats.vs.xdp_packets += done;
  1094		u64_stats_update_end(&rq->stats.syncp);
  1095	
  1096		return done;
  1097	}
  1098	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
