Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B813BC18
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005488; cv=none; b=ZokEoTRSmxMCE6uR+rcpB1xk2awCcW7C2WC+mNouCIHOTA9LCmK8TDSKd8iwbZqVyAnxuP7NfehIaEM2qq3R4Ri/y94KEsY++toCPub8wI1XOkEpogbF86sj8o2DV7k4fmV0KvGl93pDgR6+Qusd25fjF7NJbQtSF5GRGEqArcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005488; c=relaxed/simple;
	bh=YoSkqaPH58C61r5zDM3zRRZxQIc8j4jZEcmCnXp/UrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mvgav7/khoYOQKZMsws6APDe6Ua0hET5kUulXqpRtWsTgvxq7vKesqLNqmdrol5uUyGq5nIY21Klfx+zTebGCGx2xC/FN3T6QF3jXpbtZIPY5JZ/axGVn89J2CsKjAUa5VT+ew9V3Gdo47jUcRFLSpVbT5va/wuDL9ZfhcLRvjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W6gkOfBJ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6gkOfBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720005487; x=1751541487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YoSkqaPH58C61r5zDM3zRRZxQIc8j4jZEcmCnXp/UrY=;
  b=W6gkOfBJT2FLc87I9cmp64IqobQkWwggtuMKgmfUlt6MXvFQXvuadd5H
   kDMGNygKfsLDnkNuvtWaGag1RRSk9rBelM62HCEe4Z+71SYQMR4ftmVce
   AA+w5K/RLoNvPxawshzxBjVCm7R2P0zF79i3gV84BXGHpP8aZxW/EPTaQ
   HXCFG4vW81Fo8qWPvwOynooXjWqT5DvkUsYzj+ERXB/mloufkuvia9YnO
   IQwIzTSQNx4xl1HNrLRlcZMw/4jSw1Qea+iAH7GI2tWjUeto5v2w2akic
   sxladc+g/fK0q8Ft+JWtMeV39NQqT8qGVheAf4lh+c2a7O6dGq7kMp7PJ
   w==;
X-CSE-ConnectionGUID: y8RZ/JZfTPO7o+pKM4wFDg==
X-CSE-MsgGUID: l8jmREifTg2P8/gkUjYEjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34677370"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="34677370"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 04:18:07 -0700
X-CSE-ConnectionGUID: 4XizYxM1RMSPPFWJwuwLfQ==
X-CSE-MsgGUID: KWgdriLyRV2B/B5MlL/Ehg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="51411817"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Jul 2024 04:18:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOxzv-000PeQ-1p;
	Wed, 03 Jul 2024 11:18:03 +0000
Date: Wed, 3 Jul 2024 19:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10381/10451] kernel/rcu/rcu.h:138:undefined
 reference to `csd_lock_is_stuck'
Message-ID: <202407031919.QUBn1G5D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: eb52b064da252ef2ecc1fd112ebd3f687f9affd5 [10381/10451] Merge branch 'non-rcu/next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
config: riscv-randconfig-r133-20240211 (https://download.01.org/0day-ci/archive/20240703/202407031919.QUBn1G5D-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031919.QUBn1G5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031919.QUBn1G5D-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/rcu/tree.o: in function `sync_rcu_exp_done':
   kernel/rcu/tree_exp.h:155:(.text+0xd0c): undefined reference to `csd_lock_is_stuck'
   riscv64-linux-ld: kernel/rcu/tree.o: in function `rcu_seq_current':
>> kernel/rcu/rcu.h:138:(.text+0x3222): undefined reference to `csd_lock_is_stuck'


vim +138 kernel/rcu/rcu.h

2e8c28c2dd96c6 Paul E. McKenney 2017-02-20  134  
8660b7d8a54522 Paul E. McKenney 2017-03-13  135  /* Return the current value the update side's sequence number, no ordering. */
8660b7d8a54522 Paul E. McKenney 2017-03-13  136  static inline unsigned long rcu_seq_current(unsigned long *sp)
8660b7d8a54522 Paul E. McKenney 2017-03-13  137  {
8660b7d8a54522 Paul E. McKenney 2017-03-13 @138  	return READ_ONCE(*sp);
8660b7d8a54522 Paul E. McKenney 2017-03-13  139  }
8660b7d8a54522 Paul E. McKenney 2017-03-13  140  

:::::: The code at line 138 was first introduced by commit
:::::: 8660b7d8a545227fd9ee80508aa82528ea9947d7 srcu: Use rcu_segcblist to track SRCU callbacks

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
