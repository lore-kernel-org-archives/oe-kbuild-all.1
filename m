Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB082231832
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 04:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787544476; cv=none; b=NjjE5V18vV7PW3YsUJkgpKUzm140Wn9ZlTAyBzXSPrPIdDMvVBQ5kCHG46zzP+BNfYl1Am/Sy9aSL39AOeJDgfeooaKw2iqmP95u7tUU8MRUvRjeOPIgHVIZI4kEgWFT76F5X60rTJ414ZoUZhkN8PPen0ulgOT+FdcG/oD0czk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787544476; c=relaxed/simple;
	bh=6vp8ZgOVxAaK9MAAo7Yd5DfIlIKXfWlVYbS0SZiRvoI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QmjZnpvIWK2ac4zo7YVMUBcH6sfszEf0snRl7Lv9qVsGyLw2RZK2sWPVY85Kti+mJjahFQfxjz2b3MCkRnSMqkQsWWOmKrUN2AS/64eeGa4lkXSS5I0cDAF6lDpRrE9ba3xXQR+DbaCGACqf0NBouKFvb8QGyFr3kuQKboO4Ih0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYO1vBpD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYO1vBpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787544474; x=1819080474;
  h=date:from:to:cc:subject:message-id;
  bh=6vp8ZgOVxAaK9MAAo7Yd5DfIlIKXfWlVYbS0SZiRvoI=;
  b=KYO1vBpDFmAfwDpfGgv/MUcSa8stclHz4wyecld9qon3jBM03A9BK6M1
   oyuKVmjMWfQouTtrJyzwVX4w9hZPQSmhhWMf6l/OlM2tLcgrjnJw0ugpz
   yKM7LzPZcHoSd94XqA3y6y+NBE3PlwgfUmWnGsicDWWKjipvZFSxYGsxy
   XmPeSThuBFBKtAMQ3zkkvBSHaZVWgeCi+l90IPLOZiDhzPRHuZ8iKqjIs
   Ajjz9o46SziPswclPsLQZ7KSpnrf7lPGJ+Ww4+IDh1MihYByIMWJykIGH
   Ph7tjiH5JBqgukRfDcA2kC7CD3crB334A/tYojkpd3tmDsCkJ8pKgM+p/
   g==;
X-CSE-ConnectionGUID: YPGwwRELQOyhcBXQ9ME4dA==
X-CSE-MsgGUID: qcP7RO5vR7yal/K5ZWD0JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="113522882"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="113522882"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 21:07:53 -0700
X-CSE-ConnectionGUID: QKT7iwUBSvSTsVyDO6PgUw==
X-CSE-MsgGUID: lEG9WMLPQUCW5+TAJrwdzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="266929124"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 Aug 2026 21:07:52 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyLyP-000000000GZ-1Fok;
	Mon, 24 Aug 2026 04:07:49 +0000
Date: Mon, 24 Aug 2026 06:07:34 +0200
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip-7.2 641/964] Diff in
 rust/kernel/drm/gem/mod.rs:5:
Message-ID: <202608240526.oi1bGE4U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux asahi-wip-7.2
head:   57124f5176e4a4ceb553942a5f3de94cb5035877
commit: 345c967ea864a20020623fa38bcb893e2a09d6e5 [641/964] rust: drm: gem: Add export() callback
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260824/202608240526.oi1bGE4U-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240526.oi1bGE4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240526.oi1bGE4U-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j128 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/drm/gem/mod.rs:5:
    //! C header: [`include/drm/drm_gem.h`](srctree/include/drm/drm_gem.h)
    
    use crate::{
   -    bindings,
   -    dma_buf,
   +    bindings, dma_buf,
        drm::{
            self,
            device::{
>> Diff in rust/kernel/drm/gem/mod.rs:5:
    //! C header: [`include/drm/drm_gem.h`](srctree/include/drm/drm_gem.h)
    
    use crate::{
   -    bindings,
   -    dma_buf,
   +    bindings, dma_buf,
        drm::{
            self,
            device::{
>> Diff in rust/kernel/drm/gem/mod.rs:5:
    //! C header: [`include/drm/drm_gem.h`](srctree/include/drm/drm_gem.h)
    
    use crate::{
   -    bindings,
   -    dma_buf,
   +    bindings, dma_buf,
        drm::{
            self,
            device::{
   Diff in drivers/gpu/drm/nova/file.rs:4:
    use crate::gem::NovaObject;
    use kernel::{
        alloc::flags::*,
   -    auxiliary,
   -    bindings,
   +    auxiliary, bindings,
        device::Bound,
        drm::{
            self,
   Diff in drivers/gpu/drm/nova/file.rs:4:
    use crate::gem::NovaObject;
    use kernel::{
        alloc::flags::*,
   -    auxiliary,
   -    bindings,
   +    auxiliary, bindings,
        device::Bound,
        drm::{
            self,
   make[2]: *** [Makefile:1996: rustfmt] Error 123
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
