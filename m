Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD561373
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 03:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685505059; x=1717041059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IGt+vswGnudBFMXkqwv5FVU11uAV7VjiQUybWj1Qgj0=;
  b=PjlRALleEzMnP2Wx1a0GWlWo9fBYxZgi1h+JN1cGLUcrZTbenBPKvbP6
   l6IlNinGFzfYMutDjlryFIuskj6XwwAWS6LTZSBcAibdWy+icbGePJ2oF
   W6eWTvlFWMM5cbySHWN95SIQxk6ou32pvfHAEw9DkTdEULIil6qGpZgP2
   1vGbzXjRlvXO2g7wAFI5H2qQXCu4fA7WhpdgMhlGontHDvQCY8fX4eNE8
   EHR0PEwNPIhIdw7ETcrnQZu4bApjuJ6+puvYA42OghxPjB9mZAipFkUuo
   rrwf7fFViE0f/1bdiVBt1mZmTdA2V5H2Tjd8viMSUxS0iyMnQlfknDrlQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="420891817"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="420891817"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 20:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="851052538"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="851052538"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 May 2023 20:50:57 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4CrR-00013r-08;
	Wed, 31 May 2023 03:50:57 +0000
Date: Wed, 31 May 2023 11:50:10 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:vmware-rbp-breakage 15/15]
 arch/x86/include/asm/unwind_hints.h:69: Error: Bad parameter list for macro
 `unwind_hint'
Message-ID: <202305311108.4HJHK3N0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git vmware-rbp-breakage
head:   9d357e3aaa81442ec72c0dfd88b553c868b5aa6c
commit: 9d357e3aaa81442ec72c0dfd88b553c868b5aa6c [15/15] drm/vmwgfx: Silence RBP clobber warnings
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230531/202305311108.4HJHK3N0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=9d357e3aaa81442ec72c0dfd88b553c868b5aa6c
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe vmware-rbp-breakage
        git checkout 9d357e3aaa81442ec72c0dfd88b553c868b5aa6c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305311108.4HJHK3N0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/include/asm/unwind_hints.h: Assembler messages:
>> arch/x86/include/asm/unwind_hints.h:69: Error: Bad parameter list for macro `unwind_hint'
   arch/x86/include/asm/unwind_hints.h:73: Error: Bad parameter list for macro `unwind_hint'


vim +69 arch/x86/include/asm/unwind_hints.h

e25eea89bb8853 Peter Zijlstra 2020-04-01  68  
8faea26e611189 Josh Poimboeuf 2022-06-24 @69  .macro UNWIND_HINT_SAVE
8faea26e611189 Josh Poimboeuf 2022-06-24  70  	UNWIND_HINT type=UNWIND_HINT_TYPE_SAVE
8faea26e611189 Josh Poimboeuf 2022-06-24  71  .endm
8faea26e611189 Josh Poimboeuf 2022-06-24  72  

:::::: The code at line 69 was first introduced by commit
:::::: 8faea26e611189e933ea2281975ff4dc7c1106b6 objtool: Re-add UNWIND_HINT_{SAVE_RESTORE}

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
