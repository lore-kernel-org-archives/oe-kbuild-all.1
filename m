Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9541F4CBB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041364; cv=none; b=mqlm3fXBaxFtV5UYWg7vKnKYCwfNO8Yg8O5TVWjr24sXVOXhotogqNXggAYD0+nYjHQNhFgLsQkqEdeYlI/zB1rjq6aM0vSX/bVswrSKKLyXR3xtkQ3l0S/DIusjyaQHJ+nd24xvNM/bDOpvt0biZQR5Ru6gcl+5dzr8L4pPbzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041364; c=relaxed/simple;
	bh=89+W6eNuOr1T1BGEF/eRj1v69ALzCtfZVgPs9QfJu5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HHqAE5Nu9FzFiU2qXyRXcvA+R46nE/o1Ku8ovHE7VIk+FEHoiM+lFWw3+liEHXds0M2iuumCxQTcIvLmngyRFqWdOVMclWEHh03spY7XLvCXZbUJtuw9yutCs+8aPdwsTa8ABL1dN2XtcHtmiAYfk5wklxLMtd4LaiEJS9z+tYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WI/n4uh7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WI/n4uh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766041363; x=1797577363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=89+W6eNuOr1T1BGEF/eRj1v69ALzCtfZVgPs9QfJu5E=;
  b=WI/n4uh7S5wAeiVoRZtM3o7B3MvYgXrd56+RRjeY+R2ry4UeIVs+cEXX
   mkD6akGlTL0zzb53uEuan7ozdTd8L46ukgrSDgFDPW+DIv8dOXB3oc+IU
   xgFw4I8BCHBDbLdqXsk8+N3pBtema+GM1OiqEvlO8GJEuVQjwTWTjpN7b
   tqFVEp2Bpu7YbVrGoeaDYvjiHdm6kIKvdZ+V5Tf0mNBDsLAiD91JyUTKD
   jpiyoKDVRtPK8rfU4MDc//8LpJCfR28GAdswvYW4tUfzX5AmxKabe+A1H
   uEcIPLOO/xt2b8y6LKtmKE8ARQS0bHVnZKGfMj137rqHz5p2U/tzUi1nq
   w==;
X-CSE-ConnectionGUID: EuFR/DtPTeqwci3WO322wA==
X-CSE-MsgGUID: mFzFCyfNRtyGEX2kVLYWyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67869443"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67869443"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 23:02:43 -0800
X-CSE-ConnectionGUID: vuNUbJBCQSu1JbRZu+bqrg==
X-CSE-MsgGUID: 3gCts4zhTXCa2PQDXfkyfA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Dec 2025 23:02:41 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW823-000000001iv-3pS8;
	Thu, 18 Dec 2025 07:02:39 +0000
Date: Thu, 18 Dec 2025 15:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 arch/arm64/kvm/hyp_trace.c:96:27: sparse: sparse: symbol 'hyp_cb' was not
 declared. Should it be static?
Message-ID: <202512181438.aPDEbKQq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   12597ffc824d027b45aa3fda9606a4f0c3835d81
commit: 34305ad4b1bbf0b1938712ef0070a78d8b2c3583 [43/43] ANDROID: KVM: arm64: Add host support for the nVHE hyp tracing
config: arm64-randconfig-r123-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181438.aPDEbKQq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181438.aPDEbKQq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181438.aPDEbKQq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/hyp_trace.c:96:27: sparse: sparse: symbol 'hyp_cb' was not declared. Should it be static?
   arch/arm64/kvm/hyp_trace.c:488:5: sparse: sparse: symbol 'hyp_trace_release' was not declared. Should it be static?

vim +/hyp_cb +96 arch/arm64/kvm/hyp_trace.c

    95	
  > 96	struct ring_buffer_ext_cb hyp_cb = {
    97		.update_footers = __update_footers,
    98		.swap_reader = __swap_reader_page,
    99	};
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
