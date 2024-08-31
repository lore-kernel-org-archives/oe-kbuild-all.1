Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20531CF92
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 21:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725138083; cv=none; b=ZMSMGX6JKYUfSJvObr/kgi2IE6slJN0Ah+SaCZ1TCRTEo3OSawZ4tfL31uAfoMqbaXWT9wht5ejr/klxxUisD1jv5vmdV0wuDzGsH6v1wPaG60NFwiNjt7b/lcYKETbvPyLetdD8OxtYeufXR4puCamVkMphG5afhOsXRYuq5QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725138083; c=relaxed/simple;
	bh=TecFcMpqibA8H/5PUyr78LJsdInUIHC9dP8WJAfkWZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C29vaJhWnnLROxwMseCtIRcc1Z5BhFd+VLv7cJ71z/FOYPWdzW8p4vS/mqi24F5f3yT5UfvWd9ADtOrwHusgw/UjftN4mmqMNjml2URQaXZcUJ8N1qrcGg2jt2qG9dblhhY1vfemwoC6tELRQr8FmXmEkatHm4SDRDaWhIFUa8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IokbgHUc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IokbgHUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725138082; x=1756674082;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TecFcMpqibA8H/5PUyr78LJsdInUIHC9dP8WJAfkWZQ=;
  b=IokbgHUcfN23XsUGGMnYaFPHgkXfqM2ZpZBCJnWSxjs4jwRwpvNexaGe
   yIXXAe78K+4RjlkW+cdu1htwe8Ou80ivS1bphb3iscj2HTgq2EFhnUqjb
   ocR6dV4M6PKxMpcv1vVxJfGyGSVSKH48YKFfENGiZSr2CO5GJliCNwgLT
   BzY7SsaHdzpUC04erqGIQj11Cz12ajlI4T7NHYPm4bH3494IH0mr6+ENH
   /OERj3vEcpqiVuulWhLKpfP3sMS5Rwb2slTJxFYPwr216jX+yWR7XfHlU
   1LKHFlD9LRzMQUd+mEd6Np5wahgZl5m0dry81S4ybiBPafVHxm+OoxTLt
   Q==;
X-CSE-ConnectionGUID: CoMp5RS6SoO37TvAmwrZhg==
X-CSE-MsgGUID: XgW0UYFNTpK5BW5HdBC/+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="27550434"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="27550434"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 14:01:22 -0700
X-CSE-ConnectionGUID: 0rV4gzAXSh2Etdioev8UCA==
X-CSE-MsgGUID: PKvV16TiQ1SZU9td8EKxnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="64392698"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 Aug 2024 14:01:20 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skVDi-00037m-0R;
	Sat, 31 Aug 2024 21:01:18 +0000
Date: Sun, 1 Sep 2024 05:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, NeilBrown <neil@brown.name>,
	Jeff Layton <jlayton@kernel.org>
Subject: [snitzer:nfs-localio-for-next.v14-neilb 17/26]
 fs/nfsd/nfsctl.c:2284:undefined reference to `nfs_uuid_invalidate_clients'
Message-ID: <202409010417.E64kZYKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next.v14-neilb
head:   70cce93a681fa1956cb736e574953994bfd5aae0
commit: 311a9e7ccc6022120e8d153b28e99238622a259d [17/26] nfsd: implement server support for NFS_LOCALIO_PROGRAM
config: sh-sdk7780_defconfig (https://download.01.org/0day-ci/archive/20240901/202409010417.E64kZYKJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010417.E64kZYKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010417.E64kZYKJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/nfsd/nfsctl.o: in function `nfsd_net_pre_exit':
>> fs/nfsd/nfsctl.c:2284:(.text+0x140): undefined reference to `nfs_uuid_invalidate_clients'


vim +2284 fs/nfsd/nfsctl.c

  2272	
  2273	/**
  2274	 * nfsd_net_pre_exit - Disconnect localio clients from net namespace
  2275	 * @net: a network namespace that is about to be destroyed
  2276	 *
  2277	 * This invalidated ->net pointers held by localio clients
  2278	 * while they can still safely access nn->counter.
  2279	 */
  2280	static __net_exit void nfsd_net_pre_exit(struct net *net)
  2281	{
  2282		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
  2283	
> 2284		nfs_uuid_invalidate_clients(&nn->local_clients);
  2285	}
  2286	/**
  2287	 * nfsd_net_exit - Release the nfsd_net portion of a net namespace
  2288	 * @net: a network namespace that is about to be destroyed
  2289	 *
  2290	 */
  2291	static __net_exit void nfsd_net_exit(struct net *net)
  2292	{
  2293		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
  2294	
  2295		nfsd_proc_stat_shutdown(net);
  2296		percpu_counter_destroy_many(nn->counter, NFSD_STATS_COUNTERS_NUM);
  2297		nfsd_idmap_shutdown(net);
  2298		nfsd_export_shutdown(net);
  2299	}
  2300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
