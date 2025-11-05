Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BC817C220
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 03:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762312072; cv=none; b=oRoHcuxLbmWAm/Y2mfJwNFrjeDskCs5sTi/exws1zEDtdiaksRmBJzaHfMicfHxTK0O1iSxKGlTU2QxcbeXDV5Viunm1FTFw++dj4DOd42KRyh+e5PI/GyyFtj0QdoGi4aRvMvdkmIpDZOXmkJIieWqNDbsymkBaOfdeiDsKJno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762312072; c=relaxed/simple;
	bh=ehBijnjS80pv2W0mjdHqU3iqSO8XXybuvAi0fyH1oRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uHoIiWlUnPCCMHgmzRN13bb6WtiL1nGe3PusDLDry5ZkyS0dxAE1xFMZUkwAZbQ7bByWHLIOGSKd9HehFZR+riFZ90SME3blB9isdFku4FW2GrqDs9PCH1YEC6UIkIKF9W8rAyeG5GTTaaBXkuyDUCrINbWWojBRItcDvAfjwgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4XQkYcD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4XQkYcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762312070; x=1793848070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ehBijnjS80pv2W0mjdHqU3iqSO8XXybuvAi0fyH1oRM=;
  b=c4XQkYcDgsjZyQFQKkbzC9LeQOKQSeH1TgePNIml6UF5pzSesYlAzl74
   ge/Z8z8+hcIBzV4spywemVkqg2RVoRbR9HqgalC6nUPxTO0REXP47PLvl
   ZgJrhEbk46rKTj06mkvTiK3mqHohhllBSkwkRQz5qjHCeweckKvHYK9pd
   WkD/m2gCc7lDkbJVx0I0J/G/7KPNJZ08T/31I3VAyM34gPhiBwQAlXcDF
   VUmre68xsXGbZhsXzOX+tgwU2dzad/UydH0BNHKHytOl5wJe0Oldl+iWp
   ibM2omfiGrz4jNfs/Hor6vRta1REmiFWRXvnYNmMZs6pXCBh0Q/GM3KOd
   w==;
X-CSE-ConnectionGUID: C0mDTeVMTVOgNwrDYvLcCg==
X-CSE-MsgGUID: 0+A6jm7cQ9+8tdGDHAEhbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68278221"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="68278221"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 19:07:47 -0800
X-CSE-ConnectionGUID: auQudPFUQ0WlERr5w7eFOA==
X-CSE-MsgGUID: A6m90nEXQ4OamvLXDQcuPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; 
   d="scan'208";a="191427445"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 04 Nov 2025 19:07:46 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGTs7-000S6m-2v;
	Wed, 05 Nov 2025 03:07:43 +0000
Date: Wed, 5 Nov 2025 11:07:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3099/3099] mm/shmem.o: warning: objtool:
 .init.text: unexpected end of section
Message-ID: <202511051154.EI2nBnB9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f1418110051edb8e47923b009bbd051f7c06ad1a
commit: 8be4868c4f23d36ca7409bcd5492fb554933bb64 [3099/3099] mm: shmem: override mTHP shmem default with a kernel parameter
config: loongarch-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251105/202511051154.EI2nBnB9-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051154.EI2nBnB9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051154.EI2nBnB9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/shmem.c:28:
   In file included from include/linux/ramfs.h:5:
   In file included from include/linux/fs_parser.h:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   mm/shmem.c:1654:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
    1654 |         struct vm_area_struct pvma;
         |                               ^
   include/linux/mm_types.h:629:20: note: member 'vm_flags' declared 'const' here
     629 |                 const vm_flags_t vm_flags;
         |                                  ^
   mm/shmem.c:1802:24: warning: default initialization of an object of type 'struct vm_area_struct' with const member leaves the object uninitialized [-Wdefault-const-init-field-unsafe]
    1802 |         struct vm_area_struct pvma;
         |                               ^
   include/linux/mm_types.h:629:20: note: member 'vm_flags' declared 'const' here
     629 |                 const vm_flags_t vm_flags;
         |                                  ^
   3 warnings generated.
   mm/shmem.o: warning: objtool: shmem_enabled_store() falls through to next function thpsize_shmem_enabled_show()
>> mm/shmem.o: warning: objtool: .init.text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
