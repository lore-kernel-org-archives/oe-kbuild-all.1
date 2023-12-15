Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAC91856
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 00:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBWvWeXV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702598443; x=1734134443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NXUguaTNQaRtYr2oi3f5Vsg2GzQzN1tqGXXw2SOtadI=;
  b=JBWvWeXVrqN5yQpB9y98rPkjYsFDuNxu4ldiTVhbUppaBMdLmFOHFTnN
   zKZFBj6PebrZOwUxi19mhfGyWPK9EG/DckjzUnA4zCzEvomaF5+4nKggt
   IN+sIAvJr4SFCrqoG+ZOqOLolvMevbqz0hzhJ12wtc1KQcgeYBLhcYOHe
   XgIcTLEP+vVXGnAGy+rpoxMGnVCSG2PCIO8ztjOD1yOIeocBo+raOUaWV
   +w9aspMRu8mGv5AoDGzQxQlBmP8EFuDGYIgnbKyIT8gXjykMMwu6uERxj
   mYOv6U/hWLBGbgFvi+hYZyWKQI9diE1Esb8JyB3q2/gSaFvDYDu+3XJAD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="380200325"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="380200325"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 16:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="892676031"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="892676031"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Dec 2023 16:00:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDvd9-000Mll-1U;
	Fri, 15 Dec 2023 00:00:39 +0000
Date: Fri, 15 Dec 2023 08:00:10 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-pp-provider-bnxt 31/54] drivers/net/veth.c:1219:7:
 warning: variable 'nr' set but not used
Message-ID: <202312150712.y0YkCOTw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-pp-provider-bnxt
head:   07705cd570dcaaab11924a24695cd7f2b8f95f72
commit: 60891d9b07d8ed961132c365fcb5429499aa74c4 [31/54] veth: add support for io_uring zc rx
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20231215/202312150712.y0YkCOTw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150712.y0YkCOTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150712.y0YkCOTw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/veth.c:1219:7: warning: variable 'nr' set but not used [-Wunused-but-set-variable]
                   int nr = 0;
                       ^
   1 warning generated.


vim +/nr +1219 drivers/net/veth.c

  1201	
  1202	static void veth_napi_del_range(struct net_device *dev, int start, int end)
  1203	{
  1204		struct veth_priv *priv = netdev_priv(dev);
  1205		int i;
  1206	
  1207		for (i = start; i < end; i++) {
  1208			struct veth_rq *rq = &priv->rq[i];
  1209	
  1210			rcu_assign_pointer(priv->rq[i].napi, NULL);
  1211			napi_disable(&rq->xdp_napi);
  1212			__netif_napi_del(&rq->xdp_napi);
  1213		}
  1214		synchronize_net();
  1215	
  1216		for (i = start; i < end; i++) {
  1217			struct veth_rq *rq = &priv->rq[i];
  1218			void *ptr;
> 1219			int nr = 0;
  1220	
  1221			rq->rx_notify_masked = false;
  1222	
  1223			while ((ptr = ptr_ring_consume(&rq->xdp_ring))) {
  1224				veth_ptr_free(ptr);
  1225				nr++;
  1226			}
  1227	
  1228			ptr_ring_cleanup(&rq->xdp_ring, NULL);
  1229		}
  1230	
  1231		for (i = start; i < end; i++) {
  1232			page_pool_destroy(priv->rq[i].page_pool);
  1233			priv->rq[i].page_pool = NULL;
  1234		}
  1235	}
  1236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
