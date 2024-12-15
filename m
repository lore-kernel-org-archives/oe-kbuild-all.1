Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E4A14A604
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734263140; cv=none; b=idSOwtzVr6c2rKycLRuNj9EF6ejPTReenZyYMpfrZIAQyM/qtI9IpCPnbl++Mb4/QtrFCP7tfnBAOunGdDGrbhOmlYguoo0bropOyYNUOa/sWyECpQR38xAsoGwBHH9oa4tyW/NYIQ4FwL1jqvHXx60OvKN+JXlieChtt6Va6g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734263140; c=relaxed/simple;
	bh=8ui5cpiDXseD8lfCuwYM+hgMhiJl+MEGoo2iWLgWjek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIuiog7YouWgzYlCmUjRAVah6TFxZTcmyHSX0LqsbncqAyeWgF2b5AX1uCvmYBqzLYCxgx9ETgiPfLy1jOd0LpgI1ofA3JlbxQN/kOdkQZgHcVU3Tt/ds6tdFDm/mjPw9NPblXYZjyMRnTv5z50QXt5/FQr6a83OwMLod9egqyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CA4ygDNc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CA4ygDNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734263137; x=1765799137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ui5cpiDXseD8lfCuwYM+hgMhiJl+MEGoo2iWLgWjek=;
  b=CA4ygDNcQmOC2mJY78mwpJ4oxNBraMQTpsu51C80kbgzh8oJFqJshoDR
   4e+s8vrTnONmc/kyDzDLVd5SqlSlkQ5Btoe0XF1+JC+9AMvK+9I+xiXar
   AWhLNHHXKdCAoKnbHBhnDD1v6+ZO7wnfJKVuR/J1+b05wRNop35h+Dgtd
   aK50jg9mfcHQiF+H+V+ttlelj9HY4qablv7+QdridC9bypgy1v+R/SAVu
   J33pge2u/Gk0kSdanMdIQAIdK/8zsmHF9x1ToedbJPdnJ9MpppM53OqjT
   3t+FDhJTcSKQ4z44pd6y3Y1W/mcAIXgmkw4b4Z/tSEYUEeGRUL/Au8E7O
   g==;
X-CSE-ConnectionGUID: v0J5X7p7T3q/s3+xtbVEVQ==
X-CSE-MsgGUID: yhwyJZbWRDe7WPuYzApZxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38589947"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="38589947"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 03:45:34 -0800
X-CSE-ConnectionGUID: TWRAZw9dT2G9V+y9qSJLjQ==
X-CSE-MsgGUID: hHM9LyDfT7q04fzCD1wUng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="127766802"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Dec 2024 03:45:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMn3y-000Dao-0a;
	Sun, 15 Dec 2024 11:45:30 +0000
Date: Sun, 15 Dec 2024 19:44:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 7221/7241]
 kernel/sched/core.c:6916:37: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202412151940.1FAN9JlH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   39fc9c68b13a226d44263bb908cccf8783e34d6e
commit: 7236283bb8acfbee811da21affcbc56674999b02 [7221/7241] FROMLIST: sched: Add an initial sketch of the find_proxy_task() function
config: i386-randconfig-061-20241215 (https://download.01.org/0day-ci/archive/20241215/202412151940.1FAN9JlH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412151940.1FAN9JlH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412151940.1FAN9JlH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:5548:29: sparse:     got struct rq *
   kernel/sched/core.c:5746:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5746:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5746:25: sparse:     got struct rq *
   kernel/sched/core.c:5759:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5759:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5759:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6324:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6324:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6324:24: sparse:     got struct rq *
   kernel/sched/core.c:6348:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6348:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6348:24: sparse:     got struct rq *
   kernel/sched/core.c:6394:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6394:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6394:24: sparse:     got struct rq *
   kernel/sched/core.c:6428:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6428:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6428:32: sparse:    struct task_struct *
   kernel/sched/core.c:6447:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6447:26: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6447:26: sparse:     got struct rq *
   kernel/sched/core.c:6447:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6447:47: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6447:47: sparse:     got struct rq *
   kernel/sched/core.c:6459:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6459:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6459:23: sparse:    struct task_struct *
   kernel/sched/core.c:6467:46: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:6467:46: sparse:    struct task_struct *
   kernel/sched/core.c:6467:46: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6524:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6524:9: sparse:     got struct rq *
   kernel/sched/core.c:6524:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:6524:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:6524:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:6558:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6558:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6558:25: sparse:     got struct rq *
   kernel/sched/core.c:6573:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6573:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6573:22: sparse:     got struct rq *
   kernel/sched/core.c:6585:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6585:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6585:22: sparse:     got struct rq *
   kernel/sched/core.c:6597:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6597:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6597:25: sparse:     got struct rq *
   kernel/sched/core.c:6616:27: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6616:27: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6616:27: sparse:     got struct rq *
   kernel/sched/core.c:6640:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6640:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6640:22: sparse:     got struct rq *
   kernel/sched/core.c:6857:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6857:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6857:14: sparse:     got struct rq *
   kernel/sched/core.c:6858:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6858:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6858:14: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:6916:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6916:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6916:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7416:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7416:17: sparse:    struct task_struct *
   kernel/sched/core.c:7416:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7964:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7964:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7964:25: sparse:     got struct rq *
   kernel/sched/core.c:8122:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8122:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8122:9: sparse:     got struct rq *
   kernel/sched/core.c:8135:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8135:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8135:25: sparse:     got struct rq *
   kernel/sched/core.c:8144:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8144:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8144:13: sparse:     got struct rq *
   kernel/sched/core.c:8230:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8230:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8230:25: sparse:     got struct rq *
   kernel/sched/core.c:8251:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8251:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8251:25: sparse:     got struct rq *
   kernel/sched/core.c:8397:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8397:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8397:25: sparse:     got struct rq *
   kernel/sched/core.c:8435:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8435:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8435:25: sparse:     got struct rq *
   kernel/sched/core.c:8498:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8498:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8498:25: sparse:     got struct rq *
   kernel/sched/core.c:8570:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8570:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8570:25: sparse:     got struct rq *
   kernel/sched/core.c:8725:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8725:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8725:22: sparse:     got struct rq *
   kernel/sched/core.c:10322:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:10322:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:10322:25: sparse:     got struct rq *
   kernel/sched/core.c:10322:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10322:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10322:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   kernel/sched/core.c:409:9: sparse: sparse: context imbalance in 'sched_core_lock' - different lock contexts for basic block
   kernel/sched/core.c:419:17: sparse: sparse: context imbalance in 'sched_core_unlock' - unexpected unlock
   kernel/sched/core.c:627:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:653:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:677:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1407:30: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:1407:30: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:106:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:106:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:106:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:877:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2288:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2491:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct *
   kernel/sched/core.c:2170:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2170:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2170:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2514:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2514:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2491:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2491:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2491:9: sparse: sparse: incompatible types in comparison expression (different address spaces):

vim +6916 kernel/sched/core.c

  6801	
  6802	/*
  6803	 * __schedule() is the main scheduler function.
  6804	 *
  6805	 * The main means of driving the scheduler and thus entering this function are:
  6806	 *
  6807	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  6808	 *
  6809	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  6810	 *      paths. For example, see arch/x86/entry_64.S.
  6811	 *
  6812	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  6813	 *      interrupt handler sched_tick().
  6814	 *
  6815	 *   3. Wakeups don't really cause entry into schedule(). They add a
  6816	 *      task to the run-queue and that's it.
  6817	 *
  6818	 *      Now, if the new task added to the run-queue preempts the current
  6819	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  6820	 *      called on the nearest possible occasion:
  6821	 *
  6822	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  6823	 *
  6824	 *         - in syscall or exception context, at the next outmost
  6825	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  6826	 *           spin_unlock()!)
  6827	 *
  6828	 *         - in IRQ context, return from interrupt-handler to
  6829	 *           preemptible context
  6830	 *
  6831	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  6832	 *         then at the next:
  6833	 *
  6834	 *          - cond_resched() call
  6835	 *          - explicit schedule() call
  6836	 *          - return from syscall or exception to user-space
  6837	 *          - return from interrupt-handler to user-space
  6838	 *
  6839	 * WARNING: must be called with preemption disabled!
  6840	 */
  6841	static void __sched notrace __schedule(int sched_mode)
  6842	{
  6843		struct task_struct *prev, *next;
  6844		/*
  6845		 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
  6846		 * as a preemption by schedule_debug() and RCU.
  6847		 */
  6848		bool preempt = sched_mode > SM_NONE;
  6849		bool block = false;
  6850		unsigned long *switch_count;
  6851		unsigned long prev_state;
  6852		struct rq_flags rf;
  6853		struct rq *rq;
  6854		int cpu;
  6855	
  6856		cpu = smp_processor_id();
  6857		rq = cpu_rq(cpu);
  6858		prev = rq->curr;
  6859	
  6860		schedule_debug(prev, preempt);
  6861	
  6862		if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
  6863			hrtick_clear(rq);
  6864	
  6865		local_irq_disable();
  6866		rcu_note_context_switch(preempt);
  6867	
  6868		/*
  6869		 * Make sure that signal_pending_state()->signal_pending() below
  6870		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  6871		 * done by the caller to avoid the race with signal_wake_up():
  6872		 *
  6873		 * __set_current_state(@state)		signal_wake_up()
  6874		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  6875		 *					  wake_up_state(p, state)
  6876		 *   LOCK rq->lock			    LOCK p->pi_state
  6877		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  6878		 *     if (signal_pending_state())	    if (p->state & @state)
  6879		 *
  6880		 * Also, the membarrier system call requires a full memory barrier
  6881		 * after coming from user-space, before storing to rq->curr; this
  6882		 * barrier matches a full barrier in the proximity of the membarrier
  6883		 * system call exit.
  6884		 */
  6885		rq_lock(rq, &rf);
  6886		smp_mb__after_spinlock();
  6887	
  6888		/* Promote REQ to ACT */
  6889		rq->clock_update_flags <<= 1;
  6890		update_rq_clock(rq);
  6891		rq->clock_update_flags = RQCF_UPDATED;
  6892	
  6893		switch_count = &prev->nivcsw;
  6894	
  6895		/* Task state changes only considers SM_PREEMPT as preemption */
  6896		preempt = sched_mode == SM_PREEMPT;
  6897	
  6898		/*
  6899		 * We must load prev->state once (task_struct::state is volatile), such
  6900		 * that we form a control dependency vs deactivate_task() below.
  6901		 */
  6902		prev_state = READ_ONCE(prev->__state);
  6903		if (sched_mode == SM_IDLE) {
  6904			/* SCX must consult the BPF scheduler to tell if rq is empty */
  6905			if (!rq->nr_running && !scx_enabled()) {
  6906				next = prev;
  6907				goto picked;
  6908			}
  6909		} else if (!preempt && prev_state) {
  6910			block = try_to_block_task(rq, prev, prev_state,
  6911						  !task_is_blocked(prev));
  6912			switch_count = &prev->nvcsw;
  6913		}
  6914	
  6915	pick_again:
> 6916		next = pick_next_task(rq, rq->donor, &rf);
  6917		rq_set_donor(rq, next);
  6918		if (unlikely(task_is_blocked(next))) {
  6919			next = find_proxy_task(rq, next, &rf);
  6920			if (!next) {
  6921				/* zap the balance_callbacks before picking again */
  6922				zap_balance_callbacks(rq);
  6923				goto pick_again;
  6924			}
  6925		}
  6926	picked:
  6927		clear_tsk_need_resched(prev);
  6928		clear_preempt_need_resched();
  6929	#ifdef CONFIG_SCHED_DEBUG
  6930		rq->last_seen_need_resched_ns = 0;
  6931	#endif
  6932	
  6933		trace_android_rvh_schedule(prev, next, rq);
  6934		if (likely(prev != next)) {
  6935			rq->nr_switches++;
  6936			/*
  6937			 * RCU users of rcu_dereference(rq->curr) may not see
  6938			 * changes to task_struct made by pick_next_task().
  6939			 */
  6940			RCU_INIT_POINTER(rq->curr, next);
  6941			/*
  6942			 * The membarrier system call requires each architecture
  6943			 * to have a full memory barrier after updating
  6944			 * rq->curr, before returning to user-space.
  6945			 *
  6946			 * Here are the schemes providing that barrier on the
  6947			 * various architectures:
  6948			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  6949			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  6950			 *   on PowerPC and on RISC-V.
  6951			 * - finish_lock_switch() for weakly-ordered
  6952			 *   architectures where spin_unlock is a full barrier,
  6953			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  6954			 *   is a RELEASE barrier),
  6955			 *
  6956			 * The barrier matches a full barrier in the proximity of
  6957			 * the membarrier system call entry.
  6958			 *
  6959			 * On RISC-V, this barrier pairing is also needed for the
  6960			 * SYNC_CORE command when switching between processes, cf.
  6961			 * the inline comments in membarrier_arch_switch_mm().
  6962			 */
  6963			++*switch_count;
  6964	
  6965			migrate_disable_switch(rq, prev);
  6966			psi_account_irqtime(rq, prev, next);
  6967			psi_sched_switch(prev, next, block);
  6968	
  6969			trace_sched_switch(preempt, prev, next, prev_state);
  6970	
  6971			/* Also unlocks the rq: */
  6972			rq = context_switch(rq, prev, next, &rf);
  6973		} else {
  6974			rq_unpin_lock(rq, &rf);
  6975			__balance_callbacks(rq);
  6976			raw_spin_rq_unlock_irq(rq);
  6977		}
  6978	}
  6979	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
