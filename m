Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6C316905
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 22:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772145262; cv=none; b=ZgWgO9XMk6n+COeuUnfdHgh8MlvSc2fxq0ctU/4v172SBwhhYASML4Dz/edtgaV68ygRlF7Iqc96ZY4597AoBISMUydLO2xaa9F7G4aZ0StCJgyNuZu8GXXmlsSXuQnIvAWZYOOHPAB7Y4NKcUhCZ7PDKdE7emmk0CfJg36X6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772145262; c=relaxed/simple;
	bh=Rp4YrULsO/7pbiWFvUO3tnNv1U4Ua0kpuzSEqqMq9cA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pYmufh0Pqj+mSPY7khR+lnSiEoPlYynUL+BfMNgJSv4fGkH55lSmOmriEFekSyBPqt7PVT44H5ohWTVk2yJNJ3hVNdEfzg6oI9uS043dZtZkftZSvR1mUeCSxOWN73pexf9Pcqx/v6Bwba6KLWCd3TSa5Fe0Xar2aRqO/8l9C0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJePfgFU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJePfgFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772145261; x=1803681261;
  h=date:from:to:cc:subject:message-id;
  bh=Rp4YrULsO/7pbiWFvUO3tnNv1U4Ua0kpuzSEqqMq9cA=;
  b=lJePfgFU6966bwv+66ztvvu+0AMLQP9Iq62f7UlV5nnWS0qjUU8wsksL
   A1uwfWWH7+X6l4Vam3aHSdc1pI3Z/f5MgnjZIt/pjliIKv1uifBVpYbkF
   vTcI6sVydYFLNXyyd4OgQ86v/sK9etejmGNm4dSK+xSqw2mBxIHPtabfz
   9YE7m/P2NAwMIULAwrPdKyID7j1Ngucak6YRe+5s61r5jCQI2iPph7dww
   x9v7BEg2gxDRtA6QAfj4y91GYSmW4a0F029UBQaowthoeXsjn1q2Awu6e
   FcYszeeXRqA1q0lLt9GVlVAoYDtIQz9NcsYhTdV9ZdVeYGoevAayob9Wx
   Q==;
X-CSE-ConnectionGUID: 0T37tEzmTe2DOl2K5jk9Ww==
X-CSE-MsgGUID: dUxuMLqKR/aCgqwjW7RZ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="60798586"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="60798586"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 14:34:20 -0800
X-CSE-ConnectionGUID: fSZ4HiQdSdKM1ZdOA3qBnA==
X-CSE-MsgGUID: fjTpR6FkSHeLEC0y1KyXcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="215391389"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2026 14:34:19 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvjw1-000000000LR-1HTJ;
	Thu, 26 Feb 2026 22:34:17 +0000
Date: Thu, 26 Feb 2026 23:34:10 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 110/110]
 dirty_log_test.c:775:9: error: implicit declaration of function
 'TEST_ASSERT_EQ'; did you mean 'GUEST_ASSERT_EQ'?
Message-ID: <202602262332.xvFTxwwU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   8daf5694de38cda74d36b34a8eb8d82ff0392aa5
commit: e5ed6c9225378b7ab6b0e305dd84da7c87219a1b [110/110] KVM: selftests: Fix a semaphore imbalance in the dirty ring logging test
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260226/202602262332.xvFTxwwU-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602262332.xvFTxwwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602262332.xvFTxwwU-lkp@intel.com/

All errors (new ones prefixed by >>):

   dirty_log_test.c: In function 'run_test':
>> dirty_log_test.c:775:9: error: implicit declaration of function 'TEST_ASSERT_EQ'; did you mean 'GUEST_ASSERT_EQ'? [-Wimplicit-function-declaration]
     775 |         TEST_ASSERT_EQ(sem_val, 0);
         |         ^~~~~~~~~~~~~~
         |         GUEST_ASSERT_EQ

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
