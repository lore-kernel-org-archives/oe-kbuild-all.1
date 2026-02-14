Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411651ACED5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771073670; cv=none; b=EnljkiICjLNvGy+lxESOOjFVxYBE/qHWU9ztl2/+CQbDYp3DXWWU02eLq3PvwoXIYHeWmZvttWCtmyBpmBe6vAW87sGNdufib4PsfiNecCCTSD9zsvDW3qTaiMN5wCvugZkhl5uKfZvlkdM9CBGfvRmV1Hh5SWBPBzrDgAg9gaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771073670; c=relaxed/simple;
	bh=dcQddGk7gaBZC4c/wzfh/t4U9+dLBQ0O0Qh3ghV3cLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZYS8TOgSRpJoCn1jNKErIUA+vaXtbZF+aOYQgIQ+JLmQMqHbkPlnHXjz0aCdJEni0oYKaDoe/CQfeb0fMrIsQnCrPd1uM9R8qxUEZNV6fjxF8nVvz6BBmVw3qLogzO90b4A1UyrjrAUUnFh1bjEJQAbdtXLSoXZZ3CIBrDe6wc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFyn+fSs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFyn+fSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771073669; x=1802609669;
  h=date:from:to:cc:subject:message-id;
  bh=dcQddGk7gaBZC4c/wzfh/t4U9+dLBQ0O0Qh3ghV3cLo=;
  b=JFyn+fSsC7BrfsN3XaW/fl3blys90f/HXzhr817n9gpZ3+/dK7NTnVic
   r0a3T4AyPH10MzSNltkcmIWMjbMRaRMZFvwUq8zu0qacNkSaio+ZDD/Po
   9xZnzZkwYO7KrxhhVTYqpmS6HPjr+HBAOYg/P0fJcBm/Jh1LUG4zigS2e
   Tpw6M6ybDDVHI/9d+hDOdvinx4ZW6qF3f3Po5+zrOYP4AFFZIkQtvcB8j
   2x3n9rriTakTNsTsucVcX6aA+Ayi6sNfZ03O2TEwDda31iraniRr/KLgC
   PtiAGLC7F19vny2wtuBTiE/tK21RGDm5Tjuatsa11VjNTaS1MUvi6tf6n
   g==;
X-CSE-ConnectionGUID: eMVN4eXDQNqHvo7SHBAzcg==
X-CSE-MsgGUID: 8iLojUU+SH+qcJaPBzmnHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="59807143"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="59807143"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 04:54:29 -0800
X-CSE-ConnectionGUID: +0nYg4V2T6CoVEEevZItJQ==
X-CSE-MsgGUID: HkVEh/FYSn+Xu76n1+uKyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="218140959"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Feb 2026 04:54:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrFAG-00000000wXq-3k2B;
	Sat, 14 Feb 2026 12:54:24 +0000
Date: Sat, 14 Feb 2026 20:53:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:qp-trie 4/8] kernel/bpf/qp_trie.c:101:31: sparse:
 sparse: cast removes address space '__rcu' of expression
Message-ID: <202602142021.1eA0MKQI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git qp-trie
head:   85dca79aa9199152741f7429b86cf4cb78f21124
commit: 8e2c1f634e226c78b9fe6fcf77a0e1d2769d7143 [4/8] bpf: Add QP-trie map type
config: i386-randconfig-062-20260214 (https://download.01.org/0day-ci/archive/20260214/202602142021.1eA0MKQI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602142021.1eA0MKQI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602142021.1eA0MKQI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/qp_trie.c:101:31: sparse: sparse: cast removes address space '__rcu' of expression
>> kernel/bpf/qp_trie.c:101:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:101:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:101:31: sparse:    void *
>> kernel/bpf/qp_trie.c:101:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:101:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:101:31: sparse:    void *
   kernel/bpf/qp_trie.c:107:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:107:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:107:31: sparse:    void *
   kernel/bpf/qp_trie.c:113:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:113:9: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:113:9: sparse:    void *
   kernel/bpf/qp_trie.c:107:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:107:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:107:31: sparse:    void *
   kernel/bpf/qp_trie.c:107:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:107:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:107:31: sparse:    void *
   kernel/bpf/qp_trie.c:107:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:107:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:107:31: sparse:    void *
   kernel/bpf/qp_trie.c:113:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:113:9: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:113:9: sparse:    void *
   kernel/bpf/qp_trie.c:107:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:107:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:107:31: sparse:    void *
   kernel/bpf/qp_trie.c:107:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:107:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:107:31: sparse:    void *
   kernel/bpf/qp_trie.c:113:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:113:9: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:113:9: sparse:    void *
   kernel/bpf/qp_trie.c:113:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:113:9: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:113:9: sparse:    void *
   kernel/bpf/qp_trie.c:107:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:107:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:107:31: sparse:    void *
   kernel/bpf/qp_trie.c:107:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:107:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:107:31: sparse:    void *
   kernel/bpf/qp_trie.c:113:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:113:9: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:113:9: sparse:    void *
   kernel/bpf/qp_trie.c:113:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:113:9: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:113:9: sparse:    void *
   kernel/bpf/qp_trie.c:113:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:113:9: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:113:9: sparse:    void *
>> kernel/bpf/qp_trie.c:101:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:101:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:101:31: sparse:    void *
>> kernel/bpf/qp_trie.c:101:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:101:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:101:31: sparse:    void *
>> kernel/bpf/qp_trie.c:101:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:101:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:101:31: sparse:    void *
>> kernel/bpf/qp_trie.c:101:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:101:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:101:31: sparse:    void *
>> kernel/bpf/qp_trie.c:101:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/qp_trie.c:101:31: sparse:    void [noderef] __rcu *
   kernel/bpf/qp_trie.c:101:31: sparse:    void *

vim +/__rcu +101 kernel/bpf/qp_trie.c

    98	
    99	static inline unsigned long qp_deref(unsigned long *p)
   100	{
 > 101		return (unsigned long)rcu_dereference_check(
   102			*(void *__rcu __force *)p, rcu_read_lock_bh_held());
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
