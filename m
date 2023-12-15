Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E6853BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 05:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqoDn6cr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702616571; x=1734152571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJWLyiq7DOJYw/Jd6kdGwxH5adayfpP647+u9N91qDs=;
  b=UqoDn6cr+dyuy0+OYeB8ksOrolHSA+PbXhXE0pF2OSfRYvx/cCoawVDK
   jnaOINaqF7hkCHGdPRAjueRezkMH5Sn21p6vD4H0wDaAAULN3wWmxg5nU
   IE1nZj6OZ4Deurh0Mg57ZMdREv2mXhpMd4LzNY4lqcnFqMWMf8hx9Yw7z
   +eX5GmQbuWHCT85N1A0y02TEElcT0R/jXhMA1cE5w7oAPHWy/8q9Bnfl0
   ZM3uXKmaGyCT+nS+R8TNzBwCmRcdULQkocMcXPvgRlTxhFvD1E5j2WM20
   VoWmNgYWt7sZaMCO9rloI9w5rDk2YXL5peSEef2UC0Ol1olcQCYnlOjxW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8640902"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="8640902"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 21:02:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="947830554"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="947830554"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Dec 2023 21:02:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE0LU-000N7b-26;
	Fri, 15 Dec 2023 05:02:44 +0000
Date: Fri, 15 Dec 2023 13:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Kubiak <michal.kubiak@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: [alobakin:idpf-libie 35/35]
 drivers/net/ethernet/intel/idpf/idpf_txrx.c:3271:9: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202312151245.4wWxqOlI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie
head:   3bd358daafd19b00cfd2caa30d72f6ae1bb1b611
commit: 3bd358daafd19b00cfd2caa30d72f6ae1bb1b611 [35/35] idpf: add support for XDP_PASS, XDP_DROP, XDP_TX, XDP_REDIRECT
config: arm64-randconfig-r123-20231215 (https://download.01.org/0day-ci/archive/20231215/202312151245.4wWxqOlI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312151245.4wWxqOlI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151245.4wWxqOlI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3271:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3271:9: sparse:    struct bpf_prog [noderef] __rcu *
>> drivers/net/ethernet/intel/idpf/idpf_txrx.c:3271:9: sparse:    struct bpf_prog *

vim +3271 drivers/net/ethernet/intel/idpf/idpf_txrx.c

  3250	
  3251	/**
  3252	 * idpf_rx_splitq_clean - Clean completed descriptors from Rx queue
  3253	 * @rxq: Rx descriptor queue to retrieve receive buffer queue
  3254	 * @budget: Total limit on number of packets to process
  3255	 *
  3256	 * This function provides a "bounce buffer" approach to Rx interrupt
  3257	 * processing. The advantage to this is that on systems that have
  3258	 * expensive overhead for IOMMU access this provides a means of avoiding
  3259	 * it by maintaining the mapping of the page to the system.
  3260	 *
  3261	 * Returns amount of work completed
  3262	 */
  3263	static int idpf_rx_splitq_clean(struct idpf_queue *rxq, int budget)
  3264	{
  3265		int total_rx_bytes = 0, total_rx_pkts = 0;
  3266		struct idpf_queue *rx_bufq = NULL;
  3267		u16 ntc = rxq->next_to_clean;
  3268		struct libie_xdp_tx_bulk bq;
  3269		struct xdp_buff xdp;
  3270	
> 3271		libie_xdp_tx_init_bulk(&bq, rxq->xdp_prog, rxq->xdp_rxq.dev,
  3272				       rxq->xdpq);
  3273	
  3274		if (rxq->xdp.data)
  3275			xdp = rxq->xdp;
  3276		else
  3277			xdp_init_buff(&xdp, rxq->truesize, &rxq->xdp_rxq);
  3278	
  3279		/* Process Rx packets bounded by budget */
  3280		while (likely(total_rx_pkts < budget)) {
  3281			struct virtchnl2_rx_flex_desc_adv_nic_3 *rx_desc;
  3282			struct idpf_sw_queue *refillq = NULL;
  3283			struct idpf_rxq_set *rxq_set = NULL;
  3284			struct idpf_rx_buf *rx_buf = NULL;
  3285			union virtchnl2_rx_desc *desc;
  3286			unsigned int pkt_len = 0;
  3287			unsigned int hdr_len = 0;
  3288			u16 gen_id, buf_id = 0;
  3289			struct sk_buff *skb;
  3290			 /* Header buffer overflow only valid for header split */
  3291			bool hbo = false;
  3292			int bufq_id;
  3293			u8 rxdid;
  3294	
  3295			/* get the Rx desc from Rx queue based on 'next_to_clean' */
  3296			desc = &rxq->rx[ntc];
  3297			rx_desc = (struct virtchnl2_rx_flex_desc_adv_nic_3 *)desc;
  3298	
  3299			/* This memory barrier is needed to keep us from reading
  3300			 * any other fields out of the rx_desc
  3301			 */
  3302			dma_rmb();
  3303	
  3304			/* if the descriptor isn't done, no work yet to do */
  3305			gen_id = le16_to_cpu(rx_desc->pktlen_gen_bufq_id);
  3306			gen_id = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_ADV_GEN_M, gen_id);
  3307	
  3308			if (test_bit(__IDPF_Q_GEN_CHK, rxq->flags) != gen_id)
  3309				break;
  3310	
  3311			rxdid = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_ADV_RXDID_M,
  3312					  rx_desc->rxdid_ucast);
  3313			if (rxdid != VIRTCHNL2_RXDID_2_FLEX_SPLITQ) {
  3314				IDPF_RX_BUMP_NTC(rxq, ntc);
  3315				u64_stats_update_begin(&rxq->stats_sync);
  3316				u64_stats_inc(&rxq->q_stats.rx.bad_descs);
  3317				u64_stats_update_end(&rxq->stats_sync);
  3318				continue;
  3319			}
  3320	
  3321			pkt_len = le16_to_cpu(rx_desc->pktlen_gen_bufq_id);
  3322			pkt_len = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_ADV_LEN_PBUF_M,
  3323					    pkt_len);
  3324	
  3325			hbo = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_ADV_STATUS0_HBO_M,
  3326					rx_desc->status_err0_qw1);
  3327	
  3328			if (unlikely(hbo)) {
  3329				/* If a header buffer overflow, occurs, i.e. header is
  3330				 * too large to fit in the header split buffer, HW will
  3331				 * put the entire packet, including headers, in the
  3332				 * data/payload buffer.
  3333				 */
  3334				u64_stats_update_begin(&rxq->stats_sync);
  3335				u64_stats_inc(&rxq->q_stats.rx.hsplit_buf_ovf);
  3336				u64_stats_update_end(&rxq->stats_sync);
  3337				goto bypass_hsplit;
  3338			}
  3339	
  3340			hdr_len = le16_to_cpu(rx_desc->hdrlen_flags);
  3341			hdr_len = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_ADV_LEN_HDR_M,
  3342					    hdr_len);
  3343	
  3344	bypass_hsplit:
  3345			bufq_id = le16_to_cpu(rx_desc->pktlen_gen_bufq_id);
  3346			bufq_id = FIELD_GET(VIRTCHNL2_RX_FLEX_DESC_ADV_BUFQ_ID_M,
  3347					    bufq_id);
  3348	
  3349			rxq_set = container_of(rxq, struct idpf_rxq_set, rxq);
  3350			if (!bufq_id)
  3351				refillq = rxq_set->refillq0;
  3352			else
  3353				refillq = rxq_set->refillq1;
  3354	
  3355			/* retrieve buffer from the rxq */
  3356			rx_bufq = &rxq->rxq_grp->splitq.bufq_sets[bufq_id].bufq;
  3357	
  3358			buf_id = le16_to_cpu(rx_desc->buf_id);
  3359	
  3360			rx_buf = &rx_bufq->rx_buf.buf[buf_id];
  3361	
  3362			if (hdr_len) {
  3363				struct libie_rx_buffer *hdr;
  3364	
  3365				hdr = &rx_bufq->rx_buf.hdr_buf[buf_id];
  3366				libie_xdp_process_buf(&xdp, hdr, hdr_len);
  3367				hdr->page = NULL;
  3368	
  3369				u64_stats_update_begin(&rxq->stats_sync);
  3370				u64_stats_inc(&rxq->q_stats.rx.hsplit_pkts);
  3371				u64_stats_update_end(&rxq->stats_sync);
  3372			}
  3373	
  3374			libie_xdp_process_buf(&xdp, rx_buf, pkt_len);
  3375			rx_buf->page = NULL;
  3376	
  3377			idpf_rx_post_buf_refill(refillq, buf_id);
  3378			IDPF_RX_BUMP_NTC(rxq, ntc);
  3379	
  3380			/* skip if it is non EOP desc */
  3381			if (!xdp.data || !idpf_rx_splitq_is_eop(rx_desc))
  3382				continue;
  3383	
  3384			total_rx_bytes += xdp_get_buff_len(&xdp);
  3385			total_rx_pkts++;
  3386	
  3387			if (!libie_xdp_run(&xdp, &bq, idpf_xdp_tx_flush_bulk, false))
  3388				continue;
  3389	
  3390			skb = xdp_build_skb_from_buff(&xdp);
  3391			if (unlikely(!skb)) {
  3392				xdp_return_buff(&xdp);
  3393				xdp.data = NULL;
  3394	
  3395				continue;
  3396			}
  3397	
  3398			xdp.data = NULL;
  3399	
  3400			/* protocol */
  3401			if (unlikely(idpf_rx_process_skb_fields(rxq, skb, rx_desc))) {
  3402				dev_kfree_skb_any(skb);
  3403				continue;
  3404			}
  3405	
  3406			/* send completed skb up the stack */
  3407			napi_gro_receive(&rxq->q_vector->napi, skb);
  3408		}
  3409	
  3410		rxq->next_to_clean = ntc;
  3411	
  3412		if (xdp.data)
  3413			rxq->xdp = xdp;
  3414		else
  3415			rxq->xdp.data = NULL;
  3416	
  3417		libie_xdp_finalize_rx(&bq, idpf_xdp_tx_flush_bulk,
  3418				      idpf_xdp_tx_finalize);
  3419	
  3420		u64_stats_update_begin(&rxq->stats_sync);
  3421		u64_stats_add(&rxq->q_stats.rx.packets, total_rx_pkts);
  3422		u64_stats_add(&rxq->q_stats.rx.bytes, total_rx_bytes);
  3423		u64_stats_update_end(&rxq->stats_sync);
  3424	
  3425		/* guarantee a trip back through this routine if there was a failure */
  3426		return total_rx_pkts;
  3427	}
  3428	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
