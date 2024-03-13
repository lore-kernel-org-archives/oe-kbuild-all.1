Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A932383BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710326629; cv=none; b=Sk/tsAo5jmEPqR8fH6OLQONK6GUar5a78sHUPp991ZMV7V0V7vlbW9EEz1tL5kr+1fZKNvvyCJ2ocakhNH+6OC1TUNarTHm3Bwu8O2u4F+M5h7H8sQ8KFz9E7+LTxT0RBC6i5MzCfzai5uHa6xEadZBSWO69Ied2B6RX4vHK3T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710326629; c=relaxed/simple;
	bh=/UfL3E2Lw2a1IkO15wXbuEndPBoFxuADHYlN/JcoZiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OR7qkFqI3sCW+CSmFZsjo9s7CtH6WrdcnFL3v8/bq0ftTJ8GbbWuwmNpVTuuNeKhlQbemcMWLV6elt6kPwz/LTN6EN8J2KTiPUzoFptVEb7XiFck2thFTkC0nl5AiBTlF9aqHZGtsVjEQZ6nMKLKGdjD1NkFRqBN3NDdvpo4ypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QI4z/km8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QI4z/km8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710326627; x=1741862627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/UfL3E2Lw2a1IkO15wXbuEndPBoFxuADHYlN/JcoZiY=;
  b=QI4z/km8nwd/AT3h+XueHUKugfLONQM9YavM6aMKNxxdYLnkb8NcpnXA
   DMXgIgDmQJ9FCsuhOtz8FSW8q2TP4xc1Kz6HAtx6xaT3ce5FAOQlAOQr4
   tnneP5IT8JNzC+2BnGTH87X3XzXhoL216crX15KgZktV+8G7teq02aXR2
   VE7chtVhlzewwo7V2q/wnjAt3Xg/X5XLfXRoSOUKymO+4m2HTZ9ex0/V4
   9+0jm8xJJR0YBFOuc50a2IlOggrcbPF/MB3Rhi1DnvOmujvJJjRlhE8Ft
   fLiA1bH5sjnm/xKDrOS6C2nTgcYPuUlnIa6K3fDn6X1JphrszXYJ/wetU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5252031"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="5252031"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 03:43:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="16452338"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2024 03:43:45 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkM5G-000CHh-2f;
	Wed, 13 Mar 2024 10:43:42 +0000
Date: Wed, 13 Mar 2024 18:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12842/12944] powerpc-linux-ld: warning: orphan
 section `.bss..Lubsan_data772' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data772'
Message-ID: <202403131859.SZdCjzFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dad309222e4c3fc7f88b20ce725ce1e0eea07cc7
commit: 10217e780833544b6abb8502b757d1e7b03c489a [12842/12944] Merge branch 'main' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
config: powerpc-randconfig-r026-20220530 (https://download.01.org/0day-ci/archive/20240313/202403131859.SZdCjzFY-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403131859.SZdCjzFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403131859.SZdCjzFY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data772' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data772'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data772' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data772'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data772' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data772'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
