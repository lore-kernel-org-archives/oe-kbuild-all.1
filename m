Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793859517;
	b=n5+MSfOGg4l2ZrRklBCEBNN1FFWL4IiPr0mz4NOYvNPFXxS6mX3TrJIULAjxK1yjUi6v
	 2R+gkjU0x4GENfjfoHO9oy7Zok15wWmEai54pRkD25AAm8LTwY9PWDqDDc1rV8rYbuNVt
	 QyrEuvBIHK3oMf8O+IcXV60L0asJ7Yh4eVI/W762i5dDoeinSmBxS2LWy6YhTKoZezxRt
	 4eww4yoU1NBMzbsdR45OpzzfwHvPWsaCCwXDO+j29tixiO+E9nRY2iAT4oefQB9xfvLHT
	 5NM1nU6UP8tE4CpcI4GYbnNc53pvqhOnexZTj81oc/x+3vpLl7bWEJfHvp8Vn0+NbQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793859517;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eqmpt26AaEJ56XSEwZe3vcmb/eI+OXuaE6AH0M/qDG0=;
	b=5tfE7BV2FQB/pSYM9dOODbeCqy9gYrNSVNzhVrqvdWuTuPjY27u3E44n3oETp6nltEMg
	 1O1amutZlx8XoJLzkk7Cb9N53tO1BykSFVNi8ec47xA38W8oxA5rAGjAZIpeR7oIpDK4P
	 LdNQJDV89B8rIfhQYB6zytgShG323itRhUfB2LoV6XuhwvQJAWrfYQAK/+cDHrKx4qrIi
	 lOlLwXjd7VOB8yU7nj3ZwgqeTM+NAFC+QZSeBFmtjY6EYanOZWKhe9xHpsP5Org+wqc8H
	 TKPf3N3bkt6RCe432FKONYp5Oy7PGzshFTiZcVnUt2hyyO47OfZbWq/KfwHEUZ4/hjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hKAUhUAz;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06972606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 06:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06972606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hKAUhUAz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793859516; x=1825395516;
  h=date:from:to:cc:subject:message-id;
  bh=Ui0NksLwep37BBXDg9wkIh3vR9I0ziDIkGrINfhD4Ic=;
  b=hKAUhUAzMSUBlLe4FxyEspBd4JhUTD6+dn0XOr8EIegQX0uovBmKuJeV
   l3q3wTpSK0/MnRvpfoUf9Fc1alTYwjyVZneW5LVWxvAvi/Y+j+sY5AYtx
   PBpRjy6hclXZK3rn2jv1MpChEN8qQB3FBa/tSiouo8Xa8znTH81mLqR9r
   Sy8ALMtSvPSQX31yUvK/LNlR1mIfrOY2eRiVk7ANWuWYUrpt0I9PWVVnF
   LejMG2x2lcWfcuf7cFtCTb5juyzh2IE9oEvtNuoCSldeA5/eOswok5A7O
   R6B39i40I2ZkEyaKn53lB5GTCPEh/d6blGqFurCKvIOUl8Id75gCgbpEK
   g==;
X-CSE-ConnectionGUID: GYj0drmETWuexvmuMjQQaA==
X-CSE-MsgGUID: CJ/VOzTjT52PyNTOl25EZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2652649"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2652649"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 22:18:35 -0800
X-CSE-ConnectionGUID: AIT/gmk2Q2erKM3tVXBa4g==
X-CSE-MsgGUID: J+nJmGWtRZ2g41h1gyIrAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6945348"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2026 22:18:34 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOqnv-000000009Yx-2m0L;
	Thu, 05 Nov 2026 06:18:31 +0000
Date: Thu, 05 Nov 2026 07:17:53 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 303/303]
 kernel/sched/core.c:6995:5: sparse: sparse: symbol '_sched_cpu_deactivate'
 was not declared. Should it be static?
Message-ID: <202611050713.5JHTAtjF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   f012a641c30644ec5bf95cf64d8835854b997f86
commit: 683010f555d804c2b9b01d327767755fa78a3ce5 [303/303] ANDROID: cpu/hotplug: add pause/resume_cpus interface
config: i386-randconfig-2301-20261105 (https://download.01.org/0day-ci/archive/20261105/202611050713.5JHTAtjF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050713.5JHTAtjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050713.5JHTAtjF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:2469:17: sparse:     got struct rq *
   kernel/sched/core.c:2469:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2469:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:2469:17: sparse:     got struct rq *
   kernel/sched/core.c:2469:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:2469:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:2469:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:2542:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2542:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:2542:29: sparse:     got struct rq *
   kernel/sched/core.c:2596:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2596:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:2596:25: sparse:     got struct rq *
   kernel/sched/core.c:2628:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2628:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:2628:25: sparse:     got struct rq *
   kernel/sched/core.c:2644:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2644:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:2644:25: sparse:     got struct rq *
   kernel/sched/core.c:2654:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2654:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:2654:25: sparse:     got struct rq *
   kernel/sched/core.c:2666:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2666:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:2666:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2728:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2728:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:2728:25: sparse:     got struct rq *
   kernel/sched/core.c:3005:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3005:37: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3005:37: sparse:     got struct rq *
   kernel/sched/core.c:3057:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3057:21: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3057:21: sparse:     got struct rq *
   kernel/sched/core.c:3627:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3627:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3627:25: sparse:     got struct rq *
   kernel/sched/core.c:3843:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3843:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3843:24: sparse:     got struct rq *
   kernel/sched/core.c:3863:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3863:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3863:16: sparse:     got struct rq *
   kernel/sched/core.c:3873:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3873:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3873:24: sparse:     got struct rq *
   kernel/sched/core.c:3887:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3887:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3887:29: sparse:     got struct rq *
   kernel/sched/core.c:4034:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4034:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4034:25: sparse:     got struct rq *
   kernel/sched/core.c:4035:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4035:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:4035:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4470:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4470:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4470:14: sparse:     got struct rq *
   kernel/sched/core.c:4471:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4471:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:4471:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4935:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:4935:17: sparse:    struct task_struct *
   kernel/sched/core.c:4935:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:5135:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5135:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5135:25: sparse:     got struct rq *
   kernel/sched/core.c:5137:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:5137:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:5137:22: sparse:    struct task_struct *
   kernel/sched/core.c:5177:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5177:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5177:16: sparse:     got struct rq *
   kernel/sched/core.c:5999:37: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5999:37: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5999:37: sparse:     got struct rq *
   kernel/sched/core.c:6261:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6261:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6261:14: sparse:     got struct rq *
   kernel/sched/core.c:6264:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6264:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6264:16: sparse:     got struct rq *
   kernel/sched/core.c:6275:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6275:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6275:13: sparse:     got struct rq *
   kernel/sched/core.c:6573:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6573:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6573:25: sparse:     got struct rq *
   kernel/sched/core.c:6668:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6668:47: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6668:47: sparse:     got struct rq *
   kernel/sched/core.c:6736:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6736:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6736:9: sparse:     got struct rq *
   kernel/sched/core.c:6840:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6840:21: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6840:21: sparse:     got struct rq *
   kernel/sched/core.c:6941:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6941:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6941:25: sparse:     got struct rq *
>> kernel/sched/core.c:6995:5: sparse: sparse: symbol '_sched_cpu_deactivate' was not declared. Should it be static?
   kernel/sched/core.c:7063:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7063:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7063:25: sparse:     got struct rq *
   kernel/sched/core.c:7079:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7079:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7079:25: sparse:     got struct rq *
   kernel/sched/core.c:7241:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7241:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7241:22: sparse:     got struct rq *
   kernel/sched/core.c:8577:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8577:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8577:25: sparse:     got struct rq *
   kernel/sched/core.c:8577:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:8577:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:8577:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:85:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:85:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:85:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1700:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1701:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:1702:37: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1704:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1849:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1855:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1855:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1855:9: sparse:    struct task_struct *
   kernel/sched/core.c:1675:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:1675:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:1675:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:1704:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1849:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1849:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1704:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1849:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1855:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1855:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1855:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1704:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1849:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1855:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1855:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1855:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1704:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1704:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1849:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1849:9: sparse:    struct task_struct *
   kernel/sched/sched.h:1855:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1855:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1855:9: sparse:    struct task_struct *

vim +/_sched_cpu_deactivate +6995 kernel/sched/core.c

  6994	
> 6995	int _sched_cpu_deactivate(unsigned int cpu)
  6996	{
  6997		int ret;
  6998	
  6999		set_cpu_active(cpu, false);
  7000	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
