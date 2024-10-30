Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E377F1E284E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284997; cv=none; b=aFI8f17zFGe5w/vq3fF9yh44rPqn8AG1BumhYEbghU1BnXTUsdk8mOHeFQKk2dXzDB0iAhG8jSehOyrx2EjOAf/gICcRQyFsz8AycL1pxVBE635NY2AL2azPcDPiAYyE/ULZ6VFfsZ16kGbBtt7aNFarmB0gBR6csRJcUTQdlE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284997; c=relaxed/simple;
	bh=4GutitBksJ7Gx3cHkhCynzOMYXwdlH1FzNqF6gE5mlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdOJjG4u4G0zv7Gvi3FK0qxYFfmaMSZ+6z4xhvnz/BhbvxmmI46eAFwa5wRWDdKISKNrmzxhSIZCIdolfIht5OIzr5CZn1g2ZTFt8S5hSovi9zLq5WXPXdfKpmhln572yGyOukRyE12TmsHbtmbSSdy2I/2AIiBNdeD0al+S98A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6RNGsea; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6RNGsea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730284995; x=1761820995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GutitBksJ7Gx3cHkhCynzOMYXwdlH1FzNqF6gE5mlk=;
  b=i6RNGsea2K+0yk40AgdHTpryv35kO0bebIsuH85sTq8XSyxIOda/Uje0
   bMdT/tDFW9KJNI6wcBpeKxbi/+DDvyaZsoDwiJDoHNuTxgwdbhkqSpeT0
   mqfsnUM9h2umu5Vi4/83i0pKofhCk6a5l9t7o/0POaOG1lpaIS7v9MBNh
   zb4C6K/4NRfkYCz46M+MZar09vqgpjoyQz3vBVPeuspaB50PEiBkbIiXh
   XIyMMm8yAhKah+iCiZ06hWIOc4LP/6uDmMmEQ5kmE6T2wQe3WUzUIZbOM
   cNKXBNVF5x8xBhmGTJjkal+mKoleVury6LLJupUMLI2O6TUCsOtZDCLjy
   w==;
X-CSE-ConnectionGUID: 7TG8u9iJQXGwMG4Xh9Zn5g==
X-CSE-MsgGUID: Jyuw4gGuREe5Hz+mGH2njQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47441525"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47441525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 03:43:13 -0700
X-CSE-ConnectionGUID: wqLeSfziTUS6gKk09d/koQ==
X-CSE-MsgGUID: izB80UQzQ8O9wQ5xlVgCtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; 
   d="scan'208";a="86831257"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2024 03:43:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t66AJ-000eky-23;
	Wed, 30 Oct 2024 10:43:03 +0000
Date: Wed, 30 Oct 2024 18:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 43/98] kernel/taskstats.c:689:10: sparse: sparse:
 Initializer entry defined twice
Message-ID: <202410301847.Rnxnrfg0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 4cbaa1e2bb00ef43d0b8b418d258bb00835d7cd8 [43/98] taskstats: expose taskstats to all netspace
config: x86_64-randconfig-123-20241029 (https://download.01.org/0day-ci/archive/20241030/202410301847.Rnxnrfg0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410301847.Rnxnrfg0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410301847.Rnxnrfg0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/taskstats.c:280:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/taskstats.c:280:9: sparse:     expected struct spinlock [usertype] *lock
   kernel/taskstats.c:280:9: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c:292:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/taskstats.c:292:36: sparse:     expected struct spinlock [usertype] *lock
   kernel/taskstats.c:292:36: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c:585:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/taskstats.c:585:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/taskstats.c:585:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c:596:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/taskstats.c:596:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/taskstats.c:596:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c: note: in included file (through include/linux/taskstats_kern.h):
   include/linux/sched/signal.h:761:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   include/linux/sched/signal.h:761:37: sparse:     expected struct spinlock [usertype] *lock
   include/linux/sched/signal.h:761:37: sparse:     got struct spinlock [noderef] __rcu *
   kernel/taskstats.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/taskstats_kern.h):
   include/linux/rcupdate.h:778:9: sparse: sparse: context imbalance in 'fill_stats_for_tgid' - different lock contexts for basic block
>> kernel/taskstats.c:689:10: sparse: sparse: Initializer entry defined twice
   kernel/taskstats.c:693:10: sparse:   also defined here

vim +689 kernel/taskstats.c

   684	
   685	static struct genl_family family __ro_after_init = {
   686		.name		= TASKSTATS_GENL_NAME,
   687		.version	= TASKSTATS_GENL_VERSION,
   688		.module		= THIS_MODULE,
 > 689		.netnsok	= true,
   690		.ops		= taskstats_ops,
   691		.n_ops		= ARRAY_SIZE(taskstats_ops),
   692		.resv_start_op	= CGROUPSTATS_CMD_GET + 1,
   693		.netnsok	= true,
   694	};
   695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
