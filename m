Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CCE1D5CD9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Feb 2026 02:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769914528; cv=none; b=Q0IrEnCBdwOkNzQqaxXGs83K6E8yyCiGETr3hap4E6OjW0B3sd69D3AosQiD2kNihoIQYY4OwcQpweQiwZ/rzF9s5MLGPYhXJ3ybAfvBUeTtt+rbeFSn859cHn2bsgBqyCZ9dR38di6ou/G1+Bxn15nUIDtE3sUxonCVLPaOcLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769914528; c=relaxed/simple;
	bh=4Xh3bEe5Mawh8BGGhHHsZwcMaf8ur1k1DkvmKvSHBk4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y6gUn1gZU0MQH6FNOMMByn9zqnpqKcdPmdrdRbG7sAysYy5KEF92fjGZCBIvPXr+NKMa7eucnuVVU3JTZ2k7lkPJri2B6WtJnrFvkk3ktM2sal/MYMZFbCnIDXj1IPOr9CXGHJsttUwJZWR0Y/a8HeaCI9dE43KcJCe9ethBxFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dagorRnC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dagorRnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769914527; x=1801450527;
  h=date:from:to:cc:subject:message-id;
  bh=4Xh3bEe5Mawh8BGGhHHsZwcMaf8ur1k1DkvmKvSHBk4=;
  b=dagorRnCrDHme6pa5QjjjWdm2qfj0SCcfyDCQk3w15Xk7uZYUFrfZXfD
   SP7v4XxtZkPAv8MZMfdnovDiPNnsd95kfBi2pfQ1rPcZQUJ4lIglZAhBc
   fp+U1FLKU/PzJHs3ghfzJqUlq9pIIbBFqaF6H1IFovl1aVsb4YQ9ctiJ7
   QInNQRC4ul7UufRF07xGYP8qimbDePUdUmmSWF+vaiKc+QmRBJ1JhyFtx
   0MHbXnB2kLPl0jB1O4yUsnoQ1JKhV8FhVs5LSsKl8cCTtnbm7ZoNGRNRp
   C0W7a4oAXSz5GSaI0S8WqRTK5N5YkkjhAK4nVdgNTm/0wkRLiNgvxVp3z
   A==;
X-CSE-ConnectionGUID: 7IWaF30LTsC/JrI9trsKOQ==
X-CSE-MsgGUID: Ix3Wc81xQfmEe5UxtqU1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71013963"
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="71013963"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 18:55:26 -0800
X-CSE-ConnectionGUID: z7prH0sLSoW/vO1GlABZ5w==
X-CSE-MsgGUID: 5RCv0M7TSIy1VXNfZKT2LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,266,1763452800"; 
   d="scan'208";a="213673267"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jan 2026 18:55:24 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmNcQ-000000002u5-2g7t;
	Sun, 01 Feb 2026 02:55:22 +0000
Date: Sun, 01 Feb 2026 03:55:04 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/3] htmldocs:
 Documentation/vm/kidled.rst:48: WARNING: Block quote ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202602010335.ChqCKLVv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gavin,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   8f3dc34debe1467cc2306963037f0db6b36e1729
commit: 9821d36e632cb7bdae1f1f7affbebf8077b5a516 [0/3] anolis: mm: Support kidled
reproduce: (https://download.01.org/0day-ci/archive/20260201/202602010335.ChqCKLVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010335.ChqCKLVv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
   Documentation/scheduler/sched-bwc.rst:127: ERROR: Unexpected indentation. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
>> Documentation/vm/kidled.rst:48: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/vm/kidled.rst:90: ERROR: Unexpected indentation. [docutils]
   Documentation/vm/kidled.rst:106: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/admin-guide/perf/ampere_cspmu.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/arch/x86/hygon-secure-virtualization.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/networking/device_drivers/ethernet/nebula-matrix/m18120.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/coco/csv-guest.rst: WARNING: document isn't included in any toctree [toc.not_included]
>> Documentation/vm/kidled.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/vm/memcg_zombie_reaper.rst: WARNING: document isn't included in any toctree [toc.not_included]


vim +48 Documentation/vm/kidled.rst

    31	
    32	  It controls the scan period for the kernel thread to do the scanning.
    33	  Higher resolution will be achieved with smaller value, but more CPU
    34	  cycles will be consumed to do the scanning. The scanning won't be
    35	  issued if 0 is set for the parameter and it's default setting. Writing
    36	  to the file clears all statistics collected previously, even the scan
    37	  period isn't changed.
    38	
    39	.. note::
    40	   A rare race exists! ``scan_period_in_seconds`` is only visible thing to
    41	   users. duration and sequence number are internal representation for
    42	   developers, and they'd better not be seen by users to avoid be confused.
    43	   When user updates ``scan_period_in_seconds`` file, the sequence number
    44	   is increased and the duration is updated synchronously, as below figure
    45	   shows:
    46	
    47	        OP           |       VALUE OF SCAN_PERIOD
  > 48	   Initial value     | seq = 0,     duration = 0
    49	   user update 120s  | seq = 1,     duration = 120 <---- last value kidled sees
    50	   user update 120s  | seq = 2,     duration = 120 ---+
    51	   ....              |                                | kidled may miss these
    52	   ....              |                                | updates because busy
    53	   user update 300s  | seq = 65536, duration = 300    |
    54	   user update 300s  | seq = 0,     duration = 300 ---+
    55	   user update 120s  | seq = 1,     duration = 120 <---- next value kidled sees
    56	
    57	   The race happens when ``scan_period_in_seconds`` is updated very fast in a
    58	   very short period of time and kidled misses just 65536 * N (N = 1,2,3...)
    59	   updates and the duration keeps the same. kidled won't clear previous
    60	   statistics, but it won't be very odd due to the duration are the same at
    61	   least.
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
