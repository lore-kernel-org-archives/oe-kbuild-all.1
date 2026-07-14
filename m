Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2744047DFAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784038222; cv=none; b=YFNqejs+UGZbOJgKanwcwdMtpFPIbg1CWOxMzXoXHTsJrlFM7Oj7IWbsbuVOBOfO2AAt8qJJEnw06YA9rvLSepCGCGn6z7s9iN0iWXGg/nfAODVvC269FVjKKk5//zcLQfB327NpwsQW34ZwJkd7VGsTsU0cV//7uiIhI5LCo+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784038222; c=relaxed/simple;
	bh=tRtHRMTM3FbdEJbOEvKzsxuzUpYZ0Hf14wCP7V1F938=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X10+78AKoavBvrCI91rqOKJhXHSq5GLU+cYR23o3wmyAAgX75qfxC6yEKEpv+OvspnTsy8fYjXTw6cgkWJNPzR5mqxaIWQHn9a3hwhkdmPGQYs2/aKvGW+Xbf9F7t6/0pFkxWJXoTWU5pZlwSVsXhntd+9AqDPQ3lGPFrh70qvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSykALAq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSykALAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784038219; x=1815574219;
  h=date:from:to:cc:subject:message-id;
  bh=tRtHRMTM3FbdEJbOEvKzsxuzUpYZ0Hf14wCP7V1F938=;
  b=aSykALAqvLeV3OsHVFlH7QzPc62w9DU98JdkpRsx6TYyBw0POSJAr7KQ
   yTFuuIOfPYGxqfHtmvp157jJ7DfvcPUJvEmtAtMFGRy6vrJW4UCxTTzZe
   7ccb82k7WjbaUr0pcnd4VwS5rGbEI+5hsAegh71MfTKb8esczahhqik+j
   QHEI/PSZK2VIzpUp7E5tJY8lhbScJfqcbmeuPSEEsGwdCKJtJnrDTqCU6
   lEelRNB/AdlUDVpqYXvOX+k3KvxFAFPkXrVnBtCP1hvikGgChdZkyLU4I
   0kjFAJUX9XF8UsPP1rTjHxPwvTx8szT5xbPHxbvC2j8ExiTa2N+kofKvj
   Q==;
X-CSE-ConnectionGUID: brl9yaHUTS+LassEncr8TA==
X-CSE-MsgGUID: sEzx2TYtRE2ywZgy+qIPHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="83645674"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="83645674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 07:10:17 -0700
X-CSE-ConnectionGUID: qFs2XqyOQGypGHKvJ1rhng==
X-CSE-MsgGUID: G8Vtp6S1REiy5J6E+VICkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="251466209"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jul 2026 07:10:15 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjdpt-0000000040H-0IdT;
	Tue, 14 Jul 2026 14:10:13 +0000
Date: Tue, 14 Jul 2026 16:09:25 +0200
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev,
 Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [linux-next:master 3171/5809] Diff in
 rust/kernel/cpufreq.rs:792:
Message-ID: <202607141617.7AI8hGxv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49362394dad7df66c274c867a271394c10ca2bb8
commit: 5dac87fe5100484b89694e324efe3301f603a53c [3171/5809] cpufreq: intel_pstate: Adjust the .adjust_perf() driver callback
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260714/202607141617.7AI8hGxv-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607141617.7AI8hGxv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607141617.7AI8hGxv-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/cpufreq.rs:792:
        }
    
        /// Driver's `adjust_perf` callback.
   -    fn adjust_perf(_policy: &mut Policy, _min_perf: usize, _target_perf: usize,
   -                   _max_perf: usize, _capacity: usize) {
   +    fn adjust_perf(
   +        _policy: &mut Policy,
   +        _min_perf: usize,
   +        _target_perf: usize,
   +        _max_perf: usize,
   +        _capacity: usize,
   +    ) {
            build_error!(VTABLE_DEFAULT_ERROR)
        }
    
>> Diff in rust/kernel/cpufreq.rs:792:
        }
    
        /// Driver's `adjust_perf` callback.
   -    fn adjust_perf(_policy: &mut Policy, _min_perf: usize, _target_perf: usize,
   -                   _max_perf: usize, _capacity: usize) {
   +    fn adjust_perf(
   +        _policy: &mut Policy,
   +        _min_perf: usize,
   +        _target_perf: usize,
   +        _max_perf: usize,
   +        _capacity: usize,
   +    ) {
            build_error!(VTABLE_DEFAULT_ERROR)
        }
    
   make[2]: *** [Makefile:1993: rustfmt] Error 123
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
