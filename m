Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8352379C55
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 19:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563610; cv=none; b=FjK9PY9xzQd5FGBM20ZtiWeYVNn2axr0Qfl/8EWmJf+rgDvXvImpKkxmMYYfDD0H8uu1S0h9PPShvURY0TdPTsLq2AqKiMF2EzprljCnWrH2bOpuyVxj1ej7psQSJWQjBzFUqt8xWntujCPNyiw7ARlIQHV32WxRRTfZbn5Bg9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563610; c=relaxed/simple;
	bh=3fi11b3NFHd9qhMoo7cxQxRQoVkeNgNC3m/8cIiYyLk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ivxJ8xKCtjujOMZcke4HaGBhQWjKhx/XNzKlv+bVzmtch+nwT9L+fJVKbK7fD6ZETzjtFgi6XYXdhku/mGRE86qd2iUg5/8/OuvxwM69zjcGGMLFu9eWjgvABU4xE3HcYuyQDtEPIbydcbHrl1GImd6G8RkkLV8QkPJ9k5Ol9Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9woB8Nm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9woB8Nm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786563609; x=1818099609;
  h=date:from:to:cc:subject:message-id;
  bh=3fi11b3NFHd9qhMoo7cxQxRQoVkeNgNC3m/8cIiYyLk=;
  b=m9woB8Nm1N1lTeYD0UemzweiY3asR4GvwIfd8XEA5F/OLvA3pjg6WbD3
   eUkQxj7UJh50cDLsxU+Fu+oZJq0NOLnqoJ10+sKKNfsnNBVdIm9iK9oJm
   lBt4hqnWT6SWZubmGDmVBgOEsMe6uhJJ4JByKSEZYY1QJqpZJY+rLyHP0
   QEUEG04rdwmu7jwpLPacRMnKVq0eWzyO3+XeYiEBdvE3kKAPh6r5SC27D
   ynmz1Eg0wP6Xy7b2+2nTFOnw1S9k7+u1Jt4jjicFf4cfHVhInoBmYonqW
   i8mbEl3aHMWPXr2mF4ztwLDlY7NGAiULG3GZyNL9pR7MpWfflp3ZyS3z2
   A==;
X-CSE-ConnectionGUID: 3IxLqEaATtGFUxw3JPhL8A==
X-CSE-MsgGUID: Q3OtGJvpRmOdKmbuqMoO8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="97714004"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="97714004"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 12:40:08 -0700
X-CSE-ConnectionGUID: tAhAz+FJSamWIUGCbmJvsA==
X-CSE-MsgGUID: mq0qmkPXTDOfJKlVBuzaeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="267998769"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Aug 2026 12:40:07 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuEo0-00000000RTu-3InY;
	Wed, 12 Aug 2026 19:40:04 +0000
Date: Thu, 13 Aug 2026 03:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 1/1] kernel/kcov.c:296:14:
 warning: mismatch in argument 1 type of built-in function
 '__sanitizer_cov_trace_switch'; expected 'long unsigned int'
Message-ID: <202608130359.g6552qOP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   1d929bc650954dfa344168039d30b1bc13a3e48e
commit: c2985e13ddc87258e98fad13e435129a210092b6 [1/1] UPSTREAM: ubsan: enable for all*config builds
config: arm64-randconfig-003-20260813 (https://download.01.org/0day-ci/archive/20260813/202608130359.g6552qOP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130359.g6552qOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130359.g6552qOP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/kcov.c:262:14: warning: mismatch in argument 1 type of built-in function '__sanitizer_cov_trace_cmp8'; expected 'long unsigned int' [-Wbuiltin-declaration-mismatch]
     262 | void notrace __sanitizer_cov_trace_cmp8(u64 arg1, u64 arg2)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kcov.c:289:14: warning: mismatch in argument 1 type of built-in function '__sanitizer_cov_trace_const_cmp8'; expected 'long unsigned int' [-Wbuiltin-declaration-mismatch]
     289 | void notrace __sanitizer_cov_trace_const_cmp8(u64 arg1, u64 arg2)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kcov.c:296:14: warning: mismatch in argument 1 type of built-in function '__sanitizer_cov_trace_switch'; expected 'long unsigned int' [-Wbuiltin-declaration-mismatch]
     296 | void notrace __sanitizer_cov_trace_switch(u64 val, u64 *cases)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +296 kernel/kcov.c

ded97d2c2b2c5f Victor Chibotaru 2017-11-17  261  
ded97d2c2b2c5f Victor Chibotaru 2017-11-17 @262  void notrace __sanitizer_cov_trace_cmp8(u64 arg1, u64 arg2)
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  263  {
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  264  	write_comp_data(KCOV_CMP_SIZE(3), arg1, arg2, _RET_IP_);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  265  }
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  266  EXPORT_SYMBOL(__sanitizer_cov_trace_cmp8);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  267  
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  268  void notrace __sanitizer_cov_trace_const_cmp1(u8 arg1, u8 arg2)
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  269  {
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  270  	write_comp_data(KCOV_CMP_SIZE(0) | KCOV_CMP_CONST, arg1, arg2,
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  271  			_RET_IP_);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  272  }
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  273  EXPORT_SYMBOL(__sanitizer_cov_trace_const_cmp1);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  274  
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  275  void notrace __sanitizer_cov_trace_const_cmp2(u16 arg1, u16 arg2)
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  276  {
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  277  	write_comp_data(KCOV_CMP_SIZE(1) | KCOV_CMP_CONST, arg1, arg2,
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  278  			_RET_IP_);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  279  }
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  280  EXPORT_SYMBOL(__sanitizer_cov_trace_const_cmp2);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  281  
689d77f001cd22 Dmitry Vyukov    2017-12-14  282  void notrace __sanitizer_cov_trace_const_cmp4(u32 arg1, u32 arg2)
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  283  {
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  284  	write_comp_data(KCOV_CMP_SIZE(2) | KCOV_CMP_CONST, arg1, arg2,
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  285  			_RET_IP_);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  286  }
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  287  EXPORT_SYMBOL(__sanitizer_cov_trace_const_cmp4);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  288  
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  289  void notrace __sanitizer_cov_trace_const_cmp8(u64 arg1, u64 arg2)
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  290  {
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  291  	write_comp_data(KCOV_CMP_SIZE(3) | KCOV_CMP_CONST, arg1, arg2,
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  292  			_RET_IP_);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  293  }
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  294  EXPORT_SYMBOL(__sanitizer_cov_trace_const_cmp8);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  295  
ded97d2c2b2c5f Victor Chibotaru 2017-11-17 @296  void notrace __sanitizer_cov_trace_switch(u64 val, u64 *cases)
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  297  {
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  298  	u64 i;
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  299  	u64 count = cases[0];
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  300  	u64 size = cases[1];
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  301  	u64 type = KCOV_CMP_CONST;
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  302  
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  303  	switch (size) {
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  304  	case 8:
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  305  		type |= KCOV_CMP_SIZE(0);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  306  		break;
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  307  	case 16:
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  308  		type |= KCOV_CMP_SIZE(1);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  309  		break;
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  310  	case 32:
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  311  		type |= KCOV_CMP_SIZE(2);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  312  		break;
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  313  	case 64:
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  314  		type |= KCOV_CMP_SIZE(3);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  315  		break;
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  316  	default:
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  317  		return;
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  318  	}
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  319  	for (i = 0; i < count; i++)
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  320  		write_comp_data(type, cases[i + 2], val, _RET_IP_);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  321  }
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  322  EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  323  #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
ded97d2c2b2c5f Victor Chibotaru 2017-11-17  324  

:::::: The code at line 296 was first introduced by commit
:::::: ded97d2c2b2c5f1dcced0bc57133f7753b037dfc kcov: support comparison operands collection

:::::: TO: Victor Chibotaru <tchibo@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
