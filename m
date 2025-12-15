Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02F42877E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 14:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765807748; cv=none; b=bMve4d7K/zrkUBDW4/fFsec3OWQe++j58G1+4L9+DnwsRsXSINS0L2BDNeMHWS9cLg9NhmoeN77Vn8TuWu9uEZVdBgnwIfv7WNB0kvyIt5YkbPtJ3NN7W2/cUt25pooLOtq4uJ8b+wMNN6GboBooFGrKyYok8TyA2Wdb4aodxNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765807748; c=relaxed/simple;
	bh=48601MX5ARS4nj4vcunKxJhH/jivQC5G3YnXKioxtH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mw48DhKSJrW7nI9876LvDvmMZfJlW6B1/vc7JyGNVqCWKnQ2k7jkXAZzoZuJC0FFphX5C3YEWxDD7e6fDX1YGeho8k6cuIUzg6TVV77HC2L/ETrihjDJ9mOZCo6c9p5W8+l2yLRbDDMnDVYhP/bHMonpboIv2JUZwRnMRalOugQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGAMozzy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGAMozzy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765807746; x=1797343746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=48601MX5ARS4nj4vcunKxJhH/jivQC5G3YnXKioxtH0=;
  b=bGAMozzyHo/4JCksEmeAqgUs8OupxY7Rm182OcWeukwIGoYsnQCgdQ++
   G2Va75wMngUfRaJkOoUBwni/Z3JTveaoMFldPw/8q7Uz7acF+N+N6HGgi
   JqxFoDPjN0i8glGSnx/cqjoGtBq4HVlA/lqnbo562daFJBjUOyPH7OkXo
   xaTMa8rmS1e5g4UowbkOqiYCask2uPwQGG5OqQRl8v48disCvkk+lzUav
   9NML5rENkUVBiJdex4rKMzGH2W6lIKGmNX43GxO/WvCZvMU6cn7+qg8lz
   dQ+8q4EicysC6y67tH2qyoC6bgG6TLLIqFjsn5DAjmP9s9QjMWcXmFJNG
   A==;
X-CSE-ConnectionGUID: rnWDhc3lTnWFD1lvSZ4JMQ==
X-CSE-MsgGUID: xpnEe+gmSoajvzqmjMgPPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66696369"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="66696369"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 06:09:06 -0800
X-CSE-ConnectionGUID: aAyRrrc2SL+LFIp//4H1YQ==
X-CSE-MsgGUID: iLsq2qgKRFSHpxxNePGv2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="228384974"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2025 06:09:05 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV9G2-000000000M9-1lB7;
	Mon, 15 Dec 2025 14:09:02 +0000
Date: Mon, 15 Dec 2025 22:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>, Dave Jiang <dave.jiang@intel.com>
Subject: drivers/dma/idxd/cdev.c:503:24: sparse: sparse: incorrect type in
 return expression (different base types)
Message-ID: <202512152206.bFVf1Xm9-lkp@intel.com>
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
config: x86_64-randconfig-r122-20251215 (https://download.01.org/0day-ci/archive/20251215/202512152206.bFVf1Xm9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512152206.bFVf1Xm9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512152206.bFVf1Xm9-lkp@intel.com/

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
