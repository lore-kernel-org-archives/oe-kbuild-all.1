Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8ED17332A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727265309; cv=none; b=NTF4YazCdfPqzVsCpFKMW431K22j++KGoBcgHjfhWkZtMBQ3UwTWVoLO+zdeqy6bXCK271JbPoY23AqNCNiDQf78urfMJWMZPZSg1OaFyepxsXrKVABx3m81BisZ4g/oD+WSWrjMSLQdpH+xPGqmjBatq+mX8wcUgm+IL8eRCuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727265309; c=relaxed/simple;
	bh=pxbSNiQt4YqbAxLL3XtVYacO4Z0xys5LVuLJtU0mpEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HQ2rsQKyYMvMX4JYxgU+lTVhqeAaI9T6I7pp7xMc1cb7qc3hRgg++kGlgNl/l761Yze6VorhESx/tHOsQaqfhd/I0rVkvhpqtSU9AXnJNesyDQWiKUMyqNK6m/RH0Cxxl3odAPH8Bon55K9jAo6NW2CBEZSIFCnL4X2UzGo/zPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lb2ODlGy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lb2ODlGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727265307; x=1758801307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxbSNiQt4YqbAxLL3XtVYacO4Z0xys5LVuLJtU0mpEw=;
  b=lb2ODlGycLudAG/3pKGsXGg7qyc8yU68rLIlInc3UD6IkJaYOt5lBekf
   6lkU4MZxDHr3l3A1cHHZUtjP4LvtB5pANSxrYVXG1KkeB7knsfVp14389
   woi3Jp1upTSYaquie8YnvCYzhohWjQfHcLL9T3TuQoT8Ku+nUlrWSkpvX
   5FrflrUaIGwo3cvWR50sLvwLiY207AHkAQ9dDkptmbbrkIb9MQS89bPGx
   PVx58trOJ735ZRDGKtmbTzOQo9AsoT4pYEzU3h6bkZQLo2j+2wzL8ohDL
   BIdv7qt5J+LAxQeSpI23fvNBlXq0w3oOOzDlx9nDlgElu67rtv9qzt52X
   w==;
X-CSE-ConnectionGUID: d9if+MiOTOGxH9PuWsmRrw==
X-CSE-MsgGUID: m7MuU/nNQxaM6D2Aa4FSZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36872542"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="36872542"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 04:55:07 -0700
X-CSE-ConnectionGUID: P85deytqRnKC4maXJoZ6KA==
X-CSE-MsgGUID: wHA9itz4RVG/zON5Bxb7hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="71344441"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Sep 2024 04:50:17 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stQX8-000JWJ-2B;
	Wed, 25 Sep 2024 11:50:14 +0000
Date: Wed, 25 Sep 2024 19:49:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 9406/23766]
 kernel/time/.tmp_posix-cpu-timers.o: warning: objtool:
 set_process_cpu_timer()+0xc7: unreachable instruction
Message-ID: <202409251901.etAiBSp6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ecca3ab84cbf3cf5ec32574bcec8a068e79d14df
commit: 36ff49c95a04513935898fdcd4bc37646b2dc459 [9406/23766] posix-cpu-timers: Sanitize bogus WARNONS
config: x86_64-buildonly-randconfig-002-20240923 (https://download.01.org/0day-ci/archive/20240925/202409251901.etAiBSp6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409251901.etAiBSp6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251901.etAiBSp6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/.tmp_posix-cpu-timers.o: warning: objtool: set_process_cpu_timer()+0xc7: unreachable instruction


objdump-func vmlinux.o set_process_cpu_timer:
0000 000000000011ca20 <set_process_cpu_timer>:
0000   11ca20:	f3 0f 1e fa          	endbr64
0004   11ca24:	83 fe 02             	cmp    $0x2,%esi
0007   11ca27:	0f 83 82 00 00 00    	jae    11caaf <set_process_cpu_timer+0x8f>
000d   11ca2d:	41 57                	push   %r15
000f   11ca2f:	41 56                	push   %r14
0011   11ca31:	53                   	push   %rbx
0012   11ca32:	49 89 ce             	mov    %rcx,%r14
0015   11ca35:	48 89 d3             	mov    %rdx,%rbx
0018   11ca38:	48 89 f8             	mov    %rdi,%rax
001b   11ca3b:	48 8b 8f a8 05 00 00 	mov    0x5a8(%rdi),%rcx
0022   11ca42:	89 f2                	mov    %esi,%edx
0024   11ca44:	48 8d 14 52          	lea    (%rdx,%rdx,2),%rdx
0028   11ca48:	4c 8d bc d1 88 02 00 00 	lea    0x288(%rcx,%rdx,8),%r15
0030   11ca50:	89 f7                	mov    %esi,%edi
0032   11ca52:	48 89 c6             	mov    %rax,%rsi
0035   11ca55:	ba 01 00 00 00       	mov    $0x1,%edx
003a   11ca5a:	e8 41 09 00 00       	call   11d3a0 <cpu_clock_sample_group>
003f   11ca5f:	4d 85 f6             	test   %r14,%r14
0042   11ca62:	74 2c                	je     11ca90 <set_process_cpu_timer+0x70>
0044   11ca64:	49 8b 0e             	mov    (%r14),%rcx
0047   11ca67:	48 85 c9             	test   %rcx,%rcx
004a   11ca6a:	74 0f                	je     11ca7b <set_process_cpu_timer+0x5b>
004c   11ca6c:	48 29 c1             	sub    %rax,%rcx
004f   11ca6f:	ba 00 09 3d 00       	mov    $0x3d0900,%edx
0054   11ca74:	48 0f 47 d1          	cmova  %rcx,%rdx
0058   11ca78:	49 89 16             	mov    %rdx,(%r14)
005b   11ca7b:	48 8b 0b             	mov    (%rbx),%rcx
005e   11ca7e:	48 85 c9             	test   %rcx,%rcx
0061   11ca81:	74 23                	je     11caa6 <set_process_cpu_timer+0x86>
0063   11ca83:	48 01 c1             	add    %rax,%rcx
0066   11ca86:	48 89 0b             	mov    %rcx,(%rbx)
0069   11ca89:	49 3b 0f             	cmp    (%r15),%rcx
006c   11ca8c:	72 0a                	jb     11ca98 <set_process_cpu_timer+0x78>
006e   11ca8e:	eb 0b                	jmp    11ca9b <set_process_cpu_timer+0x7b>
0070   11ca90:	48 8b 0b             	mov    (%rbx),%rcx
0073   11ca93:	49 3b 0f             	cmp    (%r15),%rcx
0076   11ca96:	73 03                	jae    11ca9b <set_process_cpu_timer+0x7b>
0078   11ca98:	49 89 0f             	mov    %rcx,(%r15)
007b   11ca9b:	5b                   	pop    %rbx
007c   11ca9c:	41 5e                	pop    %r14
007e   11ca9e:	41 5f                	pop    %r15
0080   11caa0:	2e e9 00 00 00 00    	cs jmp 11caa6 <set_process_cpu_timer+0x86>	11caa2: R_X86_64_PLT32	__x86_return_thunk-0x4
0086   11caa6:	31 c9                	xor    %ecx,%ecx
0088   11caa8:	49 3b 0f             	cmp    (%r15),%rcx
008b   11caab:	72 eb                	jb     11ca98 <set_process_cpu_timer+0x78>
008d   11caad:	eb ec                	jmp    11ca9b <set_process_cpu_timer+0x7b>
008f   11caaf:	0f 0b                	ud2
0091   11cab1:	2e e9 00 00 00 00    	cs jmp 11cab7 <set_process_cpu_timer+0x97>	11cab3: R_X86_64_PLT32	__x86_return_thunk-0x4
0097   11cab7:	66 0f 1f 84 00 00 00 00 00 	nopw   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
