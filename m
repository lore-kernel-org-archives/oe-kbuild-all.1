Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9812C9A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 13:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680703096; x=1712239096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eJuEdZuCPzkf2E5rccabMj/lOnqJ+ewQKE2nEK2nPp4=;
  b=DE/fK/QEgC/mWR38+RPdkWnvBxU3y3YB7CSY4A2fz5bJac7zQBZkg/PD
   xLWjwH1XcsGtuOgA+QsA6er7q5/wdVlgQ2eM8+tOrjeU8A72QAcjwVldI
   YgNM2pcjmGxMRP4NMefUsCh8kiHCs7ywj1BI0FEOZYaWcI+x0SYtcphdH
   EI7y/WRV28Ew05MLSUwgp51iKjfF4ogBD/OCh0n58/4A2+gvjApkWyw37
   KwC5Ome9yhVYLCnvL8Vf92ytnN8TlaB0lDBteOdbdYgnlJhPswyhEoZyx
   sMN+YmfxvBaGkrRMXvAHzlG/EZTvRdSJFF2JKcfc4wjGfQzEqaz/C6HVO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370283725"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="370283725"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 06:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="689305254"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="689305254"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 05 Apr 2023 06:58:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk3eQ-000QYq-25;
	Wed, 05 Apr 2023 13:58:14 +0000
Date: Wed, 5 Apr 2023 21:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:objtool/core 13/14] check.c:2460:62: error: 'struct
 reloc' has no member named 'addend'
Message-ID: <202304052155.5deTJ0Rg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   a4a18bcf31e2e93fd9ef558e91cdf509a519affd
commit: 4f0c3447e1e2117bb1c3810775550c2a6769a0fc [13/14] objtool: Remove reloc::addend
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230405/202304052155.5deTJ0Rg-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4f0c3447e1e2117bb1c3810775550c2a6769a0fc
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/core
        git checkout 4f0c3447e1e2117bb1c3810775550c2a6769a0fc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304052155.5deTJ0Rg-lkp@intel.com/

All errors (new ones prefixed by >>):

   check.c: In function 'read_validate_unret_hints':
>> check.c:2460:62: error: 'struct reloc' has no member named 'addend'
    2460 |                 insn = find_insn(file, reloc->sym->sec, reloc->addend);
         |                                                              ^~
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/check.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [Makefile:66: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1440: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
