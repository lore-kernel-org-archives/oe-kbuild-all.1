Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111C1191F7A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 19:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731784924; cv=none; b=dTMPsKGKJ88OL17wd5/k/i/iN22nGQ22KmheG7D8L6q0GhrGO7LGbIfa3vO5A/4Z+UtshyyHTmxnal7jXZVuVHJj9VQFcEM3y0Fvk+tIQpWnY70HUlz8hkfhP5w5HMwGX39qTJhqWTrkpMDlKA9V7mfgDiLowa12GhgRxUlwCd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731784924; c=relaxed/simple;
	bh=9fuQh6eMmt3ExJm1HlFXIbAtBqKGiSyJDG6dgR65TiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rucg9LJh6u4bWoeB3Rw221X0Bo7wwSWBcSpaaPXUtonCBYk7nKBumnlCQbCIUXusORVwG2O9AxOWiN3GOifidiblHNgD2JRDO3uJFFV0z83RmL0VikP5qamZ0loyKkevLWe8FdXKXoCDZmZdjws9nXRApWu+DN089Zy4zazncLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2PKcbWb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2PKcbWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731784922; x=1763320922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9fuQh6eMmt3ExJm1HlFXIbAtBqKGiSyJDG6dgR65TiE=;
  b=E2PKcbWb/xuKO3i7ZdWqrBRm8rmNyffkXDXVVMq34+AbDtBq4lJYWnwk
   kVZypdHJ2T2ZeyemN9Ysy5V/gnSs7aYrItVg3IhkcFEzlIJIvui6BqE+p
   J4jt+dMAAAbhUjQZqkJAN0+SjzDrOMD/D5VnVWU6punGwe2ewKd577UpT
   yElcXytMzLvzbRwrDGfKcfBTsJ3z/c3aaw//iLEvVx/CZ7J1EJYGM/Xzq
   ZRIywUYW9TrLB8btJohURIR6zY5xA993TkG+b5JyPUIFslycwg5rVMtRU
   vmZM4xYfWVErasS14vRDI8hYsXNecckxEX64GoaMr5KvZc2ENjdvPzvND
   g==;
X-CSE-ConnectionGUID: l/E4w+2EQjCBkpQwUc15qQ==
X-CSE-MsgGUID: 1n4i4YRBRt+J+yonpTae9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31840584"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31840584"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 11:22:01 -0800
X-CSE-ConnectionGUID: O6Aw42yiRf61OWb/VDPJWA==
X-CSE-MsgGUID: WA0RpCOJTW2MZ3IOle9ZNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88849460"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 11:22:01 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCOMo-00013d-1D;
	Sat, 16 Nov 2024 19:21:58 +0000
Date: Sun, 17 Nov 2024 03:21:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 32/259]
 arch/x86/kvm/vmx/pkvm/hyp/mmu.c: mmu.h is included more than once.
Message-ID: <202411170337.mrWnAmVP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: a06e8b3cefaeab6b9bdfd20d445857d1e7ff8bfe [32/259] ANDROID: pkvm: x86: Introduce MMU pgtable support
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170337.mrWnAmVP-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/pkvm/hyp/mmu.c: mmu.h is included more than once.

vim +9 arch/x86/kvm/vmx/pkvm/hyp/mmu.c

   > 9	#include <mmu.h>
    10	#include <mmu/spte.h>
    11	
    12	#include <pkvm.h>
    13	#include "early_alloc.h"
    14	#include "pgtable.h"
  > 15	#include "mmu.h"
    16	#include "debug.h"
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
