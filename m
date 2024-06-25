Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7911DFF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jun 2024 04:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719288247; cv=none; b=BbQ+QtWUpO5bIWktjhD5TpC0/AA/OA6dy3ESwA7kmNSbl/zyQAWB254I1f6E7UMGbEr4XgkF3dU9RS3CHtzjZkefIAYsRM8YkS52Y06U6a6Es0dht3WNBd3Bt+GouRHKS//5D1QrKiYTDRbsvbCOZ+p9wl6OblJKJL5B1L6w87c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719288247; c=relaxed/simple;
	bh=nbW6llKdsBXDe1/xA7znvdIlS1WhaXXThQ6SKWmozJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNBln9L9pfq1/Ft99fyPF6f7MHEYhYsndpCjyEF2vMUqf/6Fm+r1m8okbx7DYPrcepfvIhqKFuXRufxiq3Mxa7EcEhsMumc25Gc8h/rg1gmrkFojQGKi1uHRISA6OU6PQ+TOsezooY7WATxqdBn2JZwMOkC94PbTWOcv7pVLD4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSJw6Voo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSJw6Voo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719288245; x=1750824245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbW6llKdsBXDe1/xA7znvdIlS1WhaXXThQ6SKWmozJ0=;
  b=ZSJw6VooR55WDaJTKNvzu6Mk1g/viJDmjoQoVt20XSMyYF/vK4Moybbq
   8VHDH2f+Pfi4rt20soHCKjUZ0W60oHEoMdUnqSQd4Vb67IhCCmj97sDDV
   oeHdmImFIFWSjAztkNTU2bicas8Fpily4BfOYb2hwj/TIHstlYaXwigcv
   74oSeo8Ta1cwlPszjm9pYtuadFmh9pA74u9oOBMmbWryNwISrlBwlitqH
   Cccjy8EtKTmAza5grtUVsHugDiCkPf9TCpQezTUQALwmLP54vwfAOjXrC
   c1TCWQiPOjIRPg/h9aJQCpHOdvLa9IKGPgcsojVykotNT2OYF1sBntYei
   g==;
X-CSE-ConnectionGUID: ZjSByJSrTlOey+H1mYalcQ==
X-CSE-MsgGUID: kSMnfJJETXCKxVl4BbdQ3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26973945"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="26973945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 21:04:05 -0700
X-CSE-ConnectionGUID: N/Rfb6ieQkq9fx7dGGtiIg==
X-CSE-MsgGUID: 0GNNotxKTZilMJ92tqPp5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="48470550"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2024 21:04:04 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLxPV-000E1v-2N;
	Tue, 25 Jun 2024 04:04:01 +0000
Date: Tue, 25 Jun 2024 12:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zcrx/next-6.10-rebase 4/35] net/core/devmem.c:83:35:
 error: implicit declaration of function 'get_netdev_rx_queue_index'
Message-ID: <202406251211.yk7pSBTG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
commit: 043f621b72506ff2986160281a88e517c8062d39 [4/35] netdev: support binding dma-buf to netdevice
config: arm64-randconfig-001-20240625 (https://download.01.org/0day-ci/archive/20240625/202406251211.yk7pSBTG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406251211.yk7pSBTG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406251211.yk7pSBTG-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/devmem.c: In function 'net_devmem_unbind_dmabuf':
>> net/core/devmem.c:83:35: error: implicit declaration of function 'get_netdev_rx_queue_index' [-Werror=implicit-function-declaration]
      83 |                         rxq_idx = get_netdev_rx_queue_index(rxq);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/get_netdev_rx_queue_index +83 net/core/devmem.c

    59	
    60	void net_devmem_unbind_dmabuf(struct net_devmem_dmabuf_binding *binding)
    61	{
    62		struct netdev_rx_queue *rxq;
    63		unsigned long xa_idx;
    64		unsigned int rxq_idx;
    65	
    66		if (!binding)
    67			return;
    68	
    69		if (binding->list.next)
    70			list_del(&binding->list);
    71	
    72		xa_for_each(&binding->bound_rxq_list, xa_idx, rxq) {
    73			if (rxq->mp_params.mp_priv == binding) {
    74				/* We hold the rtnl_lock while binding/unbinding
    75				 * dma-buf, so we can't race with another thread that
    76				 * is also modifying this value. However, the page_pool
    77				 * may read this config while it's creating its
    78				 * rx-queues. WRITE_ONCE() here to match the
    79				 * READ_ONCE() in the page_pool.
    80				 */
    81				WRITE_ONCE(rxq->mp_params.mp_priv, NULL);
    82	
  > 83				rxq_idx = get_netdev_rx_queue_index(rxq);
    84	
    85				netdev_rx_queue_restart(binding->dev, rxq_idx);
    86			}
    87		}
    88	
    89		xa_erase(&net_devmem_dmabuf_bindings, binding->id);
    90	
    91		net_devmem_dmabuf_binding_put(binding);
    92	}
    93	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
