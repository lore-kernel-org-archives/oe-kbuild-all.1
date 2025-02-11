Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86E226388F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 19:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301718; cv=none; b=Cb/viBeAB26+qw4wl3Vi+gcr8hVw68EFGZQN7h19nIcZjGs50zgtiHxNc/bxvooK/lHeH+z084Y3N5b0lKL4J0HNYp2/HK5VCz0QpIQAuvN+CluLV6JRnDp/sKtWEvIdT9Iv2fiJPtFuSp+3TKqFyLV+TiYYr1IYmJiUemb1Dos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301718; c=relaxed/simple;
	bh=an+OqzvJ659CbgGiWfy2HCJIq9L7yPkSs+VThOVR1Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4tL86KVgDuVtZ/XPMiKpQmw3w/COFSDRXoevvi4o2JMwSJDqHifz3ae+0jZR3nFkBSm/9CVmEaw16sAA4NoRjib1vAWBpnf9Hk+QqSMZ8xJKf3nHwgQDMaqum7i6uQSkj0G5ReoLfoHrT1JHo6/IGoz4jPKouy+tlc6kh8AgOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMTcqyyI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMTcqyyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739301716; x=1770837716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=an+OqzvJ659CbgGiWfy2HCJIq9L7yPkSs+VThOVR1Po=;
  b=XMTcqyyIkGETCcvo9KBul9HfIX1qXnEmDLVbuXMitGXo77zo8G5Szijo
   oasn8K+hAdzAj9tgXdPrnSWK9Muqt+1/jZapws7f0KV2NfSHT6K06lGXn
   rWLSXAN3+k8rKU8A2EEAP534rQkrsKLsyWaDkeRBjDNASMkwFNfUIFxkv
   k41f/4ULlC8XFb7LJNiKov8wFh4kWc88Gky71XCeJ/q2gt8C6xablktTO
   GaRj6ju/iq43X4MAYGn+a0f+yuxVuC0Jg1MyVV/BUqf0/hqpkpJYnR0YS
   LNrrXVPFrPiMx2ojFdmdtpsWRAg2HPEjdcFkgMN0Riz7is3XTs0hF2szS
   Q==;
X-CSE-ConnectionGUID: ORvYF+hUQP+a+Xq9GzV7nw==
X-CSE-MsgGUID: 3gCYPP1RS+6bjzfDOl4vCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="62405285"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="62405285"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 11:21:55 -0800
X-CSE-ConnectionGUID: xgB4JW0MS+yIC75aTORLvg==
X-CSE-MsgGUID: u36XP4KPQwCDg3aE0WG8uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="113112836"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Feb 2025 11:21:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thvpN-0014b7-0W;
	Tue, 11 Feb 2025 19:21:49 +0000
Date: Wed, 12 Feb 2025 03:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v5] riscv: Add runtime constant support
Message-ID: <202502120355.WlAf0wvw-lkp@intel.com>
References: <20250203-runtime_const_riscv-v5-1-bc61736a3229@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203-runtime_const_riscv-v5-1-bc61736a3229@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-Add-runtime-constant-support/20250204-044527
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250203-runtime_const_riscv-v5-1-bc61736a3229%40rivosinc.com
patch subject: [PATCH v5] riscv: Add runtime constant support
config: riscv-randconfig-r072-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120355.WlAf0wvw-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120355.WlAf0wvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120355.WlAf0wvw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:52:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:32:10: note: instantiated into assembly here
           .option arch,+zba
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:54:32: note: expanded from macro 'runtime_const_ptr'
                           "slli   %[__tmp],%[__tmp],32\n\t"               \
                                                         ^
   <inline asm>:34:2: note: instantiated into assembly here
           add.uw a1,a1,a3
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:60:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:59:10: note: instantiated into assembly here
           .option arch,+zbkb
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:61:25: note: expanded from macro 'runtime_const_ptr'
                           ".option arch,+zbkb\n\t"                        \
                                                ^
   <inline asm>:60:2: note: instantiated into assembly here
           pack    a1,a1,a3
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:52:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:32:10: note: instantiated into assembly here
           .option arch,+zba
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:54:32: note: expanded from macro 'runtime_const_ptr'
                           "slli   %[__tmp],%[__tmp],32\n\t"               \
                                                         ^
   <inline asm>:34:2: note: instantiated into assembly here
           add.uw a3,a3,a4
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:60:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:59:10: note: instantiated into assembly here
           .option arch,+zbkb
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:61:25: note: expanded from macro 'runtime_const_ptr'
                           ".option arch,+zbkb\n\t"                        \
                                                ^
   <inline asm>:60:2: note: instantiated into assembly here
           pack    a3,a3,a4
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:52:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:32:10: note: instantiated into assembly here
           .option arch,+zba
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:54:32: note: expanded from macro 'runtime_const_ptr'
                           "slli   %[__tmp],%[__tmp],32\n\t"               \
                                                         ^
   <inline asm>:34:2: note: instantiated into assembly here
           add.uw a0,a0,a1
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:60:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:59:10: note: instantiated into assembly here
           .option arch,+zbkb
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:61:25: note: expanded from macro 'runtime_const_ptr'
                           ".option arch,+zbkb\n\t"                        \
                                                ^
   <inline asm>:60:2: note: instantiated into assembly here
           pack    a0,a0,a1
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:52:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:32:10: note: instantiated into assembly here
           .option arch,+zba
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zba' (Address Generation Instructions)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:54:32: note: expanded from macro 'runtime_const_ptr'
                           "slli   %[__tmp],%[__tmp],32\n\t"               \
                                                         ^
   <inline asm>:34:2: note: instantiated into assembly here
           add.uw a1,a1,a2
           ^
>> fs/dcache.c:112:9: warning: unknown option, expected 'push', 'pop', 'rvc', 'norvc', 'relax' or 'norelax' [-Winline-asm]
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:60:19: note: expanded from macro 'runtime_const_ptr'
                           ".option push\n\t"                              \
                                          ^
   <inline asm>:59:10: note: instantiated into assembly here
           .option arch,+zbkb
                   ^
>> fs/dcache.c:112:9: error: instruction requires the following: 'Zbp' (Permutation 'Zb' Instructions) or 'Zbkb' (Bitmanip instructions for Cryptography)
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:61:25: note: expanded from macro 'runtime_const_ptr'
                           ".option arch,+zbkb\n\t"                        \
                                                ^
   <inline asm>:60:2: note: instantiated into assembly here
           pack    a1,a1,a2
           ^
>> fs/dcache.c:112:9: error: invalid .org offset '21034' (at offset '21038')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21050' (at offset '21054')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21066' (at offset '21070')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21082' (at offset '21086')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21098' (at offset '21102')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21114' (at offset '21118')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21130' (at offset '21134')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21146' (at offset '21150')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
>> fs/dcache.c:112:9: error: invalid .org offset '21034' (at offset '21038')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21050' (at offset '21054')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:99:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           ALT_NEW_CONTENT(vendor_id_2, patch_id_2, enable_2, new_c_2)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:68:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fs/dcache.c:112:9: error: invalid .org offset '21066' (at offset '21070')
           return runtime_const_ptr(dentry_hashtable) +
                  ^
   arch/riscv/include/asm/runtime-const.h:47:3: note: expanded from macro 'runtime_const_ptr'
                   ALTERNATIVE_2(                                          \
                   ^
   arch/riscv/include/asm/alternative-macros.h:163:2: note: expanded from macro 'ALTERNATIVE_2'
           _ALTERNATIVE_CFG_2(old_content, new_content_1, vendor_id_1, patch_id_1, CONFIG_k_1,     \
           ^
   arch/riscv/include/asm/alternative-macros.h:108:2: note: expanded from macro '_ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),    \
           ^
   arch/riscv/include/asm/alternative-macros.h:98:2: note: expanded from macro '__ALTERNATIVE_CFG_2'
           __ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, patch_id_1, enable_1)    \
           ^
   arch/riscv/include/asm/alternative-macros.h:94:2: note: expanded from macro '__ALTERNATIVE_CFG'
           ALT_NEW_CONTENT(vendor_id, patch_id, enable, new_c)
           ^
   arch/riscv/include/asm/alternative-macros.h:81:3: note: expanded from macro 'ALT_NEW_CONTENT'
           ".org   . - (887b - 886b) + (889b - 888b)\n"                    \
            ^
   <inline asm>:41:6: note: instantiated into assembly here
   .org    . - (887b - 886b) + (889b - 888b)
           ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   8 warnings and 20 errors generated.


vim +/Zba +112 fs/dcache.c

ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  109  
e60cc61153e61e Linus Torvalds  2024-06-10  110  static inline struct hlist_bl_head *d_hash(unsigned long hashlen)
ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  111  {
e78298556ee5d8 Linus Torvalds  2024-06-04 @112  	return runtime_const_ptr(dentry_hashtable) +
e78298556ee5d8 Linus Torvalds  2024-06-04  113  		runtime_const_shift_right_32(hashlen, d_hash_shift);
ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  114  }
ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  115  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
