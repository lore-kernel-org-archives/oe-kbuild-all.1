Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C3F3085A6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 04:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750308736; cv=none; b=NECO3X869JJzJMFXvt+tFwBVrnYtKPj3s6ga2jDTXHEYOBGzF3o4H5ZlvH2YL+oBouOW1tcGrec7kb0mEOepajxmy4DSZ+308fXyAcaX7IFFpcjt2DU5PYRwRk22NjWPPbyU5i/try85jXzBk+n4llO183+xo1C631RioFh5N/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750308736; c=relaxed/simple;
	bh=cxJebAXyuAnusSTEyB/Utvhy02RU6r7V3KT2pZtAdh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=By3nmMIPjefq52l5vUAzOUQNHjAKW3dsd3my5SzMY+9LwpZeeRHBOgFnijwHpW12O7HdOj+wu+Ghwr+ScpFdVzSVD9BPLtPYqJYoT0y8DCSrIGveCFnzCbChcqo9tApwWBcOJFC65IeXB9AOpyQGBA6CTPkurmYx7jrWoBEj6sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DH0lBKc/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DH0lBKc/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750308733; x=1781844733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxJebAXyuAnusSTEyB/Utvhy02RU6r7V3KT2pZtAdh8=;
  b=DH0lBKc/LeBRQ5dprEhhnOVVynnNnsPa9NJBBKlvz32dECXJX+9uy9GS
   9xyNVsj12WCCbDqCNMhpdMswd9A0UawnZf8tQDDg7PXfWssjKM9Lf+zkL
   AQiRXSzYXEL9NMBrxVrMAWt5GqoW7h3XIFjDTDteVfWC2XSW0wEZRDh+p
   572ogi0tykJdEf1I1G4pGMFB9smW6CXFzJjhhXPuAc6l1xuKSDKR787wV
   wha8nwhKIg1wd5f2+BRJXBkqYs7QpnDBxnCNyIFqdIxW7mQjsZObmdsQS
   8E1PGpQv4SkHxxSr07w55hG1cLB7aDkSyOMROswEQULxyKWHOT58uNBHM
   w==;
X-CSE-ConnectionGUID: dCKa/0RaR7mv6okiTW5AlA==
X-CSE-MsgGUID: TFpRrL8fQiqmPK4aAemhiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="40161200"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="40161200"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 21:52:12 -0700
X-CSE-ConnectionGUID: BJ5pC40CTuqRakAEWL30UQ==
X-CSE-MsgGUID: 2ypYWwDLTfOv/xCIDZDdBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="155978370"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Jun 2025 21:52:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS7Fx-000KPa-2y;
	Thu, 19 Jun 2025 04:52:09 +0000
Date: Thu, 19 Jun 2025 12:51:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 9/29] Warning: mm/migrate.c:188 function
 parameter 'dst' not described in 'migrate_movable_ops_page'
Message-ID: <202506191215.qBGYTyjc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   f1b6c20fba7773fa03f2b0a965ae80f8ac718891
commit: 70af46886ac15e788bfd4ed331d5b19bf13fd73e [9/29] mm/migrate: factor out movable_ops page handling into migrate_movable_ops_page()
config: parisc-randconfig-r072-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191215.qBGYTyjc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191215.qBGYTyjc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191215.qBGYTyjc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/migrate.c:188 function parameter 'dst' not described in 'migrate_movable_ops_page'
>> Warning: mm/migrate.c:188 function parameter 'src' not described in 'migrate_movable_ops_page'
>> Warning: mm/migrate.c:188 function parameter 'mode' not described in 'migrate_movable_ops_page'
>> Warning: mm/migrate.c:188 Excess function parameter 'page' description in 'migrate_movable_ops_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
