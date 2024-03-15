Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DA9101E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 23:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710544109; cv=none; b=Xjmjrz/WTF1XgjZLKiWG5eRwore4780WgAF2WRAIzy5p9y/fkKknz5OJfZzUCBcetFOzVfHX+9nQ7ANwGsi8OfN9JEcYaBtO5u4MPMTsJ5KoQBcMw0kvUK6645dspZGaM59eBtsxvvZv+AG6p3i65rxjVATyePcDJXXO8MXrkGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710544109; c=relaxed/simple;
	bh=u4+56A0BWaO/L0nuQfXZOKnlqGJdL6MiSxjjkw8pAok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OREvUw8vzIob9sqARrrhiMwActFUenhQ9zckxdQUQg628e6kWQuNfKYSuAkt0KxKILx+jP/JkoxbZOHkpbB2QjMgINhbi9EzZxKGiLqOosqvYrZy5DMBPPUdT4g6+F9Mh5yzoosMCsdaBZqulwibjs34Uo02xJOs2skbPHPSGo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+Y92BeD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+Y92BeD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710544106; x=1742080106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4+56A0BWaO/L0nuQfXZOKnlqGJdL6MiSxjjkw8pAok=;
  b=j+Y92BeDocCs8tN2fDLa+3iCi0Hr22hWej4Tu657AzTh9sxUK9cbPsAX
   nvAnsSP8pEDtqtlCweunqbEhW1ISlNHM2WAKUT+iI6pW4QDgi3BbVSD7g
   Ugmbu3Tu5dN5A1f8KPj5EMhndms6VmIxQ6/ycW3S6OW6majIF/Ffa0SMS
   2W0mOHhkZ3RFAR6gAYaIWdkwhFooKCca9LS4vx8wFvboW0nNE2BnILsW7
   jcFq/F9MvQYAf+VWwz32fr05OlU8s00M62JbEsix2mYslDvWlgLB6hcw2
   coUTLAHOi57lCWonnxEPNvmXsj1kRsB/vIdJLjf5RLZUs8MiM3LuYXnzF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5298290"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5298290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 16:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="43879792"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Mar 2024 16:08:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlGf0-000ErJ-1k;
	Fri, 15 Mar 2024 23:08:22 +0000
Date: Sat, 16 Mar 2024 07:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 23/43] warning: unused import: `PinnedDrop`
Message-ID: <202403160728.KOty09RA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   55e41b4e7955d261d26d167a0e9a847553a8ef55
commit: 1fe369c9aa669f8079cb16703cad8e1dbce90fd4 [23/43] Revert "rust: upgrade to Rust 1.77.0"
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240316/202403160728.KOty09RA-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160728.KOty09RA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160728.KOty09RA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `PinnedDrop`
   --> rust/kernel/revocable.rs:10:18
   |
   10 |     init::{self, PinnedDrop},
   |                  ^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
