Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D43388380
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Apr 2026 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777492465; cv=none; b=Qz+dEmJRBcjf8wCltdHQGrNBxHPX/w+64oZtIWbLUgryqtoe+AqWbsVUv0kY24QB26ag3ulkT9IY4NZ5XXUj1NYMotOjjBfV42SMkDFEiHrTwDKXCUUHAqdjZ7vD19cmMkWIrSVqQqYzoPq3AQ5xpL1SkWQvYx3QW4gB/Si9xH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777492465; c=relaxed/simple;
	bh=ipCqlMZ8sDbxwcp9VkMtdgE7HREeDPG7W4kG1bE95fg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZphvAOteLOV5oN3nLSDJZmPCYWww8xYbeyZtHa4RJ2+Ly7DHAGKrwzHoXOwlANBeYx7ck+3PY2MPWccRsGryrWh2Q79m4wvOl98xZbQvkNrza5uwkQSinXNsu+T54luQr+uqzGwqT0tBUkocZVMF+9Zggu/GOCOSGm3OrFfRwBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/BdrF4P; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/BdrF4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777492464; x=1809028464;
  h=date:from:to:cc:subject:message-id;
  bh=ipCqlMZ8sDbxwcp9VkMtdgE7HREeDPG7W4kG1bE95fg=;
  b=F/BdrF4PhiwxHDNIX7oW5aPBJjyOl0kZsjxFU/elYge6xmmatIwf8RW0
   UOH9eGfT2LtFALBRt4NNApEW09RNHoxzbtOas/AfNgCNlIqo9FG+im98T
   Zsohg497tApCuIUtVL3CGSKres1GH3qhk21c0fsCxj9q8+R5AlUW9znnS
   XXvivgDjTa7InuwE3vJXVMPSFVJDdexp3wUkCMoQjVrEYp5EX6HYpcT+s
   oGQzj2zW9oXo+A8KQKHs/+ptrU5ZFbz/lI7ol3HctROU+EmsXknH25LY3
   U746+ZaOgDDDTnFN9RZ83i1MkRsuZdNpa160sEcjze+xBVI7/ObuqK0kt
   w==;
X-CSE-ConnectionGUID: sEybK6qcQPKJzKXQNNiC3g==
X-CSE-MsgGUID: jd5GSzD/R2aekRCXDvfhlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="77599404"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="77599404"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:54:23 -0700
X-CSE-ConnectionGUID: oIrpeuVlRMqwzCPawW4jHQ==
X-CSE-MsgGUID: 7B/cbQnMTS2k5o2Dc4iK/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234636082"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2026 12:54:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIAzE-000000004Yr-07T2;
	Wed, 29 Apr 2026 19:54:20 +0000
Date: Wed, 29 Apr 2026 21:53:22 +0200
From: kernel test robot <lkp@intel.com>
To: Wenzhao Liao <wenzhaoliao@ruc.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in rust/kernel/pci/io.rs:4:
Message-ID: <202604292120.WooxA9hc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Wenzhao-Liao/uapi-add-goldfish_address_space-userspace-ABI-header/20260417-163828
head:   baf6fc99a94d4efae78273b11f66fcc307adffcf
commit: d26d49bf580cb48f77eb1bd5d7d1f673cf0bba73 rust: pci: add shared BAR memremap support
date:   12 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260429/202604292120.WooxA9hc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604292120.WooxA9hc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604292120.WooxA9hc-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j768 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/pci/io.rs:4:
    
    use super::Device;
    use crate::{
   -    bindings,
   -    device,
   +    bindings, device,
        devres::Devres,
        ffi::{c_ulong, c_void},
        io::{
>> Diff in rust/kernel/pci/io.rs:4:
    
    use super::Device;
    use crate::{
   -    bindings,
   -    device,
   +    bindings, device,
        devres::Devres,
        ffi::{c_ulong, c_void},
        io::{
>> Diff in rust/kernel/pci/io.rs:4:
    
    use super::Device;
    use crate::{
   -    bindings,
   -    device,
   +    bindings, device,
        devres::Devres,
        ffi::{c_ulong, c_void},
        io::{
   make[2]: *** [Makefile:1933: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
