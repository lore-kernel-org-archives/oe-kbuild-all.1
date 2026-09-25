Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2596D1C01
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 00:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790294675; cv=none; b=EqFa3Hztj7lRZvZHHVaSqV5Kcssth3PX1Ul/b1s2w/YHEXJjfExApWvoauj/B6asCpkFPvaf/TT5wIRBLuxGldmj6/oKt8ziFa8VgUWmy3CnO8Jnnn4p7F2UBJ1KFc36nQStM8KSwOoD4mrB+DHOpx0ZAU8/D/CRxNDxv7ldwFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790294675; c=relaxed/simple;
	bh=iBWZIvU0zzZ7smzIbsiQUKg80vibNTF3wmqzgrPTTiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g+m6UPBSDCNWol5reCvuYMNCe/nmmrPfvhvvYwIg8lCwsu1AQlLzC3/ein/YVYtx14yfgqLHqsLy/ABVv+780Z9GcGHz7H5QUhWbi6fT3fpMcWiltY0PjD5b98H1N/NZ6B31mR1atdELUSxyeBY6LLUi1wvp1TShvBwB0Kkqhtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGkVwO1A; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGkVwO1A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790294674; x=1821830674;
  h=date:from:to:cc:subject:message-id;
  bh=iBWZIvU0zzZ7smzIbsiQUKg80vibNTF3wmqzgrPTTiY=;
  b=hGkVwO1A4xascaqHP4weltr7XwLNtkS9tEsYbEbqFd1zIpgPBgBRheUY
   7XLBU1GX+x/kZBWFBtYniV4tDW3hRXG5FGC0GPg39r1ghrgpIHOjoKlgv
   wVS48QZYzBKxcciEW2DQH8tmGz8NruxTPHXCtTqjtop6y6tFlOrDJ0sIl
   4FLJ3yJdXrAw+awCeaZMf5Q63jobM+B3SCbdw9P/UKo9KGqiQMUDujcJk
   VZfkrJBOzXzrhmm/DxCaXiCyKXrLzaZY8NFIvpZBbFD0LBgPNLV6Rf8NI
   A9MpvSqOZrUtYQ6fPxHswlUhA58oI1BaoivF6XwKgWW0HaAzBwO4NyRvn
   w==;
X-CSE-ConnectionGUID: 6sEF1wuPQpSSDu/WMVR2aw==
X-CSE-MsgGUID: WIMx2OcXTkmAc3VRBvrS6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="112868202"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="112868202"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 17:04:34 -0700
X-CSE-ConnectionGUID: uNG30kTwRjCyOZkH2K9nEw==
X-CSE-MsgGUID: YHeLe5Z5Seaig+v5sbER4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="274286545"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Sep 2026 17:04:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9tQU-00000000JqK-1u2N;
	Fri, 25 Sep 2026 00:04:30 +0000
Date: Fri, 25 Sep 2026 08:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2025-10 1/1]
 arch/arm64/kvm/arm.c:493:15: warning: no previous prototype for
 'kvm_arch_vcpu_get_ip'
Message-ID: <202609250707.v5In0Xad-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15-2025-10
head:   7c8286117ce253a9f730573213e63c7f74e01d69
commit: a2aa2a6c9491a807bb898220acb1062dd8226a12 [1/1] BACKPORT: KVM: Move x86's perf guest info callbacks to generic KVM
config: arm64-randconfig-1000-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250707.v5In0Xad-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250707.v5In0Xad-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250707.v5In0Xad-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/arm.c:493:15: warning: no previous prototype for 'kvm_arch_vcpu_get_ip' [-Wmissing-prototypes]
     493 | unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
         |               ^~~~~~~~~~~~~~~~~~~~


vim +/kvm_arch_vcpu_get_ip +493 arch/arm64/kvm/arm.c

   492	
 > 493	unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
   494	{
   495		return *vcpu_pc(vcpu);
   496	}
   497	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
