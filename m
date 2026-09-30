Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92F24D795C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780111; cv=none; b=Llz9cd6BkylxzHPTr62PJAXmTRrHeOkLLaNfFdX5H+uyGSHTb+pAHEeW5SlYgXKmc7nnPSptiov7Fup/He89mg8KVhJZk4eHPnawRtK0yLdvVrjGgIalkCxFxvNEB2lB/YZV+AfubhUasIiBgqgg9Bvy8j4eEmBjj0/zdkbll7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780111; c=relaxed/simple;
	bh=3cdyXdZenw3NtuoEUZdJs7/GCmq3R/WG6HcXwOmzGwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G7frpw9yKpMiEKBwqUPS0TbWlNCkg0e3yY+NHAYT0uiDd5OTVN/vKRL+UzWM2Y/0w6e595uL74M7K3rDO2iT7ruZMpmRj5SYtTougBKmXRLuM/6ANCcQrWOWvVcGDTsmKoRJKXUflZFMVIcwjd7uHj0vN4SlrkkjNvmQookx0zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NE2znqem; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NE2znqem"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790780106; x=1822316106;
  h=date:from:to:cc:subject:message-id;
  bh=3cdyXdZenw3NtuoEUZdJs7/GCmq3R/WG6HcXwOmzGwg=;
  b=NE2znqemn4PvvWcvhCOTuyQ9DOb+Nmfai2NG9Z2XyiV2I6+Y68f5DLI5
   uEz95EJpKdEZZKFsjOyrdapz9Im6L+kbfjEU2jsVPpf1Ajjzm6WoZ5sKq
   lVagpF7jIxUDPzGH/eDxpDhS8FqMpkmjsTtpv8b/dzl5H8tKihZBS6n85
   EyqiTeLt5r9WOJ7JqvicSG3p1mnEn4kjkAGoPL7iq62FHmZVHl5whKl8l
   P/8b1Mc92Mwq0WZN1rQnG18/aLb1rhhM6WLpgrNLhC1yR+kE9eg8S8KcB
   4E1NPWxqCkokP+NaXLW1px7Y/GAYjDadKb2LeQEKl0aYi6RPOYX7XZOnd
   g==;
X-CSE-ConnectionGUID: YLYh4NrQQvOa8rPqm4cM8w==
X-CSE-MsgGUID: 2h+aFev3S2aPP+O7FWr8dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="79086406"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="79086406"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:55:02 -0700
X-CSE-ConnectionGUID: aPtSChrGRmSRXHhHxQjIzw==
X-CSE-MsgGUID: blw5UIVpRAmsFBdPOQHZSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279504865"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Sep 2026 07:55:01 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBvhy-000000001uB-1e5v;
	Wed, 30 Sep 2026 14:54:58 +0000
Date: Wed, 30 Sep 2026 16:54:30 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:238:1: sparse: sparse: symbol 'vm_table_lock'
 was not declared. Should it be static?
Message-ID: <202609301625.dupjpUP5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   403760a58ef72b72f3aec57113b4f1c12f3787a2
commit: 71a9fd9aad9776fed5877c6f50633b92cc6193fe [1/1] ANDROID: KVM: arm64: Handle guest FF-A share/lend/reclaim
config: arm64-randconfig-r2303-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301625.dupjpUP5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301625.dupjpUP5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301625.dupjpUP5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp/nvhe/pkvm.c:238:1: sparse: sparse: symbol 'vm_table_lock' was not declared. Should it be static?

vim +/vm_table_lock +238 arch/arm64/kvm/hyp/nvhe/pkvm.c

a1ec5c70d3f63d8 Fuad Tabba  2022-11-10  236  
4f1b201bef3e4db Will Deacon 2023-06-30  237  /* Rwlock for protecting state related to the VM table. */
4f1b201bef3e4db Will Deacon 2023-06-30 @238  DEFINE_HYP_RWLOCK(vm_table_lock);
a1ec5c70d3f63d8 Fuad Tabba  2022-11-10  239  

:::::: The code at line 238 was first introduced by commit
:::::: 4f1b201bef3e4dbb6be6e30fb7f74ca90a0545fb ANDROID: KVM: arm64: Convert pKVM 'vm_table_lock' to an rwlock

:::::: TO: Will Deacon <willdeacon@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
