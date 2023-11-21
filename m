Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6426143163
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dKESaZ1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700572444; x=1732108444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N5HkQAGpOu1EM7t55j9HpCuCH25FOOj+J+iySaDgXN8=;
  b=dKESaZ1fGMkIdEwTpCPqxnt+JWZ1Cg8Ucvk1meO7gDcmiMshQIxJT4gj
   D77jKSiMitbgO0kE917mt8I0tkR+fgulScc0IiJUG6H0qg1Pn4mrlZ2Y6
   zPDn6IPZuPMFKdtbUhC8XVM3ljCYOA9SNCUMwdTGXWJkscEmRArLj7XCs
   Hesptg3CIRfqhDuG8BFH2Fwa7NOgU9fcAzySocsTO5uFPeyXksUa18JmH
   aJDDD2hsyQ0q+VOmNcdwhJ9RUojrKdjQR0fSLZaoqR3/ffpAoCnfljCJV
   STd3iRzmLyKnU8RQaTSrZ7I2C1rjNdAo1fkwozUS6EIGOKWkbg2jheUSd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="458332843"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="458332843"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 05:14:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="14511188"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 21 Nov 2023 05:14:01 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5QZi-0007og-0u;
	Tue, 21 Nov 2023 13:13:58 +0000
Date: Tue, 21 Nov 2023 21:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com, almasrymina@google.com,
	hawk@kernel.org, ilias.apalodimas@linaro.org, dsahern@gmail.com,
	dtatulea@nvidia.com, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next v2 07/15] eth: link netdev to page_pools in
 drivers
Message-ID: <202311212126.kJXnPMgJ-lkp@intel.com>
References: <20231121000048.789613-8-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121000048.789613-8-kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/net-page_pool-split-the-page_pool_params-into-fast-and-slow/20231121-092240
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231121000048.789613-8-kuba%40kernel.org
patch subject: [PATCH net-next v2 07/15] eth: link netdev to page_pools in drivers
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311212126.kJXnPMgJ-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311212126.kJXnPMgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311212126.kJXnPMgJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/socionext/netsec.c: In function 'netsec_setup_rx_dring':
>> drivers/net/ethernet/socionext/netsec.c:1305:25: error: incompatible types when initializing type 'struct napi_struct *' using type 'struct napi_struct'
    1305 |                 .napi = priv->napi,
         |                         ^~~~


vim +1305 drivers/net/ethernet/socionext/netsec.c

  1290	
  1291	static int netsec_setup_rx_dring(struct netsec_priv *priv)
  1292	{
  1293		struct netsec_desc_ring *dring = &priv->desc_ring[NETSEC_RING_RX];
  1294		struct bpf_prog *xdp_prog = READ_ONCE(priv->xdp_prog);
  1295		struct page_pool_params pp_params = {
  1296			.order = 0,
  1297			/* internal DMA mapping in page_pool */
  1298			.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
  1299			.pool_size = DESC_NUM,
  1300			.nid = NUMA_NO_NODE,
  1301			.dev = priv->dev,
  1302			.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE,
  1303			.offset = NETSEC_RXBUF_HEADROOM,
  1304			.max_len = NETSEC_RX_BUF_SIZE,
> 1305			.napi = priv->napi,
  1306			.netdev = priv->ndev,
  1307		};
  1308		int i, err;
  1309	
  1310		dring->page_pool = page_pool_create(&pp_params);
  1311		if (IS_ERR(dring->page_pool)) {
  1312			err = PTR_ERR(dring->page_pool);
  1313			dring->page_pool = NULL;
  1314			goto err_out;
  1315		}
  1316	
  1317		err = xdp_rxq_info_reg(&dring->xdp_rxq, priv->ndev, 0, priv->napi.napi_id);
  1318		if (err)
  1319			goto err_out;
  1320	
  1321		err = xdp_rxq_info_reg_mem_model(&dring->xdp_rxq, MEM_TYPE_PAGE_POOL,
  1322						 dring->page_pool);
  1323		if (err)
  1324			goto err_out;
  1325	
  1326		for (i = 0; i < DESC_NUM; i++) {
  1327			struct netsec_desc *desc = &dring->desc[i];
  1328			dma_addr_t dma_handle;
  1329			void *buf;
  1330			u16 len;
  1331	
  1332			buf = netsec_alloc_rx_data(priv, &dma_handle, &len);
  1333	
  1334			if (!buf) {
  1335				err = -ENOMEM;
  1336				goto err_out;
  1337			}
  1338			desc->dma_addr = dma_handle;
  1339			desc->addr = buf;
  1340			desc->len = len;
  1341		}
  1342	
  1343		netsec_rx_fill(priv, 0, DESC_NUM);
  1344	
  1345		return 0;
  1346	
  1347	err_out:
  1348		netsec_uninit_pkt_dring(priv, NETSEC_RING_RX);
  1349		return err;
  1350	}
  1351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
