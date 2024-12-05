Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7D4156C6A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 03:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733368926; cv=none; b=jwimew9TRTmcHrsUG1mAYsZEzM7JPU1PpvOmmyNbl4xtfDu++mNgLfxnTmWZkABaqnpG8TxmSQXgdz9KkUZSKgyC/EVPatFIcNxsAEwiEgkk+E9BO9C1cLuAkwiv38WfvGdq4/5Uhi4ej/jNLttOzRyyzzr6XiXKDDxvUGoLd1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733368926; c=relaxed/simple;
	bh=sRH9ZQcLt428BfpTRYeShEDBq+MDgD/Z3LL60N2fKyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L7AAjCntQI9gtCgefYu9ZVmrDzJBero4ApN5lmlTkaQ0UlmboOTYlNDyLP1RI+n7GKUVuOJ2yNTBMM5JL0Zginc8PMjgtk2+mv2VxlgTiwM/55EM0eVKjvktFSDi2mk81CJw2ebMBedMyfxhFrzI7Eiplw2dHxdE8xO5yVqpF64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2jiBztS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2jiBztS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733368924; x=1764904924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sRH9ZQcLt428BfpTRYeShEDBq+MDgD/Z3LL60N2fKyk=;
  b=g2jiBztS9HW2I28Ifv1Alw74qUiGQB6UEmWYFaVooFnCtZncI0LTYTAK
   WKzbKO5XGqAXQveRy+pOyMtqFNEMWeFTic6++wRXkASa/41XI7bYY26hR
   sOlyn71331zbgg4Cu6ZHYx38b22I4j4Z9RjPo/C/Fqtv7AYX+9yFnfaSF
   yayBlJIxumqVRVSMajHdC0NltFvt0JiqDhqGUZYp3O2Njha+b8n9YEC0K
   Q+EgHj7LQlUblb7uMwPRModgjak+FIUlTnZa2XVg77yqceNmvGMMS7ZkQ
   iYQIq7S6xXC968K+RKvyUpaDwDycV6OyBoSthHop27f3WbAHDyxRkvymQ
   Q==;
X-CSE-ConnectionGUID: BRy3GVo9TjSddzPqZVlg7g==
X-CSE-MsgGUID: raXpnj9kReq+bg2+jxVbBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37600509"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="37600509"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 19:22:01 -0800
X-CSE-ConnectionGUID: aA7ViynOTgSk7dCZVvfp1g==
X-CSE-MsgGUID: NxSYQw3WQUKi1+kjjXZywg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94396093"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Dec 2024 19:22:00 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ2RB-0003jU-2G;
	Thu, 05 Dec 2024 03:21:57 +0000
Date: Thu, 5 Dec 2024 11:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ambarus:acpm-v3-upstream 9/10]
 drivers/firmware/samsung/exynos-acpm.c:272:13: warning: variable 'ret' set
 but not used
Message-ID: <202412051138.uwdsYjiw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day acpm-v3-upstream
head:   20f606fa2a40e27ec03a65c1a7e7d59617173b99
commit: 2c7c337e69c51f04f63d04aa2c817eda43cf97ca [9/10] firmware: add exynos ACPM protocol driver
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20241205/202412051138.uwdsYjiw-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051138.uwdsYjiw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051138.uwdsYjiw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/samsung/exynos-acpm.c: In function 'acpm_dequeue_by_polling':
>> drivers/firmware/samsung/exynos-acpm.c:272:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     272 |         int ret;
         |             ^~~
--
>> drivers/firmware/samsung/exynos-acpm.c:78: warning: Function parameter or struct member 'reserved' not described in 'acpm_chan_shmem'
>> drivers/firmware/samsung/exynos-acpm.c:78: warning: Function parameter or struct member 'reserved1' not described in 'acpm_chan_shmem'
>> drivers/firmware/samsung/exynos-acpm.c:78: warning: Function parameter or struct member 'reserved2' not described in 'acpm_chan_shmem'
>> drivers/firmware/samsung/exynos-acpm.c:146: warning: Function parameter or struct member 'rx_lock' not described in 'acpm_chan'


vim +/ret +272 drivers/firmware/samsung/exynos-acpm.c

    49	
    50	/**
    51	 * struct acpm_chan_shmem - descriptor of a shared memory channel.
    52	 *
    53	 * @id:			channel ID.
    54	 * @rx_rear:		rear pointer of APM RX queue (TX for AP).
    55	 * @rx_front:		front pointer of APM RX queue (TX for AP).
    56	 * @rx_base:		base address of APM RX queue (TX for AP).
    57	 * @tx_rear:		rear pointer of APM TX queue (RX for AP).
    58	 * @tx_front:		front pointer of APM TX queue (RX for AP).
    59	 * @tx_base:		base address of APM TX queue (RX for AP).
    60	 * @qlen:		queue length. Applies to both TX/RX queues.
    61	 * @mlen:		message length. Applies to both TX/RX queues.
    62	 * @poll_completion:	true when the channel works on polling.
    63	 */
    64	struct acpm_chan_shmem {
    65		u32 id;
    66		u32 reserved[3];
    67		u32 rx_rear;
    68		u32 rx_front;
    69		u32 rx_base;
    70		u32 reserved1[3];
    71		u32 tx_rear;
    72		u32 tx_front;
    73		u32 tx_base;
    74		u32 qlen;
    75		u32 mlen;
    76		u32 reserved2[2];
    77		u32 poll_completion;
  > 78	};
    79	
    80	/**
    81	 * struct acpm_queue - exynos acpm queue.
    82	 *
    83	 * @rear:	rear address of the queue.
    84	 * @front:	front address of the queue.
    85	 * @base:	base address of the queue.
    86	 */
    87	struct acpm_queue {
    88		void __iomem *rear;
    89		void __iomem *front;
    90		void __iomem *base;
    91	};
    92	
    93	/**
    94	 * struct acpm_rx_data - RX queue data.
    95	 *
    96	 * @cmd:	pointer to where the data shall be saved.
    97	 * @response:	true if the client expects the RX data.
    98	 */
    99	struct acpm_rx_data {
   100		u32 *cmd;
   101		bool response;
   102	};
   103	
   104	#define ACPM_SEQNUM_MAX    64
   105	
   106	/**
   107	 * struct acpm_chan - driver internal representation of a channel.
   108	 * @cl:		mailbox client.
   109	 * @chan:	mailbox channel.
   110	 * @acpm:	pointer to driver private data.
   111	 * @tx:		TX queue. The enqueue is done by the host.
   112	 *			- front index is written by the host.
   113	 *			- rear index is written by the firmware.
   114	 *
   115	 * @rx:		RX queue. The enqueue is done by the firmware.
   116	 *			- front index is written by the firmware.
   117	 *			- rear index is written by the host.
   118	 * @tx_lock:	protects RX queue.
   119	 * @tx_lock:	protects TX queue.
   120	 * @qlen:	queue length. Applies to both TX/RX queues.
   121	 * @mlen:	message length. Applies to both TX/RX queues.
   122	 * @seqnum:	sequence number of the last message enqueued on TX queue.
   123	 * @id:		channel ID.
   124	 * @poll_completion:	indicates if the transfer needs to be polled for
   125	 *			completion or interrupt mode is used.
   126	 * @bitmap_seqnum: bitmap that tracks the messages on the TX/RX queues.
   127	 * @rx_data:	internal buffer used to drain the RX queue.
   128	 */
   129	struct acpm_chan {
   130		struct mbox_client cl;
   131		struct mbox_chan *chan;
   132		struct acpm_info *acpm;
   133		struct acpm_queue tx;
   134		struct acpm_queue rx;
   135		spinlock_t rx_lock;
   136		spinlock_t tx_lock;
   137	
   138		unsigned int qlen;
   139		unsigned int mlen;
   140		u8 seqnum;
   141		u8 id;
   142		bool poll_completion;
   143	
   144		DECLARE_BITMAP(bitmap_seqnum, ACPM_SEQNUM_MAX - 1);
   145		struct acpm_rx_data rx_data[ACPM_SEQNUM_MAX];
 > 146	};
   147	
   148	/**
   149	 * struct acpm_info - driver's private data.
   150	 * @shmem:	pointer to the SRAM configuration data.
   151	 * @sram_base:	base address of SRAM.
   152	 * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
   153	 * @dev:	pointer to the exynos-acpm device.
   154	 * @handle:	instance of acpm_handle to send to clients.
   155	 * @node:	list head
   156	 * @num_chans:	number of channels available for this controller.
   157	 * @users:	number of users of this instance.
   158	 */
   159	struct acpm_info {
   160		struct acpm_shmem __iomem *shmem;
   161		void __iomem *sram_base;
   162		struct acpm_chan *chans;
   163		struct device *dev;
   164		struct acpm_handle handle;
   165		struct list_head node;
   166		u32 num_chans;
   167		/* protected by acpm_list_mutex */
   168		int users;
   169	};
   170	
   171	#define client_to_acpm_chan(c) container_of(c, struct acpm_chan, cl)
   172	#define handle_to_acpm_info(h) container_of(h, struct acpm_info, handle)
   173	
   174	/* List of all ACPM devices active in system */
   175	static LIST_HEAD(acpm_list);
   176	/* Protection for the entire list */
   177	static DEFINE_MUTEX(acpm_list_mutex);
   178	
   179	static int acpm_get_rx(struct acpm_chan *achan, struct acpm_xfer *xfer)
   180	{
   181		struct acpm_msg *tx = &xfer->tx;
   182		struct acpm_msg *rx = &xfer->rx;
   183		struct acpm_rx_data *rx_data;
   184		const void __iomem *base, *addr;
   185		u32 rx_front, rx_seqnum, tx_seqnum, seqnum;
   186		u32 i, val, mlen;
   187		bool rx_set = false;
   188	
   189		rx_front = readl_relaxed(achan->rx.front);
   190		i = readl_relaxed(achan->rx.rear);
   191	
   192		/* Bail out if RX is empty. */
   193		if (i == rx_front)
   194			return 0;
   195	
   196		base = achan->rx.base;
   197		mlen = achan->mlen;
   198	
   199		tx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, tx->cmd[0]);
   200	
   201		/* Drain RX queue. */
   202		do {
   203			/* Read RX seqnum. */
   204			addr = base + mlen * i;
   205			val = readl_relaxed(addr);
   206	
   207			rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, val);
   208			if (!rx_seqnum)
   209				return -EIO;
   210			/*
   211			 * mssg seqnum starts with value 1, whereas the driver considers
   212			 * the first mssg at index 0.
   213			 */
   214			seqnum = rx_seqnum - 1;
   215			rx_data = &achan->rx_data[seqnum];
   216	
   217			if (rx_data->response) {
   218				if (rx_seqnum == tx_seqnum) {
   219					__ioread32_copy(rx->cmd, addr, rx->len / 4);
   220					rx_set = true;
   221					clear_bit(seqnum, achan->bitmap_seqnum);
   222				} else {
   223					/*
   224					 * The RX data corresponds to another request.
   225					 * Save the data to drain the queue, but don't
   226					 * clear yet the bitmap. It will be cleared
   227					 * after the response is copied to the request.
   228					 */
   229					__ioread32_copy(rx_data->cmd, addr,
   230							rx->len / 4);
   231				}
   232			} else {
   233				clear_bit(seqnum, achan->bitmap_seqnum);
   234			}
   235	
   236			i = (i + 1) % achan->qlen;
   237		} while (i != rx_front);
   238	
   239		/* We saved all responses, mark RX empty. */
   240		writel_relaxed(rx_front, achan->rx.rear);
   241	
   242		/* Flush SRAM posted writes. */
   243		readl_relaxed(achan->rx.front);
   244	
   245		/*
   246		 * If the response was not in this iteration of the queue, check if the
   247		 * RX data was previously saved.
   248		 */
   249		rx_data = &achan->rx_data[tx_seqnum - 1];
   250		if (!rx_set && rx_data->response) {
   251			rx_seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM,
   252					      rx_data->cmd[0]);
   253	
   254			if (rx_seqnum == tx_seqnum) {
   255				memcpy(rx->cmd, rx_data->cmd, rx->len);
   256				clear_bit(rx_seqnum - 1, achan->bitmap_seqnum);
   257			}
   258		}
   259	
   260		return 0;
   261	}
   262	
   263	static int acpm_dequeue_by_polling(struct acpm_chan *achan,
   264					   struct acpm_xfer *xfer)
   265	{
   266		bool may_sleep = xfer->flags & ACPM_XFER_MAY_SLEEP;
   267		struct device *dev = achan->acpm->dev;
   268		struct acpm_msg *tx = &xfer->tx;
   269		unsigned long flags;
   270		unsigned int cnt_20us = 0;
   271		u32 seqnum;
 > 272		int ret;
   273	
   274		seqnum = FIELD_GET(ACPM_PROTOCOL_SEQNUM, tx->cmd[0]);
   275	
   276		do {
   277			spin_lock_irqsave(&achan->rx_lock, flags);
   278			ret = acpm_get_rx(achan, xfer);
   279			spin_unlock_irqrestore(&achan->rx_lock, flags);
   280	
   281			if (!test_bit(seqnum - 1, achan->bitmap_seqnum)) {
   282				dev_vdbg(dev, "cnt_20us = %d.\n", cnt_20us);
   283				return 0;
   284			}
   285	
   286			/* Determined experimentally. */
   287			may_sleep ? usleep_range(20, 30) : udelay(20);
   288			cnt_20us++;
   289		} while (cnt_20us < ACPM_POLL_TIMEOUT);
   290	
   291		dev_err(dev, "Timeout! ch:%u s:%u bitmap:%lx, cnt_20us = %d.\n",
   292			achan->id, seqnum, achan->bitmap_seqnum[0], cnt_20us);
   293	
   294		return -ETIME;
   295	}
   296	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
