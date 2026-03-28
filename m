Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA49E40DFC9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 06:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774680979; cv=none; b=Nh19nrkjB0zcD6WVUM9NJo6+PmXvPJEhXFIDhoUWlbSMsoRZsJMqGHRoB1XxUk3HLEq0AuFv/53AxRd9QyvXN3NpjoJbPiUUZ2f8dsNtvZ6MzmEKPE6o/ZDF6wvXMasc1i+ZskmRjVBGUlduomucVzFMdupMvtt2UVbC1yoaPdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774680979; c=relaxed/simple;
	bh=lOj/LV4Hm9FxUQekbZz9rzp0oEP+KHjgsZiA/gmN2cE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lkAL72V9EpAsFx+AK/925id4CpxdMe9Xg9uJYG/mx27jtCQVEcBcLCTNtjGxLkPuZOZGUdr8YICamFveBVSXrAQAT4d1+XCSwIrPZpnSBBDw7l41DnbhqSlxFko8lrSAIhdj7caPW+TWD9B4iLNfHpKVYBXrLXUcjQE5yXvLuFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ClS9BCsj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClS9BCsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774680977; x=1806216977;
  h=date:from:to:cc:subject:message-id;
  bh=lOj/LV4Hm9FxUQekbZz9rzp0oEP+KHjgsZiA/gmN2cE=;
  b=ClS9BCsj3t7dK1JstcDsf4KOglEO960AgGGpj4LK7sokhwyOnsK8621t
   C2CBbxaNoQQAQDYoUyNj+HS5gtKb5Ns9GEoBKEsPuTJzMD6FOhlU9ZuAM
   Q90NqlOuKTsY0BuoE9v7C1tQpGIxIEuyb2FsTsRxKJ9H3cULCD3w8pbVc
   rcxYixrr0qrIfJ8rhX879YSDrzI8rvWhhfKUmFZMgthmiBotzHUs4aRMI
   BruoQC2LlyqPy3pVJy7khh5Xb3FQ26/dXH5oThi9QuGI+v74tQ1Sef4XB
   PwPrewHdNFQx5WSOmKdKT99Ulv+hi/YaXPQIPtOAVyzdD39jxyr66Cw9q
   g==;
X-CSE-ConnectionGUID: X7RIP87vTs+kcBvqFoDTrQ==
X-CSE-MsgGUID: N0egEOsYTfe1205PkotOMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79356520"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="79356520"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 23:56:16 -0700
X-CSE-ConnectionGUID: 4l8Ejr6LTiuuaLymozr9ZQ==
X-CSE-MsgGUID: igLTdxIaRiaOx/1nQmbTTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="220665302"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Mar 2026 23:55:54 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6NaJ-00000000B8t-1mJD;
	Sat, 28 Mar 2026 06:55:51 +0000
Date: Sat, 28 Mar 2026 14:55:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 4/4]
 arch/arm64/kvm/pkvm.c:70:3: warning: 'host_s2_mode' defined but not used
Message-ID: <202603281450.ANckDUNw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1eeff75d058d17b506a97fa282e7bbb55074c8d1
commit: a834e9b6ddb8d401b3ded1fb0bf4906024f99228 [4/4] ANDROID: KVM: arm64: Add kvm-arm.host_s2 cmdline knob
config: arm64-randconfig-002-20260328 (https://download.01.org/0day-ci/archive/20260328/202603281450.ANckDUNw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281450.ANckDUNw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281450.ANckDUNw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/pkvm.c: In function '__pkvm_pgtable_stage2_unmap':
   arch/arm64/kvm/pkvm.c:1063:13: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
    1063 |         u64 pages, nr_busy;
         |             ^~~~~
   arch/arm64/kvm/pkvm.c: At top level:
>> arch/arm64/kvm/pkvm.c:70:3: warning: 'host_s2_mode' defined but not used [-Wunused-variable]
      70 | } host_s2_mode;
         |   ^~~~~~~~~~~~


vim +/host_s2_mode +70 arch/arm64/kvm/pkvm.c

    66	
    67	static enum {
    68		PKVM_HOST_S2_CMA,
    69		PKVM_HOST_S2_CARVEOUT,
  > 70	} host_s2_mode;
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
