Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7C92F8EBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786900216; cv=none; b=LGofgw8p7fbBeLpugt9cTROzk7Z5OX1S28UYRZ7x5GIsT4/T1cMZjw5dH8wKJ1Yzig+ktmsQ29DhU/Bolz4a7wen/pdqsPO6FcdI9ZNFT5Kfx2cBFRNO3IGcDezsCs80nAa6Kwy3MTYUJWXYabvzgw7mzHUN0ZZeObGycyCqVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786900216; c=relaxed/simple;
	bh=+Hbl9WlcnPW03JDPtaaNmQdPfyOxq1rB1bCb6xh3f9w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CKcIJfxuAEG6HKX31Nk8TlYb6pWcxWtxQqYjsOlI7Q7RDl23bh+zdp+sH/+CZl/XUgtrxbLR7lE//93j7Rj6bLg0/3DDmxj9Qaft+CDNbLqJ8HY7S+xJoC6zOFcV3/Cf+S/hkqf6nGTzZ2CN9PFe8jAlUrNAdN8PTUnagm6aGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhwIhe42; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhwIhe42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786900214; x=1818436214;
  h=date:from:to:cc:subject:message-id;
  bh=+Hbl9WlcnPW03JDPtaaNmQdPfyOxq1rB1bCb6xh3f9w=;
  b=hhwIhe42U/tWqgnjJOmqr/FYx3MZRk+d6+q+ujYq5z0uYe8n8XfmRGJm
   8YIbHwsLJu41Z7gxRrhGrvdPJmF1RlWtwEv/StKxgV0jAoTjSRgy7YBvy
   r/gG7ndZUREBEgKGh0S5uDkHTeYr82eKRZSppG3DyGShdG16qL7MVuJIe
   7JEoecN38C3jCX08eO6WZtpBh4JlG1Rxm7KUQluNofpCzOtjiN98pz3Iw
   Tui4axrdgO720WhyPVh0YBU5p01kfklkCKiuufwjYEeiwW7eF3GFOEeyo
   NqC8JE4vr0AcBoVb9ffYLolrbYFiQ133Cwggw9B0h+T3jNu3XY6ZBz+rZ
   Q==;
X-CSE-ConnectionGUID: LyXPVDSoRUqtyShyUFxJZg==
X-CSE-MsgGUID: SQEqDbz1SMSqyrc15n1OWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="97735251"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="97735251"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 10:10:14 -0700
X-CSE-ConnectionGUID: r02waxLcTuqEJ4mcrcOWRw==
X-CSE-MsgGUID: mNH4gwISSZKGCELSdgHSTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="268197142"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Aug 2026 10:10:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wveN7-00000000d1C-3IRK;
	Sun, 16 Aug 2026 17:10:09 +0000
Date: Mon, 17 Aug 2026 01:09:30 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v5-premap-iova 13/14]
 drivers/nvme/host/ioctl.c:136:14: error: call to undeclared function
 'io_uring_cmd_kbuf_priv'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608170020.N3auIDXR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5-premap-iova
head:   912328a605c4767433d483436a2d592d06063095
commit: 77b944e2c92e23c377117a624ac22fa2d37fe877 [13/14] nvme: issue premapped commands past the dma_opt clamp
config: hexagon-randconfig-r113-20260816 (https://download.01.org/0day-ci/archive/20260817/202608170020.N3auIDXR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170020.N3auIDXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170020.N3auIDXR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvme/host/ioctl.c:136:14: error: call to undeclared function 'io_uring_cmd_kbuf_priv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     136 |         kbuf_priv = io_uring_cmd_kbuf_priv(ioucmd, issue_flags);
         |                     ^
>> drivers/nvme/host/ioctl.c:136:12: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     136 |         kbuf_priv = io_uring_cmd_kbuf_priv(ioucmd, issue_flags);
         |                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/io_uring_cmd_kbuf_priv +136 drivers/nvme/host/ioctl.c

   125	
   126	static void nvme_setup_premapped(struct request *req, struct nvme_ns *ns,
   127					 struct io_uring_cmd *ioucmd,
   128					 unsigned int issue_flags)
   129	{
   130	#ifdef CONFIG_BLK_IOBUF_POOL
   131		struct blk_dma_premap *premap;
   132		void *kbuf_priv;
   133	
   134		if (!ioucmd)
   135			return;
 > 136		kbuf_priv = io_uring_cmd_kbuf_priv(ioucmd, issue_flags);
   137		if (!kbuf_priv)
   138			return;
   139		premap = blk_iobuf_fixed_buf_premap(kbuf_priv, ns->ctrl->dev);
   140		if (!premap)
   141			return;
   142		/*
   143		 * The buffer is persistently mapped to our DMA device. Record the
   144		 * retained mapping BEFORE the buffer is mapped into the request, so
   145		 * blk_rq_map_user_bvec sizes the gate on max_hw_premapped_sectors rather
   146		 * than the 128K dma_opt clamp; req->dma_premap on the request is the sole
   147		 * marker of a premapped request from here on.
   148		 */
   149		req->dma_premap = premap;
   150	#endif
   151	}
   152	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
