Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4DE2C9D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 04:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762576452; cv=none; b=MzOZ7VjGFuAf6W9iUrKr2fYTlDtsJNlT3FToO/0WwoaEualNUEIkhYRIRvpUWQiv88SL5yE6J+EpuTgva0IJjkb+17biwPVYYtc+jV80C0Dd0jlexefFTJx1FUkRamalHzkcELb42qdO1l3mlMzaCKOuj6ajI/hr1XAT19L8Qm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762576452; c=relaxed/simple;
	bh=jRqKNGis/urqUyBpjhlzSSE5NZio+0pV7gncGWaXv4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tAOEhHvJ7cMgl6kQu577RJEKEQ512eyigY+XWh3a3ogf51/ues/QZHbxIt8P6YHi3TxlC5gHRrlN2i+Kh5qi/JHbaf4psVuW8XYI7nZCazxfRV4VS8l1s8kXTITghMr60GMVPak5f6ocTWQBuPVy6j/bjV38gGaZv9b2fV0VRF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SL0uDbmI; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SL0uDbmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762576451; x=1794112451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jRqKNGis/urqUyBpjhlzSSE5NZio+0pV7gncGWaXv4k=;
  b=SL0uDbmIjOHfRcumKJmX/wf8efLr/UEPGSzhhJCvlGjaohUei0S9ZCko
   t8YbVXtKyFe4y1ho7qAxWJ4TRv2hhHzrD7y79ddWx9oQJb/oulzrU8W2J
   0zkFMk2dbyH+rQBvKhuS2yXn8xaURf7Vp1LeWLwvGjkj5wkdfxnt3kFRm
   wuSX7s2KfFqhquu0OO5Ds1iqf5pfZF+HhqsQYYgjIySp7ViYrdqXVVo2f
   Qtxt+WO5T3v8KeoWDLHRPATekDOitNnbyMM9PmVEdZXPckZUjIKegZmQR
   hIkKuJzKP4FLuo6f7lmUqN74Xs8T/LofbrvCLEf/0lNxCMHpZOthzImp9
   A==;
X-CSE-ConnectionGUID: qMWyd5onQMGPuvd0lx74RQ==
X-CSE-MsgGUID: +Usl28iKTA2ADYRNvHvEww==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="63931539"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="63931539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 20:34:11 -0800
X-CSE-ConnectionGUID: pk8tSVyaSMme6DiAG4+yMA==
X-CSE-MsgGUID: ZKiYx0XxT9WEfr2w+E0byA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; 
   d="scan'208";a="187466299"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Nov 2025 20:34:10 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHaeN-0000jd-2B;
	Sat, 08 Nov 2025 04:34:07 +0000
Date: Sat, 8 Nov 2025 12:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:uprobe_prolog 6/8] arch/x86/kernel/uprobes.c:1496:36:
 warning: 'opt_xol_ops' defined but not used
Message-ID: <202511081221.KQI9uToR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git uprobe_prolog
head:   0a54bb564fac2eaf528c88c5d6abc55213a4f073
commit: d61886bf13325710a187aeed37cef10307a87c36 [6/8] opt
config: i386-buildonly-randconfig-006-20251108 (https://download.01.org/0day-ci/archive/20251108/202511081221.KQI9uToR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081221.KQI9uToR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081221.KQI9uToR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/uprobes.c:1496:36: warning: 'opt_xol_ops' defined but not used [-Wunused-const-variable=]
    1496 | static const struct uprobe_xol_ops opt_xol_ops = {
         |                                    ^~~~~~~~~~~
   arch/x86/kernel/uprobes.c:1492:36: warning: 'sub_xol_ops' defined but not used [-Wunused-const-variable=]
    1492 | static const struct uprobe_xol_ops sub_xol_ops = {
         |                                    ^~~~~~~~~~~
   arch/x86/kernel/uprobes.c:1488:36: warning: 'mov_xol_ops' defined but not used [-Wunused-const-variable=]
    1488 | static const struct uprobe_xol_ops mov_xol_ops = {
         |                                    ^~~~~~~~~~~


vim +/opt_xol_ops +1496 arch/x86/kernel/uprobes.c

  1495	
> 1496	static const struct uprobe_xol_ops opt_xol_ops = {
  1497		.emulate  = optimized_emulate,
  1498	};
  1499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
