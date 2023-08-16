Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB2410949
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 17:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692206252; x=1723742252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LKQdHGRVLc9A40yfPh9cHYyCaP7borev+ApE2p8roUE=;
  b=T66RyHh8IU8uNbM7TYXhC6kZ0IhR2VY7crmMTZSiea3SbpIJz8vAIfgp
   CPphK8xJP779JjNLh37iwxHTH2HWGvUDFRWagJodMizycBO9h72OKq4Cu
   nS/CMldOTScP6QD06H97FG3zbKhqRzPYXODZ4aWFNPX3jcUel8fzVExAl
   JZv0rTyBDNz2iaOvBZm6QmtSPt+1X8kxb/yDqK2s8OvHVaZ6en851EDeU
   i9ulyC+hwARguivKDOt6lgQnyirGCo1+oWgLooU7Ds3n9ldFVOq/e0bQi
   RXFJJwOAOOWUFl0qjcN8UuanBFOOyWXhvtlAhM7YzDNi8Vw/1GW4Dcxg9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="372594942"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="372594942"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="769278000"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="769278000"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Aug 2023 10:17:22 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWK93-0000SZ-2c;
	Wed, 16 Aug 2023 17:17:21 +0000
Date: Thu, 17 Aug 2023 01:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, "Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [tip:x86/urgent 8/15] arch/x86/lib/retpoline.o: warning: objtool:
 srso_untrain_ret+0xd: call without frame pointer save/setup
Message-ID: <202308170133.1Ix5PpIZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
head:   d80c3c9de067e08498d9bbfef7ab0b716fe4cc05
commit: 4ae68b26c3ab5a82aa271e6e9fc9b1a06e1d6b40 [8/15] objtool/x86: Fix SRSO mess
config: x86_64-randconfig-x015-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170133.1Ix5PpIZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170133.1Ix5PpIZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170133.1Ix5PpIZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/retpoline.o: warning: objtool: srso_untrain_ret+0xd: call without frame pointer save/setup


objdump-func vmlinux.o srso_untrain_ret:
0000 0000000000000000 <srso_untrain_ret_alias>:
0000    0:	66 90                	xchg   %ax,%ax
0002    2:	0f ae e8             	lfence
0005    5:	e9 00 00 00 00       	jmp    a <__pcpu_unique_p4_running>	6: R_X86_64_PLT32	__x86_return_thunk-0x4
0000 00000000000000be <srso_untrain_ret>:
0000   be:	48                   	rex.W
0001   bf:	b8                   	.byte 0xb8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
