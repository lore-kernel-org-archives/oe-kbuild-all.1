Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39541C8603
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 May 2025 16:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759394; cv=none; b=bn5/1vc0RlnTrymHQTgNM+q0iQRTyYGrvLEfWAWXWkvH/k0Ro5gyd6NaidDTbletIszBu9d71Zmwp9eN/sgyoZoNTz/mfJ2SCuTSYGjyjpVLgMmWvSbdImhWIP0wZ4YcAxGA6pbG7+AHtG5EMnnlDG9FJGkVw8Awxw3YtwUOA6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759394; c=relaxed/simple;
	bh=7lCPFp5QWdV8KJ2u4ap9AMyOFK3mDiwCrPFt826vA1c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g869sjVL7LvpfAeXxX+Q7VBzu9zLXd3A36UHyjSWb+LFB4IDBIF7GCv62ZOJVAx48aRQfpE7Y0ZRx3JwHVFxkpWaXB19sVa4B36QkfMg/i114VlrrjtzNV7s+/1UEveqbHiUMJte1mnW9jcs9SF1aCxpZRYOmNfbfIc1tCxp3ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BsKwDvpz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsKwDvpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747759392; x=1779295392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7lCPFp5QWdV8KJ2u4ap9AMyOFK3mDiwCrPFt826vA1c=;
  b=BsKwDvpzV4pfGGwS9P8Jm1VWzhyVaoBGk3lDnmON3xe8MLgXd8Kf7raS
   JgwavMxZ3vgy7Mp1NAHV0YfsLHyotLYpEv+5nkuAEWS6NTPevv2KynVLH
   N/MywqTj3grG25bAaBG1eTVquaMv6xmKQFE8RE49AHijRd3EffhT0RvDd
   kFAEyf2+hh0P7mOVdJonUIpz+64B0v+t0bqekTX8hBuv1LFGyKlytrX2l
   SBotSBYl/lh9szwYBW2ioQv4F9CNf/7FXvi6ES5r4tetQJkMC0cok8LMI
   OIwfCRQFTEKxSPKrA6cqNR/mQzpwsFb186cY7H2DDTGbyA6LEYkIMb+O+
   g==;
X-CSE-ConnectionGUID: xh/zNU0iSCeFX7Y7QWNTWg==
X-CSE-MsgGUID: Ybkav+vBRHiE5auVr+fk1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52332712"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="52332712"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 09:43:11 -0700
X-CSE-ConnectionGUID: xEqZ5XZ1Q6yrgUDA425lSQ==
X-CSE-MsgGUID: B7L3CRGbQECwqL0l3D7YDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144717896"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 May 2025 09:43:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHQ3X-000NMu-28;
	Tue, 20 May 2025 16:43:07 +0000
Date: Wed, 21 May 2025 00:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mahesh Rao <mahesh.rao@altera.com>
Cc: oe-kbuild-all@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [dinguyen:socfpga_firmware_for_v6.17 3/5]
 drivers/firmware/stratix10-svc.c:178: warning: Function parameter or struct
 member 'res' not described in 'stratix10_svc_async_handler'
Message-ID: <202505210036.0KyalI7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_firmware_for_v6.17
head:   aa0777432acf3e371f2636f61c631620dfb655f8
commit: c97a5575bfe351b53a5bd4d3da60837eff376781 [3/5] firmware: stratix10-svc: Add initial support for asynchronous communication with Stratix 10 service channel
config: arm64-randconfig-002-20250520 (https://download.01.org/0day-ci/archive/20250521/202505210036.0KyalI7Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210036.0KyalI7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210036.0KyalI7Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/stratix10-svc.c:91: warning: Function parameter or struct member 'intel_svc_fcs' not described in 'stratix10_svc'
>> drivers/firmware/stratix10-svc.c:178: warning: Function parameter or struct member 'res' not described in 'stratix10_svc_async_handler'


vim +178 drivers/firmware/stratix10-svc.c

    83	
    84	/**
    85	 * struct stratix10_svc - svc private data
    86	 * @stratix10_svc_rsu: pointer to stratix10 RSU device
    87	 */
    88	struct stratix10_svc {
    89		struct platform_device *stratix10_svc_rsu;
    90		struct platform_device *intel_svc_fcs;
  > 91	};
    92	
    93	/**
    94	 * struct stratix10_svc_sh_memory - service shared memory structure
    95	 * @sync_complete: state for a completion
    96	 * @addr: physical address of shared memory block
    97	 * @size: size of shared memory block
    98	 * @invoke_fn: service clients to handle secure monitor or hypervisor calls
    99	 *
   100	 * This struct is used to save physical address and size of shared memory
   101	 * block. The shared memory blocked is allocated by secure monitor software
   102	 * at secure world.
   103	 *
   104	 * Service layer driver uses the physical address and size to create a memory
   105	 * pool, then allocates data buffer from that memory pool for service client.
   106	 */
   107	struct stratix10_svc_sh_memory {
   108		struct completion sync_complete;
   109		unsigned long addr;
   110		unsigned long size;
   111		svc_invoke_fn *invoke_fn;
   112	};
   113	
   114	/**
   115	 * struct stratix10_svc_data_mem - service memory structure
   116	 * @vaddr: virtual address
   117	 * @paddr: physical address
   118	 * @size: size of memory
   119	 * @node: link list head node
   120	 *
   121	 * This struct is used in a list that keeps track of buffers which have
   122	 * been allocated or freed from the memory pool. Service layer driver also
   123	 * uses this struct to transfer physical address to virtual address.
   124	 */
   125	struct stratix10_svc_data_mem {
   126		void *vaddr;
   127		phys_addr_t paddr;
   128		size_t size;
   129		struct list_head node;
   130	};
   131	
   132	/**
   133	 * struct stratix10_svc_data - service data structure
   134	 * @chan: service channel
   135	 * @paddr: physical address of to be processed payload
   136	 * @size: to be processed playload size
   137	 * @paddr_output: physical address of processed payload
   138	 * @size_output: processed payload size
   139	 * @command: service command requested by client
   140	 * @flag: configuration type (full or partial)
   141	 * @arg: args to be passed via registers and not physically mapped buffers
   142	 *
   143	 * This struct is used in service FIFO for inter-process communication.
   144	 */
   145	struct stratix10_svc_data {
   146		struct stratix10_svc_chan *chan;
   147		phys_addr_t paddr;
   148		size_t size;
   149		phys_addr_t paddr_output;
   150		size_t size_output;
   151		u32 command;
   152		u32 flag;
   153		u64 arg[3];
   154	};
   155	
   156	/**
   157	 * struct stratix10_svc_async_handler - Asynchronous handler for Stratix 10 service layer
   158	 * @transaction_id: Unique identifier for the transaction
   159	 * @achan: Pointer to the asynchronous channel structure
   160	 * @cb_arg: Argument to be passed to the callback function
   161	 * @cb: Callback function to be called upon completion
   162	 * @msg: Pointer to the client message structure
   163	 * @next: Node in the hash list
   164	 *
   165	 * This structure is used to handle asynchronous transactions in the
   166	 * Stratix 10 service layer. It maintains the necessary information
   167	 * for processing and completing asynchronous requests.
   168	 */
   169	
   170	struct stratix10_svc_async_handler {
   171		u8 transaction_id;
   172		struct stratix10_async_chan *achan;
   173		void *cb_arg;
   174		async_callback_t cb;
   175		struct stratix10_svc_client_msg *msg;
   176		struct hlist_node next;
   177		struct arm_smccc_1_2_regs res;
 > 178	};
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
