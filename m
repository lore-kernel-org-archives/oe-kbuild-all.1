Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD1D101E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 19:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690227545; x=1721763545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkiK+g2frn4d6goYddndvFEYn0eSVIZrNs2SJ87y078=;
  b=VUZHvPCtFfb2dJMMXdtjN+7XtvaDuX/qi/rlVZ7eim0gF0Y/IuTh0Omq
   1Z42bO72t7Ye2lD6XqeZUp8W2xs1vnFRf9NbUm1JqBD5g+7Xe2dduFew3
   wIT0yBQigCM6acHTH+C4b/FV8bHxjD0VYQZnYVpMclapwKYACOv2wdnmv
   rOHghPia39r7bPXV4/LOQYlgoXXWRS0ZpdJumzztrdQjVycLJtRUdCLOg
   iZ+/iuHxorY6ikV9a8Ob349I5Tc6IrMfEuhvJCYngp2vw6SXvZEGLPxms
   YuHJK59gut6nBqreGoCc1FHR3fRvJBLfcJ8TZGj+gglxGzpNGznVKmx+0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="398445815"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="398445815"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 12:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="972389666"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="972389666"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 24 Jul 2023 12:39:01 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO1OV-0009zS-2V;
	Mon, 24 Jul 2023 19:39:00 +0000
Date: Tue, 25 Jul 2023 03:38:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Marek <jonathan@marek.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: debug_vm_pgtable.c:undefined reference to `pmd_set_huge'
Message-ID: <202307250345.iCCBHW1l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   20ea1e7d13c1b544fe67c4a8dc3943bb1ab33e6f
commit: d8a719059b9dc963aa190598778ac804ff3e6a87 Revert "mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge"
date:   2 years ago
config: powerpc-randconfig-r033-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250345.iCCBHW1l-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250345.iCCBHW1l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250345.iCCBHW1l-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: warning: certs/system_certificates.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: certs/system_certificates.o: missing .note.GNU-stack section implies executable stack
   powerpc-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   powerpc-linux-ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   powerpc-linux-ld: mm/debug_vm_pgtable.o: in function `pmd_huge_tests':
>> debug_vm_pgtable.c:(.init.text+0x194): undefined reference to `pmd_set_huge'
   powerpc-linux-ld: mm/debug_vm_pgtable.o: in function `pud_huge_tests':
>> debug_vm_pgtable.c:(.init.text+0x29c): undefined reference to `pud_set_huge'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
