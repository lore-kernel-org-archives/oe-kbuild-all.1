Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC70D148FE8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 06:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730442614; cv=none; b=hgmefYDHXzha+jD2udMSF5PrsCD/0kCwINTKtKmWUWtobnz02KRnhXQLafLbDA2akGndMUy20kMZfdHRBtnvVUNRaWbVg0Dgw8GM2M7Sf1sQpe2osuZ7JLq79QPoQI7FByTl6dHfFBsJE78a0Cp1eyqlUUnsFteMY5hzM4Qdy9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730442614; c=relaxed/simple;
	bh=UOX1/w+jrszpc0qTFUUt2MGFXufjlYb+EIpLJRv17Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A53evjVxKZWEozw5GSL1MbHoxNXnDbsYycFsqoD/eypFPT6G1uHWJKN/TOfu1P8FEmRYez8YabAkRXWOWskDbaWwc2SJq9zE/6SHCzOT1v6TX+CaSl6UpR02O+x40J3+WmVJ3W+GzAGTtGX9ui7sSDT/Y4x3RVj7DnXGBks09Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f18ZBPWE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f18ZBPWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730442612; x=1761978612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UOX1/w+jrszpc0qTFUUt2MGFXufjlYb+EIpLJRv17Vs=;
  b=f18ZBPWEPhgTo8Q+C9L4NrN1GYNMTwWRmJfyp/CPXFlSrXjEUW27LXE+
   624vhPN+/GSr2W84netlCgfhZxA0HKpl6xjhhoRmD8O7NgNECQbh+/QqC
   bEAZuitJnAsBrQdX4Fg1DzSbcCRbGxpGf23w5e3QsEvMXEfoGHmSi7x2l
   tadxGUVpYfxB526Jg01ADeflwAB03/UNiQUZC2brF1fDNBowqXS5Gzlg+
   pPGlDT8qxXAxlCt6l6ieS60ph400AdD/UPUcekSEKIhBo5NEIZd+g5WJB
   LXN+ilhJfPdVtYqf4QlkKKFemaUwIAD54XsunDdp3+1qhSUZ/ptVYIzFI
   w==;
X-CSE-ConnectionGUID: x+G1ue1xQJmiG+18rCrBQA==
X-CSE-MsgGUID: JsT4gxG2TEqE2cgruaFPCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="40785537"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="40785537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 23:30:11 -0700
X-CSE-ConnectionGUID: jh/ESLl5QvusPGkcU/IEug==
X-CSE-MsgGUID: VM6NeaT6TJKeTdWCXPJLwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="82793980"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Oct 2024 23:30:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6lAe-000hDr-01;
	Fri, 01 Nov 2024 06:30:08 +0000
Date: Fri, 1 Nov 2024 14:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-next 22/23] fs/nfsd/filecache.c:842:17:
 error: implicit declaration of function 'nfs_localio_invalidate_clients'
Message-ID: <202411011449.X0vK2BrS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-next
head:   cdfa872ee25377e6ceb6e73f695e19c903b38608
commit: 27f81c6a85b36d6948b768cc1ec584b92fe7ee30 [22/23] nfs_common: track all open nfsd_files per nfs_client
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241101/202411011449.X0vK2BrS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011449.X0vK2BrS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011449.X0vK2BrS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/nfsd/filecache.c:42:
>> include/linux/nfslocalio.h:89:46: warning: 'struct nfs_fh' declared inside parameter list will not be visible outside of this definition or declaration
      89 | static inline void nfs_close_local_fh(struct nfs_fh *fh)
         |                                              ^~~~~~
   fs/nfsd/filecache.c: In function '__nfsd_file_cache_purge':
>> fs/nfsd/filecache.c:842:17: error: implicit declaration of function 'nfs_localio_invalidate_clients' [-Werror=implicit-function-declaration]
     842 |                 nfs_localio_invalidate_clients(&nn->local_clients);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nfsd/filecache.c:842:51: error: 'struct nfsd_net' has no member named 'local_clients'
     842 |                 nfs_localio_invalidate_clients(&nn->local_clients);
         |                                                   ^~
   cc1: some warnings being treated as errors


vim +/nfs_localio_invalidate_clients +842 fs/nfsd/filecache.c

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
 > 842			nfs_localio_invalidate_clients(&nn->local_clients);
   843		}
   844	
   845		rhltable_walk_enter(&nfsd_file_rhltable, &iter);
   846		do {
   847			rhashtable_walk_start(&iter);
   848	
   849			nf = rhashtable_walk_next(&iter);
   850			while (!IS_ERR_OR_NULL(nf)) {
   851				if (!net || nf->nf_net == net)
   852					nfsd_file_cond_queue(nf, &dispose);
   853				nf = rhashtable_walk_next(&iter);
   854			}
   855	
   856			rhashtable_walk_stop(&iter);
   857		} while (nf == ERR_PTR(-EAGAIN));
   858		rhashtable_walk_exit(&iter);
   859	
   860		nfsd_file_dispose_list(&dispose);
   861	}
   862	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
