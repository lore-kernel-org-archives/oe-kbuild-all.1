Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F853446B6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 22:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771971101; cv=none; b=Nc7enSeWvru61klKsoOUe+9uAx9gl3MVQAhGioMhXndGfbxzluNnL9SCQdG//ojAOXR9ZtQrnUdT9Zg5yfJlPCn3UupUFM6AXsWAv2v+qdWNCgZdW7rBam0t0qmjQshUC96VSmOSREXVEnxGy+oHA2K6ZWAHZBBikCbSWYiFf6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771971101; c=relaxed/simple;
	bh=aNHF17uvGjC3MPKlj4AXdkqk31WfV69+4Cvz4KQIAjY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P5mjJxXMlxVK4URAC9q9OLVVvr4LjjWYTFNFtx4alidf//IVfKB3bLuojja7D7ufZukWcDqfYCrtX2U7Uo8cHq0c1nPi/2upBtCMgQ066Numq2uADuXdTFKEyP5LNr8ZNP9C2R6yY4mChAS6UCoBXO9mZuPx/mjKPoBSKiLHvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmds2Gya; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmds2Gya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771971099; x=1803507099;
  h=date:from:to:cc:subject:message-id;
  bh=aNHF17uvGjC3MPKlj4AXdkqk31WfV69+4Cvz4KQIAjY=;
  b=lmds2Gya7aO6hKOmbhnw/HjjpWzMdCh4XbZMJisXu7REHK39plBzr3a2
   0ZtmLK2gOmEDS/lPdGU1hTVnFK/AJcobArjjVkQlofPm4YwPJXJM5j2nF
   oqaYTWDhp6wDmAaofLrEjZvzlHwqAOzNaL8e9BPaSfbQfKb7gWzoZ8D9L
   GoTCUYBvpQtzIDnkjCgUSp0YmBLx4a0tCmQR2WNtSwH1TIYZbrU++Y4i6
   wKYpcwE4uHXiGi1Vdq9Vw+P3YDTSW8kFDqOr8nU+syIg/G6ND2GNza/Wo
   pNZujprqoYZEKbIKnZKDaTPWVbnPUN0ESDsWDnFz4O9Wn1dqzHsfwvmQm
   w==;
X-CSE-ConnectionGUID: dAkmJUu8TRGoqA2o7HGt7w==
X-CSE-MsgGUID: 6Kc/o67NThy/kH942nkckQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76866629"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="76866629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 14:11:39 -0800
X-CSE-ConnectionGUID: BQ/CJbZwQxesdAWVZjYshQ==
X-CSE-MsgGUID: 7pT0HIiUTaGZnaiDdsH+Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; 
   d="scan'208";a="213799615"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Feb 2026 14:11:38 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vv0cx-000000002Ub-3frp;
	Tue, 24 Feb 2026 22:11:35 +0000
Date: Wed, 25 Feb 2026 06:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 64/64]
 kernel/events/ring_buffer.c:932:6: warning: unused variable 'metadata_pages'
Message-ID: <202602250632.YI6iw4ZN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   46dd99e420696c966a7354f8e93d3b36fa6da00d
commit: aff2eb701946b35067d43fd898e97f66bb598c8a [64/64] ANDROID: 16K: perf: ring_buffer: Use __PAGE_SIZE for metadata
config: arm-randconfig-001-20260225 (https://download.01.org/0day-ci/archive/20260225/202602250632.YI6iw4ZN-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260225/202602250632.YI6iw4ZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602250632.YI6iw4ZN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/ring_buffer.c:932:6: warning: unused variable 'metadata_pages' [-Wunused-variable]
     932 |         int metadata_pages = __PAGE_SIZE / PAGE_SIZE;
         |             ^~~~~~~~~~~~~~
   1 warning generated.


vim +/metadata_pages +932 kernel/events/ring_buffer.c

   929	
   930	static void rb_free_work(struct work_struct *work)
   931	{
 > 932		int metadata_pages = __PAGE_SIZE / PAGE_SIZE;
   933		struct perf_buffer *rb;
   934	
   935		rb = container_of(work, struct perf_buffer, work);
   936	
   937		vfree(rb->user_page);
   938		kfree(rb);
   939	}
   940	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
