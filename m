Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6330526C3BE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283827; cv=none; b=PKjnQ6QZn1kX0yJ/3KoB4qMXGNmAI+x0T8FTlD52hScMYGbI8BmQq4mNTwxD23vwKtMrAXRj4qz4UzFikQn5VydFqFBDphAxc3pVRH26CdHJU/SnqpjPYz720m5EXB5wmrOyKSgq+8ffcWFVwis5wqB94egd9A5qnZ31WOhptgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283827; c=relaxed/simple;
	bh=uoUpPzVVwfKKYPHCGgBtfQ5fUDo5YIVvWU0ZJG9/zk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mzdvmp1ety5xIzCTNxHUd+UcL/IjX7mHkBlu2O9cLQMsvENyG1Pf8+33BHm1KhQHUbRQ4IBa9w7cCU5dCAHoMPiJC3V7sJvCjSZ4osIkVRIrvk01kS0m1KU4FRV4DpWB6I9UuP22UVKO+ZleHjWTJB1lQzmU6LoOaNubw9+/fU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N78vKpeP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N78vKpeP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751283824; x=1782819824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uoUpPzVVwfKKYPHCGgBtfQ5fUDo5YIVvWU0ZJG9/zk0=;
  b=N78vKpePjRJmssIrbiIwQ/ukpsXSvC7PED6yNz1bUgRXstL+e5MvYT2O
   Ex+tCI3RLV0ApqnQD11gv3NlayEruOIvcvNbS4kiQk0CpKe7Aii2dgX/N
   ApV8GfUtCQUVXm44McDZQ3Sl7jXHmI23zYCtck7MMGyATlUcgtNrGrnCH
   e4gw4MPvopjhpCqWmvVzkqqvAZdnNLrtDSccY2aiaKgHD5oZfXinyBmWp
   qt2qldT0FS9aMRBTnVksx1u2mEk3eHxWgCghHPfCWcNgo9IF+4F1GIsNJ
   rltskicK+nz2gf1toPrt6+5S5DqQdhC8W/xSdvIxxl/PGmndpPtrE8kXt
   Q==;
X-CSE-ConnectionGUID: YDGG3wZEQFmt68vBPenxAg==
X-CSE-MsgGUID: tM+TVVKbTlyrYy6RdpFOYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64859738"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64859738"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 04:43:44 -0700
X-CSE-ConnectionGUID: DEJP+9CjRQKWIuRZ38UJgQ==
X-CSE-MsgGUID: huXL50SAQM+NOQE2MAgNHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="184358231"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jun 2025 04:43:42 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWCvE-0001Br-0x;
	Mon, 30 Jun 2025 11:43:40 +0000
Date: Mon, 30 Jun 2025 13:43:08 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhong Jinghua <zhongjinghua@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882]
 arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype
 for '__x64_sys_landlock_create_ruleset'
Message-ID: <202506301345.R55BMO2e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   2264b0731bcc958f540da580ad93b9f103a8e271
commit: 21dd31f58b64b122a2d9fb62669d6191d1cf2c0f [2882/2882] landlock: Add syscall implementations
config: x86_64-randconfig-2005-20250501 (https://download.01.org/0day-ci/archive/20250630/202506301345.R55BMO2e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301345.R55BMO2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301345.R55BMO2e-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:259:1: note: in expansion of macro 'COND_SYSCALL'
     259 | COND_SYSCALL(mremap);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_mremap' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:259:1: note: in expansion of macro 'COND_SYSCALL'
     259 | COND_SYSCALL(mremap);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_add_key' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:262:1: note: in expansion of macro 'COND_SYSCALL'
     262 | COND_SYSCALL(add_key);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_add_key' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:262:1: note: in expansion of macro 'COND_SYSCALL'
     262 | COND_SYSCALL(add_key);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_request_key' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:263:1: note: in expansion of macro 'COND_SYSCALL'
     263 | COND_SYSCALL(request_key);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_request_key' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:263:1: note: in expansion of macro 'COND_SYSCALL'
     263 | COND_SYSCALL(request_key);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_keyctl' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:264:1: note: in expansion of macro 'COND_SYSCALL'
     264 | COND_SYSCALL(keyctl);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_keyctl' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:264:1: note: in expansion of macro 'COND_SYSCALL'
     264 | COND_SYSCALL(keyctl);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_compat_sys_keyctl' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:148:9: note: in expansion of macro '__COND_SYSCALL'
     148 |         __COND_SYSCALL(ia32, compat_sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:218:9: note: in expansion of macro '__IA32_COMPAT_COND_SYSCALL'
     218 |         __IA32_COMPAT_COND_SYSCALL(name)                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:265:1: note: in expansion of macro 'COND_SYSCALL_COMPAT'
     265 | COND_SYSCALL_COMPAT(keyctl);
         | ^~~~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_landlock_create_ruleset' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:268:1: note: in expansion of macro 'COND_SYSCALL'
     268 | COND_SYSCALL(landlock_create_ruleset);
         | ^~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_landlock_create_ruleset' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:268:1: note: in expansion of macro 'COND_SYSCALL'
     268 | COND_SYSCALL(landlock_create_ruleset);
         | ^~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_landlock_add_rule' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:269:1: note: in expansion of macro 'COND_SYSCALL'
     269 | COND_SYSCALL(landlock_add_rule);
         | ^~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_landlock_add_rule' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:269:1: note: in expansion of macro 'COND_SYSCALL'
     269 | COND_SYSCALL(landlock_add_rule);
         | ^~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_landlock_restrict_self' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:270:1: note: in expansion of macro 'COND_SYSCALL'
     270 | COND_SYSCALL(landlock_restrict_self);
         | ^~~~~~~~~~~~
>> arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_landlock_restrict_self' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:270:1: note: in expansion of macro 'COND_SYSCALL'
     270 | COND_SYSCALL(landlock_restrict_self);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_fadvise64_64' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:275:1: note: in expansion of macro 'COND_SYSCALL'
     275 | COND_SYSCALL(fadvise64_64);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_fadvise64_64' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:275:1: note: in expansion of macro 'COND_SYSCALL'
     275 | COND_SYSCALL(fadvise64_64);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_compat_sys_fadvise64_64' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:148:9: note: in expansion of macro '__COND_SYSCALL'
     148 |         __COND_SYSCALL(ia32, compat_sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:218:9: note: in expansion of macro '__IA32_COMPAT_COND_SYSCALL'
     218 |         __IA32_COMPAT_COND_SYSCALL(name)                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:276:1: note: in expansion of macro 'COND_SYSCALL_COMPAT'
     276 | COND_SYSCALL_COMPAT(fadvise64_64);
         | ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_swapon' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:279:1: note: in expansion of macro 'COND_SYSCALL'
     279 | COND_SYSCALL(swapon);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_swapon' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:279:1: note: in expansion of macro 'COND_SYSCALL'
     279 | COND_SYSCALL(swapon);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_swapoff' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:256:9: note: in expansion of macro '__X64_COND_SYSCALL'
     256 |         __X64_COND_SYSCALL(name)                                        \
         |         ^~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:280:1: note: in expansion of macro 'COND_SYSCALL'
     280 | COND_SYSCALL(swapoff);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__ia32_sys_swapoff' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:120:9: note: in expansion of macro '__COND_SYSCALL'
     120 |         __COND_SYSCALL(ia32, sys_##name)
         |         ^~~~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:257:9: note: in expansion of macro '__IA32_COND_SYSCALL'
     257 |         __IA32_COND_SYSCALL(name)
         |         ^~~~~~~~~~~~~~~~~~~
   kernel/sys_ni.c:280:1: note: in expansion of macro 'COND_SYSCALL'
     280 | COND_SYSCALL(swapoff);
         | ^~~~~~~~~~~~
   arch/x86/include/asm/syscall_wrapper.h:83:21: warning: no previous prototype for '__x64_sys_mprotect' [-Wmissing-prototypes]
      83 |         __weak long __##abi##_##name(const struct pt_regs *__unused)    \
         |                     ^~
   arch/x86/include/asm/syscall_wrapper.h:100:9: note: in expansion of macro '__COND_SYSCALL'
     100 |         __COND_SYSCALL(x64, sys_##name)


vim +/__x64_sys_landlock_create_ruleset +83 arch/x86/include/asm/syscall_wrapper.h

cc42c045af1ff4 Brian Gerst       2020-03-13  13  
25c619e59b395a Brian Gerst       2020-03-13  14  /*
25c619e59b395a Brian Gerst       2020-03-13  15   * Instead of the generic __SYSCALL_DEFINEx() definition, the x86 version takes
25c619e59b395a Brian Gerst       2020-03-13  16   * struct pt_regs *regs as the only argument of the syscall stub(s) named as:
25c619e59b395a Brian Gerst       2020-03-13  17   * __x64_sys_*()         - 64-bit native syscall
25c619e59b395a Brian Gerst       2020-03-13  18   * __ia32_sys_*()        - 32-bit native syscall or common compat syscall
25c619e59b395a Brian Gerst       2020-03-13  19   * __ia32_compat_sys_*() - 32-bit compat syscall
25c619e59b395a Brian Gerst       2020-03-13  20   * __x32_compat_sys_*()  - 64-bit X32 compat syscall
25c619e59b395a Brian Gerst       2020-03-13  21   *
25c619e59b395a Brian Gerst       2020-03-13  22   * The registers are decoded according to the ABI:
25c619e59b395a Brian Gerst       2020-03-13  23   * 64-bit: RDI, RSI, RDX, R10, R8, R9
25c619e59b395a Brian Gerst       2020-03-13  24   * 32-bit: EBX, ECX, EDX, ESI, EDI, EBP
25c619e59b395a Brian Gerst       2020-03-13  25   *
25c619e59b395a Brian Gerst       2020-03-13  26   * The stub then passes the decoded arguments to the __se_sys_*() wrapper to
25c619e59b395a Brian Gerst       2020-03-13  27   * perform sign-extension (omitted for zero-argument syscalls).  Finally the
25c619e59b395a Brian Gerst       2020-03-13  28   * arguments are passed to the __do_sys_*() function which is the actual
25c619e59b395a Brian Gerst       2020-03-13  29   * syscall.  These wrappers are marked as inline so the compiler can optimize
25c619e59b395a Brian Gerst       2020-03-13  30   * the functions where appropriate.
25c619e59b395a Brian Gerst       2020-03-13  31   *
25c619e59b395a Brian Gerst       2020-03-13  32   * Example assembly (slightly re-ordered for better readability):
25c619e59b395a Brian Gerst       2020-03-13  33   *
25c619e59b395a Brian Gerst       2020-03-13  34   * <__x64_sys_recv>:		<-- syscall with 4 parameters
25c619e59b395a Brian Gerst       2020-03-13  35   *	callq	<__fentry__>
25c619e59b395a Brian Gerst       2020-03-13  36   *
25c619e59b395a Brian Gerst       2020-03-13  37   *	mov	0x70(%rdi),%rdi	<-- decode regs->di
25c619e59b395a Brian Gerst       2020-03-13  38   *	mov	0x68(%rdi),%rsi	<-- decode regs->si
25c619e59b395a Brian Gerst       2020-03-13  39   *	mov	0x60(%rdi),%rdx	<-- decode regs->dx
25c619e59b395a Brian Gerst       2020-03-13  40   *	mov	0x38(%rdi),%rcx	<-- decode regs->r10
25c619e59b395a Brian Gerst       2020-03-13  41   *
25c619e59b395a Brian Gerst       2020-03-13  42   *	xor	%r9d,%r9d	<-- clear %r9
25c619e59b395a Brian Gerst       2020-03-13  43   *	xor	%r8d,%r8d	<-- clear %r8
25c619e59b395a Brian Gerst       2020-03-13  44   *
25c619e59b395a Brian Gerst       2020-03-13  45   *	callq	__sys_recvfrom	<-- do the actual work in __sys_recvfrom()
25c619e59b395a Brian Gerst       2020-03-13  46   *				    which takes 6 arguments
25c619e59b395a Brian Gerst       2020-03-13  47   *
25c619e59b395a Brian Gerst       2020-03-13  48   *	cltq			<-- extend return value to 64-bit
25c619e59b395a Brian Gerst       2020-03-13  49   *	retq			<-- return
25c619e59b395a Brian Gerst       2020-03-13  50   *
25c619e59b395a Brian Gerst       2020-03-13  51   * This approach avoids leaking random user-provided register content down
25c619e59b395a Brian Gerst       2020-03-13  52   * the call chain.
25c619e59b395a Brian Gerst       2020-03-13  53   */
25c619e59b395a Brian Gerst       2020-03-13  54  
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  55  /* Mapping of registers to parameters for syscalls on x86-64 and x32 */
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  56  #define SC_X86_64_REGS_TO_ARGS(x, ...)					\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  57  	__MAP(x,__SC_ARGS						\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  58  		,,regs->di,,regs->si,,regs->dx				\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  59  		,,regs->r10,,regs->r8,,regs->r9)			\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  60  
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  61  /* Mapping of registers to parameters for syscalls on i386 */
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  62  #define SC_IA32_REGS_TO_ARGS(x, ...)					\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  63  	__MAP(x,__SC_ARGS						\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  64  	      ,,(unsigned int)regs->bx,,(unsigned int)regs->cx		\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  65  	      ,,(unsigned int)regs->dx,,(unsigned int)regs->si		\
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  66  	      ,,(unsigned int)regs->di,,(unsigned int)regs->bp)
ebeb8c82ffaf94 Dominik Brodowski 2018-04-05  67  
d2b5de495ee983 Brian Gerst       2020-03-13  68  #define __SYS_STUB0(abi, name)						\
0f78ff17112d8b Brian Gerst       2020-03-13  69  	long __##abi##_##name(const struct pt_regs *regs);		\
d2b5de495ee983 Brian Gerst       2020-03-13  70  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
0f78ff17112d8b Brian Gerst       2020-03-13  71  	long __##abi##_##name(const struct pt_regs *regs)		\
d2b5de495ee983 Brian Gerst       2020-03-13  72  		__alias(__do_##name);
d2b5de495ee983 Brian Gerst       2020-03-13  73  
4399e0cf494f73 Brian Gerst       2020-03-13  74  #define __SYS_STUBx(abi, name, ...)					\
0f78ff17112d8b Brian Gerst       2020-03-13  75  	long __##abi##_##name(const struct pt_regs *regs);		\
4399e0cf494f73 Brian Gerst       2020-03-13  76  	ALLOW_ERROR_INJECTION(__##abi##_##name, ERRNO);			\
0f78ff17112d8b Brian Gerst       2020-03-13  77  	long __##abi##_##name(const struct pt_regs *regs)		\
4399e0cf494f73 Brian Gerst       2020-03-13  78  	{								\
4399e0cf494f73 Brian Gerst       2020-03-13  79  		return __se_##name(__VA_ARGS__);			\
4399e0cf494f73 Brian Gerst       2020-03-13  80  	}
4399e0cf494f73 Brian Gerst       2020-03-13  81  
6cc8d2b286d9e7 Brian Gerst       2020-03-13  82  #define __COND_SYSCALL(abi, name)					\
0f78ff17112d8b Brian Gerst       2020-03-13 @83  	__weak long __##abi##_##name(const struct pt_regs *__unused)	\
6cc8d2b286d9e7 Brian Gerst       2020-03-13  84  	{								\
6cc8d2b286d9e7 Brian Gerst       2020-03-13  85  		return sys_ni_syscall();				\
6cc8d2b286d9e7 Brian Gerst       2020-03-13  86  	}
6cc8d2b286d9e7 Brian Gerst       2020-03-13  87  

:::::: The code at line 83 was first introduced by commit
:::::: 0f78ff17112d8b3469b805ff4ea9780cc1e5c93b x86/entry: Drop asmlinkage from syscalls

:::::: TO: Brian Gerst <brgerst@gmail.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
