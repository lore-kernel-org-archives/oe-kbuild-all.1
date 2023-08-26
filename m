Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1CA53
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 20:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693080052; x=1724616052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LyDfFbL5IpsXw81JD7hcoyShPmDTuCnUlXnAHhkS9Js=;
  b=LBifTnpGMIWsn8M2kxOVHBhnu202Ia37VDgwmWBiGoH4/oHRsLkvPTtm
   GlmFv1Dx6viCYy6WtSkcv7kSclkkhuNOvjm/xMenQpYkuWptyAuyPg8kA
   DcXx4Pu9pr4eKS/P+9o58WcJJAJWU5F1od2uEm9XIv9j4NGQAs0uhSHZp
   Y0rjOiQ/naXjhU0Si2GtyIuL+F/eRXI22URFgHfxp8pLeTyCJPuYySf1E
   gCYEQTR3tBeLH26Z8oc1/M5Q82++pYpbvD+Eg5ttz6x8GxDopUMUPkGiX
   Y1jEoff/l8tixE6luehTXTCx7V+tEJ/C44PtXUpt0j4ZUJjiesWIGXJJf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="461259057"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="461259057"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 13:00:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="911618678"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="911618678"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Aug 2023 13:00:49 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZzSi-00052D-37;
	Sat, 26 Aug 2023 20:00:48 +0000
Date: Sun, 27 Aug 2023 04:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Borislav Petkov <bp@suse.de>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.15.y 127/9999]
 arch/x86/crypto/crc32c-pcl-intel-asm_64.o: warning: objtool: crc_pcl()+0x78:
 missing int3 after indirect jump
Message-ID: <202308270347.FPf9h0Mk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   5ddfe5cc87167343bd4c17f776de7b7aa1475b0c
commit: 370d33da35e31c1544eb77bcf2539f09b1064b9c [127/9999] x86: Add straight-line-speculation mitigation
config: x86_64-randconfig-006-20230827 (https://download.01.org/0day-ci/archive/20230827/202308270347.FPf9h0Mk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270347.FPf9h0Mk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270347.FPf9h0Mk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/crc32c-pcl-intel-asm_64.o: warning: objtool: crc_pcl()+0x78: missing int3 after indirect jump


objdump-func vmlinux.o crc_pcl:
0000 000000000017b9e0 <crc_pcl>:
0000   17b9e0:	53                   	push   %rbx
0001   17b9e1:	57                   	push   %rdi
0002   17b9e2:	56                   	push   %rsi
0003   17b9e3:	49 89 d0             	mov    %rdx,%r8
0006   17b9e6:	48 89 f9             	mov    %rdi,%rcx
0009   17b9e9:	48 f7 df             	neg    %rdi
000c   17b9ec:	48 83 e7 07          	and    $0x7,%rdi
0010   17b9f0:	74 26                	je     17ba18 <proc_block>
0012   17b9f2:	48 83 fe 08          	cmp    $0x8,%rsi
0016   17b9f6:	73 08                	jae    17ba00 <do_align>
0018   17b9f8:	c1 e6 1e             	shl    $0x1e,%esi
001b   17b9fb:	e9 7e 10 00 00       	jmp    17ca7e <less_than_8_post_shl1>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
