Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8BA1A7AE3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Oct 2025 06:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761890528; cv=none; b=DIaAG6fKW2Qdh8TOHBjwDQbhacdbc4RVZGDQZf/1NkfMTWLAH1d3y4PiTf2XlaLwAlCD9kt6nyOnsSI437oX/nhjyri0Rwdceu60LcTdV4wwv/8unrmMMTUmEI9I/DovWY8DKNp+jvr8FWXJdaUMgai+mlXMlqjPxViiiXLWP8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761890528; c=relaxed/simple;
	bh=iSHeV3txV5h5g9kcUHVs9NduB+Zf75KnRGIZP20Njo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pcKMkUd+YTh8QlJWYjelM/6crrllI/TkRA33UOz2Z3WB3eZkZt1lDO5AIxOrsRIUP1k+3ChFhIHHpaycEvN5igxZc/iqGVN8HIVgJr8Tl96DR3hGdMIo9nPuaQ2sWe844l2049e+vDjm+jWiB+V+Iw5FVowygAsjyiaIjRucwgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+Aoh3W1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+Aoh3W1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761890526; x=1793426526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iSHeV3txV5h5g9kcUHVs9NduB+Zf75KnRGIZP20Njo8=;
  b=e+Aoh3W170j8m4cfaQ4u4ES2zQHVZczAyX+qGvXvnIjYLcKHsE1qgaVF
   mPWcgnw7x0p8EgTUTnuSi0hjXnOKdOcGm6r11O4+sBhPrN6XR8TDp4u5L
   0DlkyUkpHPY8HQXMSSTySGk5nnCTxLYZv8kPFHCkenY7xUlzcb3NYQwV6
   V8aNOnxoMlT6DKMZvwMfU72dJU4bQPY4N+8pujG21nyRnpgiaZZTLajqx
   BXJTpO2mEqhRWmDUXU+7R87RWPLdZI+9PpAM5z0h5TGBgfybdD8Dj66Z+
   LxCZjITeqHUCZR1XM/qOCaFCf5Mjl2dwRFflV+7F2XtAUUw9kq3EOUP5W
   w==;
X-CSE-ConnectionGUID: 9OrkMmKsSGqRMCVFm9DNRA==
X-CSE-MsgGUID: eTyujEkuSvWp3fFpL+/xgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63064958"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="63064958"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 23:02:05 -0700
X-CSE-ConnectionGUID: ZeTlzzcxT8G77zqsFu/sow==
X-CSE-MsgGUID: tm/p2v84TeeA97slBeyHkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="191296454"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2025 23:02:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEiCX-000MoM-2W;
	Fri, 31 Oct 2025 06:01:35 +0000
Date: Fri, 31 Oct 2025 14:00:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:namespace-6.19 13/73] kernel/nstree.c:7:28: sparse:
 sparse: symbol 'ns_tree_lock' was not declared. Should it be static?
Message-ID: <202510311331.IAWNYwBY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git namespace-6.19
head:   232affb34bfb5be4df33a3e7bc92154e38f74535
commit: 6696d17cfe2b00c43717aecab6f461e1a68c7b28 [13/73] nstree: introduce a unified tree
config: nios2-randconfig-r113-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311331.IAWNYwBY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311331.IAWNYwBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510311331.IAWNYwBY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/nstree.c:7:28: sparse: sparse: symbol 'ns_tree_lock' was not declared. Should it be static?
   kernel/nstree.c: note: in included file (through include/linux/ns_common.h, include/linux/nstree.h):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +/ns_tree_lock +7 kernel/nstree.c

     6	
   > 7	__cacheline_aligned_in_smp DEFINE_SEQLOCK(ns_tree_lock);
     8	static struct rb_root ns_unified_tree = RB_ROOT; /* protected by ns_tree_lock */
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
