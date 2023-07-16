Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB08C0A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 17:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689530010; x=1721066010;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rPDxuM16H0atJK4vGiKWaaRVYqYnyYnfpkckSgSxk4c=;
  b=BNeAfHHc3ZtwLrKiaJsOxzCmbeYXaDVH/kYq6MsM3XIEqiDpcfBcNBkk
   Lpg+dS1ZGiavbfbzYj8viswD2xrtvHHDMko0QwKSIZXBn+0dZwX0TaoPw
   UnTJNSg34zuSxYTol0N321J5fXJknvNkBwYvu7nYlGbdCq4h0LuBhwiwo
   GSPjs7L/8L7AEkM86lwdS8L0/uuwEppI1ift7Kceg1eUnHwXSBCzphMnD
   mQ4ACzY+n5lG6gFpfMvy5/L0E67vtB0ZcEI0j/VIM4Mfbz+bRnw0lEVac
   K534aM5ip2eCQVuLlFac4uL1dyRtw9b9nhogF5I7KLDgKcQvan2mugbUQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="365821580"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="365821580"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 10:53:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="722963337"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="722963337"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 16 Jul 2023 10:53:27 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qL5vy-0008vU-1v;
	Sun, 16 Jul 2023 17:53:26 +0000
Date: Mon, 17 Jul 2023 01:53:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:spilt_pp_header 55/55]
 drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:124:20: error: implicit
 declaration of function 'page_pool_get_dma_addr'
Message-ID: <202307170107.MlFDNYav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/gestionlin/linux.git spilt_pp_header
head:   11ac8c1959f7eda06a7b987903f37212b490b292
commit: 11ac8c1959f7eda06a7b987903f37212b490b292 [55/55] net:page_pool: split page_pool.h
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230717/202307170107.MlFDNYav-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230717/202307170107.MlFDNYav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307170107.MlFDNYav-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c: In function 'mlx5e_xmit_xdp_buff':
>> drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c:124:20: error: implicit declaration of function 'page_pool_get_dma_addr' [-Werror=implicit-function-declaration]
     124 |         dma_addr = page_pool_get_dma_addr(page) + (xdpf->data - (void *)xdpf);
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/page_pool_get_dma_addr +124 drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c

d460c2718906252 Maxim Mikityanskiy 2019-04-08   58  
c94e4f117e473de Tariq Toukan       2018-07-15   59  static inline bool
b9673cf5558c0ae Maxim Mikityanskiy 2019-06-26   60  mlx5e_xmit_xdp_buff(struct mlx5e_xdpsq *sq, struct mlx5e_rq *rq,
bfc63c9796900b4 Tariq Toukan       2023-02-15   61  		    struct xdp_buff *xdp)
c94e4f117e473de Tariq Toukan       2018-07-15   62  {
bfc63c9796900b4 Tariq Toukan       2023-02-15   63  	struct page *page = virt_to_page(xdp->data);
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   64  	struct mlx5e_xmit_data_frags xdptxdf = {};
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   65  	struct mlx5e_xmit_data *xdptxd;
d963fa15113076f Maxim Mikityanskiy 2019-06-26   66  	struct xdp_frame *xdpf;
d963fa15113076f Maxim Mikityanskiy 2019-06-26   67  	dma_addr_t dma_addr;
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31   68  	int i;
c94e4f117e473de Tariq Toukan       2018-07-15   69  
1b698fa5d8ef958 Lorenzo Bianconi   2020-05-28   70  	xdpf = xdp_convert_buff_to_frame(xdp);
d963fa15113076f Maxim Mikityanskiy 2019-06-26   71  	if (unlikely(!xdpf))
c94e4f117e473de Tariq Toukan       2018-07-15   72  		return false;
c94e4f117e473de Tariq Toukan       2018-07-15   73  
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   74  	xdptxd = &xdptxdf.xd;
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   75  	xdptxd->data = xdpf->data;
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   76  	xdptxd->len  = xdpf->len;
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   77  	xdptxd->has_frags = xdp_frame_has_frags(xdpf);
d963fa15113076f Maxim Mikityanskiy 2019-06-26   78  
39d6443c8daf9fe Björn Töpel        2020-05-20   79  	if (xdp->rxq->mem.type == MEM_TYPE_XSK_BUFF_POOL) {
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   80  		/* The xdp_buff was in the UMEM and was copied into a newly
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   81  		 * allocated page. The UMEM page was returned via the ZCA, and
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   82  		 * this new page has to be mapped at this point and has to be
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   83  		 * unmapped and returned via xdp_return_frame on completion.
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   84  		 */
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   85  
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   86  		/* Prevent double recycling of the UMEM page. Even in case this
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   87  		 * function returns false, the xdp_buff shouldn't be recycled,
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   88  		 * as it was already done in xdp_convert_zc_to_xdp_frame.
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   89  		 */
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   90  		__set_bit(MLX5E_RQ_FLAG_XDP_XMIT, rq->flags); /* non-atomic */
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   91  
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   92  		if (unlikely(xdptxd->has_frags))
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   93  			return false;
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   94  
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17   95  		dma_addr = dma_map_single(sq->pdev, xdptxd->data, xdptxd->len,
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   96  					  DMA_TO_DEVICE);
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   97  		if (dma_mapping_error(sq->pdev, dma_addr)) {
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   98  			xdp_return_frame(xdpf);
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26   99  			return false;
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26  100  		}
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26  101  
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  102  		xdptxd->dma_addr = dma_addr;
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  103  
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  104  		if (unlikely(!INDIRECT_CALL_2(sq->xmit_xdp_frame, mlx5e_xmit_xdp_frame_mpwqe,
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  105  					      mlx5e_xmit_xdp_frame, sq, xdptxd, 0)))
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  106  			return false;
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  107  
3f734b8c594bd37 Tariq Toukan       2023-04-17  108  		/* xmit_mode == MLX5E_XDP_XMIT_MODE_FRAME */
3f734b8c594bd37 Tariq Toukan       2023-04-17  109  		mlx5e_xdpi_fifo_push(&sq->db.xdpi_fifo,
3f734b8c594bd37 Tariq Toukan       2023-04-17  110  				     (union mlx5e_xdp_info) { .mode = MLX5E_XDP_XMIT_MODE_FRAME });
3f734b8c594bd37 Tariq Toukan       2023-04-17  111  		mlx5e_xdpi_fifo_push(&sq->db.xdpi_fifo,
3f734b8c594bd37 Tariq Toukan       2023-04-17  112  				     (union mlx5e_xdp_info) { .frame.xdpf = xdpf });
3f734b8c594bd37 Tariq Toukan       2023-04-17  113  		mlx5e_xdpi_fifo_push(&sq->db.xdpi_fifo,
3f734b8c594bd37 Tariq Toukan       2023-04-17  114  				     (union mlx5e_xdp_info) { .frame.dma_addr = dma_addr });
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  115  		return true;
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  116  	}
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  117  
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  118  	/* Driver assumes that xdp_convert_buff_to_frame returns an xdp_frame
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  119  	 * that points to the same memory region as the original xdp_buff. It
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  120  	 * allows to map the memory only once and to use the DMA_BIDIRECTIONAL
fbeed25bcc45ef6 Maxim Mikityanskiy 2022-03-10  121  	 * mode.
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26  122  	 */
84a0a2310d6de24 Maxim Mikityanskiy 2019-06-26  123  
ddc87e7d4775520 Maxim Mikityanskiy 2022-01-28 @124  	dma_addr = page_pool_get_dma_addr(page) + (xdpf->data - (void *)xdpf);
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  125  	dma_sync_single_for_device(sq->pdev, dma_addr, xdptxd->len, DMA_BIDIRECTIONAL);
d963fa15113076f Maxim Mikityanskiy 2019-06-26  126  
3a48ba12b4e471a Tariq Toukan       2023-04-17  127  	if (xdptxd->has_frags) {
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  128  		xdptxdf.sinfo = xdp_get_shared_info_from_frame(xdpf);
c1783e74fc042ad Tariq Toukan       2023-04-17  129  		xdptxdf.dma_arr = NULL;
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  130  
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  131  		for (i = 0; i < xdptxdf.sinfo->nr_frags; i++) {
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  132  			skb_frag_t *frag = &xdptxdf.sinfo->frags[i];
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  133  			dma_addr_t addr;
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  134  			u32 len;
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  135  
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  136  			addr = page_pool_get_dma_addr(skb_frag_page(frag)) +
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  137  				skb_frag_off(frag);
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  138  			len = skb_frag_size(frag);
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  139  			dma_sync_single_for_device(sq->pdev, addr, len,
8d4b475e9d0f100 Maxim Mikityanskiy 2022-11-02  140  						   DMA_BIDIRECTIONAL);
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  141  		}
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  142  	}
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  143  
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  144  	xdptxd->dma_addr = dma_addr;
d963fa15113076f Maxim Mikityanskiy 2019-06-26  145  
49529a1726850bd Maxim Mikityanskiy 2022-01-28  146  	if (unlikely(!INDIRECT_CALL_2(sq->xmit_xdp_frame, mlx5e_xmit_xdp_frame_mpwqe,
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  147  				      mlx5e_xmit_xdp_frame, sq, xdptxd, 0)))
49529a1726850bd Maxim Mikityanskiy 2022-01-28  148  		return false;
49529a1726850bd Maxim Mikityanskiy 2022-01-28  149  
3f734b8c594bd37 Tariq Toukan       2023-04-17  150  	/* xmit_mode == MLX5E_XDP_XMIT_MODE_PAGE */
3f734b8c594bd37 Tariq Toukan       2023-04-17  151  	mlx5e_xdpi_fifo_push(&sq->db.xdpi_fifo,
3f734b8c594bd37 Tariq Toukan       2023-04-17  152  			     (union mlx5e_xdp_info) { .mode = MLX5E_XDP_XMIT_MODE_PAGE });
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  153  
3a48ba12b4e471a Tariq Toukan       2023-04-17  154  	if (xdptxd->has_frags) {
3f734b8c594bd37 Tariq Toukan       2023-04-17  155  		mlx5e_xdpi_fifo_push(&sq->db.xdpi_fifo,
3f734b8c594bd37 Tariq Toukan       2023-04-17  156  				     (union mlx5e_xdp_info)
3f734b8c594bd37 Tariq Toukan       2023-04-17  157  				     { .page.num = 1 + xdptxdf.sinfo->nr_frags });
3f734b8c594bd37 Tariq Toukan       2023-04-17  158  		mlx5e_xdpi_fifo_push(&sq->db.xdpi_fifo,
3f734b8c594bd37 Tariq Toukan       2023-04-17  159  				     (union mlx5e_xdp_info) { .page.page = page });
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  160  		for (i = 0; i < xdptxdf.sinfo->nr_frags; i++) {
eb9b9fdcafe29f0 Tariq Toukan       2023-04-17  161  			skb_frag_t *frag = &xdptxdf.sinfo->frags[i];
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  162  
3f734b8c594bd37 Tariq Toukan       2023-04-17  163  			mlx5e_xdpi_fifo_push(&sq->db.xdpi_fifo,
3f734b8c594bd37 Tariq Toukan       2023-04-17  164  					     (union mlx5e_xdp_info)
3f734b8c594bd37 Tariq Toukan       2023-04-17  165  					     { .page.page = skb_frag_page(frag) });
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  166  		}
3f734b8c594bd37 Tariq Toukan       2023-04-17  167  	} else {
3f734b8c594bd37 Tariq Toukan       2023-04-17  168  		mlx5e_xdpi_fifo_push(&sq->db.xdpi_fifo,
3f734b8c594bd37 Tariq Toukan       2023-04-17  169  				     (union mlx5e_xdp_info) { .page.num = 1 });
3f734b8c594bd37 Tariq Toukan       2023-04-17  170  		mlx5e_xdpi_fifo_push(&sq->db.xdpi_fifo,
3f734b8c594bd37 Tariq Toukan       2023-04-17  171  				     (union mlx5e_xdp_info) { .page.page = page });
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  172  	}
a48ad58cec18702 Maxim Mikityanskiy 2022-01-31  173  
49529a1726850bd Maxim Mikityanskiy 2022-01-28  174  	return true;
c94e4f117e473de Tariq Toukan       2018-07-15  175  }
c94e4f117e473de Tariq Toukan       2018-07-15  176  

:::::: The code at line 124 was first introduced by commit
:::::: ddc87e7d477552084fd185b315a39d5067b01773 net/mlx5e: Store DMA address inside struct page

:::::: TO: Maxim Mikityanskiy <maximmi@nvidia.com>
:::::: CC: Saeed Mahameed <saeedm@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
