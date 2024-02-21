Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84755394
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708511784; cv=none; b=Mvw/WtOEOLFR5XMxI0JQ43pGOn9rKXRIv+DmVxCzHYulH4GgPeS69Jr2ls/FCrbNeRjlLhLyS/TUT95TwVfg7tRSTeP0OHlXRqPTNKpIftvzP0oWXmKHSR6WL1HMmFkd28PD6D3GEOjd1+7Wf9bcsU6hf93KQgsGWmiTFCPohvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708511784; c=relaxed/simple;
	bh=6QoZZwNT/IaP75xaqlbUIXjkll9bSRndR8d2Z4+e7xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JQV4t/Mo0RS4uwYIKkowHuQfGomMJOEECAr55d9ZIHZ3yjtD7/OQJz8uJ2RjBuEZ0jar9/jExt4hgetqKeRliTToF058hW974Lnp+sykSEucHkoavfcqimTUwnhX7nAY3ZdIZZJ0QAeVKC5DYt459VrQxr95BtoOzSvjrXvSu9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0LuF0Hz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0LuF0Hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708511783; x=1740047783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6QoZZwNT/IaP75xaqlbUIXjkll9bSRndR8d2Z4+e7xs=;
  b=E0LuF0HzwvqnxrRTFQ8vpYlhNONVbryLJjZ+AT5QP6I9hyLRmvDI7PX1
   I2B9405p0k1II62rmdcP/3dbt78xYrAZ6fWTbVJjI6AnLqz34wyAwEjYF
   QheqDvlPvBjqizwPtcU2odSzkMwVE5j4qYJj05Rk0GopbjDyMYuDmEY1/
   6lq50QffW/aHDrubKBG5cslGBb9YPIK+Adm7wVgCIoG6ljWxZWDrydMUs
   iF5tKW/CsGBh9Qo4sVKJnCR8oIKFzHAEa5tPQPVA2vvwpb9nvzD8gfmlG
   ui1HEg7WjPpZMSlfRhVPP+iR7VZM3z0g7pZWqzbv76nNiTVdtMeiOf7d3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13365045"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="13365045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 02:36:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9782616"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 21 Feb 2024 02:36:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcjut-0005Fa-1U;
	Wed, 21 Feb 2024 10:34:49 +0000
Date: Wed, 21 Feb 2024 18:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Kubiak <michal.kubiak@intel.com>
Subject: [alobakin:idpf-libie-new 64/68]
 drivers/net/ethernet/intel/idpf/idpf_xdp.c:237: warning: Function parameter
 or struct member '_xdpq' not described in 'idpf_clean_xdp_irq'
Message-ID: <202402211809.xJXlC1Tn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   1f9963b67f75c3f6bb19d0185f99df47e6878cef
commit: c1d59af0da217466634e9d93ed6ab70453e631a8 [64/68] idpf: add support for XDP on Rx
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20240221/202402211809.xJXlC1Tn-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402211809.xJXlC1Tn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402211809.xJXlC1Tn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/intel/idpf/idpf_xdp.c:237: warning: Function parameter or struct member '_xdpq' not described in 'idpf_clean_xdp_irq'
>> drivers/net/ethernet/intel/idpf/idpf_xdp.c:237: warning: Function parameter or struct member 'budget' not described in 'idpf_clean_xdp_irq'
>> drivers/net/ethernet/intel/idpf/idpf_xdp.c:237: warning: Excess function parameter 'xdpq' description in 'idpf_clean_xdp_irq'


vim +237 drivers/net/ethernet/intel/idpf/idpf_xdp.c

   229	
   230	/**
   231	 * idpf_clean_xdp_irq - Reclaim a batch of TX resources from completed XDP_TX
   232	 * @xdpq: XDP Tx queue
   233	 *
   234	 * Returns number of cleaned descriptors.
   235	 */
   236	static u32 idpf_clean_xdp_irq(void *_xdpq, u32 budget)
 > 237	{
   238		struct idpf_tx_queue *xdpq = _xdpq;
   239		struct idpf_compl_queue *complq = xdpq->complq;
   240		struct libeth_sq_onstack_stats ss = { };
   241		struct libeth_tx_comp_params cp = {
   242			.dev	= xdpq->dev,
   243			.ss	= &ss,
   244			.napi	= true,
   245		};
   246		u32 tx_ntc = xdpq->next_to_clean;
   247		u32 ntc = complq->next_to_clean;
   248		u32 tx_cnt = xdpq->desc_count;
   249		bool gen_flag, done = false;
   250		struct xdp_frame_bulk bq;
   251		u32 head, done_frames;
   252	
   253		gen_flag = test_bit(__IDPF_Q_GEN_CHK, complq->flags);
   254	
   255		for ( ; ; ) {
   256			const struct idpf_splitq_4b_tx_compl_desc *desc;
   257			int ctype;
   258	
   259			desc = &complq->comp_4b[ntc];
   260	
   261			ctype = idpf_xdp_parse_compl_desc(desc, gen_flag);
   262			if (likely(ctype == IDPF_TXD_COMPLT_RS)) {
   263				head = le16_to_cpu(desc->q_head_compl_tag.q_head);
   264				done_frames = head > tx_ntc ? head - tx_ntc :
   265							      head + tx_cnt - tx_ntc;
   266				done = true;
   267	
   268				goto fetch_next_desc;
   269			}
   270	
   271			switch (ctype) {
   272			case IDPF_TXD_COMPLT_SW_MARKER:
   273				idpf_tx_handle_sw_marker(xdpq);
   274				break;
   275			case -ENODATA:
   276				goto exit_xdp_irq;
   277			case -EINVAL:
   278				break;
   279			default:
   280				netdev_WARN_ONCE(complq->netdev,
   281						 "unsupported completion type: %d\n",
   282						 ctype);
   283				break;
   284			}
   285	
   286	fetch_next_desc:
   287			if (unlikely(++ntc == complq->desc_count)) {
   288				ntc = 0;
   289				gen_flag = !gen_flag;
   290				change_bit(__IDPF_Q_GEN_CHK, complq->flags);
   291			}
   292	
   293			if (done_frames >= budget)
   294				break;
   295		}
   296	
   297	exit_xdp_irq:
   298		complq->next_to_clean = ntc;
   299	
   300		if (unlikely(!done))
   301			return 0;
   302	
   303		xdp_frame_bulk_init(&bq);
   304		cp.bq = &bq;
   305	
   306		for (u32 i = 0; i < done_frames; i++) {
   307			libeth_xdp_complete_tx_buf(&xdpq->tx_buf[tx_ntc], &cp);
   308	
   309			if (unlikely(++tx_ntc == tx_cnt))
   310				tx_ntc = 0;
   311		}
   312	
   313		xdp_flush_frame_bulk(&bq);
   314	
   315		xdpq->next_to_clean = tx_ntc;
   316		xdpq->pending -= done_frames;
   317		xdpq->xdp_tx -= cp.xdp_tx;
   318	
   319		libeth_sq_napi_stats_add((struct libeth_sq_stats *)&xdpq->q_stats,
   320					 &ss);
   321	
   322		return done_frames;
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
