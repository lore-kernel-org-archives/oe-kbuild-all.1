Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CE049621
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 05:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720676711; cv=none; b=LLTO2c46i4usk8fkcBfvD03lf4llWsy3OTT4t96C9IaZ0T24mEce6QVvOu2SpmFi/ylJkwH7UY/bUobGP4MDau1GCvOv/yNRekceQg6pDJwdarNQ9VG+pupUYPrQg2zkNTiDKYNdh80U/+5BYFjwi5MavVwTbLTMk5iLOHcTM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720676711; c=relaxed/simple;
	bh=Fj7oPG2Qp+6lBXfLPlFtEkKpEZKGH8h+9/gebbb8GyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SubXXb4zRLdmD1GSPRFv/Lj6T6RydF2DO80Z4hjU4hhhYs3tL82XndaehQGeubpBO0nQOCPLSL6VmPnQzrOTxyKzSeX0xU+OS69BkGbS9VSvZhjKZwXIJZwccbOXG8aCneN7vrF8fSmYmwdGOfJ/dWA89dARMvGx/wUeEvJ2P1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TT2+TxTz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TT2+TxTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720676710; x=1752212710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fj7oPG2Qp+6lBXfLPlFtEkKpEZKGH8h+9/gebbb8GyQ=;
  b=TT2+TxTzsnrKdvxyynWq95ivlnvPkdckncFiehASqYwbx5r6jt+THfFH
   SKLyYObnKFiXjhtqcY0gWDCD4/fLEsox52t+hx907dV7cEqrS03aKh1Tb
   JfxAhS+L5U5GQgTrJKqESvsAzs3ri78X08ZUxcu+C36fd0+bdgR0+KUb3
   JEVaL+n1jwBBY7drk6z+eAL6qcP7dIWJwDCD0QJefKQCcI5ORGBoymibJ
   LLCh+wAZgyi+5UvTHSbz8NI4abbA/BTqUWGac9FLo6dUqdxaPSgmd5EOF
   5CX1BuWtdrMrF/WG8dx5Jv2wQJSgmpVSd2+nEPvzdADRVtVGwGZnImSpv
   A==;
X-CSE-ConnectionGUID: 158uOjXFTPytV1R4a5aejQ==
X-CSE-MsgGUID: LV7R+mbGSBu6qaQB8utsVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17650974"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="17650974"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 22:45:09 -0700
X-CSE-ConnectionGUID: 6ixg0qNiTg+pMjl68RFgpw==
X-CSE-MsgGUID: qBV2grHtQ3a485U429LEcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; 
   d="scan'208";a="79165630"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jul 2024 22:45:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRmc5-000Yq2-0p;
	Thu, 11 Jul 2024 05:45:05 +0000
Date: Thu, 11 Jul 2024 13:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/uprobes 11/12] kernel/events/uprobes.c:802:9:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202407111338.bsasLP3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/uprobes
head:   4cdb8dcc7af7337ef4bdafb08e0a9ba02e88553d
commit: ca41eb2a20b73d93c689062606b2a7d2e8262450 [11/12] perf/uprobe: Convert single-step and uretprobe to SRCU
config: x86_64-randconfig-r122-20240711 (https://download.01.org/0day-ci/archive/20240711/202407111338.bsasLP3X-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407111338.bsasLP3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407111338.bsasLP3X-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/uprobes.c:802:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/uprobes.c:802:9: sparse:    struct uprobe_consumer [noderef] __rcu *
   kernel/events/uprobes.c:802:9: sparse:    struct uprobe_consumer *
   kernel/events/uprobes.c:2038:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2040:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2372:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c:2374:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/events/uprobes.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h, ...):
   include/linux/rcupdate.h:812:25: sparse: sparse: context imbalance in '__replace_page' - unexpected unlock
   kernel/events/uprobes.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +802 kernel/events/uprobes.c

2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  797  
9a98e03cc145c9 kernel/events/uprobes.c Oleg Nesterov     2012-11-23  798  static void consumer_add(struct uprobe *uprobe, struct uprobe_consumer *uc)
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  799  {
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  800  	down_write(&uprobe->consumer_rwsem);
249b16c56810aa kernel/events/uprobes.c Peter Zijlstra    2024-07-05  801  	WRITE_ONCE(uc->next, uprobe->consumers);
249b16c56810aa kernel/events/uprobes.c Peter Zijlstra    2024-07-05 @802  	rcu_assign_pointer(uprobe->consumers, uc);
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  803  	up_write(&uprobe->consumer_rwsem);
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  804  }
2b144498350860 kernel/uprobes.c        Srikar Dronamraju 2012-02-09  805  

:::::: The code at line 802 was first introduced by commit
:::::: 249b16c56810aa4a7ff7c309367b48cdfbdb853f perf/uprobe: SRCU-ify uprobe->consumer list

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
