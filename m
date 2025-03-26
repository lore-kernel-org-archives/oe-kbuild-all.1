Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D982423BD11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 17:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743010331; cv=none; b=u6YJvv0AUInpWLuhKE5LZKOURBLJUDnkFK61zokXXVleDOQpEWsZcW+eBIIDv4eAEsjO+wl1/tGSvI7jxqdxvwChdv7aNi+95KGG0pM067rqhEcMW2y9hF5uu90d+aGvZsyJ67eWtJUTKRos7FLgfX4iLuUxeznX1SNSdFLMksI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743010331; c=relaxed/simple;
	bh=yqa1LhYVkEp2KS6ET1bsFrSP+3yXOiru78jsNyY/opg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bn4bVgV1FVV2eKumvku5FnF0C/c/qf+jxHDDM80It5TCY38kpG9fq2Dd+GurlPROsfqYakGiKdPpFIM1GriK4gWvrhgKi/7Evp8xW5QwnYh3cXgg9c554JPtwEbxtAnjDMvr6v40Bd8x9nxKYZVEC8G7EhZhihBBIM7MhfjZe2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1O0rgYn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1O0rgYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743010330; x=1774546330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yqa1LhYVkEp2KS6ET1bsFrSP+3yXOiru78jsNyY/opg=;
  b=O1O0rgYn+3P5FsXODe02DfvO9GK+ovrdkJeO34B+gMRjl811KihJajPs
   GgxheB0lPE+Ni6xlHLhz1ngQz9CqOGvhVaw+KpQD0EmGEM7mHscI0RIIB
   nJBjMKkcIAwgY2FOcGzBgqY3Tb0VZNgYMrDjf4iOkQ8YFL7V5BjTBJTd/
   zYDcfJaJqEsWSqdM09vsiW1SVW5lZVcooNRKXJQIyEdx0HH0y04J9DtyO
   /LI7rCFKE8aHd+N2vV2Lfmp3KXI0Gg5QHymqMVWdt+AcoRd5omP4/8kRe
   tmZyqiyA+77g7ShmpI06e7WIeibwWmATuHEoaPCgLTJotfelhanHLOdo+
   A==;
X-CSE-ConnectionGUID: +gS3GdZoTd2tltP2QJA8Gw==
X-CSE-MsgGUID: OkyduJTWTZ2zs2Zn+Afujw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66771863"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="66771863"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 10:29:56 -0700
X-CSE-ConnectionGUID: 7tbSPhH1T4SGVdIRlM/6aw==
X-CSE-MsgGUID: z1w8AMX7QMGIOqX4wvdQqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="124644210"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Mar 2025 10:29:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txUZY-0005wa-1m;
	Wed, 26 Mar 2025 17:29:48 +0000
Date: Thu, 27 Mar 2025 01:29:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova-gsp 25/43] Diff in rust/kernel/reg.rs at line 1:
Message-ID: <202503270141.VZHsbzeV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-gsp
head:   fe9f1c2329e9c32ae35ef006c8c786774241561f
commit: e8b2fbb30d806d93bbd9cede710958aa0b76a843 [25/43] [RFC] rust: add macros to define registers layout
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250327/202503270141.VZHsbzeV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270141.VZHsbzeV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270141.VZHsbzeV-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
   make: Entering directory '/kbuild/src/consumer'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>> Diff in rust/kernel/reg.rs at line 1:
    
   -
    
   make[2]: *** [Makefile:1811: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src/consumer'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
