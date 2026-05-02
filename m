Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ED31FBEBC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 07:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777707933; cv=none; b=G7Oz8it7GxsAj3s72ZVKyiCD10M8agRukFD5jp0+AbtT9Dwvngq1tiGlUMReWFZ4vaajDtvYuRry5QhKOIu2NhKIjcF8w5+ZcQedD3a1V0FHYYSAEvPFRgjxmFUKavHOAgsIIB2u35peEucHX/F5IU7AANF868dR+LZT/8oQB+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777707933; c=relaxed/simple;
	bh=b7UMK8mjgWHbZB/VDcBxYyUZBUuq8YUHq4LZARrl+2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=osH0o9QBRigXswfTT7uaGBksVf955TEz2l+F5+3M0gWFkj/Di3gihpDJJjmEUlDPXEZ1+0LxBZRgGlQyKKBwkmhHq0moHHtoJh1iOaBI0CCHvIpl8ReRRG455kh+9Q4P14Sj4WNjBP+W1k9NJc8eQ7cZKIvkhGbrzAs+DHXfS2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZ6Mrtnv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZ6Mrtnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777707931; x=1809243931;
  h=date:from:to:cc:subject:message-id;
  bh=b7UMK8mjgWHbZB/VDcBxYyUZBUuq8YUHq4LZARrl+2E=;
  b=AZ6MrtnvgbBShJddAxdvwEQt+Z9JmAu0f46R80Kc02RKWMlBukb9p0dr
   eF/ge1deiux5aCnfuPbyoEkNrljq1Y9EXCMqOnD6VmP+d5vVtVlsw6hGm
   ls42YkHp0ljTaOpmibJ5roWWhJcSux9vsJUH7owrwqnMR/B3BYY63hDOH
   fQ8pEnNvr5qZ3znP8sFyPAh+T5MZ+v9IdC9gfLnf4cZBRpzInOnMLStjh
   ufApRjuhIAZe3Lx6HU1JSXh1Ta94Gur2X2N/IwBv7EgfS4jgspsY73036
   7Bwa7A05T5fiCg332Ndc7y8CTKNtmkqr6sXMHXr8AmDq2KxBQTLwTIHi2
   g==;
X-CSE-ConnectionGUID: V939AsBBSrCIIJB+xHdqAw==
X-CSE-MsgGUID: VTjOJYijTMumUdug7vsgCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="89344702"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="89344702"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 00:45:31 -0700
X-CSE-ConnectionGUID: 1U1euSegR46mnlUnMyRuTQ==
X-CSE-MsgGUID: 6B1j9NusRKqr3sH7IdMOZA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 May 2026 00:45:30 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ52V-000000001Ef-49mU;
	Sat, 02 May 2026 07:45:27 +0000
Date: Sat, 02 May 2026 15:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:rust-bpf 2/14] kernel/bpf/helpers.c:3274:18:
 sparse: sparse: symbol '_Unwind_Resume' was not declared. Should it be
 static?
Message-ID: <202605021536.zJK0CaKr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git rust-bpf
head:   1623628cc9588b205a0e913c5e62d267ef0f6d70
commit: c600490dd1c522f33cb608687588d9f16af70f8c [2/14] kernel and libbpf hacks
config: sparc64-randconfig-r132-20260430 (https://download.01.org/0day-ci/archive/20260502/202605021536.zJK0CaKr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021536.zJK0CaKr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021536.zJK0CaKr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1212:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1212:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1212:21: sparse:     got void [noderef] __rcu *
   kernel/bpf/helpers.c:2734:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2764:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
>> kernel/bpf/helpers.c:3274:18: sparse: sparse: symbol '_Unwind_Resume' was not declared. Should it be static?
   kernel/bpf/helpers.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, arch/sparc/include/asm/atomic.h, ...):
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (eb9f becomes 9f)

vim +/_Unwind_Resume +3274 kernel/bpf/helpers.c

  3273	
> 3274	__bpf_kfunc void _Unwind_Resume(void) {}
  3275	__bpf_kfunc void bpf_alloc(void) {}
  3276	__bpf_kfunc void bpf_free(void) {}
  3277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
