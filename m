Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092E825DB14
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 16:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742920951; cv=none; b=ZlnuYGZ3uuSQj9mOlY0MtaxydmbcEHG2vhDkTZDmZqk8TaTAMOmf8lC49/0vaehaqJZR11IroP4yeThzGDY7Y+AqAVSavVVK/YurKM0kzdvrbEIVmpftSguy2ANI7c5LPjxJq5UBF3YSGyyr4VrX66DQW5hoeAL8wwKV2e8SeAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742920951; c=relaxed/simple;
	bh=zu0A2QxiPUeG7/wvnVu3LjkQ41iUj0k2WYUY2AK08mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+HrpVbTmwX55xLr1VoKDiNiBZlcKn53MIvvA8f990bIx9g85MMPkabSf72zi/zSzdmX6FYQGEGojw6lofi6ZwDXy/hMHIPfvzFBkgBuLmGFlKdbqvqsoTmrhv1M7xcOqJbGJS0mzREVfzyUCVjlmGELYQ0ckHQm58KHTekDCEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MF/3eZPp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MF/3eZPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742920950; x=1774456950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zu0A2QxiPUeG7/wvnVu3LjkQ41iUj0k2WYUY2AK08mQ=;
  b=MF/3eZPpvIHq6ts9jYxQH+Bz9NXUAF6G3SwE8e7bRNvgWOrx+HBzzIQI
   f4WKwzemvx6VOqcNtSsyIJXQA2zI+mAxrkqgWYbX0D1Y61KlCn/w18odM
   xsL4UJuedxvZhKXwjLhzRvnjE9DNrHVwOChwrVuQRwuUbxjGBGZU9NLis
   9O/nQjWQdH6VrxBYYOaV9YAKzsfeXmxh/22mmNmBbwYGl76nWX4PNxTvD
   EtGWFEdloeXMotGKq+V03kuykMKgCnE6noMdN9RSBVpBMJRzT24fFrMiZ
   lLJnWY0mSH51UES4oZNGkNPD7g45798YWwOX+p1D9x8Gr+osPHC5sP8qa
   A==;
X-CSE-ConnectionGUID: 2aBM5QN+TweyJPaIBrPo3w==
X-CSE-MsgGUID: SvkU2pkdRQOoQUKix0ABAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="69540709"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="69540709"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 09:42:30 -0700
X-CSE-ConnectionGUID: r9u+KHFRSVCVCe+j00hj8w==
X-CSE-MsgGUID: F+13iNMPRQeo6Jt3+45ETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="161643255"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Mar 2025 09:42:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx7MA-00051n-0i;
	Tue, 25 Mar 2025 16:42:26 +0000
Date: Wed, 26 Mar 2025 00:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] nfs: add a refcount tracker for struct net as held by
 the nfs_client
Message-ID: <202503260024.8S4aQlWh-lkp@intel.com>
References: <20250325-nfs-net-nef-v1-1-0142cbd7e9ea@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-nfs-net-nef-v1-1-0142cbd7e9ea@kernel.org>

Hi Jeff,

kernel test robot noticed the following build errors:

[auto build test ERROR on 38fec10eb60d687e30c8c6b5420d86e8149f7557]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-Layton/nfs-add-a-refcount-tracker-for-struct-net-as-held-by-the-nfs_client/20250325-194639
base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
patch link:    https://lore.kernel.org/r/20250325-nfs-net-nef-v1-1-0142cbd7e9ea%40kernel.org
patch subject: [PATCH] nfs: add a refcount tracker for struct net as held by the nfs_client
config: csky-randconfig-002-20250325 (https://download.01.org/0day-ci/archive/20250326/202503260024.8S4aQlWh-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260024.8S4aQlWh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260024.8S4aQlWh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/client.c: In function 'nfs_alloc_client':
>> fs/nfs/client.c:183:55: error: 'struct nfs_client' has no member named 'cl_ns_tracker'
     183 |         clp->cl_net = get_net_track(cl_init->net, &clp->cl_ns_tracker, GFP_KERNEL);
         |                                                       ^~
   fs/nfs/client.c: In function 'nfs_free_client':
   fs/nfs/client.c:253:40: error: 'struct nfs_client' has no member named 'cl_ns_track'
     253 |         put_net_track(clp->cl_net, &clp->cl_ns_track);
         |                                        ^~


vim +183 fs/nfs/client.c

   141	
   142	/*
   143	 * Allocate a shared client record
   144	 *
   145	 * Since these are allocated/deallocated very rarely, we don't
   146	 * bother putting them in a slab cache...
   147	 */
   148	struct nfs_client *nfs_alloc_client(const struct nfs_client_initdata *cl_init)
   149	{
   150		struct nfs_client *clp;
   151		int err = -ENOMEM;
   152	
   153		if ((clp = kzalloc(sizeof(*clp), GFP_KERNEL)) == NULL)
   154			goto error_0;
   155	
   156		clp->cl_minorversion = cl_init->minorversion;
   157		clp->cl_nfs_mod = cl_init->nfs_mod;
   158		if (!get_nfs_version(clp->cl_nfs_mod))
   159			goto error_dealloc;
   160	
   161		clp->rpc_ops = clp->cl_nfs_mod->rpc_ops;
   162	
   163		refcount_set(&clp->cl_count, 1);
   164		clp->cl_cons_state = NFS_CS_INITING;
   165	
   166		memcpy(&clp->cl_addr, cl_init->addr, cl_init->addrlen);
   167		clp->cl_addrlen = cl_init->addrlen;
   168	
   169		if (cl_init->hostname) {
   170			err = -ENOMEM;
   171			clp->cl_hostname = kstrdup(cl_init->hostname, GFP_KERNEL);
   172			if (!clp->cl_hostname)
   173				goto error_cleanup;
   174		}
   175	
   176		INIT_LIST_HEAD(&clp->cl_superblocks);
   177		clp->cl_rpcclient = ERR_PTR(-EINVAL);
   178	
   179		clp->cl_flags = cl_init->init_flags;
   180		clp->cl_proto = cl_init->proto;
   181		clp->cl_nconnect = cl_init->nconnect;
   182		clp->cl_max_connect = cl_init->max_connect ? cl_init->max_connect : 1;
 > 183		clp->cl_net = get_net_track(cl_init->net, &clp->cl_ns_tracker, GFP_KERNEL);
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
