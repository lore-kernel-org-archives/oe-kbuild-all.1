Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1152B9BF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112238; cv=none; b=ljqTEYRzkrNWIvEFqOt0pkZNEbmXBMeyjDsLPThT99Yc73TmEzUX8xS73HO3m+VO4fdy81VQfyBzNSECd2f0mrNL38x561VMJ4kMi/9NBRgNI/aW1V8Qp99pIfqCzbvCT4AqOhzNBMQioDOtm7Nb6DuPzmwnnuzdB8CHPgJMYsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112238; c=relaxed/simple;
	bh=zNSSwSxvkzyBKLamxSpd4zgCErkXibJf3rJLImCLwKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SkPkvtV9kE+vcYxct7PC8pnBGDXq+B4ehPZzLQp4SXzj1WZ8Mv9HGA4Ykv+spdOLF/LLZMgPRgJpthZDYcDZmZoNvmNm+qp6memkLHgNDW+4mLhswHzSiSpYNCQIH1jF6G48CQyPmees+syUOi0znKMntvzg4u2A7w2hJOc0YFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWpnUyU5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWpnUyU5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746112236; x=1777648236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zNSSwSxvkzyBKLamxSpd4zgCErkXibJf3rJLImCLwKg=;
  b=jWpnUyU5XQO2+lYKu3qT8ieqC6AArizIceNrIz/ZMcjnUNdzEhkpcWJp
   f3kj2a53ThvTTWNfdUqiu4/RZE1EAfMhCmjW+YDrehLwNqU3nJpRE7GIU
   48a2bfql93VBle030ZPv0IOnBH/9aZsJJLXZesE9FYlzhT6Y065fMLFJp
   fUZ7iYpWi9fQClvvX/4bty6eh5xWKTsENTxoRFoqQ4kjL2QQG2fH1WuG6
   LIZCAEKkj+lQBvDeepLmynrQalKIUHL5CWDAk2WTiPchjFUUwfjtZ1gUE
   yoqQmKV4nX8tkxJA5yaAUOzN9wDj00hM4YKlS/zSZC+vUM+Ygfk7tPVRt
   Q==;
X-CSE-ConnectionGUID: RvGWR93bRQ+ymi9yxDZgTg==
X-CSE-MsgGUID: HsCjaPIDQ6Wa8soT8XY+7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58776068"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58776068"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 08:10:35 -0700
X-CSE-ConnectionGUID: 1k58w42UTeiVzgk32X2dMg==
X-CSE-MsgGUID: O7lh+Zp2SdiSWlQEF1DpLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165463365"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2025 08:10:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAVYW-0004Cv-04;
	Thu, 01 May 2025 15:10:32 +0000
Date: Thu, 1 May 2025 23:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 29/34]
 rust/kernel/generated_arch_static_branch_asm.rs.S:7:89: error: too few
 arguments provided to function-like macro invocation
Message-ID: <202505012327.koZBQ9WB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   69a817d602ee843bd52388638c4d2fdce7c20fa7
commit: b4eed9fc8b26a790796951ab9d26b8ee5009b18f [29/34] objtool, livepatch: Livepatch module generation
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250501/202505012327.koZBQ9WB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505012327.koZBQ9WB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505012327.koZBQ9WB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/kernel/generated_arch_static_branch_asm.rs.S:7:89: error: too few arguments provided to function-like macro invocation
       7 | ::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM("{symb} + {off} + {branch}", "{l_yes}"))
         |                                                                                         ^
   arch/x86/include/asm/jump_label.h:25:9: note: macro 'ARCH_STATIC_BRANCH_ASM' defined here
      25 | #define ARCH_STATIC_BRANCH_ASM(key, label, size)        \
         |         ^
   1 error generated.
--
>> error: no rules expected the token `ARCH_STATIC_BRANCH_ASM`
   --> rust/kernel/generated_arch_static_branch_asm.rs:1:28
   |
   1   | ::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM)
   |                            ^^^^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
   |
   ::: rust/kernel/lib.rs:211:1
   |
   211 | macro_rules! concat_literals {
   | ---------------------------- when calling this macro
   |
   = note: while trying to match sequence start


vim +7 rust/kernel/generated_arch_static_branch_asm.rs.S

169484ab667788 rust/kernel/arch_static_branch_asm.rs.S Alice Ryhl 2024-10-30  6  
169484ab667788 rust/kernel/arch_static_branch_asm.rs.S Alice Ryhl 2024-10-30 @7  ::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM("{symb} + {off} + {branch}", "{l_yes}"))

:::::: The code at line 7 was first introduced by commit
:::::: 169484ab667788e73d1817d75c2a2c4af37dbc7f rust: add arch_static_branch

:::::: TO: Alice Ryhl <aliceryhl@google.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
