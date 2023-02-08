Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3E36E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Feb 2023 05:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675832811; x=1707368811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0oxnSC6BEGtlSPgnqe04d7dDMDv32xVfm/G9DKfLhhg=;
  b=H0m4c8atuD8w/K9kbVihoSIFtlhn3bc7mdyftF3xs+GeNKeSp5OxPoRt
   UdMW/sgVMBzAX0gFiI54H4W84iTSDvXKBqWhupKcUuMxke01xsNCT0hBx
   FIStzgPQsPFSfbGlFzDiLmlvgOYadY5dAgG2LpouGMu1w1hQhHCSUHPSZ
   bXS+qzCqZg97NzkvkKgIqaGugSy0/LCpsEgHYBw5mMrnu24aOReZMwOH+
   Ph06E8H5ZaB2QAQd6OaBDSDXON4PaTtLU79mKCxdUQ3zZ5iTpgCuyyncR
   5mIW9vNTBYHQUcFvd/xKjqKZRW6ZmVyWeNhxOKL2/u8JlVhqMLl9e0oZ/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="329738401"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="329738401"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 21:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="669044158"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="669044158"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Feb 2023 21:06:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPcfS-0004D6-07;
	Wed, 08 Feb 2023 05:06:50 +0000
Date: Wed, 8 Feb 2023 13:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: Evan Green <evan@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/6] RISC-V: hwprobe: Add support for
 RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Message-ID: <202302081207.cbclf73A-lkp@intel.com>
References: <20230206201455.1790329-4-evan@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206201455.1790329-4-evan@rivosinc.com>

Hi Evan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes robh/for-next soc/for-next linus/master v6.2-rc7 next-20230207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230207-041746
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20230206201455.1790329-4-evan%40rivosinc.com
patch subject: [PATCH v2 3/6] RISC-V: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_IMA
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/e9c3c645558ed595a5ed9d2c9d1b718c75cadd90
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Evan-Green/RISC-V-Move-struct-riscv_cpuinfo-to-new-header/20230207-041746
        git checkout e9c3c645558ed595a5ed9d2c9d1b718c75cadd90
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> Documentation/riscv/hwprobe.rst:44: WARNING: Unexpected indentation.

vim +44 Documentation/riscv/hwprobe.rst

    31	
    32	* :RISCV_HWPROBE_KEY_MVENDORID:: Contains the value of :mvendorid:, as per the
    33	  ISA specifications.
    34	* :RISCV_HWPROBE_KEY_MARCHID:: Contains the value of :marchid:, as per the ISA
    35	  specifications.
    36	* :RISCV_HWPROBE_KEY_MIMPLID:: Contains the value of :mimplid:, as per the ISA
    37	  specifications.
    38	* :RISCV_HWPROBE_KEY_BASE_BEHAVIOR:: A bitmask containing the base user-visible
    39	  behavior that this kernel supports.  The following base user ABIs are defined:
    40	    * :RISCV_HWPROBE_BASE_BEHAVIOR_IMA:: Support for rv32ima or rv64ima, as
    41	      defined by version 2.2 of the user ISA and version 1.10 of the privileged
    42	      ISA, with the following known exceptions (more exceptions may be added,
    43	      but only if it can be demonstrated that the user ABI is not broken):
  > 44	        * The :fence.i: instruction cannot be directly executed by userspace

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
