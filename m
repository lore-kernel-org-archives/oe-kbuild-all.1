Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0B01DA0E9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729162641; cv=none; b=u/fhXdHnSujXdT7asbU9vaNU2JOwPL/u1CvDHdXn66i65LdkjzyUmK3mVXgP60TEl7pgg5YPLMLgjjWbo/sa4ierRLSYN0ioSd6alnboEgTj151yJe5x8fVxRGwVldltDZfQDWsMShI4q6XfH8hepE+qAvIYr78fcqyj9Ljn0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729162641; c=relaxed/simple;
	bh=LQ6tcaQxwHRw3YE79il3ylLmczfRhGixKSe/nQPuolk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gc10WL5LWnupWzje5Z/3WJt/5WgN1LnDiBlk7SwniyfdbDkxTSu8uoAnhQoj9MZtMw5wpunaQS4AoHLRMVSdEO/1rIrrAOXwM6WaW+KpSl7CLklQDHs3/TmdyRydBMTTjcNbSEydF5hOyT8APCO38bIGJI5x8i+6ZwwDFqkkkrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4qN93fL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4qN93fL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729162638; x=1760698638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LQ6tcaQxwHRw3YE79il3ylLmczfRhGixKSe/nQPuolk=;
  b=N4qN93fLb+Bucs5Ao8yNyDhyoZNqLU2aeDjOICJ7eJ1qFB0X7lnN5aFQ
   kH0xJjlwbmZO5T/zwiz3L/w1EuGycyhHvWSp7QwV5AgMm94YLrQxfAG3o
   TMgskr50Fm7HqXTMn/ipBONIm+W94EiYBY+qplWElFx7jTA1fYgGRA7YI
   2/UwoPy3woh3s+8JoYhRHqcQJglcEZF7MagyEqRWaJ91+6C2gH53wCtM9
   wUJ6jTLrUj7gPOblPu+/CVn8ThTui3utcu6gzLM1ZygcdHZ6MbhSojrvE
   ZLoIIftXhJDNx5TldwP9ldGs06uWVbDluuJ3bB9mHIlhzNwB32byE9J20
   A==;
X-CSE-ConnectionGUID: N1y1EMmMShaoeRD+xRMu+A==
X-CSE-MsgGUID: sadrWMhLTraFMFzcNiVQQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="40011053"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="40011053"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 03:57:17 -0700
X-CSE-ConnectionGUID: AnGP78zBRE6JlRrnntxAzg==
X-CSE-MsgGUID: +vpqJzCVT1W6U5jWpsZVww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="109262757"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2024 03:57:16 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1OBt-000MDT-33;
	Thu, 17 Oct 2024 10:57:13 +0000
Date: Thu, 17 Oct 2024 18:56:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs.fixes 5/7] fs/afs/rxrpc.c:152:42: error: 'const
 struct afs_call_type' has no member named 'async_rx'
Message-ID: <202410171816.XmehO5nE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.fixes
head:   17e3b9b5cb3c98bf449d201c7dd2d5ee53e26789
commit: dabae7218d1c5a658029cb9fb7c099bd39b2e48c [5/7] afs: Fix lock recursion
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20241017/202410171816.XmehO5nE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171816.XmehO5nE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171816.XmehO5nE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from fs/afs/rxrpc.c:8:
   fs/afs/rxrpc.c: In function 'afs_alloc_call':
>> fs/afs/rxrpc.c:152:42: error: 'const struct afs_call_type' has no member named 'async_rx'
     152 |         INIT_WORK(&call->async_work, type->async_rx ?: afs_process_async_call);
         |                                          ^~
   include/linux/workqueue.h:296:34: note: in definition of macro '__INIT_WORK_KEY'
     296 |                 (_work)->func = (_func);                                \
         |                                  ^~~~~
   include/linux/workqueue.h:308:9: note: in expansion of macro '__INIT_WORK'
     308 |         __INIT_WORK((_work), (_func), 0)
         |         ^~~~~~~~~~~
   fs/afs/rxrpc.c:152:9: note: in expansion of macro 'INIT_WORK'
     152 |         INIT_WORK(&call->async_work, type->async_rx ?: afs_process_async_call);
         |         ^~~~~~~~~


vim +152 fs/afs/rxrpc.c

   133	
   134	/*
   135	 * Allocate a call.
   136	 */
   137	static struct afs_call *afs_alloc_call(struct afs_net *net,
   138					       const struct afs_call_type *type,
   139					       gfp_t gfp)
   140	{
   141		struct afs_call *call;
   142		int o;
   143	
   144		call = kzalloc(sizeof(*call), gfp);
   145		if (!call)
   146			return NULL;
   147	
   148		call->type = type;
   149		call->net = net;
   150		call->debug_id = atomic_inc_return(&rxrpc_debug_id);
   151		refcount_set(&call->ref, 1);
 > 152		INIT_WORK(&call->async_work, type->async_rx ?: afs_process_async_call);
   153		INIT_WORK(&call->work, call->type->work);
   154		INIT_WORK(&call->free_work, afs_deferred_free_worker);
   155		init_waitqueue_head(&call->waitq);
   156		spin_lock_init(&call->state_lock);
   157		call->iter = &call->def_iter;
   158	
   159		o = atomic_inc_return(&net->nr_outstanding_calls);
   160		trace_afs_call(call->debug_id, afs_call_trace_alloc, 1, o,
   161			       __builtin_return_address(0));
   162		return call;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
