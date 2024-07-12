Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A028E15A4B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720786946; cv=none; b=Z4BYLyeT7jV30IHLa+kP4Rmlugzw50kKTq5YgrJ98k0SJTgsy7niwfSmLVSOrqu6Xp7wLxoCNOf7P9zYtnMSbtm8naElHsP7aokdExjeIsd5knaHU/zPpGZKUBgBaFFA+3DWegD3Uj+MbcdrbTsN5QpRpbXJ6nHo+6Td8BUfTKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720786946; c=relaxed/simple;
	bh=60xDG0vAtAMPVM3S7H3cW3DSvOXEycPLJveNLKXEQu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AI/q86xNO1kcijkIOcfSvwaOhrLelm0H8e3Qm+HzUoNwQNAaCZyAOSVp1tDCkaRG34XgLdki5Q4MCwHbtJ9Dau/sXB/ubBbnI74SPTkyI8z4PQK/flAjnOpfyyTx4iit/wbnDU5nTwpLbEf64auqcGXCxsNez91EFft6IVGCP/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSr0IhiY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSr0IhiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720786945; x=1752322945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=60xDG0vAtAMPVM3S7H3cW3DSvOXEycPLJveNLKXEQu4=;
  b=cSr0IhiYEz1YeGnL3m0tTZfntDDcsRvXop930C+ZGD3/IYRI3eshtkZd
   9HuswIxaFtLVCpH5Cp9M+SrRrhV0OHHFpbNN0XFMCB7F3KMBIFQCuGnil
   /OYP2CdTR4n7lcl3/DnoQ5/wjutKxTERCMz6fmMmRSbavdgckDBUJf4XK
   5A8cSQe3At2eAHEGu8x2pDPCYBGI8AtIAibGOPpPca2K8cTCXO/Tw2ncX
   JthTVkHUWbY77C2BSXm6z25npbr6ZjCO9ulV7r+Yps6FuJLmDvydDKtb+
   IY0uD+/BF0fzB2UDCfk8ufv53pBy+hY/nl0f8quUyvNkp48vs2LugTvHZ
   w==;
X-CSE-ConnectionGUID: dqZTaEkSQRaaSUlmEPz4ow==
X-CSE-MsgGUID: +IGVJQWHQkStO5ZUIuePhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="22038626"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="22038626"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 05:22:24 -0700
X-CSE-ConnectionGUID: 0M+OEsSbSsSLejX/chW2fA==
X-CSE-MsgGUID: UKVkbUVJSl+LqOHIoMxVwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="86394312"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Jul 2024 05:22:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSFI4-000akI-2F;
	Fri, 12 Jul 2024 12:22:20 +0000
Date: Fri, 12 Jul 2024 20:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 12602/12880] powerpc64le-linux-ld: warning:
 orphan section `.bss..Lubsan_data72' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data72'
Message-ID: <202407122042.KzZoZpbH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3fe121b622825ff8cc995a1e6b026181c48188db
commit: 7cc8189757b6f351718e793b2deaa85b1446d85f [12602/12880] powerpc/64s: use contiguous PMD/PUD instead of HUGEPD
config: powerpc64-randconfig-r012-20220414 (https://download.01.org/0day-ci/archive/20240712/202407122042.KzZoZpbH-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407122042.KzZoZpbH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407122042.KzZoZpbH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data72' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data72'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data97' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data97'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data72' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data72'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data97' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data97'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data72' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data72'
>> powerpc64le-linux-ld: warning: orphan section `.bss..Lubsan_data97' from `fs/overlayfs/copy_up.o' being placed in section `.bss..Lubsan_data97'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
