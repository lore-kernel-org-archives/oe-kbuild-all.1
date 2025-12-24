Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E51231C91
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 04:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766551258; cv=none; b=JwjMcMSG790OC8SJF8uJcENZu6/0SgaJpKvoTRg87Ax16DMUfEsouJZst7Pt+8k6CBJ++vqfazqY+Err3zo4sk5sZIeBJnNstaA9VQB9kLJzl+cPpVhbKAgTgp+YnS7OYiaNtAgCbzVOsXDEtruUEUpPTi48QGVvU7gCGKW/DlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766551258; c=relaxed/simple;
	bh=DpRz1Td2THU4OI6wNG9sB1E+6gNJXCnQlddzq5rqod4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OYVvwa6DaBASqjaV3o0K9Pjnt8Kya9Qn9/g7JviqPHKOtYdg0ebYQYDkJsaTcS6QHneUP+UTUeQghx/80xZGioxErfweF1xby7CYG0DdSMmR6pVi1deMCSVlbqGhmpObk94lbpSaloWT+0naaxgsyQRrYw0oea0B9pc0bq2w6MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MepN0BAE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MepN0BAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766551257; x=1798087257;
  h=date:from:to:cc:subject:message-id;
  bh=DpRz1Td2THU4OI6wNG9sB1E+6gNJXCnQlddzq5rqod4=;
  b=MepN0BAEVR5W1o7Pzd8fYJX2uf+hdbeekmIsQRLKDKTpt8CP3mDVvl2k
   67e/6MLunm3Eng5LlDomuqNdjKkLrblL6VUrKRgOUqPMR/6ZJzxDjfXkK
   TqLQlGhi2+F+V8h56PvGlxDNNgYpI+/6LiK10eHoqqPZ7esXJBE6j0kDc
   ZQSp8MJchzSrQFQeqs3o8+AaMUiyzvvE49yPS6CPWc6nTGMNubp5go3Dw
   DpRxiwrwYMwlP61FNnuvc7P/m0Z6onZzk6J6t3/46xhwxkO7+B0xKKZ4z
   vFugnoD5PeaIkjoKKieddyo1CgD6hICYmLv7lUgChPzCFY7eWl/Wuj1ZL
   Q==;
X-CSE-ConnectionGUID: vMjxpts6QJWECGHo+/QUDw==
X-CSE-MsgGUID: dGipFFQIS+aWxPo3NU0yNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79029452"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79029452"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 20:40:56 -0800
X-CSE-ConnectionGUID: LYdMGK96Sw6hQIC0tTem4g==
X-CSE-MsgGUID: SmxXh/Q/TzKM6d2C5am4HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="230975129"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Dec 2025 20:40:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYGg9-000000002g9-0yfy;
	Wed, 24 Dec 2025 04:40:53 +0000
Date: Wed, 24 Dec 2025 12:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 2/2]
 arch/arm64/kvm/hyp/nvhe/clock.c:38:1: warning: 'patchable_function_entry'
 attribute directive ignored
Message-ID: <202512241232.lFA5d3JH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   5685efeaa839be4b5a6883458e4a4f003b6b168b
commit: e77aff67170b3289f944fb39f1e81b2ff8a5e40a [2/2] ANDROID: KVM: arm64: Nop padding for ftrace support in the pKVM hyp
config: arm64-randconfig-001-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241232.lFA5d3JH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241232.lFA5d3JH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241232.lFA5d3JH-lkp@intel.com/

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
