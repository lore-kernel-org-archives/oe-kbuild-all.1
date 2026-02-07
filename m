Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A5330E0EE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770454659; cv=none; b=U3shWJTkxGXVkI80djFLy24zlqzdnDIRU5+x2SAJ6RZtKqZlpHa7M1n5UK6DKvyVtktOD8RFcbQsb979z/MXk0muCt230l7+FrWyos5GbnvRZ47mOmJ0HouVdzgz+CgIDfCLDohvSlPBRLLbz1/Tf4SIm4vvkq2ETiBrQ/fPXJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770454659; c=relaxed/simple;
	bh=L7lR9BkWuGM78gri7DOKDWYlhL3osFmibic44O6rMR8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tcJ13WjmVxq99TEFsWJ5lFPMoDc94ywz0MUsUzzOqBDYy2716gCFuFjx1ejyv6B5An2P26eA3n2+veGGkuQqHQycrMffZWMths4oG6uuVhL30NgmuJvriNU261VBhOEONylPXL3cmn036gBgxQ5LRY1+BJYfOkM9wxEjp49sgDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbi6j3FJ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbi6j3FJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770454658; x=1801990658;
  h=date:from:to:cc:subject:message-id;
  bh=L7lR9BkWuGM78gri7DOKDWYlhL3osFmibic44O6rMR8=;
  b=dbi6j3FJf8WHs6qL1gccFaofVO9MINOWo+jUOJwBrREXMKJ4BUbfddIM
   QfRGe9mL/F+kAqoh+SwytkdQTtIwp2J1e+0NSwzJaQRf20btuWWoKvvHB
   Ts7dH7VaVjus+aqBLtC0xaZHk/Km3HBqOC+muyDkJDZehvAM9QLNpyuUG
   RupfmQyNHXPPIlZurlYbE33XolMyhNkVi6RW9wu5JKnb8Sl8jLXa82NaZ
   PrPhhZ6XIVJy17iarRRDJiT3sOX8amNXsxaxjk6RQhuzUCXNSJyDUrcqq
   5gsEUG0VHUPH8d5EdiS6FJojzXbxBiUFDeHwK86jSzJifNyttS5Yf2Zxa
   g==;
X-CSE-ConnectionGUID: 95r1K8iWSoO/DF1uDTGfiQ==
X-CSE-MsgGUID: a7zTUqjuQf2j7tvNEWN/Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="97106756"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="97106756"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 00:57:38 -0800
X-CSE-ConnectionGUID: sy960x1yQgGycwtsumlPMg==
X-CSE-MsgGUID: yGNQzVoWSa6HTfunRo6p4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210836513"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Feb 2026 00:57:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voe8E-00000000lWi-3agM;
	Sat, 07 Feb 2026 08:57:34 +0000
Date: Sat, 07 Feb 2026 16:57:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 ip22zilog_probe+0xa8 (section: .text) -> ip22zilog_prepare (section:
 .init.text)
Message-ID: <202602071616.b2lwdUk9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2687c848e57820651b9f69d30c4710f4219f7dbf
commit: 3fc36ae6abd263a5cbf93b2f5539eccc1fc753f7 tty: serial: ip22zilog: Use platform device for probing
date:   6 months ago
config: mips-randconfig-r111-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071616.b2lwdUk9-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071616.b2lwdUk9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071616.b2lwdUk9-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: ip22zilog_probe+0xa8 (section: .text) -> ip22zilog_prepare (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: ip22zilog_probe+0xe0 (section: .text) -> ip22zilog_prepare (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
