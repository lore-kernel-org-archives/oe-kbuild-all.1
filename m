Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678F81448DD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Apr 2024 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713783505; cv=none; b=AwIRaBnjIDIJHR5jtpwEiuI7TYEcmy5c1udSzLpHnxq1u1HvFFF2nwK2e8LRJJyZ65yFgeYsIonVcHXjSLWymSoKEB0GWni0RnRNVHF66atsyMqexrs64l2TXqxQvq60b6jLWt2b9lGg1bssh5smx8wY3yebDM7Y3r4kNsV4ong=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713783505; c=relaxed/simple;
	bh=YdIG5dZJtMwNu85eAMMXv6DmsCmlZEb2ubq5mIrbv2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfDkYhe76DuUdi7b8nLANcxt9ShY0wqo8Sjpw2jkVTBnmbPThdTQsEYnHcUbnxDUZlsUb2egpm0IzuYzrX2Acv5+hYmPRx8E7FgaIndNBhOk2LsOM/g7JahUeGP8MVl/nG03G0KT+1e5MgLyfR+b3kqcqaJOfJMebqHFRoQ3N1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQ4zgSir; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQ4zgSir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713783503; x=1745319503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YdIG5dZJtMwNu85eAMMXv6DmsCmlZEb2ubq5mIrbv2g=;
  b=kQ4zgSir44IjgD2MdhyEILkBiVIBZVIoyHrRwxPSXC6BPOLhVvVi/7Wz
   BmXmY5+OMZKtUiIv73wMd82USLDIUcFfOMqbMRxppKQuE30uBosW7k7Cc
   n1BtjDjD4ZvlZ9nlk9wk7sDfVqjVyS5QIDxz2aSoWjkhmvMi5Iv+M8wl8
   gKSQ7bTNPX8bel0ojBCIQgBFahMqY9KP+Xmsw5mnz4BX17yj5X2ew+TsH
   02FYZc1JSVL4a+Niv3Q3IxjpYb5QZD8ucYmq3MCGgUtvl3y+gArwD1yKL
   K1QdbXV5yX9R0o+k50hXotxpDhLNzeu22hbB0X8JJ4ao6jHNKu+1fpl4F
   w==;
X-CSE-ConnectionGUID: 2rHJuJK/RiymVKs/gmMnbg==
X-CSE-MsgGUID: hGbP3yTpQb6am50i/siU6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20453677"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="20453677"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 03:58:22 -0700
X-CSE-ConnectionGUID: QF1LMtkiTmyudZiwZXE5vg==
X-CSE-MsgGUID: 8xW3KRF0Qrq2uTe/4d2HGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="24017004"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Apr 2024 03:58:21 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryrNL-000CUs-0M;
	Mon, 22 Apr 2024 10:58:19 +0000
Date: Mon, 22 Apr 2024 18:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 7258/7322] powerpc-linux-ld: warning: orphan
 section `.bss..Lubsan_data373' from `kernel/ptrace.o' being placed in
 section `.bss..Lubsan_data373'
Message-ID: <202404221830.CjQlhLdl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f529a6d274b3b8c75899e949649d231298f30a32
commit: d6e2c3628b585d0e854b626176a121a0fc97d2b5 [7258/7322] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: powerpc-randconfig-r016-20220221 (https://download.01.org/0day-ci/archive/20240422/202404221830.CjQlhLdl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240422/202404221830.CjQlhLdl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404221830.CjQlhLdl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data373' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data373'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data373' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data373'
>> powerpc-linux-ld: warning: orphan section `.bss..Lubsan_data373' from `kernel/ptrace.o' being placed in section `.bss..Lubsan_data373'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
