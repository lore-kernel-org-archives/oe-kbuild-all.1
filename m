Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12438155CB3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762336666; cv=none; b=gjMr2OXxYDZ9yXEoC7nx9O1cBVWfv49gssA5fNAwn3DLUzymcRTjhnrGUUYd8mdEh2imzwTLV2ZdJLimcTJchn+eF8TpJTJV7b5S3/f6c/MYn8CzPYgLyoA6nwVbalySOWO91T3Gz0583J4pngDDO/X+eOWiPngT3QQ8rAthGn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762336666; c=relaxed/simple;
	bh=2c+sfemYCeFyFl3RpqnjapVNakGvrBC2pA4BruQjUFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d50qn8zPVocm+bDKIP6bN8OsRnSrmSUKadrzjMEymNB7Hkxv1rYgPWyxxn1OVaEG2wn+/nf3OHSkTn831L07lfY74A8wSED7d7vBH7zgUK9jB0hjmdletjOBTVW/EUJLw+65BAqSQ2dN57p28QcHTFqi2osoGAQHCOrJijBYnbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sr0/Lahx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sr0/Lahx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762336664; x=1793872664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2c+sfemYCeFyFl3RpqnjapVNakGvrBC2pA4BruQjUFk=;
  b=Sr0/LahxG0k+tXnClBeX6qopQYc6+2ojsiQ9IeKPEfVm7LGajHiW8Abv
   F91i0saHaovYd8CUXJVYFpDOnxacW5NC2vlEz+8B6txw621brS9l/PzR9
   08TP8hhr22IW6mTeb2YLbDX14Ago+Y6Mnt+D+ddIFNraaiTCVDRqNvt5U
   1BvtbeuEVS/19Avd+IoxUuEVy2UhOo2ULot12izoiEyVvYP1mXOdIKl6A
   skYxb7KX7KBFyM49UqZJDxv2RdAbJtAs8oyUN92SPa9yMkZsJ69d9ugD7
   WmZ1na72tebU33TOuJngSFGHIJ90YkOEkVAZp68b7XZX5FQXUW5jGBtAf
   A==;
X-CSE-ConnectionGUID: 4HhlAJEiTpu/1ZF9VLS/hw==
X-CSE-MsgGUID: Bvyj5jtYQ7eS3e8BiBqNmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75554889"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="75554889"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 01:57:43 -0800
X-CSE-ConnectionGUID: bpV9AXI1QPCJipa5+iHHwQ==
X-CSE-MsgGUID: e5un4uqFSq+8/EnE67QbvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="224657874"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2025 01:57:43 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGaGq-000000002W8-40Sk;
	Wed, 05 Nov 2025 09:57:40 +0000
Date: Wed, 5 Nov 2025 10:57:06 +0100
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 17/27] mm/oom_kill.c:252:27: warning:
 'oom_constraint_names' defined but not used
Message-ID: <202511051048.TIw7Yvex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   176f3f07db49e29a193bd0b986301486bc19a5a1
commit: 1de15690efff0a4668efe386cf2b9bacab17e0ee [17/27] mm: allow specifying custom oom constraint for BPF triggers
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251105/202511051048.TIw7Yvex-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051048.TIw7Yvex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051048.TIw7Yvex-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:252:27: warning: 'oom_constraint_names' defined but not used [-Wunused-const-variable=]
     252 | static const char * const oom_constraint_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +/oom_constraint_names +252 mm/oom_kill.c

   251	
 > 252	static const char * const oom_constraint_names[] = {
   253		[CONSTRAINT_NONE] = "CONSTRAINT_NONE",
   254		[CONSTRAINT_CPUSET] = "CONSTRAINT_CPUSET",
   255		[CONSTRAINT_MEMORY_POLICY] = "CONSTRAINT_MEMORY_POLICY",
   256		[CONSTRAINT_MEMCG] = "CONSTRAINT_MEMCG",
   257	};
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
