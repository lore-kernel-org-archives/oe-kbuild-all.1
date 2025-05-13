Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6562BD009
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146387; cv=none; b=YCUv8EW4LHyeEqcA8/nFs6hBwNz4PAICtetgaIDwpQmkaDmyyPH9BBjgdgeSv0j90FtPk9RFpc/o/6ujyQvlxPeaRrC0Pbhkb41Mfe6ayhR2NdK9MBeNj1QaFHg6btRa8ctDX8npHbYtXXYJOuwnyhYSEJrq2EsZEBH2aCn+tF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146387; c=relaxed/simple;
	bh=qr5qc77bXuw0coZia2rEEHwuyJue4Wp0ZDVQQls1KeM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMeVaDKxGWDWgu83JrnuFnL4J/bL8Uz84KtGqtFyi8LpA+X+WZCV0ZHYogMbiFa2qfLWdGXIZyntgY+HtMwIcOWrNDpPXdEMxy4jg1qx5L6bTpKCQCmY/1fkfNOPGRcFC1nlzvM0SIzlLQQktsVPgKH7wI6N5nJXVN8PHdMejug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxssyZk/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxssyZk/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747146384; x=1778682384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qr5qc77bXuw0coZia2rEEHwuyJue4Wp0ZDVQQls1KeM=;
  b=mxssyZk/8nPAQUosMn6hb+ebs+3FKMPDaj24T1J4wpXr4ozRiO3thdE2
   A2BMwOyKvMkf5g61bcm8tFpRdmz/0JIq/9gozwnHZNeXVyfj9QQq5EnYc
   /8bObSx+LlvhSu7agFg4TGC+iwJSMbzWqjN/6Oig3iflsZEU91ttw8Yh3
   7g8f+Yz+7TOBD5g19nEoISjkK7I2Vh4esO4+rYLDm4UomzDk+2SrBTWGl
   JMwTLP3hot83fx6DnwTMfauYb2tip9VkuKHnE9psCCxuiAssuUf6GeVrO
   Lcset4KldM4YkPk85bMxXgwuU5/Ye/S8s6ozIUfqbdW/F3jXkbCoC9Q4I
   A==;
X-CSE-ConnectionGUID: hyR45XPXRh+02FsqrvGiIA==
X-CSE-MsgGUID: WPuiL2mZSvCT+G2dAhYGMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59631867"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="59631867"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 07:26:23 -0700
X-CSE-ConnectionGUID: 4mJU43sKTDWj79CdbgLdeg==
X-CSE-MsgGUID: wEOL946OQWiDgGyooI10UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137644123"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2025 07:26:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEqaJ-000G7S-2C;
	Tue, 13 May 2025 14:26:19 +0000
Date: Tue, 13 May 2025 22:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2220/2220] kernel/sched/fair.c:7080:6: sparse:
 sparse: symbol 'free_affinity_domains' was not declared. Should it be
 static?
Message-ID: <202505132224.plUhY3K3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   196f295c5eeefa026912137e7fc120f3c8565d2e
commit: 1a553561230ab6bdc36f9e28e268c75b96dbe67e [2220/2220] sched: smart grid: init sched_grid_qos structure on QOS purpose
config: x86_64-randconfig-123-20250513 (https://download.01.org/0day-ci/archive/20250513/202505132224.plUhY3K3-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505132224.plUhY3K3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505132224.plUhY3K3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:151:14: sparse: sparse: symbol 'sysctl_overload_detect_period' was not declared. Should it be static?
   kernel/sched/fair.c:152:14: sparse: sparse: symbol 'sysctl_offline_wait_interval' was not declared. Should it be static?
   kernel/sched/fair.c:164:14: sparse: sparse: symbol 'sysctl_sched_prio_load_balance_enabled' was not declared. Should it be static?
   kernel/sched/fair.c:209:5: sparse: sparse: symbol 'sysctl_sched_util_low_pct' was not declared. Should it be static?
   kernel/sched/fair.c:1310:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1310:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1310:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13907:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13907:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13907:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6071:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6071:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6071:22: sparse:    struct task_struct *
>> kernel/sched/fair.c:7080:6: sparse: sparse: symbol 'free_affinity_domains' was not declared. Should it be static?
   kernel/sched/fair.c:7132:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7132:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7132:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7146:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7146:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7146:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7275:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7275:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:7275:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8658:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8658:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8658:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9010:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9010:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:9010:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9122:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9122:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9122:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9468:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9468:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9468:22: sparse:    struct task_struct *
   kernel/sched/fair.c:9553:1: sparse: sparse: symbol 'qos_smt_expell_switch' was not declared. Should it be static?
   kernel/sched/fair.c:9687:51: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sibling_p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9687:51: sparse:     expected struct task_struct *sibling_p
   kernel/sched/fair.c:9687:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9692:30: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9692:30: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9692:30: sparse:    struct task_struct *
   kernel/sched/fair.c:9770:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:10019:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:11107:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11744:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:11744:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:11744:22: sparse:    struct task_struct *
   kernel/sched/fair.c:13185:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13185:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13185:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12842:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12842:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12842:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13281:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13281:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13281:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2408:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2408:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2244:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2244:25: sparse:    struct task_struct *

vim +/free_affinity_domains +7080 kernel/sched/fair.c

6eb07f9925a906 Hui Tang 2024-01-17  7079  
6eb07f9925a906 Hui Tang 2024-01-17 @7080  void free_affinity_domains(struct affinity_domain *ad)
6eb07f9925a906 Hui Tang 2024-01-17  7081  {
6eb07f9925a906 Hui Tang 2024-01-17  7082  	int i;
6eb07f9925a906 Hui Tang 2024-01-17  7083  
6eb07f9925a906 Hui Tang 2024-01-17  7084  	for (i = 0; i < AD_LEVEL_MAX; i++) {
6eb07f9925a906 Hui Tang 2024-01-17  7085  		kfree(ad->domains[i]);
6eb07f9925a906 Hui Tang 2024-01-17  7086  		kfree(ad->domains_orig[i]);
6eb07f9925a906 Hui Tang 2024-01-17  7087  		ad->domains[i] = NULL;
6eb07f9925a906 Hui Tang 2024-01-17  7088  		ad->domains_orig[i] = NULL;
6eb07f9925a906 Hui Tang 2024-01-17  7089  	}
6eb07f9925a906 Hui Tang 2024-01-17  7090  	ad->dcount = 0;
6eb07f9925a906 Hui Tang 2024-01-17  7091  }
6eb07f9925a906 Hui Tang 2024-01-17  7092  

:::::: The code at line 7080 was first introduced by commit
:::::: 6eb07f9925a906d81f328c808ba25f7800888dce sched: Introduce smart grid scheduling strategy for cfs

:::::: TO: Hui Tang <tanghui20@huawei.com>
:::::: CC: yanhaitao <yanhaitao2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
