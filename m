Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89B237FF54
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781354483; cv=none; b=N9bQI5XFNmVKyp2N+lohk7VwpxOCsU0CF91VcTKZoHO8iksBvzOJzsgm6SlGfEDEaMYKS7hh3Bh4PDmrEjFQ/zwnddbYOoeN2UHHKelzDDsgYToFz42QDdrHs7jO/LAJJRWb+vCXUAX7RJmacz17uWpgnYFoF4me5yeuYeuYQH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781354483; c=relaxed/simple;
	bh=nGbiUz7Z+1D+r+FBABS+FEtN3soBgHBLvihdLpOaAwc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HPkICqdaUHVeaMZAEJm/41IFpaPzv4caMsPZ9FJajcGxkVpl/xRit5piVxFWtqFBcHiUQsUji1vCKUvMlkJ06uvoWJ6MYWssWSPUmEBEjmdiQ78e5I0vyEMYmgNAdQpLjyqQJNy0p0qtcXwSU4qjpDJR6vaZJN5pw7InhLxUslQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwLj/ju/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwLj/ju/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781354482; x=1812890482;
  h=date:from:to:cc:subject:message-id;
  bh=nGbiUz7Z+1D+r+FBABS+FEtN3soBgHBLvihdLpOaAwc=;
  b=DwLj/ju/h57EYm8UwsxXYgZTcXctV1jJsqbbHQltrDG1ZUrMPnAg2g6m
   +oJ1oaJqVsuL27Che4ZCuleKLK4xNaRnd4saBda2Byqm09oMdhpgSdmLM
   33Pa+DwZI1d67k2X7HKrWv7kAFIDV6d3+//4XJNZQF5pZG/rifCQBQzZQ
   KugZYgoqSlyuU5zCwrGY4rNsdnOtUrBPVwAw85bwEt2OoPeMaMgDP+9eB
   xrYNjS5WBqUsfEIPlli3grFdsMg6YzoRUbOs6GOVjc9wdgmMjn/X0frW4
   qrh3reNAsCeTAB25xR5p3KeKNh3oVbiGV3rr311hxzIjJdQ6M0noPfEJN
   A==;
X-CSE-ConnectionGUID: YBTo3/yHSyKnFcb+HYAn0A==
X-CSE-MsgGUID: vev+uwq1TQicny1YKqCJiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81181082"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="81181082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 05:41:21 -0700
X-CSE-ConnectionGUID: V9jXPt5ARROUS0kqPMFaHg==
X-CSE-MsgGUID: 3XAzhCZbQcSIFadUuqmAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="277245699"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 13 Jun 2026 05:41:20 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYNfp-000000004UH-3VqZ;
	Sat, 13 Jun 2026 12:41:17 +0000
Date: Sat, 13 Jun 2026 14:40:21 +0200
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [cris:scmi_telemetry_unified_fs_V4 29/34] htmldocs:
 Documentation/filesystems/stlmfs.rst:238: WARNING: Title underline too short.
Message-ID: <202606131440.jdW5ZTeF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_unified_fs_V4
head:   ed28087005811783e972fe7a788446936878932f
commit: c4f3df624c05557c708df87efde36b341fabff01 [29/34] fs/stlmfs: Document alternative topological view
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260613/202606131440.jdW5ZTeF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606131440.jdW5ZTeF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ----------- [docutils]
   WARNING: ./include/linux/virtio.h:188 struct member 'map' not described in 'virtio_device'
   WARNING: ./include/linux/virtio.h:188 struct member 'vmap' not described in 'virtio_device'
   WARNING: ./include/linux/netfs.h:764 function parameter 'ictx' not described in 'netfs_resize_file'
   WARNING: ./include/linux/netfs.h:764 function parameter 'ictx' not described in 'netfs_resize_file'
>> Documentation/filesystems/stlmfs.rst:238: WARNING: Title underline too short.


vim +238 Documentation/filesystems/stlmfs.rst

   225	
   226		scmi_tlm_0/groups/0/
   227		|-- available_update_intervals_ms
   228		|-- composing_des
   229		|-- control
   230		|-- current_update_interval_ms
   231		|-- des_bulk_read
   232		|-- des_single_sample_read
   233		|-- enable
   234		|-- intervals_discrete
   235		`-- tstamp_enable
   236	
   237	by-components/
 > 238	-----------
   239	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
