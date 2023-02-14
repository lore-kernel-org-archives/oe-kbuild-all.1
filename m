Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2134723C1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 03:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676345033; x=1707881033;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+fqEZYPoYWgcOmoSC+TAp7vUH+ohrWwIPuEPir9Pe5I=;
  b=IwLMA+zOt5DZzJHguYiqJJNepwYtyQGX+xk68fBqUM26QLVelU81VyeM
   IlFUSGEUnGbA0xigTKfUm6jW+JIKj8Iq9xORu0S7p2JYE0sjWa8X8ciHp
   ztVFZ5lxnGKf5Gr0WFY/T6iTYNf3yrrIjwuXUOKghZqPzdRDEAA156ScJ
   HHvxsYK5VafzkUh+cFPCnocjbPYCgiNh7Yti+lLkbko0Qi+DJ8NnGkcqh
   hguXH1PHRlW/pd+GRE6LnxTeOs5WvVl/0grpfDo7tnh5PEmy6TTGl+vPC
   hsbBN/AsGp7YJBGLfIjVi3ig2cKVZN8yWMxWINOdWHKP5+ks9h68VnUoM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="319096411"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="319096411"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 19:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="843007382"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="843007382"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 Feb 2023 19:23:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRlv4-0008AH-1o;
	Tue, 14 Feb 2023 03:23:50 +0000
Date: Tue, 14 Feb 2023 11:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool/core 22/24] vmlinux.o: warning: objtool:
 start_kernel() falls through to next function do_initcalls()
Message-ID: <202302141125.QrTWubSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/core
head:   93bbe1c3b489220a33d0acd2b025794ada9c9f08
commit: 21b1cd752837ff178b9f48bee06798faffd5d6ca [22/24] init: Make arch_call_rest_init() and rest_init() __noreturn
config: x86_64-randconfig-a011-20230213 (https://download.01.org/0day-ci/archive/20230214/202302141125.QrTWubSz-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=21b1cd752837ff178b9f48bee06798faffd5d6ca
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool/core
        git checkout 21b1cd752837ff178b9f48bee06798faffd5d6ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141125.QrTWubSz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: start_kernel() falls through to next function do_initcalls()
   vmlinux.o: warning: objtool: nf_ct_set_timeout.cold+0x67: relocation to !ENDBR: nf_ct_set_timeout+0x254

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
