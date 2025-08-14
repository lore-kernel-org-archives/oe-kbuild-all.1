Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431401DF247
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 14:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755182568; cv=none; b=KOWzvPmdPBpJM5CZwg4d8RH7UgAa8/tIL4ZHAdayghYc0Nwm7bsWezuwHcnwT9UwNyVoCXcR+CE+OTQqOvlrQ4xuL436wBLJ5C0SStu0idV0fAC2GDU2ow5ORMmUs6fnJpTrPnVRxF3nA2OOk5wB6kkn6LndqsmMPhFj9H5iPXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755182568; c=relaxed/simple;
	bh=ljgrrVjssP9kEpRp2uKu/JPanxs9qzzXBP+0Zr//zX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RC6HaAaSKuY15seCGq/2i9HwEOMQYcKbV22Vzyd/3gDt8zXSI+8Mt+BAgDjXEG1kUSUwh71kGr6lpSBaoYio8w/DGOmlNKmhSscTJouZYqV142og05IFnax6JBmmgbLXp8U9a4ME8sPo8GCLu9vAWUR2twoHpNnC3wTXyYyRsxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OGHskoCj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OGHskoCj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755182566; x=1786718566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ljgrrVjssP9kEpRp2uKu/JPanxs9qzzXBP+0Zr//zX8=;
  b=OGHskoCjbMupdZ7mrfIksSFTN7Xfel8Tt3GSyOXd2EcPEU1xal8VP5Ln
   pc6QnOfrBQ3poxVnxLuChsK1Gc4nrUgSdZds5SAgDYKIR3OkyBQXOzdLR
   zAy0IbkEgdVNFR3JU3B1A0jeOZPjqAlI++UUMnFe761QAd6hyx8zuIqLz
   A8Cc7sRcYIHblg6u1WBgP+kXhlZpJIBVLg4uGuc/lBlxFabu28hUzGHlE
   jAR/VxkS8oMlwod3MXGtLIb0tLN7yvzWeSd3IDFKhxKZLjl8txGLeys4E
   c7ZDJ2aTaLV0J+X7WO51kDwwS2jQy7njTBJ9bHwwPeGnenPnUuPD/gpfF
   A==;
X-CSE-ConnectionGUID: Ec/FTDEAQpWr9ly08QI1kw==
X-CSE-MsgGUID: FT3G29XsQFaWMds+i3USVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="57424017"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57424017"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 07:42:46 -0700
X-CSE-ConnectionGUID: NrVmdOsaRJKgnFgFa4skLw==
X-CSE-MsgGUID: KzKJ3DmvTJaKVcfIah+sJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="165994623"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2025 07:42:45 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umZA9-0000IB-2y;
	Thu, 14 Aug 2025 14:42:41 +0000
Date: Thu, 14 Aug 2025 16:41:55 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4]
 arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for
 function 'hyp_puts'
Message-ID: <202508141638.ZbfHdA7W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   125206b4d7d6898a8a5d0c088a5ba75114266b81
commit: ea53aa5d800829a9adc17df0b6615eb845a9314b [4/4] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-randconfig-2002-20250814 (https://download.01.org/0day-ci/archive/20250814/202508141638.ZbfHdA7W-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141638.ZbfHdA7W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508141638.ZbfHdA7W-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for function 'hyp_puts' [-Wmissing-prototypes]
      42 | void hyp_puts(const char *s)
         |      ^
   arch/arm64/kvm/hyp/nvhe/serial.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | void hyp_puts(const char *s)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/serial.c:54:6: warning: no previous prototype for function 'hyp_putx64' [-Wmissing-prototypes]
      54 | void hyp_putx64(u64 x)
         |      ^
   arch/arm64/kvm/hyp/nvhe/serial.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | void hyp_putx64(u64 x)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/serial.c:60:6: warning: no previous prototype for function 'hyp_putc' [-Wmissing-prototypes]
      60 | void hyp_putc(char c)
         |      ^
   arch/arm64/kvm/hyp/nvhe/serial.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      60 | void hyp_putc(char c)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/serial.c:66:5: warning: no previous prototype for function '__pkvm_register_serial_driver' [-Wmissing-prototypes]
      66 | int __pkvm_register_serial_driver(void (*cb)(char))
         |     ^
   arch/arm64/kvm/hyp/nvhe/serial.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      66 | int __pkvm_register_serial_driver(void (*cb)(char))
         | ^
         | static 
   4 warnings generated.


vim +/hyp_puts +42 arch/arm64/kvm/hyp/nvhe/serial.c

    41	
  > 42	void hyp_puts(const char *s)
    43	{
    44		if (!hyp_serial_enabled())
    45			return;
    46	
    47		while (*s)
    48			__hyp_putc(*s++);
    49	
    50		__hyp_putc('\n');
    51		__hyp_putc('\r');
    52	}
    53	
  > 54	void hyp_putx64(u64 x)
    55	{
    56		if (hyp_serial_enabled())
    57			__hyp_putx4n(x, 64);
    58	}
    59	
  > 60	void hyp_putc(char c)
    61	{
    62		if (hyp_serial_enabled())
    63			__hyp_putc(c);
    64	}
    65	
  > 66	int __pkvm_register_serial_driver(void (*cb)(char))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
