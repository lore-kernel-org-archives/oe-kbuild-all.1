Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792534290;
	b=Gnpm/Mq5HjJJrjKoWYEjQoFC6JijTIiZcdPIe2X2Xov9LaDJbIXELG6tf4IYtmHuBYRi
	 xo/kaTzxB9+HuxkNjOuyukyn4+ajaRz0uxS29F2xGEI6TVeQcMi7fsMKRnQuCMAx5OkYg
	 H6TOJYdqMKt3EIpM882SV4TvXg+ooFeoctUiV6LGa6BeYHlKLN18B5U7VKeLZmtIG74HB
	 Tb2ped+0gCQujopNfQkzyeGJUSkWkxAsddd68UybYSZ6XsVMWsRnKiGLFTnF7yu/FgxaY
	 5HNxUBHcrrC663eHtA3gJyeZl72x32K5UNolD7OsWqGiba1bYriW1ESOSXnkZ8oXvXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534290;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:Cc:
	 Subject:Message-ID:User-Agent;
	bh=mzPOPbvuh4Co1UIRVBgTRmWaN/HdkZ5C91SoSTpjt/w=;
	b=rb3Iz5bMdG1hrpMJzorvwF/PkI0NlSBRdffLxkoIUVV/xYvcE4tS9Vsxd5uqDHTFVE6/
	 bJsycxfJJi60vTwwFeanD9QVrDNzhbt0fNs4ky/K4RC3yIIEgzpbqK7IxO3Uxhej0Y7Bu
	 MizM+x61hSh4XgAQNRIsAvo2SnUoEYlDxmQ7uUqoahb85GoEVd6qzQ+0VxeuZ9jatznls
	 tMFofOmCQoMcJ3wV82HXGbwJXWSYJxCU0xp+5KIJOcBS4HpHxNA3mtIqqKLqCm5hR8exq
	 p6LMPNSwjsR0k8BPJo3uyIOdO/Ou1QMfHmlvAsqL5P+EzL3hn9mpVkAKMqp7YdWRhYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=(null) smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYzpTZBU;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E3606A31B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 22:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C1E3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=tempfail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dYzpTZBU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792534284; x=1824070284;
  h=date:from:cc:subject:message-id;
  bh=QnLv3qaBAO1rx73F4s17xQ26EyPaILdRLOb+mkeB7TY=;
  b=dYzpTZBUSiwIF43kvUvUFNvhwSD8QQ2Jy9GqHG7VgSkQaMuBrUkW4M38
   7xBxKO+j1BmjztoF4/oqa3HWnBEpN9AiF8RHKL77H6LM8JV3iicHjcKnI
   GXLgxTC4h92OcUGbgmhv2eR8a6wbXKK61vsdmiHOh10POGSifrzwIDUhl
   Rckj49hauAUhDZHxa0fFMeoalYybem0GUabeNaZTXmC2etnmIDmyLqDHD
   juyhvsozKbrwMkYljK49HkmckrCrtoZ6+7DC/ntVV54WUXCz/hgFgTUaP
   /j4lOvnsb9qoB1KqUvtB0dJ5DboYGMC0RGUw49JX8dsFRBBk8o1qnriYi
   Q==;
X-CSE-ConnectionGUID: pnNnewwjS+ivVzkoXPMahA==
X-CSE-MsgGUID: y6e75mWYQJKyusu7x4c1ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1263490"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1263490"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 15:11:09 -0700
X-CSE-ConnectionGUID: oXu+2f2QR7qK3NF7pkGHWg==
X-CSE-MsgGUID: epfhF+UvSiSZCavGVqoMJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3267427"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2026 15:11:07 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJI2z-000000006SJ-1jjr;
	Tue, 20 Oct 2026 22:11:05 +0000
Date: Wed, 21 Oct 2026 00:10:22 +0200
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:asdn-7.2 43/1311] error[E0428]: the name `Mmio` is
 defined multiple times
Message-ID: <202610210048.sOHLqCOj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://gitlab.freedesktop.org/agd5f/linux.git asdn-7.2
head:   daebab22691416366c30db2ad13ef2d18adf912b
commit: e94681f652dfa76700cadf4fb55287d2aff06fac [43/1311] Merge tag 'v7.2' into amd-staging-drm-next
config: um-randconfig-r2108-20261020 (https://download.01.org/0day-ci/archive/20261021/202610210048.sOHLqCOj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210048.sOHLqCOj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210048.sOHLqCOj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:28:
   In file included from include/linux/cgroup_api.h:1:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
   |                                                   ~~~~~~~~~~ ^
   1 warning generated.
   llvm-nm: error: rust/helpers/helpers.o: No such file or directory
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   clang diag: include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>> error[E0428]: the name `Mmio` is defined multiple times
   --> rust/kernel/io.rs:1180:1
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   | ------------------------------------------------------ previous definition of the type `Mmio` here
   ...
   1180 | pub struct Mmio<'a, T: ?Sized> {
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `Mmio` redefined here
   |
   = note: `Mmio` must be defined only once in the type namespace of this module
--
>> error[E0747]: constant provided when a type was expected
   --> rust/kernel/io.rs:249:48
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   |                                                ^^^^
--
>> error[E0107]: struct takes 0 lifetime arguments but 1 lifetime argument was supplied
   --> rust/kernel/io.rs:1220:25
   |
   1220 |     fn as_view(self) -> Mmio<'a, T> {
   |                         ^^^^ -- help: remove the lifetime argument
   |                         |
   |                         expected 0 lifetime arguments
   |
   note: struct defined here, with 0 lifetime parameters
   --> rust/kernel/io.rs:249:12
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   |            ^^^^
--
>> error[E0107]: struct takes 0 lifetime arguments but 1 lifetime argument was supplied
   --> rust/kernel/io.rs:1348:21
   |
   1348 | impl<'a, T: ?Sized> Mmio<'a, T> {
   |                     ^^^^ -- help: remove the lifetime argument
   |                     |
   |                     expected 0 lifetime arguments
   |
   note: struct defined here, with 0 lifetime parameters
   --> rust/kernel/io.rs:249:12
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   |            ^^^^
--
>> error[E0107]: struct takes 0 lifetime arguments but 1 lifetime argument was supplied
   --> rust/kernel/io.rs:1577:20
   |
   1577 |     fn from(value: Mmio<'a, T>) -> Self {
   |                    ^^^^ -- help: remove the lifetime argument
   |                    |
   |                    expected 0 lifetime arguments
   |
   note: struct defined here, with 0 lifetime parameters
   --> rust/kernel/io.rs:249:12
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   |            ^^^^
--
>> error[E0107]: struct takes 0 lifetime arguments but 1 lifetime argument was supplied
   --> rust/kernel/pci/io.rs:275:25
   |
   275 |     fn as_view(self) -> Mmio<'a, Self::Target> {
   |                         ^^^^ -- help: remove the lifetime argument
   |                         |
   |                         expected 0 lifetime arguments
   |
   note: struct defined here, with 0 lifetime parameters
   --> rust/kernel/io.rs:249:12
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   |            ^^^^
--
>> error[E0107]: struct takes 0 lifetime arguments but 1 lifetime argument was supplied
   --> rust/kernel/io.rs:1210:40
   |
   1210 | unsafe impl<T: ?Sized + Sync> Send for Mmio<'_, T> {}
   |                                        ^^^^ -- help: remove the lifetime argument
   |                                        |
   |                                        expected 0 lifetime arguments
   |
   note: struct defined here, with 0 lifetime parameters
   --> rust/kernel/io.rs:249:12
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   |            ^^^^
--
>> error[E0107]: struct takes 0 lifetime arguments but 1 lifetime argument was supplied
   --> rust/kernel/io.rs:1213:40
   |
   1213 | unsafe impl<T: ?Sized + Sync> Sync for Mmio<'_, T> {}
   |                                        ^^^^ -- help: remove the lifetime argument
   |                                        |
   |                                        expected 0 lifetime arguments
   |
   note: struct defined here, with 0 lifetime parameters
   --> rust/kernel/io.rs:249:12
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   |            ^^^^
--
>> error[E0107]: struct takes 0 lifetime arguments but 1 lifetime argument was supplied
   --> rust/kernel/io.rs:1575:26
   |
   1575 | impl<'a, T: ?Sized> From<Mmio<'a, T>> for IoSysMap<'a, T> {
   |                          ^^^^ -- help: remove the lifetime argument
   |                          |
   |                          expected 0 lifetime arguments
   |
   note: struct defined here, with 0 lifetime parameters
   --> rust/kernel/io.rs:249:12
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   |            ^^^^
--
>> error[E0107]: struct takes 0 lifetime arguments but 1 lifetime argument was supplied
   --> rust/kernel/io.rs:1229:44
   |
   1229 |     type View<'a, T: ?Sized + KnownSize> = Mmio<'a, T>;
   |                                            ^^^^ -- help: remove the lifetime argument
   |                                            |
   |                                            expected 0 lifetime arguments
   |
   note: struct defined here, with 0 lifetime parameters
   --> rust/kernel/io.rs:249:12
   |
   249 | pub struct Mmio<const SIZE: usize = 0>(MmioRaw<SIZE>);
   |            ^^^^
--
>> error[E0282]: type annotations needed
   --> rust/kernel/io.rs:1258:45
   |
   1258 |                 unsafe { bindings::$read_fn($backend::as_ptr(view).cast_const().cast()) }
   |                                             ^^^^^^^^^^^^^^^^^^^^^^ cannot infer type
   ...
   1377 | impl_mmio_io_capable!(RelaxedMmioBackend, u8, readb_relaxed, writeb_relaxed);
   | ---------------------------------------------------------------------------- in this macro invocation
   |
   = note: this error originates in the macro `impl_mmio_io_capable` (in Nightly builds, run with -Z macro-backtrace for more info)
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
