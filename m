Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E404107B6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716023695; cv=none; b=E9QHRV66gl4HDBiWLyp5lIXvTQYLeEUINwSYFokDumuQXeEMBZ8G4m3NGEwX/FunDG/DDjrqP/uFY0diCAKDM1na0y0Yx8y8dnhxv+y5KqUmoKXwYNqVzOA+RIhgORc3rp/i/Vqvlsy3ZyIbI5Y8L+kUjgqfPDY9FuSUKpwjXxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716023695; c=relaxed/simple;
	bh=XgeO66YiQl5aywc9cYpTn2amOpUwXL1rEtt6l68XWZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mx6y+SGRBaWoqTEyMMwh9Q37lIky13Yux3sRzVfpob1gTjP8nKOO1q9AYrLLnrLAlWRZnKMtZNsOpHqz9zlwU92cngHHNPWuBQD7M/nsOBaLSDy+HsyB8PsXLQeEGq4aCqB50/ENug07+g+e+am5m6IWEkNBaxhME0axGZGbhAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPbVgvGA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPbVgvGA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716023693; x=1747559693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XgeO66YiQl5aywc9cYpTn2amOpUwXL1rEtt6l68XWZM=;
  b=jPbVgvGAvYhgu8xAdP91s9ELZYB82AYsv99KBxaHKLE4jNysxmZ/adpw
   8OUy8Y6J09TIG98ubhx3w0/FFCUQ91h4KpUVcRcbOEK+wKbFXMFr6i/IH
   NpPqLcB3CHQcqekBPD3UE3G7CovDS9oagt8mEIsZj69MNkRvD8W7XVgN4
   zztN18w6+z0YClF6sm8HpCuzx3KFUCMtlmy9nY7nWSIAT8d7naX2kcuPO
   ljX5xox7+wgaWjoOgsFaJ313gdlo4t5fUrJyduYKPLCzpVgzzNZkjRl2E
   Lp5O6tOjF+eaUBMnwOfOu2wD11TJfF5SuF6A21nMRcHqb+GpPgG5+Uxn0
   g==;
X-CSE-ConnectionGUID: Ub+W7O2aRPKLv82be7oSsw==
X-CSE-MsgGUID: sCEJ8MUKQuiG5D5V2w60nQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="16040504"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="16040504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 02:14:52 -0700
X-CSE-ConnectionGUID: t2BJnT8pQtuIsaZslrvn9A==
X-CSE-MsgGUID: /SyDGOQxSby98bQiLt8fbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="36444250"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 May 2024 02:14:51 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8G9Q-0001wy-3A;
	Sat, 18 May 2024 09:14:48 +0000
Date: Sat, 18 May 2024 17:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Jintack Lim <jintack.lim@linaro.org>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [arm-platforms:kvm-arm64/mmu-pgt 8/27] arch/arm64/kvm/at.c:176:28:
 warning: variable 'mmu' set but not used
Message-ID: <202405181708.rahHctBK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/mmu-pgt
head:   1ed29f79e7c6441ef29c25a43d7c82d91e884dcc
commit: 0d4dfd08f040c41143701887c95bfa50f78ee701 [8/27] KVM: arm64: nv: Trap and emulate AT instructions from virtual EL2
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240518/202405181708.rahHctBK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181708.rahHctBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181708.rahHctBK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/at.c: In function '__kvm_at_s1e2':
>> arch/arm64/kvm/at.c:176:28: warning: variable 'mmu' set but not used [-Wunused-but-set-variable]
     176 |         struct kvm_s2_mmu *mmu;
         |                            ^~~


vim +/mmu +176 arch/arm64/kvm/at.c

   173	
   174	void __kvm_at_s1e2(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
   175	{
 > 176		struct kvm_s2_mmu *mmu;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
