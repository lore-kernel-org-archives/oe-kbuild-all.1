Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E9A346A19
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 11:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911039; cv=none; b=hnDAWULROixC+MTlPogfG2z6bUN1/qjpscd7q4tGMbR51ncGJGG5p8aCzwdkPAax3eBg2J5FKaVsLV/QKf0bKsWtiw1ESpFwnwoNHqA0RIUWVabuL1o8HrZ5GzZWlNeJG0XimSGwiZ2/gM+OA8jCBk8rXnsCtnv4YEsKvbXxoKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911039; c=relaxed/simple;
	bh=olAQxwuC8Pw97SpV58N815TfgTti/HyNURXSnn82M0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbcY0ifPReI/v6qDv0fj5pEHsSETCDXfib6NeTq9SKO7tL87VW53d9n0x6+1tNmMcwdz84X4t0Cn7f1bGv4ynFAoEnDLH6u1DDs0Zw7yQlwSeTYkhw/X7/dczinL69INwApoLkdpU4fr8dj/0GNsBHP5Mnb/XWSKgTmGMbD/fEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eiEqgSHN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eiEqgSHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761911037; x=1793447037;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=olAQxwuC8Pw97SpV58N815TfgTti/HyNURXSnn82M0w=;
  b=eiEqgSHNlU+MPXy0DHbsOlcQq+uOPWlxfXHucHHG15x//b84d/AKXvNx
   Ikij2iHnFIOUtahlzgqOJhLMenUtUY6E5RTXBK4K10Ek09hCwxQuZraiN
   uvazRUAvfTPuj0cO4jvXWEC5bfkoKviept6O8bVWW6FIdSQUz5b+a/6Xd
   iEYhgcIasooyVt2EXL3+NOVtFLE2EFnY6gG5zl6l6qjZg4X+mdfds4LCn
   PvDhHk1ZBsRwNMcT9P0QrwnRZSTAq2ARq3jYhEUns17wB1CZPJoQb9wY6
   SCwNG5F+fFDdnVXAuGcH0vneBm8RykWRAGEx3K3rkcI8Npc5oQDKN3dWu
   g==;
X-CSE-ConnectionGUID: iN0/CYovT1ifFNXvnGOyGA==
X-CSE-MsgGUID: N1XzXXT4TKOaoX8e7oBh8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75520476"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="75520476"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 04:43:56 -0700
X-CSE-ConnectionGUID: bnvOjEFWQ46j7957Zox8Tg==
X-CSE-MsgGUID: a51+lSijSqGq4UfKk2ovYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186960623"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 31 Oct 2025 04:43:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEnXt-000N3A-0E;
	Fri, 31 Oct 2025 11:43:53 +0000
Date: Fri, 31 Oct 2025 19:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Metzmacher <metze@samba.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 091/127] smb: client: make use of smbdirect.ko
Message-ID: <202510311833.Qq8Lu8O0-lkp@intel.com>
References: <8ae722e2bc80de69e330baa49102011572eb100b.1761742839.git.metze@samba.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ae722e2bc80de69e330baa49102011572eb100b.1761742839.git.metze@samba.org>

Hi Stefan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc3 next-20251030]
[cannot apply to cifs/for-next brauner-vfs/vfs.all v6.18-rc3 v6.18-rc2 v6.18-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Metzmacher/smb-smbdirect-let-smbdirect-h-include-include-linux-types-h/20251030-015100
base:   linus/master
patch link:    https://lore.kernel.org/r/8ae722e2bc80de69e330baa49102011572eb100b.1761742839.git.metze%40samba.org
patch subject: [PATCH v2 091/127] smb: client: make use of smbdirect.ko
config: sparc-randconfig-001-20251030 (https://download.01.org/0day-ci/archive/20251031/202510311833.Qq8Lu8O0-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311833.Qq8Lu8O0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311833.Qq8Lu8O0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/smb/common/smbdirect/smbdirect_internal.h:17,
                    from fs/smb/common/smbdirect/smbdirect_connect.c:6:
>> fs/smb/common/smbdirect/smbdirect_socket.h:191:4: error: unknown type name 'mempool_t'
       mempool_t *pool;
       ^~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:246:4: error: unknown type name 'mempool_t'
       mempool_t *pool;
       ^~~~~~~~~
--
   In file included from fs/smb/common/smbdirect/smbdirect_internal.h:17,
                    from fs/smb/common/smbdirect/smbdirect_connection.c:7:
>> fs/smb/common/smbdirect/smbdirect_socket.h:191:4: error: unknown type name 'mempool_t'
       mempool_t *pool;
       ^~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_socket.h:246:4: error: unknown type name 'mempool_t'
       mempool_t *pool;
       ^~~~~~~~~
   fs/smb/common/smbdirect/smbdirect_connection.c: In function 'smbdirect_connection_create_mem_pools':
>> fs/smb/common/smbdirect/smbdirect_connection.c:702:25: error: implicit declaration of function 'mempool_create_slab_pool'; did you mean 'proc_create_seq_data'? [-Werror=implicit-function-declaration]
     sc->send_io.mem.pool = mempool_create_slab_pool(sp->send_credit_target,
                            ^~~~~~~~~~~~~~~~~~~~~~~~
                            proc_create_seq_data
   fs/smb/common/smbdirect/smbdirect_connection.c:702:23: warning: assignment to 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     sc->send_io.mem.pool = mempool_create_slab_pool(sp->send_credit_target,
                          ^
   fs/smb/common/smbdirect/smbdirect_connection.c:731:23: warning: assignment to 'int *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     sc->recv_io.mem.pool = mempool_create_slab_pool(sp->recv_credit_max,
                          ^
>> fs/smb/common/smbdirect/smbdirect_connection.c:739:13: error: implicit declaration of function 'mempool_alloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      recv_io = mempool_alloc(sc->recv_io.mem.pool,
                ^~~~~~~~~~~~~
                mm_alloc
   fs/smb/common/smbdirect/smbdirect_connection.c:739:11: warning: assignment to 'struct smbdirect_recv_io *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      recv_io = mempool_alloc(sc->recv_io.mem.pool,
              ^
   fs/smb/common/smbdirect/smbdirect_connection.c: In function 'smbdirect_connection_destroy_mem_pools':
>> fs/smb/common/smbdirect/smbdirect_connection.c:761:3: error: implicit declaration of function 'mempool_free'; did you mean 'reqsk_free'? [-Werror=implicit-function-declaration]
      mempool_free(recv_io, sc->recv_io.mem.pool);
      ^~~~~~~~~~~~
      reqsk_free
>> fs/smb/common/smbdirect/smbdirect_connection.c:769:2: error: implicit declaration of function 'mempool_destroy'; did you mean 'ib_mr_pool_destroy'? [-Werror=implicit-function-declaration]
     mempool_destroy(sc->recv_io.mem.pool);
     ^~~~~~~~~~~~~~~
     ib_mr_pool_destroy
   fs/smb/common/smbdirect/smbdirect_connection.c: In function 'smbdirect_connection_alloc_send_io':
   fs/smb/common/smbdirect/smbdirect_connection.c:787:6: warning: assignment to 'struct smbdirect_send_io *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     msg = mempool_alloc(sc->send_io.mem.pool, sc->send_io.mem.gfp_mask);
         ^
   cc1: some warnings being treated as errors


vim +/mempool_t +191 fs/smb/common/smbdirect/smbdirect_socket.h

89bae05f9df68f8 Stefan Metzmacher 2025-08-15   95  
22234e37d7e9765 Stefan Metzmacher 2025-05-28   96  struct smbdirect_socket {
22234e37d7e9765 Stefan Metzmacher 2025-05-28   97  	enum smbdirect_socket_status status;
371d3ab51ce44c8 Stefan Metzmacher 2025-08-08   98  	wait_queue_head_t status_wait;
f5b893edde7bcd1 Stefan Metzmacher 2025-08-28   99  	int first_error;
22234e37d7e9765 Stefan Metzmacher 2025-05-28  100  
6c5b0f9253d7f15 Stefan Metzmacher 2025-08-22  101  	/*
6c5b0f9253d7f15 Stefan Metzmacher 2025-08-22  102  	 * This points to the workqueue to
6c5b0f9253d7f15 Stefan Metzmacher 2025-08-22  103  	 * be used for this socket.
6c5b0f9253d7f15 Stefan Metzmacher 2025-08-22  104  	 * It can be per socket (on the client)
6c5b0f9253d7f15 Stefan Metzmacher 2025-08-22  105  	 * or point to a global workqueue (on the server)
6c5b0f9253d7f15 Stefan Metzmacher 2025-08-22  106  	 */
6c5b0f9253d7f15 Stefan Metzmacher 2025-08-22  107  	struct workqueue_struct *workqueue;
6c5b0f9253d7f15 Stefan Metzmacher 2025-08-22  108  
de32f33c0365d06 Stefan Metzmacher 2025-08-08  109  	struct work_struct disconnect_work;
de32f33c0365d06 Stefan Metzmacher 2025-08-08  110  
f23812679f6587e Stefan Metzmacher 2025-10-29  111  	/*
f23812679f6587e Stefan Metzmacher 2025-10-29  112  	 * The reference counts.
f23812679f6587e Stefan Metzmacher 2025-10-29  113  	 */
f23812679f6587e Stefan Metzmacher 2025-10-29  114  	struct {
f23812679f6587e Stefan Metzmacher 2025-10-29  115  		/*
f23812679f6587e Stefan Metzmacher 2025-10-29  116  		 * This holds the references by the
f23812679f6587e Stefan Metzmacher 2025-10-29  117  		 * frontend, typically the smb layer.
f23812679f6587e Stefan Metzmacher 2025-10-29  118  		 *
f23812679f6587e Stefan Metzmacher 2025-10-29  119  		 * It is typically 1 and a disconnect
f23812679f6587e Stefan Metzmacher 2025-10-29  120  		 * will happen if it reaches 0.
f23812679f6587e Stefan Metzmacher 2025-10-29  121  		 */
f23812679f6587e Stefan Metzmacher 2025-10-29  122  		struct kref disconnect;
f23812679f6587e Stefan Metzmacher 2025-10-29  123  
f23812679f6587e Stefan Metzmacher 2025-10-29  124  		/*
f23812679f6587e Stefan Metzmacher 2025-10-29  125  		 * This holds the reference by the
f23812679f6587e Stefan Metzmacher 2025-10-29  126  		 * backend, the code that manages
f23812679f6587e Stefan Metzmacher 2025-10-29  127  		 * the lifetime of the whole
f23812679f6587e Stefan Metzmacher 2025-10-29  128  		 * struct smbdirect_socket,
f23812679f6587e Stefan Metzmacher 2025-10-29  129  		 * if this reaches 0 it can will
f23812679f6587e Stefan Metzmacher 2025-10-29  130  		 * be freed.
f23812679f6587e Stefan Metzmacher 2025-10-29  131  		 *
f23812679f6587e Stefan Metzmacher 2025-10-29  132  		 * Can be REFCOUNT_MAX is part
f23812679f6587e Stefan Metzmacher 2025-10-29  133  		 * of another structure.
f23812679f6587e Stefan Metzmacher 2025-10-29  134  		 *
f23812679f6587e Stefan Metzmacher 2025-10-29  135  		 * This is equal or higher than
f23812679f6587e Stefan Metzmacher 2025-10-29  136  		 * the disconnect refcount.
f23812679f6587e Stefan Metzmacher 2025-10-29  137  		 */
f23812679f6587e Stefan Metzmacher 2025-10-29  138  		struct kref destroy;
f23812679f6587e Stefan Metzmacher 2025-10-29  139  	} refs;
f23812679f6587e Stefan Metzmacher 2025-10-29  140  
22234e37d7e9765 Stefan Metzmacher 2025-05-28  141  	/* RDMA related */
22234e37d7e9765 Stefan Metzmacher 2025-05-28  142  	struct {
22234e37d7e9765 Stefan Metzmacher 2025-05-28  143  		struct rdma_cm_id *cm_id;
beda261c142cc7b Stefan Metzmacher 2025-10-29  144  		/*
beda261c142cc7b Stefan Metzmacher 2025-10-29  145  		 * The expected event in our current
beda261c142cc7b Stefan Metzmacher 2025-10-29  146  		 * cm_id->event_handler, all other events
beda261c142cc7b Stefan Metzmacher 2025-10-29  147  		 * are treated as an error.
beda261c142cc7b Stefan Metzmacher 2025-10-29  148  		 */
beda261c142cc7b Stefan Metzmacher 2025-10-29  149  		enum rdma_cm_event_type expected_event;
2baedb2026a5c01 Stefan Metzmacher 2025-08-21  150  		/*
2baedb2026a5c01 Stefan Metzmacher 2025-08-21  151  		 * This is for iWarp MPA v1
2baedb2026a5c01 Stefan Metzmacher 2025-08-21  152  		 */
2baedb2026a5c01 Stefan Metzmacher 2025-08-21  153  		bool legacy_iwarp;
22234e37d7e9765 Stefan Metzmacher 2025-05-28  154  	} rdma;
22234e37d7e9765 Stefan Metzmacher 2025-05-28  155  
22234e37d7e9765 Stefan Metzmacher 2025-05-28  156  	/* IB verbs related */
22234e37d7e9765 Stefan Metzmacher 2025-05-28  157  	struct {
22234e37d7e9765 Stefan Metzmacher 2025-05-28  158  		struct ib_pd *pd;
2a871f3e3b060fa Stefan Metzmacher 2025-10-29  159  		enum ib_poll_context poll_ctx;
22234e37d7e9765 Stefan Metzmacher 2025-05-28  160  		struct ib_cq *send_cq;
22234e37d7e9765 Stefan Metzmacher 2025-05-28  161  		struct ib_cq *recv_cq;
22234e37d7e9765 Stefan Metzmacher 2025-05-28  162  
22234e37d7e9765 Stefan Metzmacher 2025-05-28  163  		/*
22234e37d7e9765 Stefan Metzmacher 2025-05-28  164  		 * shortcuts for rdma.cm_id->{qp,device};
22234e37d7e9765 Stefan Metzmacher 2025-05-28  165  		 */
22234e37d7e9765 Stefan Metzmacher 2025-05-28  166  		struct ib_qp *qp;
22234e37d7e9765 Stefan Metzmacher 2025-05-28  167  		struct ib_device *dev;
22234e37d7e9765 Stefan Metzmacher 2025-05-28  168  	} ib;
dce8047f4725d44 Stefan Metzmacher 2025-05-28  169  
dce8047f4725d44 Stefan Metzmacher 2025-05-28  170  	struct smbdirect_socket_parameters parameters;
33dd53a90e3419e Stefan Metzmacher 2025-08-05  171  
89bae05f9df68f8 Stefan Metzmacher 2025-08-15  172  	/*
89bae05f9df68f8 Stefan Metzmacher 2025-08-15  173  	 * The state for keepalive and timeout handling
89bae05f9df68f8 Stefan Metzmacher 2025-08-15  174  	 */
89bae05f9df68f8 Stefan Metzmacher 2025-08-15  175  	struct {
89bae05f9df68f8 Stefan Metzmacher 2025-08-15  176  		enum smbdirect_keepalive_status keepalive;
89bae05f9df68f8 Stefan Metzmacher 2025-08-15  177  		struct work_struct immediate_work;
89bae05f9df68f8 Stefan Metzmacher 2025-08-15  178  		struct delayed_work timer_work;
89bae05f9df68f8 Stefan Metzmacher 2025-08-15  179  	} idle;
89bae05f9df68f8 Stefan Metzmacher 2025-08-15  180  
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  181  	/*
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  182  	 * The state for posted send buffers
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  183  	 */
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  184  	struct {
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  185  		/*
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  186  		 * Memory pools for preallocating
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  187  		 * smbdirect_send_io buffers
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  188  		 */
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  189  		struct {
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  190  			struct kmem_cache *cache;
5ef8278e3734a88 Stefan Metzmacher 2025-08-06 @191  			mempool_t *pool;
932070bf508d8ad Stefan Metzmacher 2025-10-29  192  			gfp_t gfp_mask;
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  193  		} mem;
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  194  
2191b3471df53d8 Stefan Metzmacher 2025-08-11  195  		/*
68335cbcddcd586 Stefan Metzmacher 2025-10-20  196  		 * The local credit state for ib_post_send()
68335cbcddcd586 Stefan Metzmacher 2025-10-20  197  		 */
68335cbcddcd586 Stefan Metzmacher 2025-10-20  198  		struct {
68335cbcddcd586 Stefan Metzmacher 2025-10-20  199  			atomic_t count;
68335cbcddcd586 Stefan Metzmacher 2025-10-20  200  			wait_queue_head_t wait_queue;
68335cbcddcd586 Stefan Metzmacher 2025-10-20  201  		} lcredits;
68335cbcddcd586 Stefan Metzmacher 2025-10-20  202  
68335cbcddcd586 Stefan Metzmacher 2025-10-20  203  		/*
68335cbcddcd586 Stefan Metzmacher 2025-10-20  204  		 * The remote credit state for the send side
2191b3471df53d8 Stefan Metzmacher 2025-08-11  205  		 */
2191b3471df53d8 Stefan Metzmacher 2025-08-11  206  		struct {
2191b3471df53d8 Stefan Metzmacher 2025-08-11  207  			atomic_t count;
2191b3471df53d8 Stefan Metzmacher 2025-08-11  208  			wait_queue_head_t wait_queue;
2191b3471df53d8 Stefan Metzmacher 2025-08-11  209  		} credits;
2191b3471df53d8 Stefan Metzmacher 2025-08-11  210  
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  211  		/*
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  212  		 * The state about posted/pending sends
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  213  		 */
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  214  		struct {
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  215  			atomic_t count;
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  216  			/*
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  217  			 * woken when count is decremented
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  218  			 */
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  219  			wait_queue_head_t dec_wait_queue;
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  220  			/*
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  221  			 * woken when count reached zero
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  222  			 */
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  223  			wait_queue_head_t zero_wait_queue;
3b7be44a0eb18b2 Stefan Metzmacher 2025-08-11  224  		} pending;
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  225  	} send_io;
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  226  
33dd53a90e3419e Stefan Metzmacher 2025-08-05  227  	/*
33dd53a90e3419e Stefan Metzmacher 2025-08-05  228  	 * The state for posted receive buffers
33dd53a90e3419e Stefan Metzmacher 2025-08-05  229  	 */
33dd53a90e3419e Stefan Metzmacher 2025-08-05  230  	struct {
33dd53a90e3419e Stefan Metzmacher 2025-08-05  231  		/*
33dd53a90e3419e Stefan Metzmacher 2025-08-05  232  		 * The type of PDU we are expecting
33dd53a90e3419e Stefan Metzmacher 2025-08-05  233  		 */
33dd53a90e3419e Stefan Metzmacher 2025-08-05  234  		enum {
33dd53a90e3419e Stefan Metzmacher 2025-08-05  235  			SMBDIRECT_EXPECT_NEGOTIATE_REQ = 1,
33dd53a90e3419e Stefan Metzmacher 2025-08-05  236  			SMBDIRECT_EXPECT_NEGOTIATE_REP = 2,
33dd53a90e3419e Stefan Metzmacher 2025-08-05  237  			SMBDIRECT_EXPECT_DATA_TRANSFER = 3,
33dd53a90e3419e Stefan Metzmacher 2025-08-05  238  		} expected;
d0df32a3025c2de Stefan Metzmacher 2025-08-05  239  
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  240  		/*
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  241  		 * Memory pools for preallocating
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  242  		 * smbdirect_recv_io buffers
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  243  		 */
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  244  		struct {
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  245  			struct kmem_cache *cache;
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  246  			mempool_t *pool;
932070bf508d8ad Stefan Metzmacher 2025-10-29  247  			gfp_t gfp_mask;
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  248  		} mem;
5ef8278e3734a88 Stefan Metzmacher 2025-08-06  249  
d0df32a3025c2de Stefan Metzmacher 2025-08-05  250  		/*
d0df32a3025c2de Stefan Metzmacher 2025-08-05  251  		 * The list of free smbdirect_recv_io
d0df32a3025c2de Stefan Metzmacher 2025-08-05  252  		 * structures
d0df32a3025c2de Stefan Metzmacher 2025-08-05  253  		 */
d0df32a3025c2de Stefan Metzmacher 2025-08-05  254  		struct {
d0df32a3025c2de Stefan Metzmacher 2025-08-05  255  			struct list_head list;
d0df32a3025c2de Stefan Metzmacher 2025-08-05  256  			spinlock_t lock;
d0df32a3025c2de Stefan Metzmacher 2025-08-05  257  		} free;
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  258  
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  259  		/*
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  260  		 * The state for posted recv_io messages
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  261  		 * and the refill work struct.
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  262  		 */
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  263  		struct {
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  264  			atomic_t count;
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  265  			struct work_struct refill_work;
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  266  		} posted;
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  267  
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  268  		/*
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  269  		 * The credit state for the recv side
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  270  		 */
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  271  		struct {
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  272  			u16 target;
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  273  			atomic_t count;
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  274  		} credits;
ec76e3cc6bbcb17 Stefan Metzmacher 2025-08-11  275  
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  276  		/*
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  277  		 * The list of arrived non-empty smbdirect_recv_io
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  278  		 * structures
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  279  		 *
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  280  		 * This represents the reassembly queue.
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  281  		 */
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  282  		struct {
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  283  			struct list_head list;
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  284  			spinlock_t lock;
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  285  			wait_queue_head_t wait_queue;
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  286  			/* total data length of reassembly queue */
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  287  			int data_length;
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  288  			int queue_length;
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  289  			/* the offset to first buffer in reassembly queue */
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  290  			int first_entry_offset;
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  291  			/*
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  292  			 * Indicate if we have received a full packet on the
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  293  			 * connection This is used to identify the first SMBD
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  294  			 * packet of a assembled payload (SMB packet) in
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  295  			 * reassembly queue so we can return a RFC1002 length to
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  296  			 * upper layer to indicate the length of the SMB packet
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  297  			 * received
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  298  			 */
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  299  			bool full_packet_received;
b7ffb4d2a036004 Stefan Metzmacher 2025-08-05  300  		} reassembly;
33dd53a90e3419e Stefan Metzmacher 2025-08-05  301  	} recv_io;
90255ed46774bda Stefan Metzmacher 2025-08-14  302  
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  303  	/*
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  304  	 * The state for Memory registrations on the client
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  305  	 */
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  306  	struct {
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  307  		enum ib_mr_type type;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  308  
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  309  		/*
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  310  		 * The list of free smbdirect_mr_io
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  311  		 * structures
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  312  		 */
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  313  		struct {
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  314  			struct list_head list;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  315  			spinlock_t lock;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  316  		} all;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  317  
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  318  		/*
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  319  		 * The number of available MRs ready for memory registration
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  320  		 */
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  321  		struct {
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  322  			atomic_t count;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  323  			wait_queue_head_t wait_queue;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  324  		} ready;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  325  
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  326  		/*
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  327  		 * The number of used MRs
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  328  		 */
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  329  		struct {
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  330  			atomic_t count;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  331  		} used;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  332  
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  333  		struct work_struct recovery_work;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  334  
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  335  		/* Used by transport to wait until all MRs are returned */
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  336  		struct {
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  337  			wait_queue_head_t wait_queue;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  338  		} cleanup;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  339  	} mr_io;
ed3350f09d2c023 Stefan Metzmacher 2025-08-19  340  
90255ed46774bda Stefan Metzmacher 2025-08-14  341  	/*
90255ed46774bda Stefan Metzmacher 2025-08-14  342  	 * The state for RDMA read/write requests on the server
90255ed46774bda Stefan Metzmacher 2025-08-14  343  	 */
90255ed46774bda Stefan Metzmacher 2025-08-14  344  	struct {
dbd035a139e7e0a Stefan Metzmacher 2025-10-29  345  		/*
dbd035a139e7e0a Stefan Metzmacher 2025-10-29  346  		 * Memory hints for
dbd035a139e7e0a Stefan Metzmacher 2025-10-29  347  		 * smbdirect_rw_io structs
dbd035a139e7e0a Stefan Metzmacher 2025-10-29  348  		 */
dbd035a139e7e0a Stefan Metzmacher 2025-10-29  349  		struct {
dbd035a139e7e0a Stefan Metzmacher 2025-10-29  350  			gfp_t gfp_mask;
dbd035a139e7e0a Stefan Metzmacher 2025-10-29  351  		} mem;
dbd035a139e7e0a Stefan Metzmacher 2025-10-29  352  
90255ed46774bda Stefan Metzmacher 2025-08-14  353  		/*
90255ed46774bda Stefan Metzmacher 2025-08-14  354  		 * The credit state for the send side
90255ed46774bda Stefan Metzmacher 2025-08-14  355  		 */
90255ed46774bda Stefan Metzmacher 2025-08-14  356  		struct {
90255ed46774bda Stefan Metzmacher 2025-08-14  357  			/*
90255ed46774bda Stefan Metzmacher 2025-08-14  358  			 * The maximum number of rw credits
90255ed46774bda Stefan Metzmacher 2025-08-14  359  			 */
90255ed46774bda Stefan Metzmacher 2025-08-14  360  			size_t max;
90255ed46774bda Stefan Metzmacher 2025-08-14  361  			/*
90255ed46774bda Stefan Metzmacher 2025-08-14  362  			 * The number of pages per credit
90255ed46774bda Stefan Metzmacher 2025-08-14  363  			 */
90255ed46774bda Stefan Metzmacher 2025-08-14  364  			size_t num_pages;
90255ed46774bda Stefan Metzmacher 2025-08-14  365  			atomic_t count;
90255ed46774bda Stefan Metzmacher 2025-08-14  366  			wait_queue_head_t wait_queue;
90255ed46774bda Stefan Metzmacher 2025-08-14  367  		} credits;
90255ed46774bda Stefan Metzmacher 2025-08-14  368  	} rw_io;
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  369  
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  370  	/*
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  371  	 * For debug purposes
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  372  	 */
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  373  	struct {
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  374  		u64 get_receive_buffer;
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  375  		u64 put_receive_buffer;
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  376  		u64 enqueue_reassembly_queue;
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  377  		u64 dequeue_reassembly_queue;
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  378  		u64 send_empty;
6889d2f5caa69ff Stefan Metzmacher 2025-08-19  379  	} statistics;
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  380  
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  381  	struct {
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  382  		void *private_ptr;
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  383  		bool (*needed)(struct smbdirect_socket *sc,
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  384  			       void *private_ptr,
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  385  			       unsigned int lvl,
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  386  			       unsigned int cls);
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  387  		void (*vaprintf)(struct smbdirect_socket *sc,
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  388  				 const char *func,
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  389  				 unsigned int line,
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  390  				 void *private_ptr,
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  391  				 unsigned int lvl,
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  392  				 unsigned int cls,
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  393  				 struct va_format *vaf);
8ddb25e3ca878f2 Stefan Metzmacher 2025-10-29  394  	} logging;
22234e37d7e9765 Stefan Metzmacher 2025-05-28  395  };
22234e37d7e9765 Stefan Metzmacher 2025-05-28  396  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
