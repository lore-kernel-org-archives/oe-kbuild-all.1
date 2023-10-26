Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E87156E4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 19:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TLdHyDG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698349963; x=1729885963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QiK6xuyIyZRx01Rhm88tZnR9rSgvEsAvHUnhkrR59xc=;
  b=TLdHyDG7efp2ps1Ttd/9ZXlFuutpuX6ke6pun1UT4Kvt5sZVH+Z/kvId
   +KQQV1cL4Smw70Dyl9kr9FwK8tck/FMG1QAQJxqfdj5P1GjLR6ZGx0VgH
   PfCqZJcpLvVTMIzDj1lEz9isfd0rW+aAqaROmjkIasFI8YU+6XUNanUZR
   9+3OKZAMlLs25XFte/h33d09aUHig6KHf6Gc+DIsWHNzLp8iOb6Fahs2W
   u+nJOMohgw4AqWEaDRloNeONYVNzRoVBxF0oILm89TWwApRPKwKbVy5R1
   LuMR63Kv6UQkLzAQTqOcnkg8QjT9+mpY2TrtUkm/47jmuaNCDfqy4OmDN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="377997562"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="377997562"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 12:52:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="598294"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Oct 2023 12:52:28 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw6PF-000A5f-1V;
	Thu, 26 Oct 2023 19:52:37 +0000
Date: Fri, 27 Oct 2023 03:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hay <joshua.a.hay@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Alan Brady <alan.brady@intel.com>,
	Madhu Chittim <madhu.chittim@intel.com>,
	Phani Burra <phani.r.burra@intel.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Willem de Bruijn <willemb@google.com>,
	Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: [linux-next:master 1541/15220]
 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:194:29: warning:
 variable 'tx_buf' set but not used
Message-ID: <202310270325.EbixXKZC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joshua,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ef7141596eed0b4b45ef18b3626f428a6b0a822
commit: a251eee62133774cf35ff829041377e721ef9c8c [1541/15220] idpf: add SRIOV support and other ndo_ops
config: i386-buildonly-randconfig-003-20231027 (https://download.01.org/0day-ci/archive/20231027/202310270325.EbixXKZC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270325.EbixXKZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270325.EbixXKZC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c: In function 'idpf_tx_singleq_map':
>> drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:194:29: warning: variable 'tx_buf' set but not used [-Wunused-but-set-variable]
     194 |         struct idpf_tx_buf *tx_buf = first;
         |                             ^~~~~~


vim +/tx_buf +194 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c

a5ab9ee0df0be82 Joshua Hay 2023-08-07  178  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  179  /**
a5ab9ee0df0be82 Joshua Hay 2023-08-07  180   * idpf_tx_singleq_map - Build the Tx base descriptor
a5ab9ee0df0be82 Joshua Hay 2023-08-07  181   * @tx_q: queue to send buffer on
a5ab9ee0df0be82 Joshua Hay 2023-08-07  182   * @first: first buffer info buffer to use
a5ab9ee0df0be82 Joshua Hay 2023-08-07  183   * @offloads: pointer to struct that holds offload parameters
a5ab9ee0df0be82 Joshua Hay 2023-08-07  184   *
a5ab9ee0df0be82 Joshua Hay 2023-08-07  185   * This function loops over the skb data pointed to by *first
a5ab9ee0df0be82 Joshua Hay 2023-08-07  186   * and gets a physical address for each memory location and programs
a5ab9ee0df0be82 Joshua Hay 2023-08-07  187   * it and the length into the transmit base mode descriptor.
a5ab9ee0df0be82 Joshua Hay 2023-08-07  188   */
a5ab9ee0df0be82 Joshua Hay 2023-08-07  189  static void idpf_tx_singleq_map(struct idpf_queue *tx_q,
a5ab9ee0df0be82 Joshua Hay 2023-08-07  190  				struct idpf_tx_buf *first,
a5ab9ee0df0be82 Joshua Hay 2023-08-07  191  				struct idpf_tx_offload_params *offloads)
a5ab9ee0df0be82 Joshua Hay 2023-08-07  192  {
a5ab9ee0df0be82 Joshua Hay 2023-08-07  193  	u32 offsets = offloads->hdr_offsets;
a5ab9ee0df0be82 Joshua Hay 2023-08-07 @194  	struct idpf_tx_buf *tx_buf = first;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  195  	struct idpf_base_tx_desc *tx_desc;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  196  	struct sk_buff *skb = first->skb;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  197  	u64 td_cmd = offloads->td_cmd;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  198  	unsigned int data_len, size;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  199  	u16 i = tx_q->next_to_use;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  200  	struct netdev_queue *nq;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  201  	skb_frag_t *frag;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  202  	dma_addr_t dma;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  203  	u64 td_tag = 0;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  204  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  205  	data_len = skb->data_len;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  206  	size = skb_headlen(skb);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  207  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  208  	tx_desc = IDPF_BASE_TX_DESC(tx_q, i);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  209  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  210  	dma = dma_map_single(tx_q->dev, skb->data, size, DMA_TO_DEVICE);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  211  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  212  	/* write each descriptor with CRC bit */
a5ab9ee0df0be82 Joshua Hay 2023-08-07  213  	if (tx_q->vport->crc_enable)
a5ab9ee0df0be82 Joshua Hay 2023-08-07  214  		td_cmd |= IDPF_TX_DESC_CMD_ICRC;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  215  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  216  	for (frag = &skb_shinfo(skb)->frags[0];; frag++) {
a5ab9ee0df0be82 Joshua Hay 2023-08-07  217  		unsigned int max_data = IDPF_TX_MAX_DESC_DATA_ALIGNED;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  218  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  219  		if (dma_mapping_error(tx_q->dev, dma))
a5ab9ee0df0be82 Joshua Hay 2023-08-07  220  			return idpf_tx_dma_map_error(tx_q, skb, first, i);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  221  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  222  		/* record length, and DMA address */
a5ab9ee0df0be82 Joshua Hay 2023-08-07  223  		dma_unmap_len_set(tx_buf, len, size);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  224  		dma_unmap_addr_set(tx_buf, dma, dma);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  225  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  226  		/* align size to end of page */
a5ab9ee0df0be82 Joshua Hay 2023-08-07  227  		max_data += -dma & (IDPF_TX_MAX_READ_REQ_SIZE - 1);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  228  		tx_desc->buf_addr = cpu_to_le64(dma);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  229  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  230  		/* account for data chunks larger than the hardware
a5ab9ee0df0be82 Joshua Hay 2023-08-07  231  		 * can handle
a5ab9ee0df0be82 Joshua Hay 2023-08-07  232  		 */
a5ab9ee0df0be82 Joshua Hay 2023-08-07  233  		while (unlikely(size > IDPF_TX_MAX_DESC_DATA)) {
a5ab9ee0df0be82 Joshua Hay 2023-08-07  234  			tx_desc->qw1 = idpf_tx_singleq_build_ctob(td_cmd,
a5ab9ee0df0be82 Joshua Hay 2023-08-07  235  								  offsets,
a5ab9ee0df0be82 Joshua Hay 2023-08-07  236  								  max_data,
a5ab9ee0df0be82 Joshua Hay 2023-08-07  237  								  td_tag);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  238  			tx_desc++;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  239  			i++;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  240  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  241  			if (i == tx_q->desc_count) {
a5ab9ee0df0be82 Joshua Hay 2023-08-07  242  				tx_desc = IDPF_BASE_TX_DESC(tx_q, 0);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  243  				i = 0;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  244  			}
a5ab9ee0df0be82 Joshua Hay 2023-08-07  245  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  246  			dma += max_data;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  247  			size -= max_data;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  248  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  249  			max_data = IDPF_TX_MAX_DESC_DATA_ALIGNED;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  250  			tx_desc->buf_addr = cpu_to_le64(dma);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  251  		}
a5ab9ee0df0be82 Joshua Hay 2023-08-07  252  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  253  		if (!data_len)
a5ab9ee0df0be82 Joshua Hay 2023-08-07  254  			break;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  255  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  256  		tx_desc->qw1 = idpf_tx_singleq_build_ctob(td_cmd, offsets,
a5ab9ee0df0be82 Joshua Hay 2023-08-07  257  							  size, td_tag);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  258  		tx_desc++;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  259  		i++;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  260  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  261  		if (i == tx_q->desc_count) {
a5ab9ee0df0be82 Joshua Hay 2023-08-07  262  			tx_desc = IDPF_BASE_TX_DESC(tx_q, 0);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  263  			i = 0;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  264  		}
a5ab9ee0df0be82 Joshua Hay 2023-08-07  265  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  266  		size = skb_frag_size(frag);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  267  		data_len -= size;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  268  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  269  		dma = skb_frag_dma_map(tx_q->dev, frag, 0, size,
a5ab9ee0df0be82 Joshua Hay 2023-08-07  270  				       DMA_TO_DEVICE);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  271  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  272  		tx_buf = &tx_q->tx_buf[i];
a5ab9ee0df0be82 Joshua Hay 2023-08-07  273  	}
a5ab9ee0df0be82 Joshua Hay 2023-08-07  274  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  275  	skb_tx_timestamp(first->skb);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  276  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  277  	/* write last descriptor with RS and EOP bits */
a5ab9ee0df0be82 Joshua Hay 2023-08-07  278  	td_cmd |= (u64)(IDPF_TX_DESC_CMD_EOP | IDPF_TX_DESC_CMD_RS);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  279  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  280  	tx_desc->qw1 = idpf_tx_singleq_build_ctob(td_cmd, offsets,
a5ab9ee0df0be82 Joshua Hay 2023-08-07  281  						  size, td_tag);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  282  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  283  	IDPF_SINGLEQ_BUMP_RING_IDX(tx_q, i);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  284  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  285  	/* set next_to_watch value indicating a packet is present */
a5ab9ee0df0be82 Joshua Hay 2023-08-07  286  	first->next_to_watch = tx_desc;
a5ab9ee0df0be82 Joshua Hay 2023-08-07  287  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  288  	nq = netdev_get_tx_queue(tx_q->vport->netdev, tx_q->idx);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  289  	netdev_tx_sent_queue(nq, first->bytecount);
a5ab9ee0df0be82 Joshua Hay 2023-08-07  290  
a5ab9ee0df0be82 Joshua Hay 2023-08-07  291  	idpf_tx_buf_hw_update(tx_q, i, netdev_xmit_more());
a5ab9ee0df0be82 Joshua Hay 2023-08-07  292  }
a5ab9ee0df0be82 Joshua Hay 2023-08-07  293  

:::::: The code at line 194 was first introduced by commit
:::::: a5ab9ee0df0be82aefb099d29b707d2b106e1c87 idpf: add singleq start_xmit and napi poll

:::::: TO: Joshua Hay <joshua.a.hay@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
