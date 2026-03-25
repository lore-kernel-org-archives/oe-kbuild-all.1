Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4183081D6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441896; cv=none; b=OgKPzQvD12jSMYZYmrOXZ7Xl8dUxDuO+cXpcVEG/Og60RMH+vRQe2M9kS4ITlo2G7wXQKBQccT2p7vS1e/tulv0vUX8ht893dGsqYVUsZEpmymCu98HbH+JfPBrcND/kSefudWHlpOUSYbWyBeb3AnkPewcNYwxBYbmAoA8k5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441896; c=relaxed/simple;
	bh=FaE9KC7eeYl4GqFCpDP4T/ru7BQ340pCEYq6kGp+IO4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mv4oTTa5p4qBgKkHM2mhPs9GWperd672pdpKy5ww5y69nDfKMorUYTHrXp7liszqAVOLgLn01I1F5vUb1qN5j2V0c2+7ct7wmSt3bkZJMTgpxsawFma4WCztRQZCcnzWmB9eyy5lRzVdLUPIIDLRIXvvzStSJ755/ZJLD+0Mthc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ef7QB3ZL; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ef7QB3ZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774441895; x=1805977895;
  h=date:from:to:cc:subject:message-id;
  bh=FaE9KC7eeYl4GqFCpDP4T/ru7BQ340pCEYq6kGp+IO4=;
  b=ef7QB3ZLMBAsB/BBFvTnmBiq5KktIhFqRtEjbU+R4WRHoVIUGGen55xY
   7KE2GHPa8R6Coalw54twDjJ2tZGYHj59EUeqFl6uCxI/WCncksRtNJHxf
   lW2JH19sGU2IMRJn7QZPUAGf2ajLQM7L7QiIMm01tQv9yLhtS/mRXrp/+
   1HcXW67AK+R7oZZAfCfsFzS/z2eCdjGXBoVxJfXAJX8dblFFKAMLZQ5rg
   Kknu4mG2MBm/YaV3Z5YVYVLCBHZb8X7Sl2cyzZ02Cme8QOvzBGCyTbItl
   Kp2iPfmrjKL5oHpUlCoqaI0RF0bThWwrMebxTx0h84bKizL5ubrtvyeKL
   g==;
X-CSE-ConnectionGUID: cCOM7N05RNyoIEEFpwb/1w==
X-CSE-MsgGUID: wczwwGGQTRizo+MeZEyyLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75364089"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75364089"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:31:35 -0700
X-CSE-ConnectionGUID: N/ZTlroBRHKgHfX1s6cp2g==
X-CSE-MsgGUID: LYuGZmbQRXCTHVEyclLf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="248184785"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2026 05:31:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5NOU-000000006oN-390Y;
	Wed, 25 Mar 2026 12:31:30 +0000
Date: Wed, 25 Mar 2026 20:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 arch/arm64/kvm/hyp/nvhe/serial.c:60:6: warning: no previous prototype for
 'hyp_putc'
Message-ID: <202603252025.nhucJJaN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   36e33448be90aea3d2e98da271b35aac511b8dc6
commit: 485b479fee4fbb2f2b8ac3bce7cc7f994b300303 [1/1] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260325/202603252025.nhucJJaN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252025.nhucJJaN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252025.nhucJJaN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for 'hyp_puts' [-Wmissing-prototypes]
      42 | void hyp_puts(const char *s)
         |      ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/serial.c:54:6: warning: no previous prototype for 'hyp_putx64' [-Wmissing-prototypes]
      54 | void hyp_putx64(u64 x)
         |      ^~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/serial.c:60:6: warning: no previous prototype for 'hyp_putc' [-Wmissing-prototypes]
      60 | void hyp_putc(char c)
         |      ^~~~~~~~
   arch/arm64/kvm/hyp/nvhe/serial.c:66:5: warning: no previous prototype for '__pkvm_register_serial_driver' [-Wmissing-prototypes]
      66 | int __pkvm_register_serial_driver(void (*cb)(char))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_putc +60 arch/arm64/kvm/hyp/nvhe/serial.c

    59	
  > 60	void hyp_putc(char c)
    61	{
    62		if (hyp_serial_enabled())
    63			__hyp_putc(c);
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
