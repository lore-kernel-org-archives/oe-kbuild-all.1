Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE9F3B6361
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 17:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785519604; cv=none; b=RkEv/N4QaqFnK/ST0JraPin712RxEoFuMWJNkhps+mQAsYm5Z1JjxqlGL24+5c1dPOExZnmh4QbWms6XopU09O0P6XEfRvnOKKhEX4NqBrQM5CF19ZrTkYmnFUhhd4fECpH9T4DNnBe/vPAK7tCMgr8QXbDrwZo9TzTR//W6USM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785519604; c=relaxed/simple;
	bh=baFTbFg7TB5aU8JeW8qvZyhLrSEG9VBXFSGopUV5mVo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DqlrfZtJAywwfEkRnkLCqY2zxAIIPoxDRAkVQdQJW2yD6Jfq4sJHvQMfWiOnoWnlta2Z3+P4Pkc8FRRyUpxjoTG2VFzd8E0ic4lW4BAznWdgbeAdgVXFsQoWGxDiTfl4XD0myWnjdrZpJAhU4Kf/cZd/QzUobNxuwWlT4R5et5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJFLzIBf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJFLzIBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785519598; x=1817055598;
  h=date:from:to:cc:subject:message-id;
  bh=baFTbFg7TB5aU8JeW8qvZyhLrSEG9VBXFSGopUV5mVo=;
  b=XJFLzIBfPLQ7ZarMMTLpx4edDQRka4Fd4hJHMWbdKh+aZYd4At566UdA
   fWZ4NlKuLYEinuSW+yvq7g4hRLINHbjyW8J4DYy5NlVUN0tNSVCHB4E02
   slGdJfzMe1y56t5FxdPyhDFRC2EUodmjco1zITGfyHN71nbg9/XaPY2lC
   Afea54Q0z/60HGbER8HJKxu6pDkXyUEHCe6rYqsxHcT9vp7YQEIDPs6+E
   9Mi6k42398MW2e8QqW/Uo4uYS5+HU45uLGS0cOkbrfWOPAQR9yWSQ+Iqu
   qUTs9lEm9otCCLfV7W5z89kjKALzHYc/XEjc77Jc/NG65NiP+B644Zz1F
   w==;
X-CSE-ConnectionGUID: 1V35Axd4SI2SmyL0FcwgHg==
X-CSE-MsgGUID: TQRemnTeRTO+OEJRo6bVSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86229452"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86229452"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 10:39:54 -0700
X-CSE-ConnectionGUID: 8u2lzAPeSZKw/WJUfHCvvQ==
X-CSE-MsgGUID: CrJ8TBJKQ7WS+jjA8+/KsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="260046219"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jul 2026 10:39:53 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wprD4-000000001ng-1bK5;
	Fri, 31 Jul 2026 17:39:50 +0000
Date: Sat, 01 Aug 2026 01:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 14/16]
 drivers/pmdomain/apple/pmp-report.c:114:2: error: implicit declaration of
 function 'writeq'; did you mean 'writeb'?
Message-ID: <202608010155.C5HtMAPR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Sasha,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   31d4737ed0c3a0ee8fa904e09fd5d1b7cfe3f5d9
commit: e5f8c27073d6449fa54d219f67f47d30d2bf92a4 [14/16] pmdomain: apple: Add PMP reporting interface
config: arm-randconfig-r133-20260731 (https://download.01.org/0day-ci/archive/20260801/202608010155.C5HtMAPR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010155.C5HtMAPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010155.C5HtMAPR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pmdomain/apple/pmp-report.c: In function 'apple_pmp_report_set_state':
   drivers/pmdomain/apple/pmp-report.c:110:8: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
     val = readq(rep->base + rep->offsets->tgt_read);
           ^~~~~
           readb
>> drivers/pmdomain/apple/pmp-report.c:114:2: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
     writeq(val, rep->base + rep->offsets->tgt_write);
     ^~~~~~
     writeb
   cc1: some warnings being treated as errors


vim +114 drivers/pmdomain/apple/pmp-report.c

    97	
    98	#define genpd_to_apple_pmp_report_entry(_genpd) \
    99		container_of(_genpd, struct apple_pmp_report_entry, genpd)
   100	
   101	static int apple_pmp_report_set_state(struct generic_pm_domain *genpd, bool enable)
   102	{
   103		struct apple_pmp_report_entry *ent = genpd_to_apple_pmp_report_entry(genpd);
   104		struct apple_pmp_report *rep = dev_get_drvdata(ent->dev->parent);
   105		u64 bit_val = 1 << ent->id;
   106		u64 val;
   107		unsigned long flags;
   108	
   109		spin_lock_irqsave(&rep->lock, flags);
   110		val = readq(rep->base + rep->offsets->tgt_read);
   111		val &= ~bit_val;
   112		if (enable)
   113			val |= bit_val;
 > 114		writeq(val, rep->base + rep->offsets->tgt_write);
   115		spin_unlock_irqrestore(&rep->lock, flags);
   116		val = readq(rep->base + rep->offsets->status);
   117		if ((val & PMP_REPORT_READY) == 0)
   118			return 0;
   119		return readq_poll_timeout_atomic(
   120			rep->base + rep->offsets->actual,
   121			val,
   122			!!(val & bit_val) == !!enable,
   123			100,
   124			50000);
   125	}
   126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
