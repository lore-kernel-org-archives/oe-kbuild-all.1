Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AA643
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 05:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685250118; x=1716786118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bGlnngY8NoMKMXYGAblzfilypk/A4dZEp+UBzqHcRBc=;
  b=eiqv3e80ezbG2obqxse3vChw1JhfYZJTUqtXHXhxk0etH0Ad1g2mHAXv
   WGL5ntL/mPstfbmGfEpe/oxwfNl+L7Is314RCTEZXvmhQAcNFbRSsvxSj
   lT5uuGRsuXAFbdmWdH5s13QK90SNW5YoSe3WJBT7fohK55NMzPPD8dcOW
   Wju0acCv/9nRsu1DJg1NSamHQYTlIFLOtBEqtmM7M0iPwe9jIwH3ouXd9
   5qplt5wYuYl9sKx/iox9Vd8k/IBccyWBK5Ay7euNUN/8eZHDuTCCV2SXi
   DuOTWv1midhdhr87E4P6YxbywJqMDL69oiUnyb6XcUvJs3woXadh1KDpu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="353325470"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="353325470"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 22:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="849980895"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="849980895"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 May 2023 22:01:55 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q38XS-000KRa-2D;
	Sun, 28 May 2023 05:01:54 +0000
Date: Sun, 28 May 2023 13:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hay <joshua.a.hay@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Alan Brady <alan.brady@intel.com>,
	Madhu Chittim <madhu.chittim@intel.com>,
	Phani Burra <phani.r.burra@intel.com>,
	Pavan Kumar Linga <pavan.kumar.linga@intel.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Willem de Bruijn <willemb@google.com>
Subject: [tnguy-next-queue:dev-queue 37/37]
 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:194:29: warning:
 variable 'tx_buf' set but not used
Message-ID: <202305281225.X8nTZBSM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Joshua,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   367c72ccb915a94596005aebb78557aeba517e90
commit: 5e9eec56736a45c0278d778f119225b413bec18b [37/37] idpf: configure SRIOV and add other ndo_ops
config: m68k-randconfig-s033-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281225.X8nTZBSM-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git/commit/?id=5e9eec56736a45c0278d778f119225b413bec18b
        git remote add tnguy-next-queue https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git
        git fetch --no-tags tnguy-next-queue dev-queue
        git checkout 5e9eec56736a45c0278d778f119225b413bec18b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/net/ethernet/intel/idpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281225.X8nTZBSM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c: In function 'idpf_tx_singleq_map':
>> drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c:194:29: warning: variable 'tx_buf' set but not used [-Wunused-but-set-variable]
     194 |         struct idpf_tx_buf *tx_buf = first;
         |                             ^~~~~~


vim +/tx_buf +194 drivers/net/ethernet/intel/idpf/idpf_singleq_txrx.c

8eeac5561ccec1 Joshua Hay 2023-05-22  178  
8eeac5561ccec1 Joshua Hay 2023-05-22  179  /**
8eeac5561ccec1 Joshua Hay 2023-05-22  180   * idpf_tx_singleq_map - Build the Tx base descriptor
8eeac5561ccec1 Joshua Hay 2023-05-22  181   * @tx_q: queue to send buffer on
8eeac5561ccec1 Joshua Hay 2023-05-22  182   * @first: first buffer info buffer to use
8eeac5561ccec1 Joshua Hay 2023-05-22  183   * @offloads: pointer to struct that holds offload parameters
8eeac5561ccec1 Joshua Hay 2023-05-22  184   *
8eeac5561ccec1 Joshua Hay 2023-05-22  185   * This function loops over the skb data pointed to by *first
8eeac5561ccec1 Joshua Hay 2023-05-22  186   * and gets a physical address for each memory location and programs
8eeac5561ccec1 Joshua Hay 2023-05-22  187   * it and the length into the transmit base mode descriptor.
8eeac5561ccec1 Joshua Hay 2023-05-22  188   */
8eeac5561ccec1 Joshua Hay 2023-05-22  189  static void idpf_tx_singleq_map(struct idpf_queue *tx_q,
8eeac5561ccec1 Joshua Hay 2023-05-22  190  				struct idpf_tx_buf *first,
8eeac5561ccec1 Joshua Hay 2023-05-22  191  				struct idpf_tx_offload_params *offloads)
8eeac5561ccec1 Joshua Hay 2023-05-22  192  {
8eeac5561ccec1 Joshua Hay 2023-05-22  193  	u32 offsets = offloads->hdr_offsets;
8eeac5561ccec1 Joshua Hay 2023-05-22 @194  	struct idpf_tx_buf *tx_buf = first;
8eeac5561ccec1 Joshua Hay 2023-05-22  195  	struct idpf_base_tx_desc *tx_desc;
8eeac5561ccec1 Joshua Hay 2023-05-22  196  	struct sk_buff *skb = first->skb;
8eeac5561ccec1 Joshua Hay 2023-05-22  197  	u64 td_cmd = offloads->td_cmd;
8eeac5561ccec1 Joshua Hay 2023-05-22  198  	unsigned int data_len, size;
8eeac5561ccec1 Joshua Hay 2023-05-22  199  	u16 i = tx_q->next_to_use;
8eeac5561ccec1 Joshua Hay 2023-05-22  200  	struct netdev_queue *nq;
8eeac5561ccec1 Joshua Hay 2023-05-22  201  	skb_frag_t *frag;
8eeac5561ccec1 Joshua Hay 2023-05-22  202  	dma_addr_t dma;
8eeac5561ccec1 Joshua Hay 2023-05-22  203  	u64 td_tag = 0;
8eeac5561ccec1 Joshua Hay 2023-05-22  204  
8eeac5561ccec1 Joshua Hay 2023-05-22  205  	data_len = skb->data_len;
8eeac5561ccec1 Joshua Hay 2023-05-22  206  	size = skb_headlen(skb);
8eeac5561ccec1 Joshua Hay 2023-05-22  207  
8eeac5561ccec1 Joshua Hay 2023-05-22  208  	tx_desc = IDPF_BASE_TX_DESC(tx_q, i);
8eeac5561ccec1 Joshua Hay 2023-05-22  209  
8eeac5561ccec1 Joshua Hay 2023-05-22  210  	dma = dma_map_single(tx_q->dev, skb->data, size, DMA_TO_DEVICE);
8eeac5561ccec1 Joshua Hay 2023-05-22  211  
8eeac5561ccec1 Joshua Hay 2023-05-22  212  	/* write each descriptor with CRC bit */
8eeac5561ccec1 Joshua Hay 2023-05-22  213  	if (tx_q->vport->crc_enable)
8eeac5561ccec1 Joshua Hay 2023-05-22  214  		td_cmd |= IDPF_TX_DESC_CMD_ICRC;
8eeac5561ccec1 Joshua Hay 2023-05-22  215  
8eeac5561ccec1 Joshua Hay 2023-05-22  216  	for (frag = &skb_shinfo(skb)->frags[0];; frag++) {
8eeac5561ccec1 Joshua Hay 2023-05-22  217  		unsigned int max_data = IDPF_TX_MAX_DESC_DATA_ALIGNED;
8eeac5561ccec1 Joshua Hay 2023-05-22  218  
8eeac5561ccec1 Joshua Hay 2023-05-22  219  		if (dma_mapping_error(tx_q->dev, dma))
8eeac5561ccec1 Joshua Hay 2023-05-22  220  			return idpf_tx_dma_map_error(tx_q, skb, first, i);
8eeac5561ccec1 Joshua Hay 2023-05-22  221  
8eeac5561ccec1 Joshua Hay 2023-05-22  222  		/* record length, and DMA address */
8eeac5561ccec1 Joshua Hay 2023-05-22  223  		dma_unmap_len_set(tx_buf, len, size);
8eeac5561ccec1 Joshua Hay 2023-05-22  224  		dma_unmap_addr_set(tx_buf, dma, dma);
8eeac5561ccec1 Joshua Hay 2023-05-22  225  
8eeac5561ccec1 Joshua Hay 2023-05-22  226  		/* align size to end of page */
8eeac5561ccec1 Joshua Hay 2023-05-22  227  		max_data += -dma & (IDPF_TX_MAX_READ_REQ_SIZE - 1);
8eeac5561ccec1 Joshua Hay 2023-05-22  228  		tx_desc->buf_addr = cpu_to_le64(dma);
8eeac5561ccec1 Joshua Hay 2023-05-22  229  
8eeac5561ccec1 Joshua Hay 2023-05-22  230  		/* account for data chunks larger than the hardware
8eeac5561ccec1 Joshua Hay 2023-05-22  231  		 * can handle
8eeac5561ccec1 Joshua Hay 2023-05-22  232  		 */
8eeac5561ccec1 Joshua Hay 2023-05-22  233  		while (unlikely(size > IDPF_TX_MAX_DESC_DATA)) {
8eeac5561ccec1 Joshua Hay 2023-05-22  234  			tx_desc->qw1 = idpf_tx_singleq_build_ctob(td_cmd,
8eeac5561ccec1 Joshua Hay 2023-05-22  235  								  offsets,
8eeac5561ccec1 Joshua Hay 2023-05-22  236  								  max_data,
8eeac5561ccec1 Joshua Hay 2023-05-22  237  								  td_tag);
8eeac5561ccec1 Joshua Hay 2023-05-22  238  			tx_desc++;
8eeac5561ccec1 Joshua Hay 2023-05-22  239  			i++;
8eeac5561ccec1 Joshua Hay 2023-05-22  240  
8eeac5561ccec1 Joshua Hay 2023-05-22  241  			if (i == tx_q->desc_count) {
8eeac5561ccec1 Joshua Hay 2023-05-22  242  				tx_desc = IDPF_BASE_TX_DESC(tx_q, 0);
8eeac5561ccec1 Joshua Hay 2023-05-22  243  				i = 0;
8eeac5561ccec1 Joshua Hay 2023-05-22  244  			}
8eeac5561ccec1 Joshua Hay 2023-05-22  245  
8eeac5561ccec1 Joshua Hay 2023-05-22  246  			dma += max_data;
8eeac5561ccec1 Joshua Hay 2023-05-22  247  			size -= max_data;
8eeac5561ccec1 Joshua Hay 2023-05-22  248  
8eeac5561ccec1 Joshua Hay 2023-05-22  249  			max_data = IDPF_TX_MAX_DESC_DATA_ALIGNED;
8eeac5561ccec1 Joshua Hay 2023-05-22  250  			tx_desc->buf_addr = cpu_to_le64(dma);
8eeac5561ccec1 Joshua Hay 2023-05-22  251  		}
8eeac5561ccec1 Joshua Hay 2023-05-22  252  
8eeac5561ccec1 Joshua Hay 2023-05-22  253  		if (!data_len)
8eeac5561ccec1 Joshua Hay 2023-05-22  254  			break;
8eeac5561ccec1 Joshua Hay 2023-05-22  255  
8eeac5561ccec1 Joshua Hay 2023-05-22  256  		tx_desc->qw1 = idpf_tx_singleq_build_ctob(td_cmd, offsets,
8eeac5561ccec1 Joshua Hay 2023-05-22  257  							  size, td_tag);
8eeac5561ccec1 Joshua Hay 2023-05-22  258  		tx_desc++;
8eeac5561ccec1 Joshua Hay 2023-05-22  259  		i++;
8eeac5561ccec1 Joshua Hay 2023-05-22  260  
8eeac5561ccec1 Joshua Hay 2023-05-22  261  		if (i == tx_q->desc_count) {
8eeac5561ccec1 Joshua Hay 2023-05-22  262  			tx_desc = IDPF_BASE_TX_DESC(tx_q, 0);
8eeac5561ccec1 Joshua Hay 2023-05-22  263  			i = 0;
8eeac5561ccec1 Joshua Hay 2023-05-22  264  		}
8eeac5561ccec1 Joshua Hay 2023-05-22  265  
8eeac5561ccec1 Joshua Hay 2023-05-22  266  		size = skb_frag_size(frag);
8eeac5561ccec1 Joshua Hay 2023-05-22  267  		data_len -= size;
8eeac5561ccec1 Joshua Hay 2023-05-22  268  
8eeac5561ccec1 Joshua Hay 2023-05-22  269  		dma = skb_frag_dma_map(tx_q->dev, frag, 0, size,
8eeac5561ccec1 Joshua Hay 2023-05-22  270  				       DMA_TO_DEVICE);
8eeac5561ccec1 Joshua Hay 2023-05-22  271  
8eeac5561ccec1 Joshua Hay 2023-05-22  272  		tx_buf = &tx_q->tx_buf[i];
8eeac5561ccec1 Joshua Hay 2023-05-22  273  	}
8eeac5561ccec1 Joshua Hay 2023-05-22  274  
8eeac5561ccec1 Joshua Hay 2023-05-22  275  	skb_tx_timestamp(first->skb);
8eeac5561ccec1 Joshua Hay 2023-05-22  276  
8eeac5561ccec1 Joshua Hay 2023-05-22  277  	/* write last descriptor with RS and EOP bits */
8eeac5561ccec1 Joshua Hay 2023-05-22  278  	td_cmd |= (u64)(IDPF_TX_DESC_CMD_EOP | IDPF_TX_DESC_CMD_RS);
8eeac5561ccec1 Joshua Hay 2023-05-22  279  
8eeac5561ccec1 Joshua Hay 2023-05-22  280  	tx_desc->qw1 = idpf_tx_singleq_build_ctob(td_cmd, offsets, size, td_tag);
8eeac5561ccec1 Joshua Hay 2023-05-22  281  
8eeac5561ccec1 Joshua Hay 2023-05-22  282  	IDPF_SINGLEQ_BUMP_RING_IDX(tx_q, i);
8eeac5561ccec1 Joshua Hay 2023-05-22  283  
8eeac5561ccec1 Joshua Hay 2023-05-22  284  	/* set next_to_watch value indicating a packet is present */
8eeac5561ccec1 Joshua Hay 2023-05-22  285  	first->next_to_watch = tx_desc;
8eeac5561ccec1 Joshua Hay 2023-05-22  286  
8eeac5561ccec1 Joshua Hay 2023-05-22  287  	nq = netdev_get_tx_queue(tx_q->vport->netdev, tx_q->idx);
8eeac5561ccec1 Joshua Hay 2023-05-22  288  	netdev_tx_sent_queue(nq, first->bytecount);
8eeac5561ccec1 Joshua Hay 2023-05-22  289  
8eeac5561ccec1 Joshua Hay 2023-05-22  290  	idpf_tx_buf_hw_update(tx_q, i, netdev_xmit_more());
8eeac5561ccec1 Joshua Hay 2023-05-22  291  }
8eeac5561ccec1 Joshua Hay 2023-05-22  292  

:::::: The code at line 194 was first introduced by commit
:::::: 8eeac5561ccec130e628d7aa78ae5ef6cee3f628 idpf: add singleq start_xmit and napi poll

:::::: TO: Joshua Hay <joshua.a.hay@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
