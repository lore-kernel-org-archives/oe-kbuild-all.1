Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E5C7D411
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 15:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708702984; cv=none; b=q0v1dw6jHyBQt6H5ZIdAiQpc+HKgOdxw96P5Ud1r5boIwEap6RcVMVmdDvN02F8UyIMjzYV12+LTOcZSFUHSKhl0EVMFXfZT8D1UXk+7Ae7/fsaQYIPJUnnySxSRwad1yswgdBHylfMD0Up6AnkyURmd6K8Njy+j1uUvp4gWdRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708702984; c=relaxed/simple;
	bh=gTIUKCEdlv1F17sbTnApSs4DwNA3+jJZKawEr8NHnek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AwAIB7zTdn5CIW+TGd8cZbaAUsmZUjsNz8ZCFrNTf5gK7/sGPwG0rTzunlXIy4jPBy7YwDUgmD1rcZ2VC/KY3HHaSy8HcMpr1kiPudvo4o5zB5Chvoq5ZmPFIewHZs/zgOqQrHq2Wx+7pSojCcrhRYTsjaThm6eZP+/637Rvh/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjzUX0Hj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjzUX0Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708702982; x=1740238982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gTIUKCEdlv1F17sbTnApSs4DwNA3+jJZKawEr8NHnek=;
  b=TjzUX0HjWSml4FOWVahp5S78eawM61o/G0vkKn74rI8No3qFHw9yQyeU
   rJIHY6xyPfniOwJrMFMqhDGQLOAf5vcw3NzX+5MUvpCaYiLXkQ95qv5Da
   bWIljDxEcsiBtVC1rU3FS8aUwVcyPXLa935y4o1YM6cTbB789CI9V+5a3
   tAaycEq6mAVxuTp2W3HJdWZ07BDyFKnn5I7/CdwqbyokgfODIitIu+Uyy
   6HzVX+Liz5XgRZW+sB1vxDiIEZleeqlrRXLdoUH0XnYv12CGy95VXht8S
   KauMUQDfcU2EjK1l+wD0CsPRxJ0uhzs919PLTAPEmcICwRv6C5lw3uepq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20463267"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="20463267"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 07:43:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6351043"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 23 Feb 2024 07:43:01 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdXhR-0007ce-0w;
	Fri, 23 Feb 2024 15:42:57 +0000
Date: Fri, 23 Feb 2024 23:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 33/86] kernel/sched/fair_eevdf.c:28:5:
 sparse: sparse: symbol 'sysctl_sched_use_eevdf' was not declared. Should it
 be static?
Message-ID: <202402232349.78PT7YsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   51373b96695eae3e943e06a2b2169535a2af3ba4
commit: d110cb090ea029fee70c2a512f58306682bad476 [33/86] CHROMIUM: sched: Make EEVDF changes conditional
config: x86_64-randconfig-123-20240218 (https://download.01.org/0day-ci/archive/20240223/202402232349.78PT7YsU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402232349.78PT7YsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402232349.78PT7YsU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair_eevdf.c:28:5: sparse: sparse: symbol 'sysctl_sched_use_eevdf' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:708:6: sparse: sparse: symbol 'update_entity_lag' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:1268:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:1268:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:1268:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:1305:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair_eevdf.c:1305:34: sparse:     expected struct sched_entity *se
   kernel/sched/fair_eevdf.c:1305:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair_eevdf.c:11975:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11975:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11975:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:6309:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:6309:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:6309:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:6569:1: sparse: sparse: symbol '__pcpu_scope_load_balance_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:6570:1: sparse: sparse: symbol '__pcpu_scope_select_idle_mask' was not declared. Should it be static?
   kernel/sched/fair_eevdf.c:7625:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7625:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:7625:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7806:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:7806:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair_eevdf.c:7806:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:7996:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:7996:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:7996:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:8304:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair_eevdf.c:8304:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair_eevdf.c:8304:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair_eevdf.c:9359:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair_eevdf.c:9359:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair_eevdf.c:9359:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair_eevdf.c:9901:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair_eevdf.c:9901:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair_eevdf.c:9901:22: sparse:    struct task_struct *
   kernel/sched/fair_eevdf.c:11264:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11264:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11264:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:10922:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:10922:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair_eevdf.c:10922:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:11360:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair_eevdf.c:11360:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair_eevdf.c:11360:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair_eevdf.c:6235:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair_eevdf.c: note: in included file:
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2234:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2234:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2234:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2068:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2068:25: sparse:    struct task_struct *

vim +/sysctl_sched_use_eevdf +28 kernel/sched/fair_eevdf.c

    24	
    25	/*
    26	 * Use EEVDF scheduler
    27	 */
  > 28	int sysctl_sched_use_eevdf = 0;
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
