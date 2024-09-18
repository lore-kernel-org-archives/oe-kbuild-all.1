Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC714A0A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 07:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726642869; cv=none; b=ReFjND/LoeleCq1+bkzFM7dXcBxPn/pIla9psU8Hjic7Ja+ejlhXuQwxQUspTAPKPUQ/S35iZiaC8ZpGBcdlZjqRI/oSmfQGZTX8kYF/ADRTiIRrPHGT+B0JQj1hUlBQfPL+laBrc5aRzmTl802E1V6ZcnQ5CMCmDbSioovDm4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726642869; c=relaxed/simple;
	bh=MkTjAbh0hzOE+Q2tobqzRF+MPINCAPk7RxxP17rpmew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mofagm+7ntQSavhsPZ6fauNKgbHX8HnZRP2NbUE8sxb3wUkQMUKv8zO3dIZtpVhCD4U35Zo7Beq95V1kTjidM4C2zZNa2oWYPvc8Yh5nA3JesPwHQVo5agkBoAYHjLVkbhJnKoOdBBkxlaiD4Z961psAE9nzOXIyQeWqwOw/2zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QaIhEkC1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaIhEkC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726642868; x=1758178868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MkTjAbh0hzOE+Q2tobqzRF+MPINCAPk7RxxP17rpmew=;
  b=QaIhEkC1wNrXEGS7lit0N9Zj7/ZsVCW8C1nPS2oHcQBGPBqC661UUZ/0
   /xtFfq/coXzuAtLmQswz7dx5fkBSNxBeCtYOjNfgCjkZtH+UC6dqCdIkE
   xIqmT+aKqjAuc7Z0/KeBxez0er83uQZxoQORV5zZD5UfLFWRN7iUaBFhd
   +bNMu6A6MW+TpMkNbrqNpLZAgirqR4YyFPoo33rznlo87Rf38njjPz2ka
   jvEvaHB5adBi+U67dLh0DE0d+KPOt8m1y8Hm94BBlLzgduES8HAoy4cQC
   SrbP/Onzn0GQGpbBZQQFd3KNVZwsykqrGlekoYmi7rTdjkHonI9EpnQCH
   g==;
X-CSE-ConnectionGUID: goOIlki4RSm0BgcQ2SlI2w==
X-CSE-MsgGUID: gqxcNq8nRwKMLOFdu7kW4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36913704"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36913704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 00:01:03 -0700
X-CSE-ConnectionGUID: TAIc5DJxTQCqhiifjB2v8g==
X-CSE-MsgGUID: TNNlUp5XR8KMrKwFhrr3Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="106915596"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Sep 2024 00:01:01 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqogM-000BwN-02;
	Wed, 18 Sep 2024 07:00:58 +0000
Date: Wed, 18 Sep 2024 15:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:net-next-pp-inflight-fix 2/2]
 net/core/page_pool_priv.h:47:1: warning: no return statement in function
 returning non-void
Message-ID: <202409181451.iC7wtlkf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git net-next-pp-inflight-fix
head:   585c4413fc2f6385d74132e13b42cba3e4123eee
commit: 585c4413fc2f6385d74132e13b42cba3e4123eee [2/2] page_pool: fix IOMMU crash when driver has already unbound
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240918/202409181451.iC7wtlkf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409181451.iC7wtlkf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181451.iC7wtlkf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/netdev_rx_queue.c:7:
   net/core/page_pool_priv.h: In function 'page_pool_set_pp_info':
>> net/core/page_pool_priv.h:47:1: warning: no return statement in function returning non-void [-Wreturn-type]
      47 | }
         | ^


vim +47 net/core/page_pool_priv.h

8ab79ed50cf10f Mina Almasry 2024-09-10  37  
0f921404689398 Mina Almasry 2024-09-10  38  #if defined(CONFIG_PAGE_POOL)
585c4413fc2f63 Yunsheng Lin 2024-09-12  39  bool page_pool_set_pp_info(struct page_pool *pool, netmem_ref netmem);
585c4413fc2f63 Yunsheng Lin 2024-09-12  40  void page_pool_clear_pp_info(struct page_pool *pool, netmem_ref netmem);
0f921404689398 Mina Almasry 2024-09-10  41  int page_pool_check_memory_provider(struct net_device *dev,
0f921404689398 Mina Almasry 2024-09-10  42  				    struct netdev_rx_queue *rxq);
0f921404689398 Mina Almasry 2024-09-10  43  #else
585c4413fc2f63 Yunsheng Lin 2024-09-12  44  static inline bool page_pool_set_pp_info(struct page_pool *pool,
0f921404689398 Mina Almasry 2024-09-10  45  					 netmem_ref netmem)
0f921404689398 Mina Almasry 2024-09-10  46  {
0f921404689398 Mina Almasry 2024-09-10 @47  }
585c4413fc2f63 Yunsheng Lin 2024-09-12  48  static inline void page_pool_clear_pp_info(struct page_pool *pool,
585c4413fc2f63 Yunsheng Lin 2024-09-12  49  					   netmem_ref netmem)
0f921404689398 Mina Almasry 2024-09-10  50  {
0f921404689398 Mina Almasry 2024-09-10  51  }
0f921404689398 Mina Almasry 2024-09-10  52  static inline int page_pool_check_memory_provider(struct net_device *dev,
0f921404689398 Mina Almasry 2024-09-10  53  						  struct netdev_rx_queue *rxq)
0f921404689398 Mina Almasry 2024-09-10  54  {
0f921404689398 Mina Almasry 2024-09-10  55  	return 0;
0f921404689398 Mina Almasry 2024-09-10  56  }
0f921404689398 Mina Almasry 2024-09-10  57  #endif
0f921404689398 Mina Almasry 2024-09-10  58  

:::::: The code at line 47 was first introduced by commit
:::::: 0f921404689398943257793f7240db239a23b609 memory-provider: dmabuf devmem memory provider

:::::: TO: Mina Almasry <almasrymina@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
