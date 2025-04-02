Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8331DB92C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Apr 2025 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619309; cv=none; b=ONXgqpDBGX9qnvgPYv78Oc11rlrRb2LXtgiJ5bTAe6fZm+40oK5TQso1YFucNzYaDW6NxB++MqnwyLLY5Oot9/Nak8U9w4UwiO1OyV8zkaTzKz7m2G4b7bihKRzQsJlKEP++HYCsaGijLahiqz1hu1vL34jnHj2dw5C6hpXjwJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619309; c=relaxed/simple;
	bh=vcltVxxU5vqlbE2X+dUAFFZFyZCZ3y3qQ+Ma2jWYgpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NWr5uKcK13qskX7CjHISXws8RHoq4vgiIRvOG4pPUwG9W54QBrJ74bQ4FvWWsZoodrRX1tOCmIMFOsrx9pklX0UePSKzT7NwS82N2cr0VpqjqjMqhTHxlMJtV+xXWh5A6f9Hj7qAp8031U4/nkH2zlV17HwS5RfQohe/0uP1FNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hinOUcUH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hinOUcUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743619308; x=1775155308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vcltVxxU5vqlbE2X+dUAFFZFyZCZ3y3qQ+Ma2jWYgpQ=;
  b=hinOUcUHKg3Ap5UfiE06h0P4dzI9ljF8hsrr7DI/doivnG7xWt1jt7t1
   TVV/47+/tFsxv33Cm5ipc9VwZ8jUDBbbVeR0sHrWeKtqijobSXb0O2WjS
   7zl7ErhiV4QjfgAklJuB8sCJPFB0JM9wDavKcvKC7bHtXokn49AQ8Y4zc
   OHAe2vi+ViXPjbiqtV8RkEv9OO9vD5tbyuUrxhsPs3QKIMW8XvRsdLT+j
   Q99hwIdegyb9aucv4Bj+gZNM77viBiCoa11UfPOhxi2q9mtErlj/5GLuE
   4nf9kM2HxyklQtdiGIyxfUW69plO5oqP+F5WLabUbWBmVAdisdnFxQFMw
   A==;
X-CSE-ConnectionGUID: 8cWA7//ZQOe9nCiuaFHqzw==
X-CSE-MsgGUID: pNIHL4kHSveVc/dMFArE8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="55993774"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="55993774"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 11:41:47 -0700
X-CSE-ConnectionGUID: wtffelbCQfm33umXbBemOg==
X-CSE-MsgGUID: CCp+n4AWT5Wbzr4BJ2skdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; 
   d="scan'208";a="157779875"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2025 11:41:45 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u031z-000AyM-1b;
	Wed, 02 Apr 2025 18:41:43 +0000
Date: Thu, 3 Apr 2025 02:41:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 7/7] drivers/crypto/ccp/vpsp.c:65:
 warning: Function parameter or member 'vpsp_cmd_ctx_table' not described in
 'DEFINE_HASHTABLE'
Message-ID: <202504030255.RstgRL6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   5bcfae793917ca097364501bd3ff69d749df729e
commit: 6ce26e500b6bb9b4220c636e1bd657ecda0b4d4a [7/7] anolis: crypto: ccp: Use a workqueue to clean up the vpsp ringbuffer
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250403/202504030255.RstgRL6u-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504030255.RstgRL6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504030255.RstgRL6u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/ccp/vpsp.c:65: warning: Function parameter or member 'vpsp_cmd_ctx_table' not described in 'DEFINE_HASHTABLE'
>> drivers/crypto/ccp/vpsp.c:65: warning: Function parameter or member '11' not described in 'DEFINE_HASHTABLE'
>> drivers/crypto/ccp/vpsp.c:124: warning: Function parameter or member 'key1' not described in 'vpsp_cmd_ctx_create'
>> drivers/crypto/ccp/vpsp.c:124: warning: Function parameter or member 'key2' not described in 'vpsp_cmd_ctx_create'
>> drivers/crypto/ccp/vpsp.c:124: warning: Excess function parameter 'hkey' description in 'vpsp_cmd_ctx_create'
   drivers/crypto/ccp/vpsp.c:220: warning: Function parameter or member 'vpsp' not described in 'kvm_pv_psp_cmd_pre_op'
   drivers/crypto/ccp/vpsp.c:220: warning: Function parameter or member 'data_gpa' not described in 'kvm_pv_psp_cmd_pre_op'
>> drivers/crypto/ccp/vpsp.c:220: warning: Function parameter or member 'cmd_ctx' not described in 'kvm_pv_psp_cmd_pre_op'
   drivers/crypto/ccp/vpsp.c:474: warning: Cannot understand  * @brief Directly convert the gpa address into hpa and forward it to PSP,
    on line 474 - I thought it was a doc line
   drivers/crypto/ccp/vpsp.c:580: warning: Cannot understand  * @brief copy data in gpa to host memory and send it to psp for processing.
    on line 580 - I thought it was a doc line
   drivers/crypto/ccp/vpsp.c:722: warning: cannot understand function prototype: 'uint32_t allow_default_vid = 1; '
>> drivers/crypto/ccp/vpsp.c:737: warning: Function parameter or member 'ctx' not described in 'vpsp_get_dev_ctx'
>> drivers/crypto/ccp/vpsp.c:737: warning: Function parameter or member 'pid' not described in 'vpsp_get_dev_ctx'
   drivers/crypto/ccp/vpsp.c:763: warning: Function parameter or member 'vid' not described in 'vpsp_add_vid'


vim +65 drivers/crypto/ccp/vpsp.c

    33	
    34	/*
    35	 * The file mainly implements the base execution
    36	 * logic of virtual PSP in kernel mode, which mainly includes:
    37	 *	(1) Preprocess the guest data in the host kernel
    38	 *
    39	 *	(2) The command that has been converted will interact
    40	 *		with the channel of the psp through the driver and
    41	 *		try to obtain the execution result
    42	 *	(3) The executed command data is recovered, and then returned to the VM
    43	 *
    44	 * The primary implementation logic of virtual PSP in kernel mode
    45	 * call trace:
    46	 * guest command(vmmcall, KVM_HC_PSP_COPY_FORWARD_OP)
    47	 *		   |
    48	 *	kvm_pv_psp_copy_op---->	| -> kvm_pv_psp_cmd_pre_op
    49	 *				|
    50	 *				| -> vpsp_try_do_cmd/vpsp_try_get_result
    51	 *				|	|<=> psp device driver
    52	 *				|
    53	 *				|
    54	 *				|-> kvm_pv_psp_cmd_post_op
    55	 *
    56	 * guest command(vmmcall, KVM_HC_PSP_FORWARD_OP)
    57	 *		   |
    58	 *	kvm_pv_psp_forward_op-> |-> vpsp_try_do_cmd/vpsp_try_get_result
    59	 *					|<=> psp device driver
    60	 */
    61	/**
    62	 * used to locate the command context,
    63	 * when the guest enters the host via vmmcall
    64	 */
  > 65	DEFINE_HASHTABLE(vpsp_cmd_ctx_table, 11);
    66	DEFINE_RWLOCK(table_rwlock);
    67	
    68	static struct vpsp_cmd_ctx *vpsp_hashtable_find_cmd_ctx(gpa_t key1, pid_t key2)
    69	{
    70		struct vpsp_cmd_ctx *entry = NULL;
    71		bool is_found = false;
    72	
    73		read_lock(&table_rwlock);
    74		hash_for_each_possible(vpsp_cmd_ctx_table, entry, node, key1) {
    75			if (entry->key1 == key1 && entry->key2 == key2) {
    76				is_found = true;
    77				break;
    78			}
    79		}
    80		read_unlock(&table_rwlock);
    81		if (!is_found)
    82			entry = NULL;
    83	
    84		return entry;
    85	}
    86	
    87	static void vpsp_hashtable_add_cmd_ctx(struct vpsp_cmd_ctx *ctx)
    88	{
    89		struct vpsp_cmd_ctx *entry = NULL;
    90	
    91		write_lock(&table_rwlock);
    92		hash_for_each_possible(vpsp_cmd_ctx_table, entry, node, ctx->key1) {
    93			if (entry->key1 == ctx->key1 &&
    94					entry->key2 == ctx->key2) {
    95				vpsp_cmd_ctx_obj_put(entry, true);
    96				break;
    97			}
    98		}
    99		hash_add(vpsp_cmd_ctx_table, &ctx->node, ctx->key1);
   100		write_unlock(&table_rwlock);
   101	
   102		vpsp_cmd_ctx_obj_get(ctx);
   103	}
   104	
   105	static void vpsp_hashtable_remove_cmd_ctx(struct vpsp_cmd_ctx *ctx)
   106	{
   107		write_lock(&table_rwlock);
   108		hash_del(&ctx->node);
   109		write_unlock(&table_rwlock);
   110	
   111		vpsp_cmd_ctx_obj_put(ctx, false);
   112	}
   113	
   114	/**
   115	 * Create a vpsp_cmd_ctx object and insert it into the
   116	 * vpsp_cmd_ctx_table hash table.
   117	 *
   118	 * @hkey: The key value for the hash table vpsp_cmd_ctx_table
   119	 *
   120	 * Return: the address of the vpsp_cmd_ctx object
   121	 *	   if created successfully, otherwise returns NULL
   122	 */
   123	static struct vpsp_cmd_ctx *vpsp_cmd_ctx_create(gpa_t key1, pid_t key2)
 > 124	{
   125		struct vpsp_cmd_ctx *cmd_ctx = kmem_cache_zalloc(vpsp_cmd_ctx_slab, GFP_KERNEL);
   126	
   127		if (cmd_ctx) {
   128			/**
   129			 * According to the implementation of refcount,
   130			 * the initial value must be greater than 0.
   131			 */
   132			refcount_set(&cmd_ctx->ref, 1);
   133			cmd_ctx->statval = VPSP_CMD_STATUS_RUNNING;
   134			cmd_ctx->key1 = key1;
   135			cmd_ctx->key2 = key2;
   136			vpsp_hashtable_add_cmd_ctx(cmd_ctx);
   137		}
   138		return cmd_ctx;
   139	}
   140	
   141	/**
   142	 * Destroys the specified vpsp_cmd_ctx object,
   143	 * indicating it will no longer be accessed.
   144	 *
   145	 * But does not necessarily free the cmd_ctx memory immediately,
   146	 * only additional to perform decrement refcount.
   147	 *
   148	 * Actual memory release occurs when the refcount drops to 0,
   149	 * which may happen during the vpsp_worker_handler or
   150	 * vpsp_cmd_ctx_destroy process.
   151	 *
   152	 * @cmd_ctx: the vpsp_cmd_ctx object
   153	 */
   154	static void vpsp_cmd_ctx_destroy(struct vpsp_cmd_ctx *cmd_ctx)
   155	{
   156		if (!cmd_ctx)
   157			return;
   158		/**
   159		 * The initial refcount is 1,
   160		 * need to additional decrement a refcount.
   161		 */
   162		vpsp_cmd_ctx_obj_put(cmd_ctx, false);
   163		vpsp_hashtable_remove_cmd_ctx(cmd_ctx);
   164	}
   165	
   166	void vpsp_cmd_ctx_obj_get(struct vpsp_cmd_ctx *cmd_ctx)
   167	{
   168		refcount_inc(&cmd_ctx->ref);
   169	}
   170	
   171	void vpsp_cmd_ctx_obj_put(struct vpsp_cmd_ctx *cmd_ctx, bool force)
   172	{
   173		do {
   174			if (refcount_dec_and_test(&cmd_ctx->ref)) {
   175				kfree(cmd_ctx->data);
   176				memset(cmd_ctx, 0, sizeof(*cmd_ctx));
   177				kmem_cache_free(vpsp_cmd_ctx_slab, cmd_ctx);
   178				force = false;
   179			}
   180		} while (force);
   181	}
   182	
   183	struct psp_cmdresp_head {
   184		uint32_t buf_size;
   185		uint32_t cmdresp_size;
   186		uint32_t cmdresp_code;
   187	} __packed;
   188	
   189	static int check_gpa_range(struct vpsp_dev_ctx *vpsp_ctx, gpa_t addr, uint32_t size)
   190	{
   191		if (!vpsp_ctx || !addr)
   192			return -EFAULT;
   193	
   194		if (addr >= vpsp_ctx->gpa_start && (addr + size) <= vpsp_ctx->gpa_end)
   195			return 0;
   196		return -EFAULT;
   197	}
   198	
   199	static int check_psp_mem_range(struct vpsp_dev_ctx *vpsp_ctx,
   200				void *data, uint32_t size)
   201	{
   202		if ((((uintptr_t)data + size - 1) & ~PSP_2MB_MASK) !=
   203				((uintptr_t)data & ~PSP_2MB_MASK)) {
   204			pr_err("data %llx, size %d crossing 2MB\n", (u64)data, size);
   205			return -EFAULT;
   206		}
   207	
   208		if (vpsp_ctx)
   209			return check_gpa_range(vpsp_ctx, (gpa_t)data, size);
   210	
   211		return 0;
   212	}
   213	
   214	/**
   215	 * Copy Guest data to the Host kernel buffer
   216	 * and allocate a cmd_ctx to insert into the vpsp_cmd_ctx_table.
   217	 */
   218	static int kvm_pv_psp_cmd_pre_op(struct kvm_vpsp *vpsp, gpa_t data_gpa,
   219			struct vpsp_cmd_ctx **cmd_ctx)
 > 220	{
   221		int ret = 0;
   222		void *data = NULL;
   223		struct psp_cmdresp_head psp_head;
   224		uint32_t data_size;
   225	
   226		if (unlikely(!cmd_ctx))
   227			return -EFAULT;
   228		*cmd_ctx = NULL;
   229	
   230		if (unlikely(vpsp->read_guest(vpsp->kvm, data_gpa, &psp_head,
   231						sizeof(struct psp_cmdresp_head))))
   232			return -EFAULT;
   233	
   234		data_size = psp_head.buf_size;
   235		if (check_psp_mem_range(NULL, (void *)data_gpa, data_size))
   236			return -EFAULT;
   237	
   238		data = kzalloc(data_size, GFP_KERNEL);
   239		if (!data)
   240			return -ENOMEM;
   241	
   242		*cmd_ctx = vpsp_cmd_ctx_create(data_gpa, vpsp->kvm->userspace_pid);
   243		if (!(*cmd_ctx)) {
   244			ret = -EFAULT;
   245			goto end;
   246		}
   247	
   248		if (unlikely(vpsp->read_guest(vpsp->kvm, data_gpa, data, data_size))) {
   249			ret = -EFAULT;
   250			goto end;
   251		}
   252	
   253		(*cmd_ctx)->data = data;
   254		(*cmd_ctx)->data_size = data_size;
   255	end:
   256		if (ret) {
   257			vpsp_cmd_ctx_destroy(*cmd_ctx);
   258			kfree(data);
   259		}
   260		return ret;
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
