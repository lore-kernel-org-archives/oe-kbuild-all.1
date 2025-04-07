Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B4E206F1A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042381; cv=none; b=oT2Kmi3LzITrDbp0Y7v/rsQgQZtXzNr/vMb3VPLma0myyveFnvLomTZAP7n0mwyGyJyLsV5uwove/5nifH46MZrXwwuB6O+aop+jxEIIezjnDVzuYdMnfNddHxRdwtfX7wcl2Wu+0gE5pkI5C5X1Rl9t2wOVp9g96aBl5qsNivY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042381; c=relaxed/simple;
	bh=YoabH8Vv3jzvgX7p/Us7BuN4gkORkp4yoJo1cDVY2Ao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NU4Bt0dPdV1KfrIXzx13qntk/3i/8lC8WLKq826ykKx/Ap8r9TJvOGJlsaADqe+GS6sImzXNmEtLTpO3/mtljK4s3r4H3t+WjDi8vjdMIe5GeKTUZNkTCd95ojvPixUHf+0dfTAEnXR/A0qKETNeapnYd3QWjgN51Hi7PMtmrmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4g7KSVg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4g7KSVg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744042380; x=1775578380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YoabH8Vv3jzvgX7p/Us7BuN4gkORkp4yoJo1cDVY2Ao=;
  b=b4g7KSVg5W9RkSTh7aCcfsGoWBqcZ+UszW4gv8XuhuZfcL2EwfKo1dwh
   zMb4MHFT6n4X05fgn7OHV0am+sekaZBPcSDWq/zW3/PndfxyrK+Sk33Nw
   AfBRVpqanh/QkJXzgygeGlFEXCmtA6I9kVPqHQDaErHNZnNPNhPtI8FO8
   RMd2krSr3F2Jf1EiCjH/Hoipt12ATyYTOdR8fa+wqk4oJs5fR/PsJlI9g
   efBCTpyV2ehnolkCA/kxy36DFMDBIih6tpq52+0LpFUVbAfYcKsYE9IGv
   JfC9N2EEJRrP90UZUU8urcBH8THR0EdX3ot3dUWUIB+fIcmG8OzZT7skD
   A==;
X-CSE-ConnectionGUID: 25J5UW/7QoCy08pnnuPdHA==
X-CSE-MsgGUID: Y8DthvFsTFKWxNd3yjP/fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="33043288"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="33043288"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 09:12:59 -0700
X-CSE-ConnectionGUID: xfoNxgWUSjGvqdaRj0yTLA==
X-CSE-MsgGUID: CCSrrORPRka0bvWodsUJTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="132725990"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Apr 2025 09:12:58 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1p5j-0003aP-2W;
	Mon, 07 Apr 2025 16:12:55 +0000
Date: Tue, 8 Apr 2025 00:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 25/25] WARNING: modpost: EXPORT
 symbol "policy_has_boost_freq" [vmlinux] version generation failed, symbol
 will not be versioned.
Message-ID: <202504080058.5sJkfWkP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   e39770687017b78c961a47d6b4d4df4f260ef066
commit: 858a257b8cabd8923251cba5e22b9aecf978241b [25/25] Merge fd8c09ad0d87 ("Merge tag 'kbuild-v6.14' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild") into android-mainline
config: arm-qcom_defconfig (https://download.01.org/0day-ci/archive/20250408/202504080058.5sJkfWkP-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504080058.5sJkfWkP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504080058.5sJkfWkP-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: EXPORT symbol "policy_has_boost_freq" [vmlinux] version generation failed, symbol will not be versioned.
Is "policy_has_boost_freq" prototyped in <asm/asm-prototypes.h>?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
