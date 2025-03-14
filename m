Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108C91C878E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Mar 2025 12:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741956996; cv=none; b=mbjI2HZw0H7z0Q0LmSDM1qaYCvlQYoSqOdDbZprWvhUwk8Dprn/ZssYuZIyuGwpn6jb3qRC8x+/dQXSZdcNwt8s/ep8EFLoQ0+8DoYjabtopkQMA1kUP0bWYRriZeyMMjw3ZxlLE0lwAVlvEkMRCqHOF0gHxn20fULdr0PWVGGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741956996; c=relaxed/simple;
	bh=d6qJCSH6sJFsDjMpjSVIWi4YjxQutQ+W2+WAlzQtp6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=frE55kpTUmlmPmeq7eG29byMNqxF5QjfizM7bEuDw8+WRUwpuiKeWOIHuuTT4Q18tt0/Mh429x0fo43sTqINfVIrzxOJQWjUmDJyhCVMAsqUlGlCsmEAYcLL20Dl8OP5OGK/P51rO7Psety51o/yceOCp17a7CWe1eIAhhLQX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QjHR8/ZG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QjHR8/ZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741956995; x=1773492995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6qJCSH6sJFsDjMpjSVIWi4YjxQutQ+W2+WAlzQtp6Y=;
  b=QjHR8/ZGoAR6h/J9Lf0Q4xVWMlVJS0/Ai3ZKEY6tZi9dlfH/Mazmh95T
   gFdr7bAZHkH9+KdMfCqqSWvpQ6jZK+AT7haBeC4UodS7UAVy5VpjlKg8x
   UWCYgImhJrpNj8W+2IhYoSE/S0MkOdXRnlbud3t26LBl7ku7qFxer7URM
   NsOAz4Qi5qvOcmwwr0bLaZDMQkfyG45DnvI6/vAjGnfBE1JPKr9SMqVpa
   ikuKPMpb0Txzcy1P2kDHwe25h0HQlnv9P0e6m1txZ/V8gg8Las/i+Dib2
   xeMAezs6+x5ey8OWQZRJpqoa4Dq4QgN4OfhEmQsXh68kBmjl4D1E6i+Zh
   g==;
X-CSE-ConnectionGUID: O4klMaTtRP2pETxlqn15QA==
X-CSE-MsgGUID: S5MYouUtRpqUd3a/Iu3axg==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="60646561"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="60646561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 05:56:34 -0700
X-CSE-ConnectionGUID: 9trj4GpaTiuHWnN1KzEehg==
X-CSE-MsgGUID: uwbN/rhvTBGpA0XM7YbFlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="126140427"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 05:56:33 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tt4aU-000ATA-2t;
	Fri, 14 Mar 2025 12:56:30 +0000
Date: Fri, 14 Mar 2025 20:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Oak Zeng <oak.zeng@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: [linux-next:master 8263/11207] ERROR: modpost: "__divdi3"
 [drivers/gpu/drm/xe/xe.ko] undefined!
Message-ID: <202503142031.OWuVpaFM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   da920b7df701770e006928053672147075587fb2
commit: 9c44fd5f6e8aa1ed944f085926044fcbf797206c [8263/11207] drm/xe: Add migrate layer functions for SVM support
config: i386-randconfig-062-20250313 (https://download.01.org/0day-ci/archive/20250314/202503142031.OWuVpaFM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503142031.OWuVpaFM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503142031.OWuVpaFM-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "__divdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
