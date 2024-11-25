Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289DA1552FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 20:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732567875; cv=none; b=Xcgc39dWUwevvCgxDlqYJHCleBb/yHm/mYNuyTprbA0hFMlU/FwRemfSB2JTI2tVAPNiiHug3IhMj1IXwm6CaVwbpN+r+BtjWXWVp5sptH6stfqLB8pbK1tDTRyGxv760uJ76g0c1N3UXDlIox0/56Jp4hRoE9Ep33DzrfdgkVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732567875; c=relaxed/simple;
	bh=h0rqbaX1Ko2jw7Omwq2x9yW+RM1RkU2qjJS4tdIW8TM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z8kr3M4nMumrvfVxwN8eLWO4okKAcjOwpIz1vJGATGwazYqJAlvubHAioOGOEchw6t5QOu239vtmj3WnRD5Wy1wI3O8m7jPADtFjHMPTL6gl46uG+hWp/Rhrmp0W8UHe+hhNPtIM370UqOruxPjHLda1YHOP4sevOGE2+K9vr6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSndCF9C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSndCF9C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732567873; x=1764103873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h0rqbaX1Ko2jw7Omwq2x9yW+RM1RkU2qjJS4tdIW8TM=;
  b=PSndCF9CpfynsmUTQ+UCEVzKz7rj8gPWNgSg/EJDaacnPocQl51W9gI4
   0JkdPOi9c2DpOIuLK3pqVcRbSs+X2IWg7FRkbzz90njFrRHxIyhPYgZKR
   n6g5edP1zhzrT21qsuOBy8PZmPh38tahQFob9qZY+UZUGgGxbDwocIovq
   ajt1ACZu/zOmUfGTBI9XYUshZ6BJ+nedVKf/hjufiVfWWHvoF2KHXQ/n9
   DtHX6YuLwEXFqO08+mp84XqX1y41MX50J3WT9g7nInDoX8hDt7VUA2pkC
   +AB5lm9wohocF/zy7JD4zzQZb2z3KBTUbpkv5w/UPWNx2QGK/yjSo6Xk4
   g==;
X-CSE-ConnectionGUID: R3QzuL/DQ963B8M2Msdy7g==
X-CSE-MsgGUID: c/mlT5V3SG+B8Sf7W18RqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43358148"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="43358148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 12:51:12 -0800
X-CSE-ConnectionGUID: aTIm00xoTWuDalRREjFx5w==
X-CSE-MsgGUID: kwfMwOZ7Rryn5sB84SkOIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="122245975"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2024 12:51:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFg33-0006mz-1C;
	Mon, 25 Nov 2024 20:51:09 +0000
Date: Tue, 26 Nov 2024 04:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:uaccess-hardening-2 3/6] arch/x86/coco/sev/core.o:
 warning: objtool: .altinstr_replacement+0x9: redundant UACCESS disable
Message-ID: <202411260425.Mc3OULe9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git uaccess-hardening-2
head:   94875b72da986f998cdcfc2eec3350132ed81749
commit: fff0d25ed7089778000a28cf9a7014a77351f7d0 [3/6] x86/sev: Remove off-label __get_user() usage
config: x86_64-randconfig-103-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260425.Mc3OULe9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260425.Mc3OULe9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260425.Mc3OULe9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/coco/sev/core.c:17:
   In file included from include/linux/set_memory.h:9:
   In file included from arch/x86/include/asm/set_memory.h:5:
   In file included from include/linux/mm.h:2225:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> arch/x86/coco/sev/core.o: warning: objtool: .altinstr_replacement+0x9: redundant UACCESS disable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
