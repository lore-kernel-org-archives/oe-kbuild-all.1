Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B627E056
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126703; cv=none; b=SLqXZsY4xZHH2ltXkR876d1NRBEofVtnEf5DztRwN/FvZdzEKvc3IGS+5LODki5njn/0hmUFpw9xf05BHyGF58w9Gh0C8YZXpmUGKvXFuyJrmr7q54sHPk0Gs+dUpq2qoStRhviZ26dZmHNBKZxy0yVusr0Y9BMKv2DANZLrHRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126703; c=relaxed/simple;
	bh=rADu/awL9SvseXwbvNwzK1uqZ/NwaCFwso+T7BpAtI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O25LCVAcTmDIEX8uRkQtqAUSRqC+MTV4cxjNUX4b91zyaofr/6XUr+jPrNTLOdWfcm4PekDg3bhehVU6P/+0POG4dNSAmU2T4YDjm6tZE3ODSIzsjfp+9ap5+VAB8n1Y2ekn1OrxW3LknTULhrv/w4bE3B6g0iJw1N2h7JYvGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N+TQpmkW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N+TQpmkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766126702; x=1797662702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rADu/awL9SvseXwbvNwzK1uqZ/NwaCFwso+T7BpAtI8=;
  b=N+TQpmkWo6kwiNZjdyRdyFMBY/d+/KEQD8sD74Gttqg/HpIG7KVgneO/
   DyqBsKWbEoAp/RFdNuuUh3C2MS5LZnDiJJ2WgUZaHeuMD8X4faiJH06b2
   3W4Hg4KtLSJffsT42CmeFc1zLlfzr1HtqBdOJUoLZGudCrUpw/SQ/caKk
   kY4ZVYbDzJWkryw3xHWZjfdjTvvSLmCjXMRd0m11bIptAchjAboM28GNV
   IHSfd00SO0B+x8G2boxVIatH00dIkvDZMwkIzGyA1G57vJaNqIue0bQ3u
   WsUiyw36pQ1jZb+eKZBrvWt8Q4cixnB460E6FBDOYh7AkojRglgJAgyPY
   A==;
X-CSE-ConnectionGUID: TCje4+iSRYmICEaQxPWypw==
X-CSE-MsgGUID: GPn8KX92TBGZJvNhJx47aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="71717077"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="71717077"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 22:45:02 -0800
X-CSE-ConnectionGUID: x57wzveHTMm4nP+bIi3Daw==
X-CSE-MsgGUID: 4XXggPJbQ6K81Ca2h2KJlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="229469239"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Dec 2025 22:45:00 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWUET-000000003BB-45Yh;
	Fri, 19 Dec 2025 06:44:57 +0000
Date: Fri, 19 Dec 2025 14:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4/4]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202512191404.xB4YbhCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   500d05631d89314552da084e17819640507698bf
commit: d9a579535cd0f4623e627c3375781fb29c78692b [4/4] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20251219/202512191404.xB4YbhCt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191404.xB4YbhCt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191404.xB4YbhCt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such file or directory
      11 | #include <asm/archrandom.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 drivers/firmware/smccc/smccc.c

     7	
     8	#include <linux/init.h>
     9	#include <linux/arm-smccc.h>
    10	#include <linux/kernel.h>
  > 11	#include <asm/archrandom.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
