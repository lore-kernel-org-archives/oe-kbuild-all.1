Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D4625BF1F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Jun 2025 08:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925862; cv=none; b=NhnkSzBITnEgSITvGqd3zkzYNcdH4N/thqwHm0WYWcg/JNLHOZicMuwl8S0LUpE5ApPhxPlCLQRuLxdiUuvEeRMsZ6auu94KoqqIVR2lgqEqfXFTe+zGiFoaHDlw348Q7vMCgpp0RNe5bBXVh6nJnD9ZwpvkA3sIVw0YSVzpuoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925862; c=relaxed/simple;
	bh=z8MyNZUVddz5D0+qY3W+cM/bVGD0LgA5dfsZ1WouhrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UVq8SXBT6KL4XkHb8JFMydSj4+sTYSjUTFAyhHRyPPDaPcAROO/QdzmMg5Sp6V3r0ReuHNPdN/7A72OGxNzksrKwNaS4s/haWwTeRfaINNJCFceHxa81GwonDF880j3uCmTV4HhRCPD9ByoYU4Hq7z1TZvnvBVkvn4Fs66VE9sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DMoXrhJt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DMoXrhJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750925860; x=1782461860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z8MyNZUVddz5D0+qY3W+cM/bVGD0LgA5dfsZ1WouhrQ=;
  b=DMoXrhJtXITUzzDS/3dZdClu9L9/ZrC/OXwssvHWIJm0u1YeoJUw8jBA
   OuMawOyTy+TYbW21bN2GcNsyiv02Fbv9c8q+HpTI4aRu8C1sL34yduCHT
   pkBehZY8cAlFU/4Jv+rRD/IeuYYqwK+z3QnMOgQ2Wh9j020ImmUNfi2Cu
   CIVvhCzdIn7s8Wr4r6ky9U/l0prKNXiuKJSQ2HBmt0RLmUIQO8KRJByzE
   oIoojleq/h2EhIyzRTEgvrH9AJnKBQH7fsoc3XE5qDmTAAVRrNTnZUU4j
   6XhLievdZqA/yFwY46RlO2daZPBQOm7+33p3qgiUssZD2ZbIylenD5fR4
   g==;
X-CSE-ConnectionGUID: BSBO+SDPTyufy+LAr8Vsrg==
X-CSE-MsgGUID: U+2M84WHQ1SC7CZpkYp+/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63812177"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="63812177"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 01:16:37 -0700
X-CSE-ConnectionGUID: z4XFdJMKSEuS7s2X1GfokQ==
X-CSE-MsgGUID: lVyheS2YSQSTaD80DcWxeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="189636559"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jun 2025 01:16:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUhmc-000TsG-0c;
	Thu, 26 Jun 2025 08:16:34 +0000
Date: Thu, 26 Jun 2025 16:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-01 1/1]
 drivers/regulator/rk808-regulator.o: warning: objtool:
 .text.rk806_set_mode_dcdc: unexpected end of section
Message-ID: <202506261620.tGiEjgF2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-01
head:   17cdfa1756f8a2371148aa88ddd33d84d6976a97
commit: 349fde599db65d4827820ef6553e3f9ee75b8c7c [1/1] arch: enable HAS_LTO_CLANG with KASAN and KCOV
config: x86_64-buildonly-randconfig-002-20250626 (https://download.01.org/0day-ci/archive/20250626/202506261620.tGiEjgF2-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506261620.tGiEjgF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506261620.tGiEjgF2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/regulator/rk808-regulator.o: warning: objtool: .text.rk806_set_mode_dcdc: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
