Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32CB2F9D85
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 18:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776362803; cv=none; b=Nm4cMNMS/jt1m0NEFwBABSpeLfby7x1qiBPpyMd/m6fIzyI+qwVXyQhqmYPlPpWGw9j2AmZB7NrKbVaFUQtjVQP+osvBULCL+Ee+kLgKJHrPPiGfvq8kdJMSvPVo0F+mO+lwTZto6CqQa/cPQRCSr1ix1fLupcWPKIVVOGFeeUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776362803; c=relaxed/simple;
	bh=KLTkdpsutvox5pakD0Xk6t2meJkuHtb613NozqP2kDI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mOcMHVKuxMsjKJOjtwpHEkPTWxiX08fhda5hQYmrmRce+tq1l9e37nvmD0kojEyw94upIEZqqjEOb9F07zW2wj+viv0zGI52r6t8q8UylUMvBFfYbEUnzIh8iUSiwOz1lOqazL/15dRmFa2vkDHKfY5pzTlq+yTbSsH9EfSQDyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQHM+3ZU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQHM+3ZU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776362802; x=1807898802;
  h=date:from:to:cc:subject:message-id;
  bh=KLTkdpsutvox5pakD0Xk6t2meJkuHtb613NozqP2kDI=;
  b=MQHM+3ZUFsvBIFnh8sKSWPnRb5QCzLjXF77tQgUnE2UUt1lyble9RO+G
   yTJG5fQcAmZhA+tk4brU+Lr+i30HgfNLYMJpDJSsI+iJY2JgAthH4cazy
   4/j87nvtTyXOV1C8Pz2q99X18nucFbwROHTinzPTLTIDIWJg9CaywfjDz
   EuGcVws3xbTgN3tsYuNIVkuWox5rUdW8qbYsNSQjeM+IPfXko39hcDT0r
   +Q3UR6TvjKoYqXgjlgXhGc6gmRndpJ5gAdquqmV+reHGrMiH3iC4+QkZz
   xFsFD5R17NXE24S4ben1EMySAQiZQBGZ6TqMXAvNC6IuiX4LtwwPXxtkb
   Q==;
X-CSE-ConnectionGUID: 5UdVlhKyTguQ+cURsKvcOA==
X-CSE-MsgGUID: o9wxINIbRXWRp7tjXwmBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77349642"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77349642"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 11:06:42 -0700
X-CSE-ConnectionGUID: oWiSYlCrRRyewVbrZbt2Nw==
X-CSE-MsgGUID: xxZkyMfsTgqU0q+qNJ48ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="232553814"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 16 Apr 2026 11:06:40 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDR6r-0000000014j-42Mx;
	Thu, 16 Apr 2026 18:06:37 +0000
Date: Thu, 16 Apr 2026 20:06:15 +0200
From: kernel test robot <lkp@intel.com>
To: Aakash Bollineni <aakash.bollineni@multicorewareinc.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Diff in rust/kernel/workqueue.rs:1285:
Message-ID: <202604161940.IryuHzCN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Aakash-Bollineni-via-B4-Relay/rust-helpers-add-workqueue-helpers/20260416-152403
head:   3107a4b11f40fce70e0d2500e95664336856a4b1
commit: 3107a4b11f40fce70e0d2500e95664336856a4b1 rust: workqueue: add KUnit and sample stress tests
date:   11 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260416/202604161940.IryuHzCN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161940.IryuHzCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161940.IryuHzCN-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/workqueue.rs:1285:
    ///
    /// This is intended for use in KUnit tests and sample modules ONLY.
    #[cfg(CONFIG_KUNIT)]
   -
    #[macros::kunit_tests(rust_kernel_workqueue)]
    mod tests {
        use super::*;
>> Diff in rust/kernel/workqueue.rs:1285:
    ///
    /// This is intended for use in KUnit tests and sample modules ONLY.
    #[cfg(CONFIG_KUNIT)]
   -
    #[macros::kunit_tests(rust_kernel_workqueue)]
    mod tests {
        use super::*;
   make[2]: *** [Makefile:1912: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1337:29
   |
   1337 |         let initial_count = arc_count(&item);
   |                             ^^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1344:21
   |
   1344 |             assert!(arc_count(&item) == initial_count + 1);
   |                     ^^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1346:21
   |
   1346 |             assert!(arc_count(&item) == initial_count);
   |                     ^^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1361:29
   |
   1361 |         let initial_count = arc_count(&item);
   |                             ^^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1368:21
   |
   1368 |             assert!(arc_count(&item) == initial_count + 1);
   |                     ^^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1370:21
   |
   1370 |             assert!(arc_count(&item) == initial_count);
   |                     ^^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1391:20
   |
   1391 |         assert_eq!(arc_count(&item), 1);
   |                    ^^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1405:29
   |
   1405 |         let initial_count = arc_count(&item);
   |                             ^^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1412:21
   |
   1412 |             assert!(arc_count(&item) == initial_count + 1);
   |                     ^^^^^^^^^ not found in this scope
--
>> error[E0425]: cannot find function `arc_count` in this scope
   --> rust/kernel/workqueue.rs:1414:21
   |
   1414 |             assert!(arc_count(&item) == initial_count);
   |                     ^^^^^^^^^ not found in this scope

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
