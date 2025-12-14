Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39BF2CCC0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 07:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765697625; cv=none; b=amboT7/ptD5URztjw3n3e2VauDEJ7YoN9eFrJMCgzzv6fqiDvbF2IvuYubmZnKZ05SOUpRYJiWeLtsAoZdgOB+gBj6l/sD9c379ZGmrAxhAn7EaWYDbACJqzoFhUhfySGvOxQ/P7Wx99+4d4/28hSZy711Y0w5j8XXYWLreRUuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765697625; c=relaxed/simple;
	bh=99x1FAMDwd8uq6WtOinrmLr8RA+d4z1BiWxzZOHkJ1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iK0anodsD7e3Apro0ZmpLuyGR4Nn+cBVSZ4h72l21p0uWGxvwE1q22kXS4KMh0HriFRZmIX6wgetnNoOcjL2anGbiI8QseEf2caGSjEcsSTDS1CHyt9eCV7M5gFeAnMbiKGm7zHRu7x+Q2pYNt7MS+u/U5k19/2PCTYXRjszBSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMyilUcx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMyilUcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765697624; x=1797233624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99x1FAMDwd8uq6WtOinrmLr8RA+d4z1BiWxzZOHkJ1A=;
  b=UMyilUcxMYQ8Gq/w4JhUESzly/M4SFdNHC1/HLzwCkaLQ0jKZSo6BlCE
   JwiBsP6K4gqMw5cHsENxdC8DwmfqE/NKeWmTNpz55O/YEIeQI8xwzA/9e
   zR1RRG/L1crzeAxtL7g2hU5frU8eX29ZV4fjuyZNz39w+28hRXMQrsGlg
   7ZnIYLE5z2q/k+b2YNcciH35Z7yfAgR7HyF8KGwt3hMNDuEIztWiEn37J
   78pCLRbI+SsWgqWwCnOh0UIuKlzpWEkl0p665aQMe5OBTDkp8xKvvtWeu
   NqPLV2586ljfeeuiL7dH2aV9dRU5rWcCudilwamddaMTjJBMzE3T3Oy0/
   Q==;
X-CSE-ConnectionGUID: isRyIZt9Tx6dU62pV92eRg==
X-CSE-MsgGUID: 9g4fwGyqRnyrHEYoUNx8yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="78337605"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="78337605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:33:43 -0800
X-CSE-ConnectionGUID: v3TlLBt9T+e8wJnHtr7cCQ==
X-CSE-MsgGUID: cuRGNgNWRkuejDLk7oF+wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197220493"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 23:33:42 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUgbr-000000002JU-39xS;
	Sun, 14 Dec 2025 07:33:39 +0000
Date: Sun, 14 Dec 2025 08:33:08 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 0/25] htmldocs:
 Documentation/vm/kidled.rst:48: WARNING: Block quote ends without a blank
 line; unexpected unindent. [docutils]
Message-ID: <202512140840.HD9lDAkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   48fa9d861c1eb99e9f682fb2623142fb456aa0eb
commit: 9821d36e632cb7bdae1f1f7affbebf8077b5a516 [0/25] anolis: mm: Support kidled
reproduce: (https://download.01.org/0day-ci/archive/20251214/202512140840.HD9lDAkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140840.HD9lDAkG-lkp@intel.com/

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
