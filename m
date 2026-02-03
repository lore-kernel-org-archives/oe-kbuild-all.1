Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC0B27057D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770113751; cv=none; b=iNjE09fJR5E/91j26aJYqJJf8W74fY3eP3UJ1XoWQ/ir3PEQPWTEvq2EbSMGAXBcca9OGxco+qMvP5Lct/W3evIftA8QXOZTPU62MJr9slor2KbwdNYoNNlqz+UlVKBfNzU0D0a4M9IS2eZthq+KJDBEwSgWIDmvsLmxAkEXb80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770113751; c=relaxed/simple;
	bh=6T4SMekW5RI699xQich8QNOmbvG/+dzS9ourHpnTSF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mnicuqoGa04D9dx3fJRM+CxM3Y230dDvejfwhYOQG0rZ9EZ0zsvTmEFMjyKXUTxazMdQxabNtnG27nYCj48Q4JXBMj8PITZEuPwJOZlsZFFS6IKwHrOrtqv8I7jWo3bU5OeaM2bvEnv809byp8jsRg+MOeXcQtLT7Miiv8Ytuyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHP5UOo9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHP5UOo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770113749; x=1801649749;
  h=date:from:to:cc:subject:message-id;
  bh=6T4SMekW5RI699xQich8QNOmbvG/+dzS9ourHpnTSF4=;
  b=AHP5UOo9KmZGBqRJHHzq0GED3GQUaJ5CMTnumCJwu5Hs4XhpoICKkXeE
   L7TdwHRpcY9onizTH8KQpkNah38f3lAeHRE54vAmcL4zrLPXumY9K5+Un
   HCkhc0YNgbP3pQ9M5akFgFjSKtyGXUybfAhpZFOYIEkSQygqzosV3gqv7
   b3hlDdheM4ocVLrnCnfZbsW6P7pIkW8RKIuqJRXY+CDraVFIlRS51o/I8
   W+m6sJkP1OXIfqePOttkrbmid7hgI+Ropa5XwvRIUfjYODdEV6XXM3vz7
   N7Ar+9LsW1TJmLKQKIWywoDY+lcVXuskAiiYfULO5DnaXS3xmtUZSmz2t
   Q==;
X-CSE-ConnectionGUID: XFmuQyObShqt7zzw1fd1Ew==
X-CSE-MsgGUID: KDW1QI8VSxSTWnySALXjMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75137372"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="75137372"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 02:15:49 -0800
X-CSE-ConnectionGUID: FxR7OwuaR/qZtdR7BAHf+w==
X-CSE-MsgGUID: RFA4ZW4oQ9mG9C6kymL0ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="214578344"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2026 02:15:47 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnDRh-000000003Lx-1NC5;
	Tue, 03 Feb 2026 10:15:45 +0000
Date: Tue, 03 Feb 2026 11:14:57 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Subject: [sashal-linus-next:linus-next 10891/11193]
 lib/kvm_util.c:362:7: error: no member named 'pgtable_levels' in 'struct
 kvm_vm'
Message-ID: <202602031126.7yg4Gpjh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   3e0a859f3459ea4f76bcfa5d6f67b3594fa37cd1
commit: a21f297ade6d48400877cd20b893b13d310c071c [10891/11193] Merge 'kvm-x86' from https://github.com/kvm-x86/linux.git (next)
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260203/202602031126.7yg4Gpjh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602031126.7yg4Gpjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602031126.7yg4Gpjh-lkp@intel.com/

Note: the sashal-linus-next/linus-next HEAD 3e0a859f3459ea4f76bcfa5d6f67b3594fa37cd1 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> lib/kvm_util.c:362:7: error: no member named 'pgtable_levels' in 'struct kvm_vm'
     362 |                 vm->pgtable_levels = 5;
         |                 ~~  ^
   lib/kvm_util.c:367:7: error: no member named 'pgtable_levels' in 'struct kvm_vm'
     367 |                 vm->pgtable_levels = 4;
         |                 ~~  ^
   lib/kvm_util.c:372:7: error: no member named 'pgtable_levels' in 'struct kvm_vm'
     372 |                 vm->pgtable_levels = 3;
         |                 ~~  ^
   3 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
