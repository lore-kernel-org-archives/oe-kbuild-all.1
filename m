Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A4EDF42
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 02:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733021075; cv=none; b=KWK9A9hs/NwWLoh8ZZ3lPEX22J/pdJWQIgr3K8p/L1F5PpkT7uckGOX5ojfbWqpzcH8DNNXzfki+PHVea5fr+eN42DntZFv6idtcth2uXRc3/jnVfeQZeVc/LQSy6Q0bPc5aovDB37Z3UywaVnJd53N98cVKrCIWV1WPMailz6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733021075; c=relaxed/simple;
	bh=nJR06HWvdkI+gTdDiX48Qww+zzq+8SMeWcqfrBjPcSI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QXtK9qcRZIOPXY2esMYa084FiALJ3HO9KraZ7LrEdSysZtyDAn+0W3Rd8AXiLf+dLX579/d3Pknw/t6jJ7S39Sqps6dlhDYO91jcls8Ag+0G5vJFQux1LloCYFJCR4PatNTOptPZ4f63VhietVay2Myp+ypf0r10s3vPOMuxTfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqBWcgWf; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqBWcgWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733021073; x=1764557073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJR06HWvdkI+gTdDiX48Qww+zzq+8SMeWcqfrBjPcSI=;
  b=dqBWcgWfYJHrqnAZw98gvPHyLDRFgW1GYoyOTpUE4NoHYDiuZbifq6NP
   QIVG/jBLEDfU+5eJG5+wXXVQWbR6Bv6gamE0uOWHrQxKNlh3ehp/8Z6vO
   dtUoMSFblCYV8y9wOmU44tAs3HrUWa0P+bykHePpcTcJxK/1X6A+oCPof
   RrGEYFq5SzlksBSp3z9LVftCdYLYt0YqcUdtwqyMFgx428rUPPuBnXlsO
   WGp1GD5yssp9VL9mR4Tu2x6xKaC4Qh/2EO1VoHKH6JXe1BJfAk8J04Jf6
   I74Q9oBRpzTnhYQjF8PyqyeLIH7gsrHk3uaiNr/54+RZfDoIOuWCgAuXX
   w==;
X-CSE-ConnectionGUID: mJT55sAtQFi0THrxlzGwhw==
X-CSE-MsgGUID: cboymlfrRbeJhITOj7cf8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="55694051"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="55694051"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 18:44:33 -0800
X-CSE-ConnectionGUID: Vt1oHDLpR62orD5nGf9Y7Q==
X-CSE-MsgGUID: r3Sm6c74QY6D5l6jOsKC1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="92869902"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 30 Nov 2024 18:44:31 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHZwj-0001AJ-1N;
	Sun, 01 Dec 2024 02:44:29 +0000
Date: Sun, 1 Dec 2024 10:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Yejian <zhengyejian1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] kernel/module/strict_rwx.c:36:6:
 warning: no previous prototype for function 'module_disable_ro'
Message-ID: <202412011012.Rb9u97rY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zheng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: c8783f92771c891518257c9deb22cd91d4e1a212 [1474/1474] livepatch/core: Revert module_enable_ro and module_disable_ro
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241201/202412011012.Rb9u97rY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412011012.Rb9u97rY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011012.Rb9u97rY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/strict_rwx.c:36:6: warning: no previous prototype for function 'module_disable_ro' [-Wmissing-prototypes]
   void module_disable_ro(const struct module *mod)
        ^
   kernel/module/strict_rwx.c:36:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void module_disable_ro(const struct module *mod)
   ^
   static 
   1 warning generated.


vim +/module_disable_ro +36 kernel/module/strict_rwx.c

    34	
    35	#ifdef CONFIG_LIVEPATCH_WO_FTRACE
  > 36	void module_disable_ro(const struct module *mod)
    37	{
    38		if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
    39			return;
    40	#ifdef CONFIG_STRICT_MODULE_RWX
    41		if (!rodata_enabled)
    42			return;
    43	#endif
    44	
    45		module_set_memory(mod, MOD_TEXT, set_memory_rw);
    46		module_set_memory(mod, MOD_INIT_TEXT, set_memory_rw);
    47		module_set_memory(mod, MOD_RODATA, set_memory_rw);
    48		module_set_memory(mod, MOD_INIT_RODATA, set_memory_rw);
    49	}
    50	#endif /* CONFIG_LIVEPATCH_WO_FTRACE */
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
