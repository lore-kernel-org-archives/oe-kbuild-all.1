Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841851FA1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Dec 2023 01:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aL8wLXgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702775349; x=1734311349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=er8bGMu3R3WZxQ+N4JRvm6o3cppUaeRHmmRILoj3x5o=;
  b=aL8wLXgT0FGePsX2B6XetVq6P4Rnhu+bO1t1otUIrha690MvHa26SxT9
   bzUfmUeJ4t9ZI40xsb6Tx5LuPhPBNwP9XoD56D36BAQfFsKgjR9F0j277
   qBcpmmtPuVcRNnHvj+2LQG42pXSQJDrrb76+9IS6qBcGbGsj4g4rIIM5A
   OhCHqaJ96w9Ax/vLr6oxKbXgstsoNfLOTSwZgAqk6pk4RGEAKA7E0Nodg
   f7Im/sFPZVSi7g/hKsMROINfDgjztp6+CUBwoBrZrrM5yDa64OirMXhWO
   UIhhDaXwrCxUAlaPYogxudbN5MOT0v1bXwuE/MEUsEvKyCMSU2Z0P/8gK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="399227715"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="399227715"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 17:09:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16741059"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 16 Dec 2023 17:09:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEfeT-0002Qn-2C;
	Sun, 17 Dec 2023 01:09:05 +0000
Date: Sun, 17 Dec 2023 09:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8142/8213] riscv64-linux-ld: warning: orphan
 section `.bss..Lubsan_data632' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data632'
Message-ID: <202312170935.celubwTh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: 60a2548ff9535a27503e472b25b4ec015d0b1e59 [8142/8213] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: riscv-randconfig-002-20230923 (https://download.01.org/0day-ci/archive/20231217/202312170935.celubwTh-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170935.celubwTh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170935.celubwTh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> riscv64-linux-ld: warning: orphan section `.bss..Lubsan_data632' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data632'
>> riscv64-linux-ld: warning: orphan section `.bss..Lubsan_data654' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data654'
>> riscv64-linux-ld: warning: orphan section `.bss..Lubsan_data632' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data632'
>> riscv64-linux-ld: warning: orphan section `.bss..Lubsan_data654' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data654'
>> riscv64-linux-ld: warning: orphan section `.bss..Lubsan_data632' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data632'
>> riscv64-linux-ld: warning: orphan section `.bss..Lubsan_data654' from `kernel/sched/core.o' being placed in section `.bss..Lubsan_data654'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
