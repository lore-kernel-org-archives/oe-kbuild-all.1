Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD017DA9C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 10:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700253; cv=none; b=r4usJQ+fopfY6oplqJsoye/QBtUp0woP6eyUoqiY0H4RKU8WTXL814P+H3WFFOHmUygZJE++hnGBvUOzMpipUjgIrqGxDlkl2faVspipvSc/yTaLsNp3JcBbgoin/8IhMeVNdLNkCuf7c72FYDNd3tL/deubp4ng3JB/ehDtUsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700253; c=relaxed/simple;
	bh=N1zMVRXvaadFlCh3nIoK/28Nz8Y54IN87P6cLTE3h8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bSP8PAFWJO3hU4O23FCIuV6c47Muhdl67RwHQHByJ2qUc8GWqFFCcpEDospyqC17RlO7Oi4ozWbiCUItprQJE5gyjHN6PJKTLd5lwYLMu4HVBX22Al1YzY2MT7IGkwyDRAQC1MmV6wsP/rSrEe6j8vDulLtSMx1C5JK1SC1y97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKA48yau; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKA48yau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746700252; x=1778236252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N1zMVRXvaadFlCh3nIoK/28Nz8Y54IN87P6cLTE3h8I=;
  b=OKA48yau9QXjSkoJiAixLGnb2VlwvVbooQ8oQvOCHRAJHTiypcv6rVo9
   4L+Jc9PfbNLRadmOkzHB5LfQMz/v+tWzntnVexYEqDigt/FqzlV/rNXah
   eyT/KBwLv2I9NkHGNVAqAbwMjifnebz5XRgWGrqeu12N0R4RXCW6bPk1m
   uoVvr5XIY5aXwbMWVvRY15zGwBlTrpF6qlL57bnw0Urv2l39eN8ITxVHK
   hiqbLXMlPQu0Ml9tgAabqoU/QSTG+gVcUsuquvbQ/PKsOuQqHeqJ4ydZ8
   l/85iy29YFdC75BFeVooNOI4DLQSHrf4pWRXIWAwCPK3KIor+Loe6xx+F
   w==;
X-CSE-ConnectionGUID: 9jndQY+RSB228j1+sxr7mA==
X-CSE-MsgGUID: xMZEdqGpRLm0Vp7wHTPbvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59462998"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59462998"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:30:47 -0700
X-CSE-ConnectionGUID: MmiRyBtDRaqg2QM7amaS5Q==
X-CSE-MsgGUID: GKJMDaG8SOKsD2wQ2exZwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141466746"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 May 2025 03:30:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCyWZ-000As4-0O;
	Thu, 08 May 2025 10:30:43 +0000
Date: Thu, 8 May 2025 18:30:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Subject: [linux-next:master 5014/9308] drivers/dma/idxd/cdev.c:503:24:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <202505081851.rwD7jVxg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: 8dfa57aabff625bf445548257f7711ef294cd30e [5014/9308] dmaengine: idxd: Fix allowing write() from different address spaces
config: x86_64-randconfig-122-20250503 (https://download.01.org/0day-ci/archive/20250508/202505081851.rwD7jVxg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081851.rwD7jVxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081851.rwD7jVxg-lkp@intel.com/

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
