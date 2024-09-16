Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF181804E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 13:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726491963; cv=none; b=T/MydY9hqE+i40kqP/S+bURPCybHp+TShc+xL+xtqmz1GvDLBthSAuO0c/I04uvB56o1EMCNGcInwgm7C+/QQ0Y73CxVPAkVKcG9zrH2yUHlmebNmmOIhJcCVBv4m4mZ1XT9B1oIXyVphjhR952bWMvo+o2DVm9k4AoWpnJW6Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726491963; c=relaxed/simple;
	bh=iXF7zZ6+N9gMcfJEt7zbWTKG2Jnw0ugT8Ls55YrYItc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSvBi2nFIRimdPl0N4Gw0JXuXnGVYVTGuI7BPqZUTOelzD2XyRjk44ySsU69HzqVv2XHOVsQNT8Z5QyZgcNP1bgeRfgQ47bEOMgsfvYBRRJdRpdy+6VfFqxvoXFLbf+4Xu9WVDqU5pXiE3jurrEpyygoFL8isVThXtGEfZNavp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpxZ7t/o; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpxZ7t/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726491961; x=1758027961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iXF7zZ6+N9gMcfJEt7zbWTKG2Jnw0ugT8Ls55YrYItc=;
  b=DpxZ7t/o3AE3UEuoKmVpP0Meryz67RuY0RjvoV/Uayhvn3jsOQFobSKZ
   nMaKFghdn/qO3oE9MJqx6JNu0bUPstjvVQ/im9r7A3acUCt1dERPN2Ju5
   aGTDOsDbM0TnrHm6ZFJgzLEzy9uQXYY8MZIAJXfR/BF5WFfK7WpyoConj
   pfQ62jcgcvhRv/78W1X8lAmXdo3BefQD8Tk6Ao0MI+LRLx2Z0fWL/vLqI
   3O2cBBVo678hi4vdvNqvHoSM6qo6S6sCjo+XmoQylZEz/QvcMRM81GSj8
   lEclrOB9EVnEGHpXlAAVaQfqHxeo7HOX+84u6uAOlNGDNIRbeDZwrNEli
   g==;
X-CSE-ConnectionGUID: kHitE9TyTLym2GS34Gh2ww==
X-CSE-MsgGUID: SYA8yvA2QoKlFG3+ygfzgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25516102"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="25516102"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 06:06:00 -0700
X-CSE-ConnectionGUID: ujjkO6DKRP+pw502wPO3MQ==
X-CSE-MsgGUID: SHcuWplmTEG60xTgBAbYuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68967732"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2024 06:06:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqBQT-000A4A-2F;
	Mon, 16 Sep 2024 13:05:57 +0000
Date: Mon, 16 Sep 2024 21:05:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 16693/23714]
 arch/x86/kernel/unwind_orc.o: warning: objtool: missing symbol for section
 .text
Message-ID: <202409162123.h3UocbtQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: badd79c400ed404df871e1d035bed971d20ead4c [16693/23714] x86/unwind/orc: Remove boot-time ORC unwind tables sorting
config: x86_64-buildonly-randconfig-005-20240915 (https://download.01.org/0day-ci/archive/20240916/202409162123.h3UocbtQ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409162123.h3UocbtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409162123.h3UocbtQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/unwind_orc.c:179:13: warning: unused function 'orc_sort_swap' [-Wunused-function]
     179 | static void orc_sort_swap(void *_a, void *_b, int size)
         |             ^~~~~~~~~~~~~
   arch/x86/kernel/unwind_orc.c:199:12: warning: unused function 'orc_sort_cmp' [-Wunused-function]
     199 | static int orc_sort_cmp(const void *_a, const void *_b)
         |            ^~~~~~~~~~~~
   2 warnings generated.
>> arch/x86/kernel/unwind_orc.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
