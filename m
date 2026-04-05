Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2364086A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Apr 2026 03:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775361486; cv=none; b=I+l6zAs9lg12+lB8apLsXq70elWQOZky58zWhk0n7jxmyymm4L0TDFqDza4WwWQcSZN3QfoDScjrU9Y314iarR9ongmQ546KCqZkCr+u2WdQqXWjGRFAfKXqpwajTYeWM/Xzkaa/gb1NLFuBnIhZqSzHhcvE9muGLsoxZHzwPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775361486; c=relaxed/simple;
	bh=aZHvIVx5i3/iHzmXlebbi0k9hg8CI4IEn7AQMmoz3G4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=njs6GFeHp0p6O7el7S0OitXkYQT9uM+gmkC6uOP3Ue9rbpe1AJxizt+lDZvF/YxhZDixeD2d0nqBB40PerMiqFKBis9wAXQZOOihIRAXffMHit05n40Lzki2VHk8L0meafhrBgtTVOOMnj5P6b6ASUACQaDAN1MStdMxBTm8OEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzpMHXXh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzpMHXXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775361485; x=1806897485;
  h=date:from:to:cc:subject:message-id;
  bh=aZHvIVx5i3/iHzmXlebbi0k9hg8CI4IEn7AQMmoz3G4=;
  b=nzpMHXXhLnWWWCcXy0rNVDE91OyFsJz6wUpO6G36Uyw2JDmYYU1J/lN8
   riXDGRLl/lWEbuFEqAMA1QBmUIZN3Plb2awLsOy5sT5OGvjdfq47Xo4fe
   s9JUchxk6rOC0DZ0V2eR4h2qwAcSEpe3VqFxoTO3GYGbPgftEJsHAGMTr
   sfYzm9gwn89Gq9oLgkh2Y5UTI6syiWhgvC3G/Pq/BqJv1bwu2kFDg2NWM
   Jrrpm7xFdlbyalBySGpFBDRgH+I4/s31Vj6cqgayPwgLwdp1ZARRDgCC/
   IdA4a4OtCCGVfspVMZUJxScUxN6a0OKZgcz9JE123MLHHfk+prMcFPBs8
   g==;
X-CSE-ConnectionGUID: Zq/xH3o7TFKKaDds1r/sBA==
X-CSE-MsgGUID: 9YLxmM9QRrKIdCAbcAnoEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="76482726"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="76482726"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 20:58:04 -0700
X-CSE-ConnectionGUID: NW7HjylDQRWUUcpwaWZmPA==
X-CSE-MsgGUID: eAE2PRRRRoaoCzFYYGsk1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="232425527"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 04 Apr 2026 20:58:03 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9Eca-000000009k5-33Dp;
	Sun, 05 Apr 2026 03:58:00 +0000
Date: Sun, 05 Apr 2026 05:57:48 +0200
From: kernel test robot <lkp@intel.com>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 setup_local_APIC.cold+0xab (section: .text.unlikely) -> init_eilvt (section:
 .init.text)
Message-ID: <202604050502.sPS6JEJo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Naveen-N-Rao-AMD/x86-apic-Drop-AMD-Extended-Interrupt-LVT-macros/20260403-160307
head:   43266aa9ff041a935816f55dba1040887a69dfbe
commit: 43266aa9ff041a935816f55dba1040887a69dfbe x86/apic: Drop APIC_EILVT_NR_MAX and switch to using apic_eilvt_count
date:   2 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260405/202604050502.sPS6JEJo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050502.sPS6JEJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050502.sPS6JEJo-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: setup_local_APIC.cold+0xab (section: .text.unlikely) -> init_eilvt (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
