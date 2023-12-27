Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E821FBF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 02:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loHyKycu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703642769; x=1735178769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QuQdXNrGT1ktsvXSSBoRKkIY9TgMXDZw5+WH1C0U/PE=;
  b=loHyKycufxD9cwmrYbgl6yoKjIJz2p5NFmNzp4WYyfGWXS2MEjsm9cjg
   8AM0OBoZmgpVNYS+5tbfKyAhK/0D/Rw8lP1gLRFO+SwDno2iJYtmenaEE
   LoS14Ptc6HTNVGLl+1RaQj1kjEaim+rZHrPLIwXOOlyYBImlDZfMEa+eU
   oQPnWIAw7dFSqJ79tPG+I33Uo+7I9NuBJpTRriUVQ+z+5No83K+cjCl8C
   tAflsRL87JiN+4QnR2/vvBu4O24zNkzlOTnjGmcb20xaQVnQH45qdODhz
   fPocza0X060VbXUwaHNWANCIuTNrQSaWBdCxobK2nhh1OXEnHhcKYijSL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="3491750"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="3491750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 18:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="12581078"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Dec 2023 18:06:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIJJ6-000ExZ-2l;
	Wed, 27 Dec 2023 02:06:04 +0000
Date: Wed, 27 Dec 2023 10:05:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10230/10295] powerpc64-linux-ld: warning: orphan
 section `.bss..Lubsan_data566' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data566'
Message-ID: <202312270919.7NqnQb5p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   39676dfe52331dba909c617f213fdb21015c8d10
commit: 3f58d57768c5d9693d4bff8af20b14a08b02086c [10230/10295] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: powerpc64-randconfig-r014-20220225 (https://download.01.org/0day-ci/archive/20231227/202312270919.7NqnQb5p-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312270919.7NqnQb5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312270919.7NqnQb5p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data566' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data566'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data540' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data540'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data566' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data566'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data540' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data540'
>> powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data566' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data566'
   powerpc64-linux-ld: warning: orphan section `.bss..Lubsan_data540' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data540'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
