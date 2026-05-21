Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4066B1A6825
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380942; cv=none; b=NfKBAVS2phFPKRctKIVF7Gb4ZyzyklBoyrv03L4T/rOp0ylovtR7SBN/8rmKprpTJq3jDmRyGpoDMQ1LSNDCnH6Jj1rl9JuvXgt2TonYGCb3hOhdhFO2WH99pKc4ELBp9zsvSRij0xprJMRhR/w+olkpw86ZhIsHcRPDWA4274Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380942; c=relaxed/simple;
	bh=hhNpy1powOsFtAtyAqlogT5Gwym+CrAqDQV/iLqaF/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ugnaBgxx92r13jsCJiDoqpdA+M50OyFuyYTGFjCLtVPqdvA4er4j6Qe1E0pR8VtMmi1m5AR+uahbhnvzmzXUS367eMiy6uNnYZjklRiFKCaUwuhitVreqgqmDrjlw/M06zps7wyazlWsurcPdgWJN8UvD2hISFXyiqk0lhY1BF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqFkNWQP; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqFkNWQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779380941; x=1810916941;
  h=date:from:to:cc:subject:message-id;
  bh=hhNpy1powOsFtAtyAqlogT5Gwym+CrAqDQV/iLqaF/Q=;
  b=NqFkNWQPV/GnDVPGI1qCEDFyo5bNU9N+WOosW29k4sHYJTkGzrLZgP4Q
   edIXP1ujPQkbXm2ze9OmUaE0Ycu0s848HSh68Upf9+BuBHTgLD8AiY/ZK
   LlymngyOWDisC+6gN9pXsHaZBGi6T68XQu131Bdj+zH8fJSscmMdxt5gr
   dcNM+4NkNwZg9b5AnvvlqC8A38GuqEjaR8QbvrvQSVLyNEeIQ1qCjFqSX
   eX1AmsVL31sjrvMHgy49Q8+hBdkWakpAw49CW7L0jrRWlQmUqAMqF3kMJ
   mAOhCKLI5l06VTdRJTMtZx4RYoouDcYJl2QPCheloyFRrtBwKpOF/A1Vr
   A==;
X-CSE-ConnectionGUID: LzAGU9LZQYaQyJBULQHvTw==
X-CSE-MsgGUID: Rb242q+TQKmCxSaOGE4w2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="79454356"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="79454356"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 09:29:00 -0700
X-CSE-ConnectionGUID: Kd5E+4l7S+iN+S0DYhgbIw==
X-CSE-MsgGUID: ghRNaIW/TwiiDJaTTyj3AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="264372124"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 May 2026 09:28:59 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ6GX-000000000nJ-1QhI;
	Thu, 21 May 2026 16:28:57 +0000
Date: Fri, 22 May 2026 00:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1042/1130]
 drivers/video/fbdev/sis/sis_main.c:1656:17: warning: 'sisfb_compat_ioctl'
 defined but not used
Message-ID: <202605220016.0cDGkOSC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 29215d96a50fc1e78f4341de622e393c45325bea [1042/1130] cheri: riscv: compat64: Enable compat64 in default configs
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260522/202605220016.0cDGkOSC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220016.0cDGkOSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220016.0cDGkOSC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/sis/sis_main.c: In function 'sisfb_compat_ioctl':
   drivers/video/fbdev/sis/sis_main.c:1659:55: error: implicit declaration of function 'compat_ptr' [-Wimplicit-function-declaration]
    1659 |         return sisfb_ioctl(info, cmd, (user_uintptr_t)compat_ptr(arg));
         |                                                       ^~~~~~~~~~
   drivers/video/fbdev/sis/sis_main.c: At top level:
>> drivers/video/fbdev/sis/sis_main.c:1656:17: warning: 'sisfb_compat_ioctl' defined but not used [-Wunused-function]
    1656 | static int      sisfb_compat_ioctl(struct fb_info *info, unsigned int cmd,
         |                 ^~~~~~~~~~~~~~~~~~


vim +/sisfb_compat_ioctl +1656 drivers/video/fbdev/sis/sis_main.c

  1654	
  1655	/* ----------- FBDev related routines for all series ---------- */
> 1656	static int	sisfb_compat_ioctl(struct fb_info *info, unsigned int cmd,
  1657					   unsigned long arg)
  1658	{
  1659		return sisfb_ioctl(info, cmd, (user_uintptr_t)compat_ptr(arg));
  1660	}
  1661	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
