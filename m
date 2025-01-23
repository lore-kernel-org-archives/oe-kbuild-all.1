Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E23139CEF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 23:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737673732; cv=none; b=DcRJzjx19VHh+GPpF9uQlG1TTQW1+7LfT+sAT9g1eSZRdiP9JQCRuiPEGw1PWQxO+kJMuCJRzHC9qp16hqbDuccsuH+6qLWCEjWFMaxMbMLvgxYrmqAftrQxg3lQrOnVTYYenFJh2b5hul7m8jSK3z9fmbVW93FcdEVuZmquUFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737673732; c=relaxed/simple;
	bh=vaMz/SK+p+2XAijXkA4LlJpRbB9nSdB3AjCiqD1Ux9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nvIHZyznlDgkQyjFQ7Na3dzRQoxXt/gWT1pfiDmSBFkxJSC/pP4lGgjL1XmTi8qEJHXg6VfA20nVAAJ7vzWcs/vanYm0xQmyw/i0NMVkuTFomQzwPYIDtTP6UAiabqrRiyN8BPOOZKD6ZUgxUhlbOUhvs+M5CNKk/Gn+jWok2iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMFQMYqk; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMFQMYqk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737673730; x=1769209730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vaMz/SK+p+2XAijXkA4LlJpRbB9nSdB3AjCiqD1Ux9g=;
  b=MMFQMYqk4J8VbEMDemkrD6cHS0UxBDu7jOr0pBvbcv4Rj+5xblxsrLH/
   cy6y5yzvwd3Q/Y5HmUBfiXlANjiFOEx6gOIv0t5sXxfUNJOa5yRjU/52Y
   8dZT8wir0j2sBndYcr3vk9Jb2ijZjw8aEhb+0I0gz2pTnDkhE4dXE/J/f
   KZGM3Ygp3AoHsvMd6OV9AZGFHvUhCIxlEBu5ArfHykWxBMt0AbfgA1/5O
   efGALSuWvm56ntPfIusUb+smaBdnwMSEyObkHJy9XCN9jnBVtFtT65NY5
   jJTqAfOFswTXfLbsFBahWse8q/PJQtMVvPWb1w8y6T1Po3AqGvLHVcckB
   Q==;
X-CSE-ConnectionGUID: W2d/an+pT2mqyp1YVz66Pw==
X-CSE-MsgGUID: SPCGe9R3R/qDJ5UPp08+PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48788953"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="48788953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 15:08:49 -0800
X-CSE-ConnectionGUID: 5+/ndimgTKuCOuxwPh2lew==
X-CSE-MsgGUID: Kr42hEARQpKkEamA3higZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107454840"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 15:08:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb6JZ-000bpD-3D;
	Thu, 23 Jan 2025 23:08:45 +0000
Date: Fri, 24 Jan 2025 07:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 mc_debug_data+0x0 (section: .data) -> mc_debug_data_early (section:
 .init.data)
Message-ID: <202501240741.aDLCHaBI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Juergen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0d106a2bd21499901299160744e5fe9f4c83ddb
commit: 368990a7fe30737c990f628a60d26d9854a9e690 xen: fix multicall debug data referencing
date:   6 months ago
config: x86_64-randconfig-r123-20241124 (https://download.01.org/0day-ci/archive/20250124/202501240741.aDLCHaBI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240741.aDLCHaBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240741.aDLCHaBI-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: mc_debug_data+0x0 (section: .data) -> mc_debug_data_early (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/clocksource-wdtest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/backtracetest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/dmapool_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_hexdump.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/find_bit_benchmark.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test-kstrtox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_min_heap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_bitmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_uuid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_xarray.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_maple_tree.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_memcat_p.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_meminit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ref_tracker.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
