Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B79145B2C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 05:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727675875; cv=none; b=ZjYMwFFijTIQHNByk7MBF7xRPwkK0VOYyXhBQDVMrBOdrygQZsMrpwWNdi66gqPBLCkxRWShODpgP2tdQwIYLKFduf5XRLj90zpnaio9UWDxQ7K2KsnmBd7xm2kw5yszEsmwkseReLhLXQjINiFnY9yia7uQhupGN58kxSmj2iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727675875; c=relaxed/simple;
	bh=bE+yuufA2r4DgY1U2XC2BeulkTqF5D+5uColP9HtrNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VH4l4mHvkfQMaaDsXlO/c51VyV7QlKEh5/Hq6fCEot5qtSW61QxF7TXhD0P9CT/TF1g3cF6xGv7HTUtNEY8XZrVBhMZ1jGkGwt/74Q8DioXOkK1m9SHBvOYPoC6pzFQ8ey1tBMXK+E1ORbbED+wE2KtGshLO9QnBQDCEdzqz5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pcv6/wLa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pcv6/wLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727675873; x=1759211873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bE+yuufA2r4DgY1U2XC2BeulkTqF5D+5uColP9HtrNo=;
  b=Pcv6/wLat8LuZW9NAppN6hPbAJRFBoSiowO0C6clSAaMpJm5CAizbRmx
   apFldohysKZmoB4n6gFAolp4JY/SHJA8z0pH75NMnk+e0eKp0PFUF899Q
   tYKQaeDRQu0RHQCqiK+ERTcr0CKefdALMxey6CmNM/ZJ+W0dAaJbqi1wy
   UntuDlc+76budpBxrFAiIVgyFgKFBx6U5s7VH1QPg1puAHJKjPYpDjJ+B
   IHWP1eixR4Vr8XoiubC18Kber+3PkXM+EvUxsUWIcoss+ZohyxXEfhTG1
   EfEp8F4xZfvuJrRzTZrNx0uHfU7O88KIHytvruHsf6ZwnB2t5WCI9+boH
   g==;
X-CSE-ConnectionGUID: yb7Iu/NFTpeTdHq7yXZE2A==
X-CSE-MsgGUID: QfQtqetCQwiVC6wE2zd6RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="38129803"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="38129803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 22:57:52 -0700
X-CSE-ConnectionGUID: VH9PEweBSFKwiyo04PIn4w==
X-CSE-MsgGUID: fnmnpfyQQk616vtu6yTLhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="96509615"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Sep 2024 22:57:51 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv9Pp-000P5j-0i;
	Mon, 30 Sep 2024 05:57:49 +0000
Date: Mon, 30 Sep 2024 13:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Dong Yibo <dong100@mucse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7044/14254]
 drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1236:6: warning: no
 previous prototype for 'rnpgbevf_alloc_rx_buffers'
Message-ID: <202409301357.XJDOWyKd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e4fe1cc5cc1a347dec844c60d34f6141780f05af
commit: bf177ad1d8f72824180b44563c09f37562f645de [7044/14254] drivers: initial support for rnpgbevf drivers from Mucse Technology
config: loongarch-randconfig-001-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301357.XJDOWyKd-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301357.XJDOWyKd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301357.XJDOWyKd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mucse/rnpgbevf/vf.h:13,
                    from drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf.h:14,
                    from drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:27:
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h: In function '_rnp_skb_dump':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:265:23: warning: variable 'tailroom' set but not used [-Wunused-but-set-variable]
     265 |         int headroom, tailroom;
         |                       ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:265:13: warning: variable 'headroom' set but not used [-Wunused-but-set-variable]
     265 |         int headroom, tailroom;
         |             ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:264:23: warning: variable 'has_trans' set but not used [-Wunused-but-set-variable]
     264 |         bool has_mac, has_trans;
         |                       ^~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_defines.h:264:14: warning: variable 'has_mac' set but not used [-Wunused-but-set-variable]
     264 |         bool has_mac, has_trans;
         |              ^~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: At top level:
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:119:6: warning: no previous prototype for 'rnpgbevf_unmap_and_free_tx_resource' [-Wmissing-prototypes]
     119 | void rnpgbevf_unmap_and_free_tx_resource(struct rnpgbevf_ring *ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1236:6: warning: no previous prototype for 'rnpgbevf_alloc_rx_buffers' [-Wmissing-prototypes]
    1236 | void rnpgbevf_alloc_rx_buffers(struct rnpgbevf_ring *rx_ring, u16 cleaned_count)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: In function 'rnpgbevf_clean_rx_irq':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1530:14: warning: variable 'xdp_xmit' set but not used [-Wunused-but-set-variable]
    1530 |         bool xdp_xmit = false;
         |              ^~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: At top level:
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2263:6: warning: no previous prototype for 'rnpgbevf_write_eitr_rx' [-Wmissing-prototypes]
    2263 | void rnpgbevf_write_eitr_rx(struct rnpgbevf_q_vector *q_vector)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2361:6: warning: no previous prototype for 'rnpgbevf_configure_tx_ring' [-Wmissing-prototypes]
    2361 | void rnpgbevf_configure_tx_ring(struct rnpgbevf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2426:6: warning: no previous prototype for 'rnpgbevf_disable_rx_queue' [-Wmissing-prototypes]
    2426 | void rnpgbevf_disable_rx_queue(struct rnpgbevf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2432:6: warning: no previous prototype for 'rnpgbevf_enable_rx_queue' [-Wmissing-prototypes]
    2432 | void rnpgbevf_enable_rx_queue(struct rnpgbevf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2438:6: warning: no previous prototype for 'rnpgbevf_configure_rx_ring' [-Wmissing-prototypes]
    2438 | void rnpgbevf_configure_rx_ring(struct rnpgbevf_adapter *adapter,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: In function 'rnpgbevf_vlan_rx_kill_vid':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:2561:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    2561 |         int err = -EOPNOTSUPP;
         |             ^~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: In function 'rnpgbevf_acquire_msix_vectors':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:3187:13: warning: variable 'vector_threshold' set but not used [-Wunused-but-set-variable]
    3187 |         int vector_threshold;
         |             ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: At top level:
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4378:6: warning: no previous prototype for 'rnpgbevf_tx_ctxtdesc' [-Wmissing-prototypes]
    4378 | void rnpgbevf_tx_ctxtdesc(struct rnpgbevf_ring *tx_ring, u16 mss_seg_len,
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4820:6: warning: no previous prototype for 'rnpgbevf_maybe_tx_ctxtdesc' [-Wmissing-prototypes]
    4820 | void rnpgbevf_maybe_tx_ctxtdesc(struct rnpgbevf_ring *tx_ring,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:4838:13: warning: no previous prototype for 'rnpgbevf_xmit_frame_ring' [-Wmissing-prototypes]
    4838 | netdev_tx_t rnpgbevf_xmit_frame_ring(struct sk_buff *skb,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:5311:6: warning: no previous prototype for 'rnpgbevf_assign_netdev_ops' [-Wmissing-prototypes]
    5311 | void rnpgbevf_assign_netdev_ops(struct net_device *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c: In function 'rnpgbevf_request_msix_irqs':
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1978:44: warning: '%d' directive output may be truncated writing between 1 and 5 bytes into a region of size between 1 and 16 [-Wformat-truncation=]
    1978 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                            ^~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1978:34: note: directive argument in the range [0, 65535]
    1978 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                  ^~~~~~~~~~~~~
   drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c:1977:25: note: 'snprintf' output between 10 and 29 bytes into a destination of size 24
    1977 |                         snprintf(q_vector->name, sizeof(q_vector->name) - 1,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1978 |                                  "%s-%s-%d-%d", netdev->name, "TxRx", i,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1979 |                                  q_vector->v_idx);
         |                                  ~~~~~~~~~~~~~~~~


vim +/rnpgbevf_alloc_rx_buffers +1236 drivers/net/ethernet/mucse/rnpgbevf/rnpgbevf_main.c

  1229	
  1230	#else
  1231	/**
  1232	 * rnpgbevf_alloc_rx_buffers - Replace used receive buffers
  1233	 * @rx_ring: ring to place buffers on
  1234	 * @cleaned_count: number of buffers to replace
  1235	 **/
> 1236	void rnpgbevf_alloc_rx_buffers(struct rnpgbevf_ring *rx_ring, u16 cleaned_count)
  1237	{
  1238		union rnp_rx_desc *rx_desc;
  1239		struct rnpgbevf_rx_buffer *bi;
  1240		u16 i = rx_ring->next_to_use;
  1241		u64 fun_id = ((u64)(rx_ring->vfnum) << (32 + 24));
  1242		u16 bufsz;
  1243		/* nothing to do */
  1244		if (!cleaned_count)
  1245			return;
  1246	
  1247		rx_desc = RNPVF_RX_DESC(rx_ring, i);
  1248	
  1249		BUG_ON(!rx_desc);
  1250	
  1251		bi = &rx_ring->rx_buffer_info[i];
  1252	
  1253		BUG_ON(!bi);
  1254	
  1255		i -= rx_ring->count;
  1256		bufsz = rnpgbevf_rx_bufsz(rx_ring);
  1257	
  1258		do {
  1259			if (!rnpgbevf_alloc_mapped_page(rx_ring, bi))
  1260				break;
  1261	
  1262			dma_sync_single_range_for_device(rx_ring->dev, bi->dma,
  1263							 bi->page_offset, bufsz,
  1264							 DMA_FROM_DEVICE);
  1265	
  1266			/* Refresh the desc even if buffer_addrs didn't change
  1267			 * because each write-back erases this info.
  1268			 */
  1269			rx_desc->pkt_addr =
  1270				cpu_to_le64(bi->dma + bi->page_offset + fun_id);
  1271	
  1272			/* clean dd */
  1273			rx_desc->cmd = 0;
  1274	
  1275			rx_desc++;
  1276			bi++;
  1277			i++;
  1278			if (unlikely(!i)) {
  1279				rx_desc = RNPVF_RX_DESC(rx_ring, 0);
  1280				bi = rx_ring->rx_buffer_info;
  1281				i -= rx_ring->count;
  1282			}
  1283	
  1284			/* clear the hdr_addr for the next_to_use descriptor */
  1285			cleaned_count--;
  1286		} while (cleaned_count);
  1287	
  1288		i += rx_ring->count;
  1289	
  1290		if (rx_ring->next_to_use != i)
  1291			rnpgbevf_update_rx_tail(rx_ring, i);
  1292	}
  1293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
