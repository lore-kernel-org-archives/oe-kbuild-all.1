Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170793C3B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675796370; x=1707332370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8KGk3QM1ezFAsti4lUTG/tRBxfC8IUwEI8lWXM79zg=;
  b=Mz644xiVW3pLl+VBSd2w+BEYWlzADV1/e5AApDKNzkrd4ipPZaJu4lPS
   LmpAKb7p+yRYVZjXNZ1OHUOhu5r7Qaw1pbPlnbRzbWp7GvtM9CAT295I9
   OsKHfGtucLMdnhpGpQwNm6Z1KzKGvUR27unZrZGkQ4lr9wD90R1e+g5uz
   IAy0CCJneHMLt7hb4VM/CkGNq1FQBnecy6W67Gz1nVwCfwyfDlKL6MIdG
   muRMm49aAbGjJISq3o+7f4a6aFoHxxYRS2ujlUkieR1aT2/yHgua2kQ4G
   4OPFAPf4FYo2Yv5FlOyXQc/SFYMB3Hl5ofxit00wpqHqAbKpQ4eM31tJ7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="356974273"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="356974273"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 10:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="735647145"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="735647145"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Feb 2023 10:59:28 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPTBf-0003nG-2J;
	Tue, 07 Feb 2023 18:59:27 +0000
Date: Wed, 8 Feb 2023 02:59:03 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 7/8] check.c:55:74: error:
 'last_orig_insn' may be used uninitialized in this function
Message-ID: <202302080232.wCYd0dZO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   fff5d41447f9480e757c7fb39611041afad1d4cf
commit: 5d577128831ca5312b8feb36ee943bd0bcf86e95 [7/8] objtool: Fix overlapping alternatives
config: x86_64-randconfig-a013-20230206 (https://download.01.org/0day-ci/archive/20230208/202302080232.wCYd0dZO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=5d577128831ca5312b8feb36ee943bd0bcf86e95
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/core
        git checkout 5d577128831ca5312b8feb36ee943bd0bcf86e95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All errors (new ones prefixed by >>):

   check.c: In function 'add_special_section_alts':
>> check.c:55:74: error: 'last_orig_insn' may be used uninitialized in this function [-Werror=maybe-uninitialized]
      55 |         if (!next || &next->list == &file->insn_list || next->sec != insn->sec)
         |                                                                      ~~~~^~~~~
   check.c:1735:29: note: 'last_orig_insn' was declared here
    1735 |         struct instruction *last_orig_insn, *last_new_insn = NULL, *insn, *nop = NULL;
         |                             ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tools/objtool/check.o] Error 1
   make[3]: *** [Makefile:66: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1439: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
