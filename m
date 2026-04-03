Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA53737C110
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205604; cv=none; b=ISvYJG3ReFH+dVYEY807R5/wiR0xvqj9MwokrflnQS8sxqt3RVUdaPRODVlf0JCaSGTXAMWucGs50bSjT3RRVIvOtuDvvrnhid5SxAVDzA7IsDAB+JN6A0g8K1d/6l3rxXb3yZpPfc/EmA82HN6r3kl8aJWEjDMPDdsnOHn9Utc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205604; c=relaxed/simple;
	bh=LRoTLYwEw9TNpoVGHIgCZbMdQ0JPhPXfFEroNiALrX4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hFmtK+rupgk3JePOxVDsiV+GrbUdVsZMknmTUD4RFyv/H7NgUn5t1+KJSTz+Bf/ieIjawsRGKV9db4gUreQoC4Um3/aRtsEnjF8zmV9gbWzS2skYChuyiq3uiXHLf6udzq6F5Qq3l4SKpv1DRtuMSxEnJUS1nR5cPWu0hErcaz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EutysIuw; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EutysIuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205604; x=1806741604;
  h=date:from:to:cc:subject:message-id;
  bh=LRoTLYwEw9TNpoVGHIgCZbMdQ0JPhPXfFEroNiALrX4=;
  b=EutysIuwfSgjZ6PMqJWnTEDkpTGYvR7WI+vXSBiezXn1RAJ5aZnmy4fh
   ivARQDkWuQlpDCo0JMxuz0UE3P5Ev29VIUyiH+rMXFoAnB5pswx3CnA/R
   Jin0LrrSFinq75vTww6DDduoGlmL52kJRNiqP/xefiz1UpDTLeSgbQUZ6
   Z+kGO0rdDoxe7sQ4kF5waTZ4kmc+hNoQY7eC4sPxRvpuHUlYtOptn6HPK
   ne/VjKGDmzO783hjIjuHq0VtV6OtALg0xAeaUR57w/tFwzaX3FkqPd7bc
   Zldg4qscZTcn3RkI3Dry7U3ntlg9R2pFEVvmj/a85wgtdlvE2MQYtmXvA
   g==;
X-CSE-ConnectionGUID: Oco6r5+rTpSpbR+RL/bhHg==
X-CSE-MsgGUID: hX1pJFZ9T2iuPhJ55C56Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76153058"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76153058"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:39:59 -0700
X-CSE-ConnectionGUID: ChCPGHAwT7CiSO5CEbOfKA==
X-CSE-MsgGUID: tqgEdoNRQEWhpcvZ8Jzpcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="257678125"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Apr 2026 01:39:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a4H-0000000011h-4Adh;
	Fri, 03 Apr 2026 08:39:53 +0000
Date: Fri, 03 Apr 2026 16:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Leon Romanovsky <leon@kernel.org>
Subject: [linux-next:master 3198/10705]
 drivers/infiniband/core/uverbs_ioctl.c:82:16: sparse: sparse: incorrect type
 in return expression (different modifiers)
Message-ID: <202604021044.CPKVFH7t-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   36ece9697e89016181e5ae87510e40fb31d86f2b
commit: 715eccd4798ec72f38a3d5d2c8cc18d06021f016 [3198/10705] RDMA: Add ib_copy_validate_udata_in()
config: arc-randconfig-r133-20260402 (https://download.01.org/0day-ci/archive/20260402/202604021044.CPKVFH7t-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021044.CPKVFH7t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021044.CPKVFH7t-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/core/uverbs_ioctl.c:82:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected int ( * )( ... ) @@     got int ( [noderef] *__v )( ... ) @@
   drivers/infiniband/core/uverbs_ioctl.c:82:16: sparse:     expected int ( * )( ... )
   drivers/infiniband/core/uverbs_ioctl.c:82:16: sparse:     got int ( [noderef] *__v )( ... )
   drivers/infiniband/core/uverbs_ioctl.c:453:17: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *handler )( ... ) @@     got int ( [noderef] *__v )( ... ) @@
   drivers/infiniband/core/uverbs_ioctl.c:453:17: sparse:     expected int ( *handler )( ... )
   drivers/infiniband/core/uverbs_ioctl.c:453:17: sparse:     got int ( [noderef] *__v )( ... )
   drivers/infiniband/core/uverbs_ioctl.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/arc/include/asm/uaccess.h:592:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned char *d_char @@     got void [noderef] __user *to @@
   arch/arc/include/asm/uaccess.h:592:33: sparse:     expected unsigned char *d_char
   arch/arc/include/asm/uaccess.h:592:33: sparse:     got void [noderef] __user *to

vim +82 drivers/infiniband/core/uverbs_ioctl.c

    72	
    73	uverbs_api_ioctl_handler_fn uverbs_get_handler_fn(struct ib_udata *udata)
    74	{
    75		struct uverbs_attr_bundle *bundle =
    76			rdma_udata_to_uverbs_attr_bundle(udata);
    77		struct bundle_priv *pbundle =
    78			container_of(&bundle->hdr, struct bundle_priv, bundle);
    79	
    80		lockdep_assert_held(&bundle->ufile->device->disassociate_srcu);
    81	
  > 82		return srcu_dereference(pbundle->method_elm->handler,
    83					&bundle->ufile->device->disassociate_srcu);
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
