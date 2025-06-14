Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C82DBA2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jun 2025 14:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910558; cv=none; b=WZp7s7CkHOaFtoT62k/2ZzBgayLRXbc1QJOSFh72OcWrGCoO52vMV+CfjkeiOfiRFoBX5nAd/dSibxfelfPD3/diCYzvn32bRdOrR4odLRGgSGAEOz3S4P94B9x2Mdpp12uoqa+VnlGcxC5LMHi1VCcWgYhYbTttf4fXfYCgsFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910558; c=relaxed/simple;
	bh=4bJdxZpasC3zWfbXaiPGqWDhmkTE1rEEPC+jgt6Hs+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bd7kxanQLn8EHXoewaLrBX8lizK5d6DuqK2lg9sSMMJCDQ6UYcEjoVaaRoTpx1+naXM4YOHWPIgNJ1iOJzQ0qFzdU3uoDEhJiwPUAfFbgAEACOvUJ2MHQsQIR7BojzgyQe9yXig3D+i5i6pReQ9iQujXDuAVyZA8zIcCWd/Vf9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htezFSdI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htezFSdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749910557; x=1781446557;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4bJdxZpasC3zWfbXaiPGqWDhmkTE1rEEPC+jgt6Hs+M=;
  b=htezFSdIdRQ1/ibm8VuVkbFO+XWJxdt5jKJPgf0bTGhGj6JpgKmCUZJS
   jexEgpQwnZSj0g1PKxGgVfFzJBXvTr+wKUZKZz97naM0KYq7jq+BafCeT
   MZUI58uGtC5NunTL3u2DL1Gkg9lEO0EO1DXBCU8Z94+aImpSOpMH2Bp/D
   uO9uUQ+G3VZpKrxuEgYoGn8E+9K6IHw0bPon+dCh5GWuq7xWclUlJjElK
   FNZPlTE3CCu7g6pZZCqQz73BAcBb9zB1gX8hDHDbekAE29By/Fku89Chs
   5u+2rKUrw4/rf6LBApwi8sf+OFqQv+NhvEyNIgdosJa+nLO5/jx7aS/w7
   Q==;
X-CSE-ConnectionGUID: Y7dhEj6ZRASVQOtKrcTVnw==
X-CSE-MsgGUID: BKTTzYw8TxO62elQAibEJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52203941"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="52203941"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 07:15:56 -0700
X-CSE-ConnectionGUID: vfzp0ywnSIeALh7lo6jryw==
X-CSE-MsgGUID: lij6EnReQOSi1efbYzENKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="178963458"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2025 07:15:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQRfl-000DZY-07;
	Sat, 14 Jun 2025 14:15:53 +0000
Date: Sat, 14 Jun 2025 22:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC Patch v2 2/4] drivers/hv: Allow vmbus message synic
 interrupt injected from Hyper-V
Message-ID: <202506142114.LRNCd3ev-lkp@intel.com>
References: <20250613110829.122371-3-ltykernel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613110829.122371-3-ltykernel@gmail.com>

Hi Tianyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/x86-Hyper-V-Not-use-hv-apic-driver-when-Secure-AVIC-is-available/20250613-191041
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250613110829.122371-3-ltykernel%40gmail.com
patch subject: [RFC Patch v2 2/4] drivers/hv: Allow vmbus message synic interrupt injected from Hyper-V
config: arm64-randconfig-002-20250614 (https://download.01.org/0day-ci/archive/20250614/202506142114.LRNCd3ev-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506142114.LRNCd3ev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506142114.LRNCd3ev-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hv/hv.c:23:10: fatal error: asm/apic.h: No such file or directory
      23 | #include <asm/apic.h>
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +23 drivers/hv/hv.c

    10	
    11	#include <linux/io.h>
    12	#include <linux/kernel.h>
    13	#include <linux/mm.h>
    14	#include <linux/slab.h>
    15	#include <linux/vmalloc.h>
    16	#include <linux/hyperv.h>
    17	#include <linux/random.h>
    18	#include <linux/clockchips.h>
    19	#include <linux/delay.h>
    20	#include <linux/interrupt.h>
    21	#include <clocksource/hyperv_timer.h>
    22	#include <asm/mshyperv.h>
  > 23	#include <asm/apic.h>
    24	#include <linux/set_memory.h>
    25	#include "hyperv_vmbus.h"
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
