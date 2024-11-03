Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B4E3FC2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 03:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730604673; cv=none; b=NrfJNI77UDz3OjbGvU68eeuONi98B92rXvuhwZUW/h0IM9wePMbat5zb5yLd4kDkfN/l0Y6FooG+ijy6iqWza18AcNABfm9QKeOeS+jL3KJHCNX8F/mRvkS3hpCA7QrZIYl5p1CrULM0amT7VPLJ7jBO5nHePpRgZrEH5xd7v8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730604673; c=relaxed/simple;
	bh=vpY9shfk7w7FF713K5IFFNBpQgHlVGE4KgpFL4pB5e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fPVDBzdBaApMQOZZD/kAs2hTMLVwd/v3FvwZxHvNMbZK0RiE4NVSm1Ftm4/AFHiPCAXmnh+n/R1Js7p5ecvlPR6tPeJdcuUpU7mKdUd447wqIMC/MBGLNsPZEPe3y44rQtsWpYnTtWAtBEtKip+xLyaxuynbZZx5TL/7H5y7qR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EKOxA/ao; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EKOxA/ao"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730604671; x=1762140671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vpY9shfk7w7FF713K5IFFNBpQgHlVGE4KgpFL4pB5e4=;
  b=EKOxA/aop+lL6jLVdjqT3wAc+LcNfoJSRop/jWiiMOBjT2hcBueT3Law
   eRn35TVEBMhMId2Z7itKTUy8ZtdaMLkup6F/xFJ++e+NaGoK+vs3xxAlt
   sdhEXTC4iwBOvqhZE3ss7XDyQ7erYB+mv1fThyk6mRe3FTEcj/AaKsBnB
   tjtbW98v+86dDH0wXagOXrgkECYJG+z7DSXJkmgqmFRhfaTdF9QNgU4Am
   ONex8g6dPUANzGawUjSmn6i7+zBv3ut0p2khMR+e5EkdJJkHXYCxrZGJI
   /3XpdBTBnCxxeGw1GydP/Qfl409IBtWXzwANihe4dZQlJKtBLLzi8ruM6
   w==;
X-CSE-ConnectionGUID: pFv3hgdLQjeB8Qr3K99ywg==
X-CSE-MsgGUID: Bu3CMxSHRgqHu0ReSj/j5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30095653"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30095653"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 20:31:11 -0700
X-CSE-ConnectionGUID: eHpWs9weQDStSNKXsUBTcQ==
X-CSE-MsgGUID: 6gxFf2rmQKWt2s3y9WMX9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="82987304"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Nov 2024 20:31:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7RKV-000jdt-2x;
	Sun, 03 Nov 2024 03:31:07 +0000
Date: Sun, 3 Nov 2024 11:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 25/26] fs/nfsd/filecache.c:843:51:
 error: 'struct nfsd_net' has no member named 'local_clients_lock'
Message-ID: <202411031143.hGE7042D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   1a750ba15bb3f764f22fcc9731f8991cba0b084b
commit: 987bb33e11a334f6b224f92ab1f1f6c694eb96ee [25/26] nfs_common: split localio global nfs_uuids_lock
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241103/202411031143.hGE7042D-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031143.hGE7042D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031143.hGE7042D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/filecache.c:42:
   include/linux/nfslocalio.h:105:46: warning: 'struct nfs_fh' declared inside parameter list will not be visible outside of this definition or declaration
     105 | static inline void nfs_close_local_fh(struct nfs_fh *fh)
         |                                              ^~~~~~
   fs/nfsd/filecache.c: In function '__nfsd_file_cache_purge':
   fs/nfsd/filecache.c:842:17: error: implicit declaration of function 'nfs_localio_invalidate_clients' [-Werror=implicit-function-declaration]
     842 |                 nfs_localio_invalidate_clients(&nn->local_clients,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfsd/filecache.c:842:51: error: 'struct nfsd_net' has no member named 'local_clients'
     842 |                 nfs_localio_invalidate_clients(&nn->local_clients,
         |                                                   ^~
>> fs/nfsd/filecache.c:843:51: error: 'struct nfsd_net' has no member named 'local_clients_lock'
     843 |                                                &nn->local_clients_lock);
         |                                                   ^~
   cc1: some warnings being treated as errors


vim +843 fs/nfsd/filecache.c

   824	
   825	/**
   826	 * __nfsd_file_cache_purge: clean out the cache for shutdown
   827	 * @net: net-namespace to shut down the cache (may be NULL)
   828	 *
   829	 * Walk the nfsd_file cache and close out any that match @net. If @net is NULL,
   830	 * then close out everything. Called when an nfsd instance is being shut down,
   831	 * and when the exports table is flushed.
   832	 */
   833	static void
   834	__nfsd_file_cache_purge(struct net *net)
   835	{
   836		struct rhashtable_iter iter;
   837		struct nfsd_file *nf;
   838		LIST_HEAD(dispose);
   839	
   840		if (net) {
   841			struct nfsd_net *nn = net_generic(net, nfsd_net_id);
   842			nfs_localio_invalidate_clients(&nn->local_clients,
 > 843						       &nn->local_clients_lock);
   844		}
   845	
   846		rhltable_walk_enter(&nfsd_file_rhltable, &iter);
   847		do {
   848			rhashtable_walk_start(&iter);
   849	
   850			nf = rhashtable_walk_next(&iter);
   851			while (!IS_ERR_OR_NULL(nf)) {
   852				if (!net || nf->nf_net == net)
   853					nfsd_file_cond_queue(nf, &dispose);
   854				nf = rhashtable_walk_next(&iter);
   855			}
   856	
   857			rhashtable_walk_stop(&iter);
   858		} while (nf == ERR_PTR(-EAGAIN));
   859		rhashtable_walk_exit(&iter);
   860	
   861		nfsd_file_dispose_list(&dispose);
   862	}
   863	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
