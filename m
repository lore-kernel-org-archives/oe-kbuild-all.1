Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A0369985
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Sep 2026 01:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788570110; cv=none; b=k0wvf5FIhBD/e9nvBgoQ2Iv1QaU2JsultbmpAGebz1SgYSTfYHq7njWxeo/en8RJ+cMJrqm2gUikl90ZN8ECA5cOVBkyuUAhfUvC9a+4HM/3AePa4pLD6YBPQigBVy2OOSA17CQms95wHm6vf9CX5mBeRpzkNEnvBAlCHJBofoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788570110; c=relaxed/simple;
	bh=2MLPLQs26/r1SJ7qBZfhAJFomEVQ1aT4INFw542dZlg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MwXlHLow2Dja5n7kDxIrX1m/Fv0QHXJFnAc+2e+AhE0Cjo9fzYsHoOiFn+ag+S6GNQYNPTUktXr7yV0ubGRTtzM/5W5RmZKivBclk94MBVP+/SH096qGgu0uhaCgKVFTp+b7n9MPG3x7100kltI3O57hWF6UMJyvbEyf4ak+fGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RgEd1pea; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RgEd1pea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788570105; x=1820106105;
  h=date:from:to:cc:subject:message-id;
  bh=2MLPLQs26/r1SJ7qBZfhAJFomEVQ1aT4INFw542dZlg=;
  b=RgEd1peai/3XKDQrfQVoDvmLXTRucBecErLqBX5qVHH9qmQdnrP2bjuv
   QZUU0MYUs/BwXAqZpfeLK/3ikCMXnOglO+6V3OYjiEtXGd7hIvSitCgUs
   1PF8C8fYfLp2/TWUyyej7haYlYOkuQoZyd4jjaO8wEPAbvnpwQUmdLb7/
   idmPCm2mhnYU0Y3Ki3Xy1WwE0xEiPpW6vojbTxL23hqCIjXQn5si4zqu3
   6UlRkUvWd4VwSgTcNkfXBignEO8eGU+ncrSg1mwva1u9pU9xiNVyCI9no
   dU+cEd03WlRxHQW0DKtlpO4uyYmDmRcg+BuqpDMAfbp35mZ15TSKkSoo7
   A==;
X-CSE-ConnectionGUID: cEydEsCKQ6W6iO4tjK5XzA==
X-CSE-MsgGUID: SHH2QymCTPmT9Qf+1GWpGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="100593980"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="100593980"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 18:01:41 -0700
X-CSE-ConnectionGUID: tXOrCBdoQC644y81ouN1IA==
X-CSE-MsgGUID: s1q/4pMiT1WzLHDnH67BjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="268872230"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Sep 2026 18:01:40 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2emo-00000000AZW-0opv;
	Sat, 05 Sep 2026 01:01:38 +0000
Date: Sat, 05 Sep 2026 09:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 2/2]
 arch/arm64/kvm/hyp/nvhe/clock.c:38:1: warning: 'patchable_function_entry'
 attribute directive ignored
Message-ID: <202609050857.HIrRj7SU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   98d5b9e071f1828ec75981d3758cc20c452616a3
commit: e77aff67170b3289f944fb39f1e81b2ff8a5e40a [2/2] ANDROID: KVM: arm64: Nop padding for ftrace support in the pKVM hyp
config: arm64-randconfig-r072-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050857.HIrRj7SU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050857.HIrRj7SU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050857.HIrRj7SU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/clock.c:38:1: warning: 'patchable_function_entry' attribute directive ignored [-Wattributes]
    {
    ^


vim +/patchable_function_entry +38 arch/arm64/kvm/hyp/nvhe/clock.c

97c14dba6f9623 Vincent Donnefort 2024-09-11  35  
97c14dba6f9623 Vincent Donnefort 2024-09-11  36  /* Using host provided data. Do not use for anything else than debugging. */
e77aff67170b32 Vincent Donnefort 2024-10-01  37  u64 __attribute__((patchable_function_entry(0, 0))) trace_clock(void)
97c14dba6f9623 Vincent Donnefort 2024-09-11 @38  {

:::::: The code at line 38 was first introduced by commit
:::::: 97c14dba6f96234c7120802f9d727a4ccfd17367 FROMLIST: KVM: arm64: Add clock support in the nVHE hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Keir Fraser <keirf@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
