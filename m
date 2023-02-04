Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBEA7F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Feb 2023 08:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675500415; x=1707036415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ElwpE2Ns3G4h8dKC8AbPXBkpHj+fzMoP2wlVyRGXtKg=;
  b=WPyPON+j2swtPm2rw2hVUXrLiCtMkhwe04UWRIev1pHwcxcCtVevrU/s
   39UiUljiWVEL4Lg6jjeUJqYuhMq73rDf9PCRwZ9pxOMb8mVG88+NiIPeG
   Y5glV/kQpn7mivB49Yus4aFF/f54Ar0aOy4A7UqMCVgdtDAmaSdAjsoeo
   7HPCaUztR5i5dDvF/pJTHBD9Tf1jjuRwSAasPMUBc3J/uIf6LL9Zy0Wk6
   vHuRf3SFIhKxTjaC/tAaf8R70rOQYmbVlHB/OB6/BemWsx9aep0RdYppm
   DU7wJ0Qo8gIxF4/0wEAwFtXcwOZPHo/pF+KeubUojLP2efEIl9aua+Sdj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309263980"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="309263980"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 00:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="754731786"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="754731786"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2023 00:46:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOEBx-0001Ar-1a;
	Sat, 04 Feb 2023 08:46:37 +0000
Date: Sat, 4 Feb 2023 16:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>
Subject: [kees:for-next/kspp 19/19] lib/ubsan.c:27:13: warning: no previous
 prototype for 'report_ubsan_failure'
Message-ID: <202302041600.oGDByVG5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
head:   eeea3ad2aae00767549e2e5c50ad5f2dcfb353cd
commit: eeea3ad2aae00767549e2e5c50ad5f2dcfb353cd [19/19] arm64: Support Clang UBSAN trap codes for better reporting
config: s390-randconfig-r044-20230204 (https://download.01.org/0day-ci/archive/20230204/202302041600.oGDByVG5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=eeea3ad2aae00767549e2e5c50ad5f2dcfb353cd
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
        git fetch --no-tags kees for-next/kspp
        git checkout eeea3ad2aae00767549e2e5c50ad5f2dcfb353cd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/ubsan.c:27:13: warning: no previous prototype for 'report_ubsan_failure' [-Wmissing-prototypes]
      27 | const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/report_ubsan_failure +27 lib/ubsan.c

    20	
    21	#ifdef CONFIG_UBSAN_TRAP
    22	/*
    23	 * Only include matches for UBSAN checks that are actually compiled in.
    24	 * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
    25	 * SanitizerHandler (the traps) in Clang is in clang/lib/CodeGen/.
    26	 */
  > 27	const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
    28	{
    29		switch (check_type) {
    30	#ifdef CONFIG_UBSAN_BOUNDS
    31		/*
    32		 * SanitizerKind::ArrayBounds and SanitizerKind::LocalBounds
    33		 * emit SanitizerHandler::OutOfBounds.
    34		 */
    35		case ubsan_out_of_bounds:
    36			return "UBSAN: array index out of bounds";
    37	#endif
    38	#ifdef CONFIG_UBSAN_SHIFT
    39		/*
    40		 * SanitizerKind::ShiftBase and SanitizerKind::ShiftExponent
    41		 * emit SanitizerHandler::ShiftOutOfBounds.
    42		 */
    43		case ubsan_shift_out_of_bounds:
    44			return "UBSAN: shift out of bounds";
    45	#endif
    46	#ifdef CONFIG_UBSAN_DIV_ZERO
    47		/*
    48		 * SanitizerKind::IntegerDivideByZero emits
    49		 * SanitizerHandler::DivremOverflow.
    50		 */
    51		case ubsan_divrem_overflow:
    52			return "UBSAN: divide/remainder overflow";
    53	#endif
    54	#ifdef CONFIG_UBSAN_UNREACHABLE
    55		/*
    56		 * SanitizerKind::Unreachable emits
    57		 * SanitizerHandler::BuiltinUnreachable.
    58		 */
    59		case ubsan_builtin_unreachable:
    60			return "UBSAN: unreachable code";
    61	#endif
    62	#if defined(CONFIG_UBSAN_BOOL) || defined(CONFIG_UBSAN_ENUM)
    63		/*
    64		 * SanitizerKind::Bool and SanitizerKind::Enum emit
    65		 * SanitizerHandler::LoadInvalidValue.
    66		 */
    67		case ubsan_load_invalid_value:
    68			return "UBSAN: loading invalid value";
    69	#endif
    70	#ifdef CONFIG_UBSAN_ALIGNMENT
    71		/*
    72		 * SanitizerKind::Alignment emits SanitizerHandler::TypeMismatch
    73		 * or SanitizerHandler::AlignmentAssumption.
    74		 */
    75		case ubsan_alignment_assumption:
    76			return "UBSAN: alignment assumption";
    77		case ubsan_type_mismatch:
    78			return "UBSAN: type mismatch";
    79	#endif
    80		default:
    81			return "UBSAN: unrecognized failure code";
    82		}
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
