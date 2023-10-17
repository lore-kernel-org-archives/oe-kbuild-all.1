Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CB1430E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 22:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4SNvoqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697581303; x=1729117303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aC2FDLQv9donxPnz/vMOn39ZIGpl17OHfJwKiSl+Lpo=;
  b=F4SNvoqVVc2gHmpGmJ5BAEQxVhc2GnPYyMYTWRWAo+t73eBrd/heKtyQ
   GRPUSyQcLrOtYhIBDcBw2oAzqAu5RwCsnVBzE9kkrgGq7IcgjJopJJRa8
   TE5c06wMW//6t3ad/m4g+4ebxB9Rc5VTVVCvjmhKdvC2P8b3tDkv3zOic
   UwfynRLxoavf/CVG6LyjH77jxCoBeD3ZEaIixtWrLuwyXOGVRj+sVYHZY
   GWSFrjPTvtgH5qTc7mY8thC6k2XzxjzHdg4l8SOqrPVdbekEObqrjQTma
   26Ozd/yMSlDiL68OMEtrI+JkNWk9V5+cpYOBNUoxUGlgQnHuwWGzTxRAJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="472115564"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="472115564"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 15:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791355841"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="791355841"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Oct 2023 15:21:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qssRR-000A9v-2z;
	Tue, 17 Oct 2023 22:21:33 +0000
Date: Wed, 18 Oct 2023 06:21:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1009/1018] include/net/data_pool.h:91:24: error:
 implicit declaration of function 'io_zc_rx_buf_dma'; did you mean
 'io_zc_rx_put_buf'?
Message-ID: <202310180641.WLtF9f46-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: 9f51c6d3364cc1430726f2a50a81be50174722a6 [1009/1018] netdev/bnxt: add data pool and use it in BNXT driver
config: x86_64-randconfig-013-20231018 (https://download.01.org/0day-ci/archive/20231018/202310180641.WLtF9f46-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180641.WLtF9f46-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180641.WLtF9f46-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/data_pool.h:4,
                    from drivers/net/ethernet/broadcom/bnxt/bnxt.c:58:
   include/linux/io_uring.h:131:6: warning: no previous prototype for 'io_zc_rx_put_buf' [-Wmissing-prototypes]
     131 | void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
         |      ^~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/broadcom/bnxt/bnxt.c:58:
   include/net/data_pool.h: In function 'data_pool_get_dma_addr':
>> include/net/data_pool.h:91:24: error: implicit declaration of function 'io_zc_rx_buf_dma'; did you mean 'io_zc_rx_put_buf'? [-Werror=implicit-function-declaration]
      91 |                 return io_zc_rx_buf_dma(buf);
         |                        ^~~~~~~~~~~~~~~~
         |                        io_zc_rx_put_buf
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_vf_target_id':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5212:42: error: invalid use of undefined type 'struct bnxt_vf_info'
    5212 |         struct bnxt_vf_info *vf = &pf->vf[vf_idx];
         |                                          ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5214:18: error: invalid use of undefined type 'struct bnxt_vf_info'
    5214 |         return vf->fw_fid;
         |                  ^~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5215:1: error: control reaches end of non-void function [-Werror=return-type]
    5215 | }
         | ^
   cc1: some warnings being treated as errors


vim +91 include/net/data_pool.h

     3	
   > 4	#include <linux/io_uring.h>
     5	#include <linux/io_uring_types.h>
     6	#include <linux/mm_types.h>
     7	#include <linux/netdevice.h>
     8	#include <net/netdev_rx_queue.h>
     9	
    10	static inline struct netdev_rx_queue *
    11	data_pool_get_rx_queue(struct net_device *dev, unsigned int q_idx)
    12	{
    13		if (q_idx >= dev->num_rx_queues)
    14			return NULL;
    15		return __netif_get_rx_queue(dev, q_idx);
    16	}
    17	
    18	static inline int data_pool_set_page_pool(struct net_device *dev,
    19						  unsigned int q_idx,
    20						  struct page_pool *pool)
    21	{
    22		struct netdev_rx_queue *rxq;
    23	
    24		rxq = data_pool_get_rx_queue(dev, q_idx);
    25		if (!rxq)
    26			return -EINVAL;
    27	
    28		rxq->page_pool = pool;
    29		return 0;
    30	}
    31	
    32	static inline int data_pool_set_zc_ifq(struct net_device *dev,
    33						unsigned int q_idx,
    34						struct io_zc_rx_ifq *ifq)
    35	{
    36		struct netdev_rx_queue *rxq;
    37	
    38		rxq = data_pool_get_rx_queue(dev, q_idx);
    39		if (!rxq)
    40			return -EINVAL;
    41	
    42		rxq->zc_ifq = ifq;
    43		return 0;
    44	}
    45	
    46	static inline struct page *data_pool_alloc_page(struct netdev_rx_queue *rxq)
    47	{
    48		if (rxq->zc_ifq) {
    49			struct io_zc_rx_buf *buf;
    50			buf = io_zc_rx_get_buf(rxq->zc_ifq);
    51			if (!buf)
    52				return NULL;
    53			return buf->page;
    54		} else {
    55			return page_pool_dev_alloc_pages(rxq->page_pool);
    56		}
    57	}
    58	
    59	static inline void data_pool_fragment_page(struct netdev_rx_queue *rxq,
    60						   struct page *page,
    61						   unsigned long bias)
    62	{
    63		if (rxq->zc_ifq) {
    64			struct io_zc_rx_buf *buf;
    65			buf = io_zc_rx_buf_from_page(rxq->zc_ifq, page);
    66			atomic_set(&buf->refcount, bias);
    67		} else {
    68			page_pool_fragment_page(page, bias);
    69		}
    70	}
    71	
    72	static inline void data_pool_put_page(struct netdev_rx_queue *rxq,
    73					      struct page *page)
    74	{
    75		if (rxq->zc_ifq) {
    76			struct io_zc_rx_buf *buf;
    77			buf = io_zc_rx_buf_from_page(rxq->zc_ifq, page);
    78			io_zc_rx_put_buf(rxq->zc_ifq, buf);
    79		} else {
    80			WARN_ON_ONCE(page->pp_magic != PP_SIGNATURE);
    81			page_pool_recycle_direct(rxq->page_pool, page);
    82		}
    83	}
    84	
    85	static inline dma_addr_t data_pool_get_dma_addr(struct netdev_rx_queue *rxq,
    86							struct page *page)
    87	{
    88		if (rxq->zc_ifq) {
    89			struct io_zc_rx_buf *buf;
    90			buf = io_zc_rx_buf_from_page(rxq->zc_ifq, page);
  > 91			return io_zc_rx_buf_dma(buf);
    92		} else {
    93			return page_pool_get_dma_addr(page);
    94		}
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
