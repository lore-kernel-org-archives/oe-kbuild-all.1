Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413CB4A2F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 11:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722685595; cv=none; b=LT/ff4fUjLMNBqnVW5TKdVXuZsRLxw19KenkbrLrQHAFXQImJ9hbm48CUgXKHbXXfegJX4O/ji4HV+tms6DF2qoYLlFGPDTCNHXf68ekgyHr/qAloZqAcW6le9La7x45QJmhspdrRgj9Q4gmIBq3xwajKpzyzvCGWaTjZ3XruN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722685595; c=relaxed/simple;
	bh=Z8MBOebm3oJdXBH0sdxD0JUrzON71RaCf+ifseNBvhI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cqLo87vBxMutdbANvfhSsyQpQb0qhZgtNABtpwkmRYLV0v1u6UWS7iaMYKh40R4aclnAZ7zZ2ajStXF7IrW/rOslgL3eX7iFcSFevb53mSRrkwuJbnreaB1wii4oS/5Z/qqtHNvTqW/56M9O4C2M5ddgTKDCAQtatl8EBPd0i+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJUopmE4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJUopmE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722685593; x=1754221593;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Z8MBOebm3oJdXBH0sdxD0JUrzON71RaCf+ifseNBvhI=;
  b=oJUopmE4VB1O8dT2dcAdfO7QANWazy4Yo5WEwP4XiBmqX4y+QVr/V0XO
   RP/U4vuilnf0fQOIEdf+XwKwsmRxG/XB2r9NaEZr7BzOLTFaMXJUg+Yt5
   gzbU6aDft5e8ghPs8r9hGfoOlpVqY/3MxwEq0gdecT92Ig3zzvOexWECO
   1A3ufnR9+qbUDpojU8Xf904ixb4eGo7mSGCVY7BsiwooItLsHdDmYf8Sr
   XhpTH8L/qe+aBnEIcYM1X4CGyFS5tK4O2/4Uh2Ow9xfYiWWNKqd58+2v9
   Wzu6W2bpN0iZhYDpCG4aP8rlfvnTZvldU9slKMe/DVrdbzBoZLQVB6yxB
   w==;
X-CSE-ConnectionGUID: 33L4MrvdR2WxbiKrE/zLXg==
X-CSE-MsgGUID: A9GxYYr9Q/yvcJaezrY7ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="38198348"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="38198348"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 04:46:12 -0700
X-CSE-ConnectionGUID: ju09BJHWSNOnaKRa6zFlOg==
X-CSE-MsgGUID: Q+8iaJQ+SViPVqRPqaPEKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60531225"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Aug 2024 04:46:12 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saDD2-0000Q2-1x
	for oe-kbuild-all@lists.linux.dev;
	Sat, 03 Aug 2024 11:46:06 +0000
Date: Sat, 3 Aug 2024 19:45:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 867/29299] aarch64-linux-ld:
 jack.c:undefined reference to `input_free_device'
Message-ID: <202408031909.aGEsgudJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ram,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   9485d66da87d67d1efc4a5f2d357616c6501dc72
commit: 1e702f432d551041753c46ec0d6d49484e776441 [867/29299] ANDROID: GKI: Added missing SND configs
config: arm64-randconfig-004-20240803 (https://download.01.org/0day-ci/archive/20240803/202408031909.aGEsgudJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031909.aGEsgudJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031909.aGEsgudJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_disconnect':
   jack.c:(.text+0xc4): undefined reference to `input_unregister_device'
   jack.c:(.text+0xc4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_unregister_device'
>> aarch64-linux-ld: jack.c:(.text+0xd4): undefined reference to `input_free_device'
   jack.c:(.text+0xd4): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_free_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_register':
   jack.c:(.text+0x1dc): undefined reference to `input_set_capability'
   jack.c:(.text+0x1dc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_set_capability'
>> aarch64-linux-ld: jack.c:(.text+0x20c): undefined reference to `input_register_device'
   jack.c:(.text+0x20c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_register_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_dev_free':
   jack.c:(.text+0x40c): undefined reference to `input_unregister_device'
   jack.c:(.text+0x40c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_unregister_device'
   aarch64-linux-ld: jack.c:(.text+0x41c): undefined reference to `input_free_device'
   jack.c:(.text+0x41c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_free_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_new':
>> jack.c:(.text+0x5f8): undefined reference to `input_allocate_device'
   jack.c:(.text+0x5f8): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_allocate_device'
>> aarch64-linux-ld: jack.c:(.text+0x660): undefined reference to `input_set_capability'
   jack.c:(.text+0x660): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_set_capability'
   aarch64-linux-ld: jack.c:(.text+0x710): undefined reference to `input_free_device'
   jack.c:(.text+0x710): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_free_device'
   aarch64-linux-ld: sound/core/jack.o: in function `snd_jack_report':
   jack.c:(.text+0x92c): undefined reference to `input_event'
   jack.c:(.text+0x92c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `input_event'
>> aarch64-linux-ld: jack.c:(.text+0x9b8): undefined reference to `input_event'
   jack.c:(.text+0x9b8): additional relocation overflows omitted from the output
   aarch64-linux-ld: jack.c:(.text+0x9fc): undefined reference to `input_event'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
