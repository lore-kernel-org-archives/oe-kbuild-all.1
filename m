Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085DF25290D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 19:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746732040; cv=none; b=eiES1h3n3/SWsCqJ5CMIF0jHy5zs6VdKzDStjM8qQhFXRNlx5+HOiu7XJUAbzUPZsOxmldg2SWCmt74ppXvhO6BaQ4aRCOCQsciwNu33HYIf76FXDfu0NyO28SzrgjVelRUyZcJTbsSsAHyICBlyCtFBjz2ue2VXGCJsmXgpuJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746732040; c=relaxed/simple;
	bh=ppObmI6Ouy6XivuQNPyxoT3lbbBuvdpN9Kg4AXoEmbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMgySoSguCEZ6rViSQ5kwZEKyrmTGu6PDHR3J1uw7pVPY/o5ZRDpB8eophODIqdQ5Z3igjzfiHcLsjBnwVO7CtLi3DBq5rhnY5wJ9ioc8xDJqZGmeHX1rdGLTnwYFBrZCCCBGmA5sLV0lioq8lFRKF2LyQ2XE6Ho0sL28Xto/pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d0l2DQgn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d0l2DQgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746732038; x=1778268038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ppObmI6Ouy6XivuQNPyxoT3lbbBuvdpN9Kg4AXoEmbk=;
  b=d0l2DQgnEZjKTTd33Q927cWhGcP/x4cpU09/DMYDR8LdKdyjKrLlSzl0
   iGa0xGN1CwPw9rrrHlreKOIiiSqWIMpsxq8O48hQh+6fQ8yS00+J8H7+H
   Uizbp6/TzxWQRvCnU7p93pVuTfb4/W1d5gHAVyZ+gq8aqo0NqJT8w8Ttc
   F/pz2fZ4CmZpMCA/KA866A9IS5R+CS3lXJFIOmbgbxuzaiek2T9o6r0xx
   E505JpCf+CgFZsv/wqJdYIssmj4RURkl+ckWNZtBd+YRYf10hlaOzt74q
   nAm5/GXDmEv/DA5W+BUJiSNMh0jw/9unaLv9DRFoGcHFUd48V7wrfRZSX
   g==;
X-CSE-ConnectionGUID: Re6lXbfFTMyNNiVJsdhBEQ==
X-CSE-MsgGUID: UWyOhYo3T+y8PTPfOgSBlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48408691"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48408691"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 12:20:38 -0700
X-CSE-ConnectionGUID: 5c1sRVbNSzqpOx/QCfCSvg==
X-CSE-MsgGUID: exq4pEEXRZ2aZ7CoClax6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136877818"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 May 2025 12:20:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD6nK-000BId-0M;
	Thu, 08 May 2025 19:20:34 +0000
Date: Fri, 9 May 2025 03:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/netkit-xdp 6/11] drivers/net/netkit.c:218:39: error:
 'struct netdev_rx_queue' has no member named 'pool'
Message-ID: <202505090304.PmYQL9l0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning still remains.

tree:   https://github.com/cilium/linux.git pr/netkit-xdp
head:   4ee9f15d4c2af8705389b81757f1cd597156304d
commit: 65332eb9360ea7f0f0bcea9de6c4b2ec7a8ca936 [6/11] netkit: implement ndos
config: alpha-randconfig-r071-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090304.PmYQL9l0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090304.PmYQL9l0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090304.PmYQL9l0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/netkit.c: In function 'netkit_xsk_get_pool_from_qid':
>> drivers/net/netkit.c:218:39: error: 'struct netdev_rx_queue' has no member named 'pool'
      return nk->lower->dev->_rx[queue_id].pool;
                                          ^
>> drivers/net/netkit.c:220:39: error: 'struct netdev_queue' has no member named 'pool'
      return nk->lower->dev->_tx[queue_id].pool;
                                          ^
   drivers/net/netkit.c: In function 'netkit_xsk_reg_pool_at_qid':
   drivers/net/netkit.c:245:32: error: 'struct netdev_rx_queue' has no member named 'pool'
      nk->lower->dev->_rx[queue_id].pool = pool;
                                   ^
   drivers/net/netkit.c:247:32: error: 'struct netdev_queue' has no member named 'pool'
      nk->lower->dev->_tx[queue_id].pool = pool;
                                   ^
   drivers/net/netkit.c: In function 'netkit_xsk_clear_pool_at_qid':
   drivers/net/netkit.c:261:32: error: 'struct netdev_rx_queue' has no member named 'pool'
      nk->lower->dev->_rx[queue_id].pool = NULL;
                                   ^
   drivers/net/netkit.c:263:32: error: 'struct netdev_queue' has no member named 'pool'
      nk->lower->dev->_tx[queue_id].pool = NULL;
                                   ^


vim +218 drivers/net/netkit.c

   207	
   208	static struct xsk_buff_pool *
   209	netkit_xsk_get_pool_from_qid(struct net_device *dev, u16 queue_id)
   210	{
   211		struct netkit *nk = netkit_priv(dev);
   212	
   213		if (!nk->lower || nk->primary)
   214			return NULL;
   215		if (!netkit_queue_valid(dev, queue_id))
   216			return NULL;
   217		if (queue_id < nk->lower->dev->real_num_rx_queues)
 > 218			return nk->lower->dev->_rx[queue_id].pool;
   219		if (queue_id < nk->lower->dev->real_num_tx_queues)
 > 220			return nk->lower->dev->_tx[queue_id].pool;
   221		return NULL;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
