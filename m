Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2498A372ED3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 11:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623784; cv=none; b=WEfRcWLa5T8mjssqRvO8z9iWoyR8TWq1zlitdKbOG75HMJ27KZGJB7TrHHGIxl4XCiVS66QrxxEsEac46i0vUccbnHFtYCqg+/AQiO9OPIa/4AJ3N+QCesvpIjSCKHBuq39oX05zUusRee20FWxhS9hCdWPMbxXi1wxYq7++hlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623784; c=relaxed/simple;
	bh=1TQlMpU6hmoK4qwk6KP9PeW6GPyus3gxEyfT0uObLtE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qbHYkNnRW4np4qwr4yyVWuozA/LcjtUds9oGHHwNwP6ntfR0PzKEf5BPuHIOk68kuXSSWjKy5qqgQb0NJFwhsUueDtVRqsioT8N6kc/Z/CUqOqL8UtC4MkO4doAwHGdhWHShKgQoeAqsNc2lR9NmGrYVsb9U/D5zYwVwgpXVqTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TeucZZbs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TeucZZbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772623782; x=1804159782;
  h=date:from:to:cc:subject:message-id;
  bh=1TQlMpU6hmoK4qwk6KP9PeW6GPyus3gxEyfT0uObLtE=;
  b=TeucZZbsp6XLLtr/pCNUOoXYoTSNbWr+RZoIP1/WIl/WwbdzngFZO1u1
   +hX2uLruSyfv1gfATAUWJafZYGWsz+nff/JLvTyrsuWNfFVc/zIO9bi1z
   5gssvPsUG3uXMTfHQn4WiEfQll9ZKfpNhe5N70ucMOEeuBsy6bbE+qT1K
   +jhOisYfs8KNF5IMH6L00soKCbI21RwHOtBkTNcAC7hTii8ZGjzq0a7CZ
   rfc5+ZJHOFAfgFXHT3YI2ZXN2SHTlj2aVtUQpKZMD7ONlSVHqSgRpQXHd
   9bf0bX4kIFJ95OSG3KEWwOjf0hR47Y28VpaLwgSXfaTS4zbrfgMS9WryO
   g==;
X-CSE-ConnectionGUID: PEaGKYeaQzKezs+JBRZ7zw==
X-CSE-MsgGUID: D6UqQbdlREmlllQGnCOA+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99153587"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="99153587"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 03:29:42 -0800
X-CSE-ConnectionGUID: I3thCLj0QM6k4dS9fOjy3w==
X-CSE-MsgGUID: gfqTVne3RFGWv6vIfO9PcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="218265265"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Mar 2026 03:29:39 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxkQ4-000000003ez-1rm0;
	Wed, 04 Mar 2026 11:29:36 +0000
Date: Wed, 04 Mar 2026 19:29:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [akpm-mm:mm-nonmm-unstable 49/110]
 __efistub_cmdline.c:undefined reference to `__efistub___lshrdi3'
Message-ID: <202603041925.KLKqpK6N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   09c4ad73ba08ac959a6afb5e019826743837e0aa
commit: 7c5bff091374a7980431237af80e6da21dce74fe [49/110] lib: fix memparse() to handle overflow
config: riscv-randconfig-001-20260304 (https://download.01.org/0day-ci/archive/20260304/202603041925.KLKqpK6N-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603041925.KLKqpK6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603041925.KLKqpK6N-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L38':
>> __efistub_cmdline.c:(.init.text+0x1d4): undefined reference to `__efistub___lshrdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
