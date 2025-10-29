Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761FB221F1C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 02:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705863; cv=none; b=OJSXt4myhNp+N4V+MVhlorSkPmHQXb0JYArMDuQ0K4UY438f10QZ0dTw5OL8m3xDZminTQ2aTmEKdNbH46q02YiuLx9pIjewP1l0I+pY6z1SZMbLrT1bkfEUJhe0BIKCbVzPBxkKRa4mALelaCi9I1xvpM3BNfuxjpFIPVwXOgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705863; c=relaxed/simple;
	bh=Ojwqy5xebFI9lU1TIe9ZG72rgaWWf3+rrKX5XVnWJbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqvjYT3BFZSkX3r8aQqDWxhI/lcKt9MB0CKGoEw4YNJsREVirnZI4dXLdCeGCTZQmbrvVjS7evqzA7zgVDYr1+90J+wrIRHy3tL2amy8E49i0vpGZ7SP1izIwIaGJ1kYBdCCE9pyrej7ImhJE2LnRlb46AcWhBOGFcxF6IPa0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a0MLaCaO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a0MLaCaO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761705858; x=1793241858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ojwqy5xebFI9lU1TIe9ZG72rgaWWf3+rrKX5XVnWJbo=;
  b=a0MLaCaOdWxUBtwpGfwLgpxlhY4qKDnjtTLR+Fe6T4/XjOyv4YW+OFoB
   a77zD8vY4DotcxV0JUpmhFTTLD8Wc+jM81MXGQgLTOLktKomQpAY8WdVJ
   i05exdKT4VvY8+ciWls9ThpaJQoxk2XuSotrk39l9in7jQvXuGlxTF/Yt
   49s4h2F/5cFmGdf82tnnZuN8ynXhvc+9ZddY6aYhDMqin/fmro56j9Bk/
   n1/fsMA+yul1XwdnXzvnijrODRWY5HFuhurd55OcJxIuSZbB3RN3bv/l+
   izRPckMED+xQSneJQNrDeMuS83+zJQ94EQtRPCDeFQiwS/A0tDcA0+Y1w
   g==;
X-CSE-ConnectionGUID: NXutMit9TjiKMvSa7XeFdA==
X-CSE-MsgGUID: rxgNeCjKTdStw1agdw0P7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74417281"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="74417281"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 19:44:17 -0700
X-CSE-ConnectionGUID: R3UXx9LRQja2bxTSouc4iQ==
X-CSE-MsgGUID: xiFTM96FTxSsrhCKAneBGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="184714024"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2025 19:44:17 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDwAY-000K4L-0S;
	Wed, 29 Oct 2025 02:44:14 +0000
Date: Wed, 29 Oct 2025 10:43:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3058/3058]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:458:13:
 error: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202510291008.soJ2OPQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab8573e771fc00691b546bfb1b7432ed6b19f9bc
commit: 69181c3c9413ccaa4dab458057d13efda520cb60 [3058/3058] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-001-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291008.soJ2OPQm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291008.soJ2OPQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291008.soJ2OPQm-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c: In function 'nbl_userdev_set_eventfd':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:458:15: error: implicit declaration of function 'eventfd_ctx_fileget'; did you mean 'eventfd_ctx_fdget'? [-Wimplicit-function-declaration]
     458 |         ctx = eventfd_ctx_fileget(eventfd.file);
         |               ^~~~~~~~~~~~~~~~~~~
         |               eventfd_ctx_fdget
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:458:13: error: assignment to 'struct eventfd_ctx *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     458 |         ctx = eventfd_ctx_fileget(eventfd.file);
         |             ^
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c: In function 'nbl_userdev_get_bar_size':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:475:21: warning: variable 'hw_addr' set but not used [-Wunused-but-set-variable]
     475 |         u8 __iomem *hw_addr;
         |                     ^~~~~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c: In function 'nbl_userdev_dma_map_ioctl':
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c:676:30: warning: variable 'vfn' set but not used [-Wunused-but-set-variable]
     676 |         unsigned long vaddr, vfn;
         |                              ^~~


vim +458 drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev_user.c

bad535d287c9c1 Bennie Yan 2024-09-24  436  
bad535d287c9c1 Bennie Yan 2024-09-24  437  static long nbl_userdev_set_eventfd(struct nbl_adapter *adapter, unsigned long arg)
bad535d287c9c1 Bennie Yan 2024-09-24  438  {
bad535d287c9c1 Bennie Yan 2024-09-24  439  	struct nbl_dev_mgt *dev_mgt = (struct nbl_dev_mgt *)NBL_ADAPTER_TO_DEV_MGT(adapter);
bad535d287c9c1 Bennie Yan 2024-09-24  440  	struct nbl_dev_user *user = NBL_DEV_MGT_TO_USER_DEV(dev_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  441  	struct nbl_channel_ops *chan_ops = NBL_DEV_MGT_TO_CHAN_OPS(dev_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  442  	struct eventfd_ctx *ctx;
bad535d287c9c1 Bennie Yan 2024-09-24  443  	struct fd eventfd;
bad535d287c9c1 Bennie Yan 2024-09-24  444  	int fd;
bad535d287c9c1 Bennie Yan 2024-09-24  445  	long ret = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  446  
bad535d287c9c1 Bennie Yan 2024-09-24  447  	if (get_user(fd, (unsigned long __user *)arg)) {
bad535d287c9c1 Bennie Yan 2024-09-24  448  		dev_err(NBL_ADAPTER_TO_DEV(adapter), "get user fd failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  449  		return -EFAULT;
bad535d287c9c1 Bennie Yan 2024-09-24  450  	}
bad535d287c9c1 Bennie Yan 2024-09-24  451  
bad535d287c9c1 Bennie Yan 2024-09-24  452  	eventfd = fdget(fd);
bad535d287c9c1 Bennie Yan 2024-09-24  453  	if (!eventfd.file) {
bad535d287c9c1 Bennie Yan 2024-09-24  454  		dev_err(NBL_ADAPTER_TO_DEV(adapter), "get eventfd failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  455  		return -EBADF;
bad535d287c9c1 Bennie Yan 2024-09-24  456  	}
bad535d287c9c1 Bennie Yan 2024-09-24  457  
bad535d287c9c1 Bennie Yan 2024-09-24 @458  	ctx = eventfd_ctx_fileget(eventfd.file);
bad535d287c9c1 Bennie Yan 2024-09-24  459  	if (IS_ERR(ctx)) {
bad535d287c9c1 Bennie Yan 2024-09-24  460  		ret = PTR_ERR(ctx);
bad535d287c9c1 Bennie Yan 2024-09-24  461  		dev_err(NBL_ADAPTER_TO_DEV(adapter), "get eventfd ctx failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  462  		return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  463  	}
bad535d287c9c1 Bennie Yan 2024-09-24  464  
bad535d287c9c1 Bennie Yan 2024-09-24  465  	chan_ops->set_listener_info(NBL_DEV_MGT_TO_CHAN_PRIV(dev_mgt), user->shm_msg_ring, ctx);
bad535d287c9c1 Bennie Yan 2024-09-24  466  
bad535d287c9c1 Bennie Yan 2024-09-24  467  	return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  468  }
bad535d287c9c1 Bennie Yan 2024-09-24  469  

:::::: The code at line 458 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
