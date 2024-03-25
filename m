Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA2A1BF512
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Mar 2024 04:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711340483; cv=none; b=rNSJE5CjbH7EqmoU2eRsHIYrNBjmul8EBw5h6YyUw15aONyClHCGPaIrZd4a+6gNEzMa8Elm2izyYD9W21wNeI1Rq2Fk7XL57TB5diVRHsx0DCOgSA//74+RPxEUhjGqe5Nn9mrzchDOzf7eLZ8s6xzUir43TAIOAqwgwpT2PZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711340483; c=relaxed/simple;
	bh=K4FyQPvG7Eavv+2nPlLWJsinoY8iKkK3JLZ/yZaLiCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q0A0Ti5W0ZljXxUoK7tLvwULgLm0OEVfJ3ai507iq8iPuLwzmZF91G05WuDxP5IjV2sBmKmCwTzEtrNgFCgm06D5a25TV/3Pcs2ERFWXVHJgOFlTi2l0VgtyrkHX9aitJYLJlegAEODaAHstdeytkjk05buYNOhNUijIAp0BoF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iL6veYRI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iL6veYRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711340481; x=1742876481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K4FyQPvG7Eavv+2nPlLWJsinoY8iKkK3JLZ/yZaLiCs=;
  b=iL6veYRIcTwdVQV5cEUopOegN6n0bxpzbAeqdgC+p41hjWzLgU+6W7w4
   lz/2/l7JgF0uVYJTMaXg1VFLt1PoVEtFaB6kD5UjUlxEBE+o40x5hlsu0
   mXTghC7nNvDpMSqbCDYpKAEmbql2BAzhgw/KvFqc66PTv/8UAvOSlDdLi
   c4iOp0ruwDkKF2Gowl1F76VIQyiXTxPW33Dpu5g9BnMyx5jKxEkLeKEyD
   8uMapNPxNKoAMOCsOZQQ+Wf055umjOsxM4Rks2lNVb8q8C7E1tdoC3isU
   IAL0FQxqS9zHnLTsCT32vkDxoCUj2oh5onx2e3xNnKcLYQWnxqN1Qs+ZB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6181606"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6181606"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 21:21:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="19961710"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2024 21:21:19 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1robpl-000MF5-0G;
	Mon, 25 Mar 2024 04:21:17 +0000
Date: Mon, 25 Mar 2024 12:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 41/43] error[E0599]: no method named
 `as_mut_ptr` found for raw pointer `*mut bindings::cpumask` in the current
 scope
Message-ID: <202403251240.910qRprS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   9c04e83db301c9a77a1e4f395cebee5cbec22a17
commit: 4d8681660c8aad5c0d6c0f3be279e413ea917cb3 [41/43] rust: Add bindings for cpufreq framework
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240325/202403251240.910qRprS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240325/202403251240.910qRprS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403251240.910qRprS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0599]: no method named `as_mut_ptr` found for raw pointer `*mut bindings::cpumask` in the current scope
   --> rust/kernel/cpufreq.rs:347:19
   |
   347 |         self.cpus.as_mut_ptr()
   |                   ^^^^^^^^^^ help: there is a method with a similar name: `as_mut`
   |
   = note: try using `<*const T>::as_ref()` to get a reference to the type behind the pointer: https://doc.rust-lang.org/std/primitive.pointer.html#method.as_ref
   = note: using `<*const T>::as_ref()` on a pointer which is unaligned or points to invalid or uninitialized memory is undefined behavior

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
