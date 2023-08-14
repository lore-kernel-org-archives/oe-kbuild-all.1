Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95415BE68
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692022204; x=1723558204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yOMvfMC8iXM8vOHJuzhPW0VugXR/wUpTtkryeMIlJN0=;
  b=S4XqWD4O/yEMLhzGIvruEYduBqb4J8H/ztkDcUagC/Bcp2k0FJttHqJR
   bcndVEMcuadpcML/FDqUE0KR9LM4c1PB5wWBNDid0MALj9HKYrE6sZ+sY
   INEzRWNwYQgotG2ZRnNFKfsa8rKupMM93sucI1yFiY1G2S1oRRg43zsF1
   P4gd5rAhj68xJZkZiVD8Z5hUtrncLM4c0W2cdQ6k/JQDTwMIncDd0GJSy
   ikcJO4THdzrTsDAhy3MUSWsDHWO8+dC1gyz7shD/U9ZiBvYQEAfIaO0HF
   jliQTjYnssmJqVAaZftDM3sNtMSgB7F0x1bYR8WhnTinG+/SCnADoBpm4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="375754731"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="375754731"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 07:09:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="907249215"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="907249215"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Aug 2023 07:09:10 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVYFq-0000BI-0G;
	Mon, 14 Aug 2023 14:09:10 +0000
Date: Mon, 14 Aug 2023 22:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: "G Jaya Kumaran, Vineetha" <vineetha.g.jaya.kumaran@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Fei Yang <fei.yang@intel.com>
Subject: [intel-lts:4.14/base 5560/28962] drivers/tty/cbc/cbc_core.c:54:6:
 warning: no previous declaration for 'cbc_core_configure_channel'
Message-ID: <202308142243.cgQ6Z5At-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaya,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.14/base
head:   65b8aaa4ae7a568d08d64eeee7b09f26f711c78f
commit: c32864654ac9f8e851eb0a8f21a79cc0ba74c7e2 [5560/28962] Integration of CBC line discipline kernel module
config: i386-randconfig-r081-20230814 (https://download.01.org/0day-ci/archive/20230814/202308142243.cgQ6Z5At-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230814/202308142243.cgQ6Z5At-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308142243.cgQ6Z5At-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/cbc/cbc_core.c:54:6: sparse: sparse: symbol 'cbc_core_configure_channel' was not declared. Should it be static?
   drivers/tty/cbc/cbc_core.c:70:6: sparse: sparse: symbol 'cbc_core_send_data' was not declared. Should it be static?
   drivers/tty/cbc/cbc_core.c:238:16: sparse: sparse: symbol 'target_specific_send_cbc_uart_data' was not declared. Should it be static?
>> drivers/tty/cbc/cbc_core.c:54:6: warning: no previous declaration for 'cbc_core_configure_channel' [-Wmissing-declarations]
    void cbc_core_configure_channel(u32 const channel_idx, const u8 priority,
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tty/cbc/cbc_core.c:70:6: warning: no previous declaration for 'cbc_core_send_data' [-Wmissing-declarations]
    void cbc_core_send_data(const u32 channel_idx, const u16 length,
         ^~~~~~~~~~~~~~~~~~
>> drivers/tty/cbc/cbc_core.c:238:16: warning: no previous declaration for 'target_specific_send_cbc_uart_data' [-Wmissing-declarations]
    enum cbc_error target_specific_send_cbc_uart_data(u16 length,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cbc_core_configure_channel +54 drivers/tty/cbc/cbc_core.c

    45	
    46	/*
    47	 * cbc_core_configure_channel - Set the priority and receive
    48	 *                              callback for a CBC channel.
    49	 * @channel_idx: Channel identifier (see cbc_channel_enumeration)
    50	 * @priority: Priority for channel.
    51	 * @data: Data associated with channel.
    52	 * @receive: Receive callback associated with channel.
    53	 */
  > 54	void cbc_core_configure_channel(u32 const channel_idx, const u8 priority,
    55					void *data,
    56					void (*receive)(void *data, const u16 length,
    57					const u8 * const buffer))
    58	{
    59		cbc_mux_configure_data_channel(channel_idx, priority, data, receive);
    60	}
    61	EXPORT_SYMBOL_GPL(cbc_core_configure_channel);
    62	
    63	/*
    64	 * cbc_core_send_data - Send to a CBC channel.
    65	 * @channel_idx: Channel identifier (see cbc_channel_enumeration)
    66	 * @priority: Priority for channel.
    67	 * @data: Data associated with channel.
    68	 * @receive: Receive function associated with channel.
    69	 */
  > 70	void cbc_core_send_data(const u32 channel_idx, const u16 length,
    71							const u8 * const buffer)
    72	{
    73		cbc_manager_transmit_data(channel_idx, length, buffer);
    74	}
    75	EXPORT_SYMBOL_GPL(cbc_core_send_data);
    76	
    77	/*
    78	 * cbc_ldisc_open - Open the CBC connection to the IOC.
    79	 * @tty: Handle to tty.
    80	 *
    81	 * This function is called by the tty module when the
    82	 * line discipline is requested. It allocates the memory pool and creates the
    83	 * CBC devices.
    84	 * Called in process context serialized from other ldisc calls.
    85	 *
    86	 * Return: 0 on success error otherwise.
    87	 */
    88	static int cbc_ldisc_open(struct tty_struct *tty)
    89	{
    90		struct cbc_struct *cbc;
    91		int err;
    92	
    93		pr_debug("cbc-ldisc open.\n");
    94		mutex_lock(&cbc_core.ldisc_mutex);
    95	
    96		if (WARN_ON(tty->ops->write == NULL)) {
    97			pr_err("cbc-ldisc open write not supported.\n");
    98			err = -EOPNOTSUPP;
    99			goto err_exit;
   100		}
   101	
   102		cbc = tty->disc_data;
   103	
   104		err = -EEXIST;
   105		/* First make sure we're not already connected. */
   106		if (WARN_ON(cbc && cbc->magic == CBC_MAGIC)) {
   107			pr_err(
   108			"cbc-ldisc CBC line discipline already open or CBC magic wrong.\n");
   109			goto err_exit;
   110		}
   111	
   112		cbc = &cbc_core;
   113	
   114		cbc->tty = tty;
   115		tty->disc_data = cbc;
   116		tty->receive_room = 65536;
   117	
   118		/* Create class cbc-core. This will appear as /sys/class/cbc* */
   119		cbc->cbc_class = class_create(THIS_MODULE, "cbc");
   120	
   121		if (WARN_ON(!cbc->cbc_class)) {
   122			pr_err("cbc-ldisc open could not create cbc class.\n");
   123			goto err_exit;
   124		}
   125	
   126		/* Create memory pool */
   127		cbc->memory_pool = cbc_memory_pool_create(
   128				CBC_QUEUE_LENGTH * CBC_CHANNEL_MAX_NUMBER);
   129		if (WARN_ON(!cbc->memory_pool)) {
   130			pr_err("failed to create memory pool.\n");
   131			goto err_exit;
   132		}
   133	
   134		/* Initialise on every open, so we start with sequence-counters at 0.*/
   135		cbc_link_layer_init(cbc->memory_pool);
   136	
   137		/* Register devices here. */
   138		err = cbc_register_devices(cbc->cbc_class, cbc->memory_pool);
   139		if (err != 0) {
   140			pr_err("register devices failed\n");
   141			goto err_exit;
   142		}
   143	
   144		cbc_link_layer_set_frame_granularity(granularity);
   145	
   146		/* tty layer expects 0 on success */
   147		mutex_unlock(&cbc_core.ldisc_mutex);
   148		return 0;
   149	
   150	err_exit: mutex_unlock(&cbc_core.ldisc_mutex);
   151		return err;
   152	}
   153	
   154	/*
   155	 * cbc_ldisc_close - Close down the CBC communication.
   156	 * @tty: Handle to tty
   157	 *
   158	 * Unregister CBC devices and destroy CBC class.
   159	 */
   160	static void cbc_ldisc_close(struct tty_struct *tty)
   161	{
   162		struct cbc_struct *cbc;
   163	
   164		mutex_lock(&cbc_core.ldisc_mutex);
   165	
   166		cbc = (struct cbc_struct *) tty->disc_data;
   167		pr_debug("cbc-ldisc close\n");
   168	
   169		if (cbc && cbc->magic == CBC_MAGIC && cbc->tty == tty) {
   170			cbc_unregister_devices(cbc->cbc_class);
   171			class_destroy(cbc->cbc_class);
   172			if (WARN_ON(!cbc_memory_pool_try_free(cbc->memory_pool)))
   173				pr_err("could not free memory pool.\n");
   174			tty->disc_data = NULL;
   175			cbc->tty = NULL;
   176		} else {
   177			WARN_ON(1);
   178			pr_err("ldisc close with wrong CBC magic.\n");
   179		}
   180	
   181		mutex_unlock(&cbc_core.ldisc_mutex);
   182	}
   183	
   184	/*
   185	 * Close line discipline on ldisc hangup.
   186	 * @tty: Handle to tty
   187	 */
   188	static int cbc_ldisc_hangup(struct tty_struct *tty)
   189	{
   190		cbc_ldisc_close(tty);
   191		return 0;
   192	}
   193	
   194	/*
   195	 * cbc_ldisc_receive_buf - .receive call for a line discipline.
   196	 * @tty: Handle to tty
   197	 * @cp:  Received data buffer.
   198	 * @fp:  Not used
   199	 * @count: Amount of data received.
   200	 *
   201	 * Attempts to read a single CBC frame at a time. Cycles round
   202	 * until all data has been processed.
   203	 */
   204	static void cbc_ldisc_receive_buf(struct tty_struct *tty,
   205			const unsigned char *cp, char *fp, int count)
   206	{
   207		struct cbc_struct *cbc;
   208		u8 accepted_bytes; /* per cbc_serial_receive call */
   209		unsigned int accepted_bytes_sum = 0;
   210	
   211		mutex_lock(&cbc_core.ldisc_mutex);
   212		cbc = (struct cbc_struct *) tty->disc_data;
   213	
   214		if (cbc && (cbc->magic == CBC_MAGIC) && (cbc->tty == tty)) {
   215			do {
   216				u8 chunksize = 254;
   217	
   218				if ((count - accepted_bytes_sum) < 255)
   219					chunksize = count - accepted_bytes_sum;
   220				accepted_bytes = cbc_core_on_receive_cbc_serial_data(
   221						chunksize, cp + accepted_bytes_sum);
   222				accepted_bytes_sum += accepted_bytes;
   223				cbc_link_layer_rx_handler();
   224			} while (accepted_bytes_sum != count);
   225		}
   226		mutex_unlock(&cbc_core.ldisc_mutex);
   227	}
   228	
   229	/*
   230	 * Called from ldisc when write is possible. Not used.
   231	 */
   232	static void cbc_ldisc_write_wakeup(struct tty_struct *tty)
   233	{
   234		(void) tty;
   235	}
   236	
   237	/* Called to send messages from channel specific device to the IOC */
 > 238	enum cbc_error target_specific_send_cbc_uart_data(u16 length,
   239							const u8 *raw_buffer)
   240	{
   241		mutex_lock(&cbc_core.ldisc_mutex);
   242		if (cbc_core.tty) {
   243			set_bit(TTY_DO_WRITE_WAKEUP, &cbc_core.tty->flags);
   244	
   245			cbc_core.tty->ops->write(cbc_core.tty, raw_buffer, length);
   246		}
   247		mutex_unlock(&cbc_core.ldisc_mutex);
   248	
   249		return CBC_OK;
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
