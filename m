Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F352E1F06
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 May 2026 05:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778046333; cv=none; b=TboWqFi4uCjK35zu2ywh0BpmxsaGIglP8v6ytgsQWSgttqBT+sVsNGP+mdSgRR1pj82Ckj++/PZMzGoNFK3H3DA3DY2ewiAlq37CKVLgFkfu7AM7GWE6ZOWmu/8GOAWC7U3M4OaS+6EPQJOndK8DIDM4xskcOctD6Y/53FXPt6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778046333; c=relaxed/simple;
	bh=TaOIekrNrzICi30QJjvxrorufXF07qkv8jSnvZiNOBw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eQ72oReIp8JIiRVWj4LjjJX8SDAMIMsoe7T7c3yefRNfCwxnHW6xSSOevTORz8pgwbe3p89Q4PA+foFn4uIPF/Dxj5LTta1qo9CtmUCGbrG+PvEJzkTPJ/zJ2k61qO/BtjkjjbKKar2KD1uOV6Le6IgC//8weSQ45K8ryDYjnwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oElSwQSh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oElSwQSh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778046333; x=1809582333;
  h=date:from:to:cc:subject:message-id;
  bh=TaOIekrNrzICi30QJjvxrorufXF07qkv8jSnvZiNOBw=;
  b=oElSwQSh8w/Lihcsoe/zx/NtB6c1AYk0lqlWVF4NOXt0/CXdARNY3MyF
   ftzs+q/7A6KL/BK61qkPOEcPtyhylzDzQ8Ms2VFTGNzI+EmjRETpxOh58
   jPdDnfQEpwhquIP29Dj0HtxGnsMzx9NZN9lhKJylh/XDdsKXr+2oKJtNE
   hFrI4hZ0RMvqugrR+oEx72TDSFqPIP21yh8Go4hJ3yJkMbD7zZmY2FpsL
   fT/FmvT4OOi0VSGSNpeWmwKDOVSl7RSXayrZ/vQeNYuZ3k0YHVoZgTeCv
   bDH5XpEbI8b4YinNoZGZfbcCmcnNsqKtrbea3ENC4EXQuJEd7LVYwoike
   Q==;
X-CSE-ConnectionGUID: ZaUwH94jRPGA8z9ftb4ogA==
X-CSE-MsgGUID: Au0OdwZ8QdOnFRM6dFZaYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96363054"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="96363054"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 22:45:30 -0700
X-CSE-ConnectionGUID: ILFBzL1xTDGm+z1RJ7Rn1g==
X-CSE-MsgGUID: BPbA4Cp6RyOjoDmBfa55CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; 
   d="scan'208";a="231445359"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 May 2026 22:45:29 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKV4Y-000000000jv-2roC;
	Wed, 06 May 2026 05:45:26 +0000
Date: Wed, 06 May 2026 13:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_transport_instance_handle_V1 4/5]
 drivers/firmware/arm_scmi/transports/virtio.c:187:36: error: 'mutexname'
 undeclared here (not in a function); did you mean 'putname'?
Message-ID: <202605061319.vLf86C8s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_transport_instance_handle_V1
head:   13190d4c752c9adc3184690ccf035795be170fb9
commit: 25da96b2ceb31392d167fcc5d252a1f26ccae5c4 [4/5] firmware: arm_scmi: virtio: Rework transport probe sequence
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260506/202605061319.vLf86C8s-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605061319.vLf86C8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605061319.vLf86C8s-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/platform_device.h:13,
                    from drivers/firmware/arm_scmi/transports/virtio.c:23:
>> drivers/firmware/arm_scmi/transports/virtio.c:187:36: error: 'mutexname' undeclared here (not in a function); did you mean 'putname'?
     187 |         .mtx = __MUTEX_INITIALIZER(mutexname),
         |                                    ^~~~~~~~~
   include/linux/mutex.h:40:21: note: in definition of macro '__DEBUG_MUTEX_INITIALIZER'
      40 |         , .magic = &lockname
         |                     ^~~~~~~~
   drivers/firmware/arm_scmi/transports/virtio.c:187:16: note: in expansion of macro '__MUTEX_INITIALIZER'
     187 |         .mtx = __MUTEX_INITIALIZER(mutexname),
         |                ^~~~~~~~~~~~~~~~~~~


vim +187 drivers/firmware/arm_scmi/transports/virtio.c

  > 23	#include <linux/platform_device.h>
    24	#include <linux/refcount.h>
    25	#include <linux/slab.h>
    26	#include <linux/virtio.h>
    27	#include <linux/virtio_config.h>
    28	
    29	#include <uapi/linux/virtio_ids.h>
    30	#include <uapi/linux/virtio_scmi.h>
    31	
    32	#include "../common.h"
    33	
    34	#define VIRTIO_MAX_RX_TIMEOUT_MS	60000
    35	#define VIRTIO_SCMI_MAX_MSG_SIZE 128 /* Value may be increased. */
    36	#define VIRTIO_SCMI_MAX_PDU_SIZE(ci) \
    37		((ci)->max_msg_size + SCMI_MSG_MAX_PROT_OVERHEAD)
    38	#define DESCRIPTORS_PER_TX_MSG 2
    39	
    40	/**
    41	 * struct scmi_vio_channel - Transport channel information
    42	 *
    43	 * @vqueue: Associated virtqueue
    44	 * @cinfo: SCMI Tx or Rx channel
    45	 * @free_lock: Protects access to the @free_list.
    46	 * @free_list: List of unused scmi_vio_msg, maintained for Tx channels only
    47	 * @deferred_tx_work: Worker for TX deferred replies processing
    48	 * @deferred_tx_wq: Workqueue for TX deferred replies
    49	 * @pending_lock: Protects access to the @pending_cmds_list.
    50	 * @pending_cmds_list: List of pre-fetched commands queueud for later processing
    51	 * @is_rx: Whether channel is an Rx channel
    52	 * @max_msg: Maximum number of pending messages for this channel.
    53	 * @lock: Protects access to all members except users, free_list and
    54	 *	  pending_cmds_list.
    55	 * @shutdown_done: A reference to a completion used when freeing this channel.
    56	 * @users: A reference count to currently active users of this channel.
    57	 */
    58	struct scmi_vio_channel {
    59		struct virtqueue *vqueue;
    60		struct scmi_chan_info *cinfo;
    61		/* lock to protect access to the free list. */
    62		spinlock_t free_lock;
    63		struct list_head free_list;
    64		/* lock to protect access to the pending list. */
    65		spinlock_t pending_lock;
    66		struct list_head pending_cmds_list;
    67		struct work_struct deferred_tx_work;
    68		struct workqueue_struct *deferred_tx_wq;
    69		bool is_rx;
    70		unsigned int max_msg;
    71		/*
    72		 * Lock to protect access to all members except users, free_list and
    73		 * pending_cmds_list
    74		 */
    75		spinlock_t lock;
    76		struct completion *shutdown_done;
    77		refcount_t users;
    78	};
    79	
    80	enum poll_states {
    81		VIO_MSG_NOT_POLLED,
    82		VIO_MSG_POLL_TIMEOUT,
    83		VIO_MSG_POLLING,
    84		VIO_MSG_POLL_DONE,
    85	};
    86	
    87	/**
    88	 * struct scmi_vio_msg - Transport PDU information
    89	 *
    90	 * @request: SDU used for commands
    91	 * @input: SDU used for (delayed) responses and notifications
    92	 * @list: List which scmi_vio_msg may be part of
    93	 * @rx_len: Input SDU size in bytes, once input has been received
    94	 * @max_len: Maximumm allowed SDU size in bytes
    95	 * @poll_idx: Last used index registered for polling purposes if this message
    96	 *	      transaction reply was configured for polling.
    97	 * @poll_status: Polling state for this message.
    98	 * @poll_lock: A lock to protect @poll_status
    99	 * @users: A reference count to track this message users and avoid premature
   100	 *	   freeing (and reuse) when polling and IRQ execution paths interleave.
   101	 */
   102	struct scmi_vio_msg {
   103		struct scmi_msg_payld *request;
   104		struct scmi_msg_payld *input;
   105		struct list_head list;
   106		unsigned int rx_len;
   107		unsigned int max_len;
   108		unsigned int poll_idx;
   109		enum poll_states poll_status;
   110		/* Lock to protect access to poll_status */
   111		spinlock_t poll_lock;
   112		refcount_t users;
   113	};
   114	
   115	static struct scmi_transport_core_operations *core;
   116	
   117	/* Only one SCMI VirtIO device can possibly exist */
   118	static struct virtio_device *scmi_vdev;
   119	
   120	/**
   121	 * struct scmi_virtio_suppliers  - Transport descriptor
   122	 * @mtx: A mutex to protect @available
   123	 * @available: A reference to an initialized transport device ready to use
   124	 *	       which  will cycle through the following 3 states:
   125	 *	       1. PTR_ERR(-EPROBE_DEFER) at start before transport is ready
   126	 *	       2. <supplier_dev> when transport is initialized, ready for use,
   127	 *	          but still unused
   128	 *	       3. PTR_ERR(-EBUSY) when transport supplier device is in use
   129	 * @th: An embedded transport handle object that embeds the helpers
   130	 *	implementing the above mentioned logic
   131	 *
   132	 * Note that this transport driver enforces single instance probing.
   133	 */
   134	struct scmi_virtio_suppliers {
   135		/* Protect @available */
   136		struct mutex mtx;
   137		struct device *available;
   138		const struct scmi_transport_handle th;
   139	};
   140	
   141	#define to_vsup(t)	container_of(t, struct scmi_virtio_suppliers, th)
   142	
   143	static int scmi_virtio_supplier_init(const struct scmi_transport_handle *th,
   144					     struct device *dev)
   145	{
   146		struct scmi_virtio_suppliers *vsup = to_vsup(th);
   147	
   148		guard(mutex)(&vsup->mtx);
   149		/* Was any transport already registered ? */
   150		if (!IS_ERR(vsup->available))
   151			return -EBUSY;
   152	
   153		vsup->available = dev;
   154	
   155		return 0;
   156	}
   157	
   158	static struct device *
   159	scmi_virtio_supplier_get(const struct scmi_transport_handle *th)
   160	{
   161		struct scmi_virtio_suppliers *vsup = to_vsup(th);
   162		struct device *supplier;
   163	
   164		guard(mutex)(&vsup->mtx);
   165		supplier = vsup->available;
   166		if (!IS_ERR(supplier))
   167			vsup->available = ERR_PTR(-EBUSY);
   168	
   169		return supplier;
   170	}
   171	
   172	static void scmi_virtio_supplier_put(const struct scmi_transport_handle *th,
   173					     struct device *supplier)
   174	{
   175		struct scmi_virtio_suppliers *vsup = to_vsup(th);
   176	
   177		guard(mutex)(&vsup->mtx);
   178		vsup->available = supplier;
   179	}
   180	
   181	static void scmi_virtio_supplier_cleanup(const struct scmi_transport_handle *th)
   182	{
   183		scmi_virtio_supplier_put(th, ERR_PTR(-EPROBE_DEFER));
   184	}
   185	
   186	static struct scmi_virtio_suppliers scmi_transport_suppliers = {
 > 187		.mtx = __MUTEX_INITIALIZER(mutexname),
   188		.available = INIT_ERR_PTR(-EPROBE_DEFER),
   189		.th.supplier_get = scmi_virtio_supplier_get,
   190		.th.supplier_put = scmi_virtio_supplier_put,
   191	};
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
