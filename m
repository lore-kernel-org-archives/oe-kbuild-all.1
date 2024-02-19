Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47610EAE8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 04:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708315307; cv=none; b=ql1kQIKy3PHv1Pjsa9nQJmNq2tsMcR0WrD+e5Xej+sS8HEt5V43V8X1cy4ewzk5Wq/uXwaMbpFletissqDv75kuZ9/CuYaq/Cuy8vau3LAZKGrPtIUHJnjf3UA3i95OGSwX3qIk86rNHp4IZNDCsaScosofw6EYVIyzMnZSQ9Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708315307; c=relaxed/simple;
	bh=qn9alZWjSiBKYRwKEghmXMy1+jBtL1No/omGxQ//o1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3SwPQzitDhi4IPjrRwZ8RWF2BQkmzAkCOeRMQnzkfq5qPdz/fBWuCczUK1w7hjOu5qIMhktmEu0nAq4tNba5TSdLFVBGQEEZtBJq5VlLUpauk9DPifQiuWEkrNrhUTYi+TpciDP/3qGORyjROLsFDSUbQKJ1wemqwo/WG6AqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HacaZ0On; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HacaZ0On"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708315305; x=1739851305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qn9alZWjSiBKYRwKEghmXMy1+jBtL1No/omGxQ//o1o=;
  b=HacaZ0OncUCl5R5Bn6wr6MXThKWaEr77cPR9BLYL/We2ZX+Gie6rWZPt
   HBpSy6s5fe6CyZyTOrDxuPUo5gyXJ/K67lGVXUsWph6nfndVNl4X6KDJP
   TqQK6kIjovtEfT4xazYfNOzOBIe6KsvP+95k0Y/kPctYRrUbx7KG5yGa2
   Hyja8rKy1Wbux5uX0ICLI4usQ8JY/NuklthS7ONUzuZO/DHikTw+myULg
   P0HlBvKDDn1am6vga5ZspuSuPJPxaQVFpGPY+j2p5j/bNnifHS7LDDXUb
   icOjNKTxlnENExFvb2Muu79xL0O6jYArPoI46xoaiDJmBjfi7+sCspbKB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2243879"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2243879"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 20:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4765927"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Feb 2024 20:01:43 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbuqa-0003VS-0b;
	Mon, 19 Feb 2024 04:01:40 +0000
Date: Mon, 19 Feb 2024 12:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 19/62] kernel/sched/fair_eevdf.c:663:6:
 sparse: sparse: symbol 'update_entity_lag' was not declared. Should it be
 static?
Message-ID: <202402191129.E3FZEMxS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   81ba8c6abf5aa0bcc26dac46b109f519060b5fe5
commit: a115e5d67e8707fd4f6ac76edf1fb6c719dbc72f [19/62] BACKPORT: sched/fair: Add lag based placement
config: x86_64-randconfig-123-20240218 (https://download.01.org/0day-ci/archive/20240219/202402191129.E3FZEMxS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402191129.E3FZEMxS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402191129.E3FZEMxS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair_eevdf.c:663:6: sparse: sparse: symbol 'update_entity_lag' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:995:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:995:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:995:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:1031:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair_eevdf.c:1031:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair_eevdf.c:1031:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair_eevdf.c:11621:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11621:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11621:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:5969:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:5969:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:5969:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:6229:1: sparse: sparse: symbol '__pcpu_scope_load_balance_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:6230:1: sparse: sparse: symbol '__pcpu_scope_select_idle_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:7285:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7285:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:7285:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7466:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7466:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair_eevdf.c:7466:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7656:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:7656:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:7656:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:7954:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:7954:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:7954:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:9005:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair_eevdf.c:9005:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair_eevdf.c:9005:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair_eevdf.c:9547:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair_eevdf.c:9547:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair_eevdf.c:9547:22: sparse:    struct task_struct *
   kernel/sched/fair_eevdf.c:10910:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10910:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:10910:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:10568:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10568:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair_eevdf.c:10568:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:11006:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11006:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11006:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:5898:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair_eevdf.c: note: in included file:
   kernel/sched/sched.h:2067:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2067:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2067:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2232:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2232:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2232:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2067:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2067:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2067:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2067:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2067:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2067:25: sparse:    struct task_struct *

vim +/update_entity_lag +663 kernel/sched/fair_eevdf.c

   659	
   660	/*
   661	 * lag_i = S - s_i = w_i * (V - v_i)
   662	 */
 > 663	void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
   664	{
   665		SCHED_WARN_ON(!se->on_rq);
   666		se->vlag = avg_vruntime(cfs_rq) - se->vruntime;
   667	}
   668	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
