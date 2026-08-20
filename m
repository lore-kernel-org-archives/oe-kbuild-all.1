Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDFE38757A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Aug 2026 04:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787201943; cv=none; b=SE6YujTw5UKZWsiuP+oI6ViNX4uHSw1YFR4SlvN89vYwjtw5kU4fSYVKwu+/BkJmZi/ive0wqfrA0Bfu+Thn+bkaMhGR5Pd5xxpZgpr4Hm3fMd8crQdEilu2Ia2Rlwb7PU3iYDM73cm+Z+IebJ/U6YHpzR6A47VC0/cRRSj8dVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787201943; c=relaxed/simple;
	bh=VLCo0tvkMrTiHkazAxrk3Xgo+Y2IxEa+zzIHRDUc7XM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KMQPgtk89Yn5oK/Oudim762a3+JuAmHko16n6x372X2Fxuk4WWiA5ombEZRFcuL6dg/m/py+ouv/O9js8qCUhSzvUY1G3t/QVUoanOXBT7iZCUFKyv9cZ3RcHta5KSF3w8EjMYaifcDAXwZfrlG25sSubwZOhwN2f/DFZGq/qyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e5kDHJVi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e5kDHJVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787201941; x=1818737941;
  h=date:from:to:cc:subject:message-id;
  bh=VLCo0tvkMrTiHkazAxrk3Xgo+Y2IxEa+zzIHRDUc7XM=;
  b=e5kDHJViFZAVA1kaRh3QmpcVnj0GgtPPiBjm/6IFi5N9yHm/METkbA+V
   pMADONghNI9ManIRuFS7IcRRyj0ivZAxulOWKIJfTv/SgjJLNneElcAIY
   DNKW8OaXtSvAK5QqgYI9haxMrzVO4izwqGZLPoLVYUuZyENE0sv6ffC/i
   VDvKyw+biBboSjIcF4lhTKBL9G3gn9E6n8Bgu+YAhKI1izKe70+93Ko3F
   m8g8jd++MUQ+7d76jaYgorcLDBaxWx8nKqVzaq4rtRWdlhC7h8m5MSRMW
   7PeXrfOnOet9lt7ZO+/gn8EiqL2p0za03J4zL324JSGlsv6Ts6phWSb+P
   A==;
X-CSE-ConnectionGUID: ze4GSipiSQeSVAEd7ODjUg==
X-CSE-MsgGUID: tyBhkjOqTburR4nGaCQISA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87749216"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="87749216"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 21:59:00 -0700
X-CSE-ConnectionGUID: VhOTR55STQOJv8t/LR665g==
X-CSE-MsgGUID: 1WHlfrnTRHSR4sjZLRYHkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
   d="scan'208";a="270087655"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Aug 2026 21:58:59 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwurf-00000000hrd-3knj;
	Thu, 20 Aug 2026 04:58:55 +0000
Date: Thu, 20 Aug 2026 12:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/fair.c:2004:38: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202608201214.QpYw7L8N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
commit: 85570f10a4c61372c1d437365b9d8dbad512ec6f sched/eevdf: Move to a single runqueue
date:   7 weeks ago
config: microblaze-randconfig-r112-20260820 (https://download.01.org/0day-ci/archive/20260820/202608201214.QpYw7L8N-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260820/202608201214.QpYw7L8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608201214.QpYw7L8N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1335:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1335:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1335:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1945:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1945:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1945:33: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:2004:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:2004:38: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:2004:38: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:14433:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:14433:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:14433:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7744:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:7744:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:7744:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9440:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9440:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:9440:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9635:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9635:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:9635:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9809:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9809:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:9809:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9843:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9843:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:9843:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10045:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:10045:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:10045:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:11385:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11385:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:11385:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:12151:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:12151:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12151:22: sparse:    struct task_struct *
   kernel/sched/fair.c:13669:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13669:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13669:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13300:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13300:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:13300:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13805:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13805:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13805:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7644:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *

vim +2004 kernel/sched/fair.c

  2001	
  2002	static void update_curr_fair(struct rq *rq)
  2003	{
> 2004		struct sched_entity *se = &rq->donor->se;
  2005	
  2006		for_each_sched_entity(se)
  2007			update_curr(cfs_rq_of(se));
  2008	}
  2009	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
