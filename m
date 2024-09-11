Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB38558B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 05:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726033957; cv=none; b=HtC7hOu4/5XqgFP4Xn/7WHVKHxJJqsNZj7mr9yb8Y3dpA2L10uoZwgGPhLirBVu1Am+Zg9+j/72I68j6RmPer1PyRQdFiOtZyS89yT3arlt4O4MUEgJtxoKkOZ3a9AdbmSI7QbTqripYkXbf7VPQZLVES9ufVYhhmJUAqm1qaQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726033957; c=relaxed/simple;
	bh=cilhEiRXCMtMsFiv7q+j3JwD8PGgG+Mbh2BlrflV6wA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=THCs6Uqed3Xu/GCaM5hxPwOVctxEmxXaHn1/fkT5ESn9UAKwpMhbdHBHxIjuSc3okGcHoRs8KRw+alNtYbvr8KwPBN/8neu7QHa0jVmLhPH5YVEukIfbY0jvVfPZ91nhf9bX5mGc9FaOG0T+riZ5S2kob1+iMxw5lfBvkIRUwTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XapdbVRI; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XapdbVRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726033955; x=1757569955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cilhEiRXCMtMsFiv7q+j3JwD8PGgG+Mbh2BlrflV6wA=;
  b=XapdbVRIEmWNYHAOHKnmS9bfypClSYd1Dt68xcAC7eqE3/JQ8dRbKDhJ
   ekNs4Tq+RA48ocqY78+2gtsOST4gG/9sfxI4fF6Mt5CBoJybYKxBbf7f3
   miOq2cbgOgZCweM0YODonQgAL1OSdj3qLNokFiyZ6kCmNlu/yt6j1nE+d
   WePYiY8jvH/HwbxWFoWTlsqAi3KbiAo3qcLgeX7DmHHaJFhDLu/B5LNBj
   gZhDBm1KDjAZAHG8groNALkD4QjAYVhE2Xa6Gt5WW3vCRiqgrZFa+VGpu
   ImQZU1T+KWQpvhmqrUOJkQFmp/J3u+NKRJrkqd+eTM6awNmJoKXGimN0L
   Q==;
X-CSE-ConnectionGUID: Iyu9KCdBSYOhkQDVWfm0VQ==
X-CSE-MsgGUID: tKlimkgpT6OKjnkNystj4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35483378"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="35483378"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 22:52:33 -0700
X-CSE-ConnectionGUID: 33fD/V8uRB6IVX8nMegiNg==
X-CSE-MsgGUID: xhEnOgnbRm2q65AM+/+SEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="66890796"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Sep 2024 22:52:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soGHG-00036W-0n;
	Wed, 11 Sep 2024 05:52:30 +0000
Date: Wed, 11 Sep 2024 13:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 4865/30000] arch/x86/lib/copy_highpages.c:10:1:
 sparse: sparse: symbol 'hugepage_nocache_copy' was not declared. Should it
 be static?
Message-ID: <202409111327.wMHIgHKQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   a6042799048d28282f37a2a254f2757cea2c780a
commit: 50d5bf1b6da9f74bf93f9dec601c09d45d6d8406 [4865/30000] x86: hugepage: use nt copy hugepage to AEP in x86
config: x86_64-randconfig-123-20240910 (https://download.01.org/0day-ci/archive/20240911/202409111327.wMHIgHKQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111327.wMHIgHKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111327.wMHIgHKQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/lib/copy_highpages.c:10:1: sparse: sparse: symbol 'hugepage_nocache_copy' was not declared. Should it be static?
>> arch/x86/lib/copy_highpages.c:33:47: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   arch/x86/lib/copy_highpages.c:33:47: sparse:     expected void *
   arch/x86/lib/copy_highpages.c:33:47: sparse:     got void [noderef] __user *buffer
>> arch/x86/lib/copy_highpages.c:20:5: sparse: sparse: symbol 'sysctl_hugepage_nocache_copy' was not declared. Should it be static?
>> arch/x86/lib/copy_highpages.c:47:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   arch/x86/lib/copy_highpages.c:47:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   arch/x86/lib/copy_highpages.c:47:35: sparse:     got int ( * )( ... )

vim +/hugepage_nocache_copy +10 arch/x86/lib/copy_highpages.c

     9	
  > 10	DEFINE_STATIC_KEY_FALSE(hugepage_nocache_copy);
    11	#ifdef CONFIG_SYSCTL
    12	static void set_hugepage_nocache_copy(bool enabled)
    13	{
    14		if (enabled)
    15			static_branch_enable(&hugepage_nocache_copy);
    16		else
    17			static_branch_disable(&hugepage_nocache_copy);
    18	}
    19	
  > 20	int sysctl_hugepage_nocache_copy(struct ctl_table *table, int write,
    21			void __user *buffer, size_t *lenp, loff_t *ppos)
    22	{
    23		struct ctl_table t;
    24		int err;
    25		int state;
    26	
    27		if (write && !capable(CAP_SYS_ADMIN))
    28			return -EPERM;
    29	
    30		state = static_branch_unlikely(&hugepage_nocache_copy);
    31		t = *table;
    32		t.data = &state;
  > 33		err = proc_dointvec_minmax(&t, write, buffer, lenp, ppos);
    34		if (err < 0)
    35			return err;
    36		if (write)
    37			set_hugepage_nocache_copy(state);
    38		return err;
    39	}
    40	
    41	static struct ctl_table copy_highpages_table[] = {
    42	        {
    43	                .procname       = "hugepage_nocache_copy",
    44	                .data           = NULL,
    45	                .maxlen         = sizeof(unsigned int),
    46	                .mode           = 0600,
  > 47	                .proc_handler   = sysctl_hugepage_nocache_copy,
    48	                .extra1         = SYSCTL_ZERO,
    49	                .extra2         = SYSCTL_ONE,
    50	        },
    51	        {}
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
