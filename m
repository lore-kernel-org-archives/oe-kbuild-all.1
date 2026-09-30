Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E059D395AD3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753998; cv=none; b=bp92KWSnwukJDmNCVCZjxcA0nrmN1mCPi5g+ZOv+mZXXrDugPG+On3g+85FC9s7SSMz5TeKVWfG3VpmbH7Jn8vAaOdseOWXiLE2Qd2YnCEBPntYQYQawR3zs7OHoAPqD4U69Qg2RoSLOnn6t/nT93X+2m7dXUMdZZSFaLZ8axe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753998; c=relaxed/simple;
	bh=cWJVweAAptKcleTreWRiHeL5VxYfvYMdukoGTUyaa0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uG6aFM3Md++zdF6iEQiU3V4MhuYqDyaKIsaf6jfsPJlzdAVTaCBGdmPfcATzX+LybGXRZhFEJVQ40Q6TP2X/1PZawU8G1ZwGKUaiWNL6Jj7RIR9AGwxRzp3JpZP6T6ueSxmcd1wfHxCtobPB+Q1tzNwCGb1bwp/wD3PjLopkQCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nksBoUIR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nksBoUIR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790753995; x=1822289995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cWJVweAAptKcleTreWRiHeL5VxYfvYMdukoGTUyaa0w=;
  b=nksBoUIRLVdLj6UP+4EmCW6wx/P95xatNpDC4gzbQ/gQfR88+tmLBTcN
   F/zhsfvy56rCwVpd/Nk+XZ7dyycN40zVQ/b5DfXej2iN2tUNy/hJXKZ3B
   2aJccjJRTQ4QckLa30WY06huZPs9CGOrKlScZ9a+MoDLM6gXAkAPYPPc/
   rmJZy1FJRSqsBi7iB0Jnvlv9ErL3p2B4kXyS+522utWStm7+NoyFqgpJ6
   SeWfHM8g4wF0SR24Of1n7zNFr+C3IXD6N+DpIsG0HVmeC7Q0lNC5cE4l2
   L8NJgR0t6oXxdGyf4sU17M0hmp5CuQD5v8A1zmoY7xGZKjaWgw/UoMfX8
   w==;
X-CSE-ConnectionGUID: SQQTTf9MQIu5yNIb2c35aw==
X-CSE-MsgGUID: bge5bLA8T9y2gPvHjdiSeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93971214"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="93971214"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 00:39:52 -0700
X-CSE-ConnectionGUID: LtcQl/KdSIaXA6pI4OqF5w==
X-CSE-MsgGUID: R0yGBi4bQkuM9gsN7zd7lw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Sep 2026 00:39:51 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBouq-000000001mZ-2kww;
	Wed, 30 Sep 2026 07:39:48 +0000
Date: Wed, 30 Sep 2026 09:39:38 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Andr=C3=A9?= Almeida" <andrealmeid@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: 
 ./arch/openrisc/include/generated/asm/syscall_table_32.h:475:16: error:
 'sys_get_robust_list2' undeclared here (not in a function); did you mean
 'sys_get_robust_list'?
Message-ID: <202609300907.VFVqZpaP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Skip-test_futex_robust_unlock-if-not-supported/20260925-145324
head:   0a151b703cae864a3bab66cc7fb5b8dc983658d3
commit: 0357f8d39498ca0c6500615515a07248f04e8201 futex: Wire up get_robust_list2 syscall
date:   5 days ago
config: openrisc-randconfig-r2100-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300907.VFVqZpaP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300907.VFVqZpaP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609300907.VFVqZpaP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ./arch/openrisc/include/generated/asm/syscall_table_32.h:474:16: error: 'sys_set_robust_list2' undeclared here (not in a function); did you mean 'sys_set_robust_list'?
     474 | __SYSCALL(473, sys_set_robust_list2)
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/openrisc/kernel/sys_call_table.c:19:37: note: in definition of macro '__SYSCALL'
      19 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                     ^~~~
>> ./arch/openrisc/include/generated/asm/syscall_table_32.h:475:16: error: 'sys_get_robust_list2' undeclared here (not in a function); did you mean 'sys_get_robust_list'?
     475 | __SYSCALL(474, sys_get_robust_list2)
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/openrisc/kernel/sys_call_table.c:19:37: note: in definition of macro '__SYSCALL'
      19 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                     ^~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
