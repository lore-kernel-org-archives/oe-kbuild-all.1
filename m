Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F320B33
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 04:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712203230; cv=none; b=c0sskEBhBkCYDgt8deCnnmRzzykOo4oiCs0Z162EqhHyXbRPwADZN6E5dRdwqcwPzA4maA7MC5fZiksCa0ovcSREzJXG0KOmF3brtYHNDAnpsB2Luqh2gWlx+5Vp3rGA01OHnXAu21xcPhd3udd5TJk6Dpr6zrKcbODBJn2uxHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712203230; c=relaxed/simple;
	bh=LaxP2k/aD8DMG68nqMxJ9teAPwNYt2WLREo/nIMxc1E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jvz9i0WSRiAqr1rkPgVRsca45IVOKXIIA3yTBNajlR9X1Y0VaKgHil5kDJhb8FFT0DDqDbg86oMlV8p/aI3Nj0eAYhcQp2P9JoV5TCTf7PqANP+aahPh55XMav2g079kxLWMXFeBR3Kkmoh3OTP1IqF7YQEYLh9+xHZ1eBaTMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZmXVNHa; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZmXVNHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712203228; x=1743739228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LaxP2k/aD8DMG68nqMxJ9teAPwNYt2WLREo/nIMxc1E=;
  b=gZmXVNHawnsLtjM2Hh0EyQ5zQeZSPv8U1Y3vjZnTOEHnkArQc9edDo6k
   0vc+E0wNIKEk4VCt673IDfKoUSr3xCROzG3d4s5AiP7r0OyPKxPeLRYAa
   hkAw0PQrxIvdE0quSUZNlmbBW9DLUSTDyxg1DI5DEZcJG5PQy/P7ZSjyH
   s5h5XTuyjx1js/YtdDM3Raw6YaVrt/ITZI+F0TAnHq13ljENnAZPzZefc
   B+xXjN9PKpD4qgnRW351nvmMBWqZgoLuuwJcGJBWBw5wwTDXKjxRkSA/p
   SPKO7nJ19M5b+z07UbdidTh8uVt6F3IJHJPNZD9wbYlEyP/Vv2m/j4Z/G
   A==;
X-CSE-ConnectionGUID: iCajEhb5SNCQqLCFVUAIYg==
X-CSE-MsgGUID: 4LkxfgnpRhmNXGxCMnN6Wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="10434679"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="10434679"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 21:00:27 -0700
X-CSE-ConnectionGUID: S1O3iR2eRXGU5ir0Bkk0BA==
X-CSE-MsgGUID: 25oz6FszRMmN3cEssKhlHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="19082109"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Apr 2024 21:00:27 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsEH2-0000aR-1P;
	Thu, 04 Apr 2024 04:00:24 +0000
Date: Thu, 4 Apr 2024 11:59:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rostedt-trace:trace/ring-buffer-prealloc 15/15] trace.c:undefined
 reference to `memmap_named'
Message-ID: <202404041143.UTjtOoog-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/ring-buffer-prealloc
head:   9d075d4dc5b36849ef23fd132764443511519ede
commit: 9d075d4dc5b36849ef23fd132764443511519ede [15/15] tracing: Add option to use memmap boot memory for trace boot instance
config: sh-randconfig-001-20240404 (https://download.01.org/0day-ci/archive/20240404/202404041143.UTjtOoog-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041143.UTjtOoog-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041143.UTjtOoog-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: kernel/trace/ring_buffer.o: in function `__rb_map_vma':
   ring_buffer.c:(.text+0xdc8): undefined reference to `vm_insert_pages'
   sh4-linux-ld: kernel/trace/trace.o: in function `enable_instances':
>> trace.c:(.init.text+0x664): undefined reference to `memmap_named'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
