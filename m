Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD301A0BD0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 02:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780281857; cv=none; b=Ujd0ls5ZkrzzwB3GkoLzBE00/dfUlJSjqVwwBMDEyEP4G84vP7CABaMOuYoH7JsEG0/rK7K+zvj5FfYvH/uSSNeOufFysgCVu12jRHXJrfW0v7Y/mCq8FtRJlUasugo8enbrweLYkZdcf38Nmh7TSwBaum28apn5Am4+qm6o6JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780281857; c=relaxed/simple;
	bh=EMUHgVwY9nw8XT/Lof1fdSQPwrY4bBbSrS+LKzdUL0U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tFZbxyPAVzFzbXRceeAojJjwZMUgD1kyOsild96HCsmG7+Pm7pJRsBGagVYlNdadlmtWFz0g1GrSDRRUFEFXOMummEM2aRdpgJ/kDvXhgVWAS85UiKmWRs+UMgYXS2gczUhjvF6sF1SFPNP6tVAJqcoV1sZUqOXOMj+vNuzCK+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eix/bjyE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eix/bjyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780281856; x=1811817856;
  h=date:from:to:cc:subject:message-id;
  bh=EMUHgVwY9nw8XT/Lof1fdSQPwrY4bBbSrS+LKzdUL0U=;
  b=eix/bjyEbgk+cgN1CBEQ7YvDRBmpJjg7Jizdh6MfmSUnQHwYoYkea1gL
   89kHhPRjkWslDsCsf72Sb3NhaMjLrJ02GyIEbUupe9L3X5u4P7Pk6pZ1w
   O0F5zVw+zfBhUgMln3wrjQojp69NVNu/mn5VdXdhB1wfBkCu4MnWGnjnd
   PdCOXCfOXp3Hgq0/QquhoGn8gwoi4tOis/XagJUybRtUxomKu+p1ScaOq
   gP6WfOSMYkZHd/T7RLepqnmc26urHd+T01Fm+co+v10H8ii7x7UQK/n25
   8LnGqFpCzuOMk0XMa3gO0GLPESJOASEPBKaEkJAYsAUIzcnX/oOA+TosN
   Q==;
X-CSE-ConnectionGUID: tkA23LRsTqm+oXP/BhOfcA==
X-CSE-MsgGUID: PT4pOUwaT1OAQlaYJV82Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="92418433"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="92418433"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 19:44:15 -0700
X-CSE-ConnectionGUID: ie8OGUeyRkarXNE8GKiZjA==
X-CSE-MsgGUID: pSc+NwmCRzKAqdreKGf8yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; 
   d="scan'208";a="281560414"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 31 May 2026 19:44:13 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTsdP-000000009z4-0jUG;
	Mon, 01 Jun 2026 02:44:11 +0000
Date: Mon, 01 Jun 2026 10:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.all 15/15]
 include/linux/rcupdate.h:110:undefined reference to `xxh32'
Message-ID: <202606011009.f2CJLTNP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs.all
head:   5ac2d6d826f2c4d04480827eb799cb7a86c866d8
commit: 5ac2d6d826f2c4d04480827eb799cb7a86c866d8 [15/15] Merge branch 'vfs-7.2.xattr' into vfs.all
config: sh-sh2007_defconfig (https://download.01.org/0day-ci/archive/20260601/202606011009.f2CJLTNP-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011009.f2CJLTNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606011009.f2CJLTNP-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: fs/xattr.o: in function `simple_xattr_obj_hashfn':
   fs/xattr.c:1295:(.text+0x264): undefined reference to `xxh32'
   sh4-linux-ld: fs/xattr.o: in function `simple_xattr_hashfn':
   fs/xattr.c:1288:(.text+0x2e4): undefined reference to `xxh32'
   sh4-linux-ld: fs/xattr.o: in function `simple_xattr_get':
   fs/xattr.c:1354:(.text+0x27e4): undefined reference to `xxh32'
   sh4-linux-ld: fs/xattr.o: in function `__rcu_read_unlock':
>> include/linux/rcupdate.h:110:(.text+0x2a38): undefined reference to `xxh32'
   sh4-linux-ld: fs/xattr.o: in function `rht_bucket_insert':
   include/linux/rhashtable.h:298:(.text+0x3230): undefined reference to `xxh32'
   sh4-linux-ld: fs/xattr.o:fs/xattr.c:1693: more undefined references to `xxh32' follow


vim +110 include/linux/rcupdate.h

7b0b759b65247c Paul E. McKenney 2010-08-17  105  
7b0b759b65247c Paul E. McKenney 2010-08-17  106  static inline void __rcu_read_unlock(void)
7b0b759b65247c Paul E. McKenney 2010-08-17  107  {
925da92ba5cb0c Waiman Long      2021-08-26  108  	if (IS_ENABLED(CONFIG_RCU_STRICT_GRACE_PERIOD))
aa40c138cc8f36 Paul E. McKenney 2020-08-10  109  		rcu_read_unlock_strict();
fcf0e25ad4c8d1 Ankur Arora      2024-12-12 @110  	preempt_enable();
7b0b759b65247c Paul E. McKenney 2010-08-17  111  }
7b0b759b65247c Paul E. McKenney 2010-08-17  112  

:::::: The code at line 110 was first introduced by commit
:::::: fcf0e25ad4c8d14d2faab4d9a17040f31efce205 rcu: handle unstable rdp in rcu_read_unlock_strict()

:::::: TO: Ankur Arora <ankur.a.arora@oracle.com>
:::::: CC: Boqun Feng <boqun.feng@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
