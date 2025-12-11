Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5FCD70808
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 21:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765487455; cv=none; b=XNkLgOMjIipbSi8++wfTr8G/g+bTQJzmpFd0jcuJ7MeEkoYFQdrgMf+zEJhMbZqDpnET5s1t6z9bMGOvZqBk6q5WyWMpcPsI0wG0ePJLyNX4qDsj+dUVFHs20NOJ2CwTFj8YaLS54xY63pMwneOJEZxJEVKWr1S3NOYfoVDLE1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765487455; c=relaxed/simple;
	bh=LtQEhRYs2pQlzHH++8jnu7TpVcPyWRNPZuEAjDrHvxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KiRx3K9EPnGowPy4xqhSJene5r8Aidwni+B7uNnc0WaKmgKq2wdc5ucSFTFpY/uHwCztMDo90boDux62wD4jFKqKnjc8p/g67NmqCZVTJQh1mPOG3vOxRy6+LQZYOxH5sKM7xtyvGIiNyswtwXv7jxN4g2dibC/gNaQZRB8kbBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yqiy8KG/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yqiy8KG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765487454; x=1797023454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtQEhRYs2pQlzHH++8jnu7TpVcPyWRNPZuEAjDrHvxo=;
  b=Yqiy8KG/DeDxchoL5aaEtiNg/swyCS5QOAkMJlSNgmVFr4ORv5FJfedS
   6P98Rjr9BEqP7VM09JAC6o0Qv534fZud46nN+mfI1TDV/UAG0xiHk6E08
   QM8O0B+uY0srWUUUOKkVFO8ueeWrgBzazQ5ekgTIzILR+oLFtb6TTuoOo
   nQ6uSiZeXGYyzNnLJtXUjORF2Uq16v6feN3/vvdReuZere20lylqFFeNP
   WQ6f2B/QtFN++nDjyhezwIpGas8ITJUaxNg5eM6kLnrWVzVNFVzTaAeY0
   lpJXOJZjNjeaQ6tl6/h7tk5UpIPXdAT3hS46t7HQBa5jLwudIcGWnhxA+
   Q==;
X-CSE-ConnectionGUID: H0jWJ8fgRgu+VPoaJuESiQ==
X-CSE-MsgGUID: t6Mszx2FQf2LpY+qsT89aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70061136"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="70061136"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 13:10:53 -0800
X-CSE-ConnectionGUID: Iilyi9sOTKOllQcBBt866w==
X-CSE-MsgGUID: RQW6eBv2SOm9qFxz/9plmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201983505"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 11 Dec 2025 13:10:52 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTnw2-000000001CS-0A0q;
	Thu, 11 Dec 2025 21:10:50 +0000
Date: Thu, 11 Dec 2025 22:10:02 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-RDT-ANBZ24559 0/25] htmldocs:
 Documentation/admin-guide/perf/ampere_cspmu.rst: WARNING: document isn't
 included in any toctree [toc.not_included]
Message-ID: <202512112235.Wec1Fd3p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-RDT-ANBZ24559
head:   443d7ee63a13180e69479cd694f03a167a87da2e
commit: dc765eee4bf576658a5cc14e647dfed7765b5405 [0/25] perf: arm_cspmu: ampere_cspmu: Add support for Ampere SoC PMU
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512112235.Wec1Fd3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512112235.Wec1Fd3p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/power/video.rst:213: WARNING: Footnote [#] is not referenced. [ref.footnote]
   Documentation/scheduler/sched-bwc.rst:127: ERROR: Unexpected indentation. [docutils]
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 ./include/linux/fprobe.h' failed with return code 1
   WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -sphinx-version 8.2.3 -internal ./include/linux/mutex.h' failed with return code 2
   Documentation/translations/zh_TW/dev-tools/index.rst:21: WARNING: toctree contains reference to nonexisting document 'translations/zh_TW/dev-tools/sparse' [toc.not_readable]
>> Documentation/admin-guide/perf/ampere_cspmu.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/arch/x86/hygon-secure-virtualization.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/gpu/hydcu-fixup-header.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/virt/coco/csv-guest.rst: WARNING: document isn't included in any toctree [toc.not_included]
   Documentation/vm/memcg_zombie_reaper.rst: WARNING: document isn't included in any toctree [toc.not_included]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
