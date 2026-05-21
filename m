Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990BF3AB5AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363187; cv=none; b=Iar70XmDSqHEavgwxcpIP/QjzR8CF/eM7y+3VOUoEeFnAI6hLt0hdHrpvRABB6xX68JOVH7z50u0GGtfcVwtg3ZbelGhe7SabkEMDlKEzLssXzbnaLDCi5B5C/rohjXxu7ZcmhGWdBN0s2uitUClVGNR3UgMPsaisMhZSnvMjdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363187; c=relaxed/simple;
	bh=tcZWMeOdzUyyuwoUzS5NlCd0JbvFkf/HZR6WFd7ofBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q5UkL1LfQYXf+39QcILPT9xq6yE+sPt03OXypcX/vDEzDkDMTjEgiaPBO1HFMFklKWgHdnnQwgM0dBwnNqV/qUlR5t4Y5sxQwKVIb07AInvrntcnoP+1zn8e9JTH1/4Q1YspcxTPArnHFxt/1syEEwTGh7s7vfkfSeofGsnQL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0QLoWUV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0QLoWUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779363186; x=1810899186;
  h=date:from:to:cc:subject:message-id;
  bh=tcZWMeOdzUyyuwoUzS5NlCd0JbvFkf/HZR6WFd7ofBc=;
  b=h0QLoWUV0njK416dRinLVSA+DVhPHQHDBBH67kbMwdPSlpoLjTKBRJ8a
   H5y+DElSTztNLFx2XC/nyre59CeSy60oNzwGdMBREGIteqd7ksifNqS5O
   0IAynMnMK7HVWlqBrv0WpncGqyCOwXXYwfceFoZEWM/n1Fk3GVSqtmFZH
   1DkQFOHwiKeXV3+Fm4EHN9gsi0RQ78gUYzhtHUdfdhufaLNphIvBV3KTu
   7TydsCv2rkIiGX1HRSIGRODhr6xgvTMKmfITp5xN+ZEwpq7JcjXGOnzwL
   sqdB0Y0NGjqeLJ46NvWsVvfotw5xSBkWCBeN2kmDgvLd7mbiEMln1sk20
   Q==;
X-CSE-ConnectionGUID: m4w4U3vZTgOSh0R6UOxmGA==
X-CSE-MsgGUID: rI72dombSHOCw9NJaDgmPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="90576137"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="90576137"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:33:05 -0700
X-CSE-ConnectionGUID: kGvxqGjSRuWdosyott50pA==
X-CSE-MsgGUID: bein1FNVQgeHSmiLVgIbjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="236250088"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2026 04:33:04 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ1e9-000000000Cv-29x5;
	Thu, 21 May 2026 11:33:01 +0000
Date: Thu, 21 May 2026 19:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1100/1130]
 lib/crypto/riscv/poly1305-core.S:91: Error: illegal operands `sd xs0,3*8(x2)'
Message-ID: <202605211922.XxmyxWPP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Christian,

First bad commit (maybe != root cause):

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 3a93cebfaed1cf821c02f08e7be6572f55b6756a [1100/1130] cheri: lib/crypto: cherify poly1305
config: riscv-randconfig-002-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211922.XxmyxWPP-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211922.XxmyxWPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211922.XxmyxWPP-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/crypto/riscv/poly1305-core.S: Assembler messages:
>> lib/crypto/riscv/poly1305-core.S:91: Error: illegal operands `sd xs0,3*8(x2)'
>> lib/crypto/riscv/poly1305-core.S:92: Error: illegal operands `sd xs1,2*8(x2)'
>> lib/crypto/riscv/poly1305-core.S:93: Error: illegal operands `sd xs2,1*8(x2)'
>> lib/crypto/riscv/poly1305-core.S:94: Error: illegal operands `sd xs3,0*8(x2)'
>> lib/crypto/riscv/poly1305-core.S:188: Error: illegal operands `ld xs0,3*8(x2)'
>> lib/crypto/riscv/poly1305-core.S:189: Error: illegal operands `ld xs1,2*8(x2)'
>> lib/crypto/riscv/poly1305-core.S:190: Error: illegal operands `ld xs2,1*8(x2)'
>> lib/crypto/riscv/poly1305-core.S:191: Error: illegal operands `ld xs3,0*8(x2)'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
