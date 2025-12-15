Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80D62F6586
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 09:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765790240; cv=none; b=biE3WjhaeS1yNwUe3WpC7PSeTdZaORkGVePcD4J2dmYNiKQaEhnJhIyQnIzO2lnS6eN9tDJyyZ+GvR35AaZpzrpCR9+ujKDkM9ehctAyuvEMsqoyybEac4VIx6NuAuMUj3sn4oPFb2/hv0a3NpfsDYeST/dv3H4xmQHLP3Be+9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765790240; c=relaxed/simple;
	bh=2s4N4d+asIhG8Pjf7Z23x8bQbENHoAXNNrFaHlb0GDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PSvu0yXqNAW/jDNEdWLdVjBRWpRbXSUBz4NKwfWEoHdqI4vNrTXW+1XmxbK+imZhA7LyouSIlMEOjvXxsI8uv5Y82/UsrUKf0CsqzeuhbYbkHGzYZ7fpTYURFYpBCVMrM05rCtp1mMSRuHInQsi1VAHohQClXVwG2FsdCfoJ5EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ON5IrCek; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ON5IrCek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765790237; x=1797326237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2s4N4d+asIhG8Pjf7Z23x8bQbENHoAXNNrFaHlb0GDs=;
  b=ON5IrCektRuGmofoFFGz56uqLER81XXE/HEEyrqKXNzxtgvpsv783ihe
   UFpAsXkuvLpSdDzxw39hLSciHv4CAPvt2P1lNWBvMvJYl6EQu6Mq+yqj+
   xqrBWarRGZLqVUToWvJ44xYadQp3tzUTIspEeVXSNEDW7NM3/4SiajTIk
   rZ1A1sSpCEpb20oYXEHh4eSMvRNRyiulolVXmaTsWTv8yQLtguTbrf1EY
   aJUn6Vv/irxoewN5EWadiseQA2wzSBS7Llq1RLswXbgkm1qlmkLIwNiLZ
   LVJkwzefh4EtffjfFhMhfdEaZtOylXwPMB2oVJtjRCo29F2r8sVwc/ZHD
   Q==;
X-CSE-ConnectionGUID: 2v5zYeEQQPOTaI/LNkPZwg==
X-CSE-MsgGUID: y6dLUd8KTdqk+tgbqoyDXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67757277"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="67757277"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 01:17:17 -0800
X-CSE-ConnectionGUID: yxCs8phpQvWcJoVY7ptG+A==
X-CSE-MsgGUID: vxmSsTGETa6VcFB8o2zKsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="198189118"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Dec 2025 01:17:15 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV4hd-0000000008V-3ZSa;
	Mon, 15 Dec 2025 09:17:13 +0000
Date: Mon, 15 Dec 2025 17:17:00 +0800
From: kernel test robot <lkp@intel.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Dave Jiang <dave.jiang@intel.com>
Subject: drivers/dma/idxd/cdev.c:503:24: sparse: sparse: incorrect type in
 return expression (different base types)
Message-ID: <202512151753.eExr3PMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 8dfa57aabff625bf445548257f7711ef294cd30e dmaengine: idxd: Fix allowing write() from different address spaces
date:   8 months ago
config: x86_64-randconfig-r122-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151753.eExr3PMz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151753.eExr3PMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151753.eExr3PMz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/idxd/cdev.c:503:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   drivers/dma/idxd/cdev.c:503:24: sparse:     expected restricted __poll_t
   drivers/dma/idxd/cdev.c:503:24: sparse:     got int

vim +503 drivers/dma/idxd/cdev.c

   493	
   494	static __poll_t idxd_cdev_poll(struct file *filp,
   495				       struct poll_table_struct *wait)
   496	{
   497		struct idxd_user_context *ctx = filp->private_data;
   498		struct idxd_wq *wq = ctx->wq;
   499		struct idxd_device *idxd = wq->idxd;
   500		__poll_t out = 0;
   501	
   502		if (current->mm != ctx->mm)
 > 503			return -EPERM;
   504	
   505		poll_wait(filp, &wq->err_queue, wait);
   506		spin_lock(&idxd->dev_lock);
   507		if (idxd->sw_err.valid)
   508			out = EPOLLIN | EPOLLRDNORM;
   509		spin_unlock(&idxd->dev_lock);
   510	
   511		return out;
   512	}
   513	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
