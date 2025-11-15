Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932873043D2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 19:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763234268; cv=none; b=q3P+HvBh08tGGaYs4agA8/CkYMRrpahAOnqmLb7tgvdZPmFlywRyF5TGXcVQoFZX59E0ECwldHAH9ZRqD5yFCXAAdh58R3FkXjrAdLrs6ZXNoiZ5s/5fbNRBiNKOt7uIcVtVawWFZJE4rc9imLroRj0CJnS82AeZB1Vo67Sq6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763234268; c=relaxed/simple;
	bh=bwvI3c+HmFTzePIicqVXEPZEDllCSbcNtYHq+t1aXVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tXUTJjTMz58IG6hXchXCtjBDFGzMn3ektVhxmftcAa6zlDjSdFTFbEh6lOURg0l4WwIwcQVDuGodVFJxgWzJmAoIvRxUWzfbSeFyhMr9t2k6FwF/aCne/oMeC1CX8ZiCk77IRnU4wH9FOPQ5U4Cq9FtYY3TLtX0yKYQJzSyHmd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QebbHAPw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QebbHAPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763234267; x=1794770267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bwvI3c+HmFTzePIicqVXEPZEDllCSbcNtYHq+t1aXVE=;
  b=QebbHAPwjGGuB2An4Fhu8Pmd4qta86enF1H5oEE4494O4k0MHF753e+h
   1exwnaB9oNjieOv1SbuL1uyA001DllPlLBc+oceyeeCYEfeDNRhhHet/F
   0sHTyIiehU3LCOVy4DRdJO1/8owrLLYvp/8wdtgrIt15WeOw8VVeu5rT1
   +GXYXBdniuRbUbs4rzzzuVEQs/tWPQ5WmL1Ksws/hKPidgoKlwkakadoi
   jdZFv2y/X/1NBHeDJ8FexadR6pt8HQRm+zsebnjDL9eEJSnaPS80VkVN+
   2Fgc0EdawkDVJjpNvbFsWHiCiB2jaWJz9rSyGiqNAU3xr6VixA2eADmw5
   w==;
X-CSE-ConnectionGUID: 3L1ySoRfSI69J9SAAOFnvg==
X-CSE-MsgGUID: lzjCVpCQTGa8gQs5YjSumg==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="67901326"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="67901326"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 11:17:44 -0800
X-CSE-ConnectionGUID: eboLaDQ6Q/OFyywf7DDL6w==
X-CSE-MsgGUID: RrtIGC+/RiOEFs1XvRpx7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="194194209"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Nov 2025 11:17:42 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKLmG-0008CR-13;
	Sat, 15 Nov 2025 19:17:40 +0000
Date: Sun, 16 Nov 2025 03:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Subject: [akpm-mm:mm-nonmm-unstable 82/133]
 include/linux/kexec_handover.h:108:7: warning: no previous prototype for
 'kho_alloc_preserve'
Message-ID: <202511160332.SpHDxf5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   4fc88c237bfe11bde443e104428aac56e63a997f
commit: 88316955b5b1b4cb0cb2fad416f7e8dde9b246a0 [82/133] kho: introduce high-level memory allocation API
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251116/202511160332.SpHDxf5J-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160332.SpHDxf5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160332.SpHDxf5J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mm_init.c:33:
>> include/linux/kexec_handover.h:108:7: warning: no previous prototype for 'kho_alloc_preserve' [-Wmissing-prototypes]
     108 | void *kho_alloc_preserve(size_t size)
         |       ^~~~~~~~~~~~~~~~~~
>> include/linux/kexec_handover.h:113:6: warning: no previous prototype for 'kho_unpreserve_free' [-Wmissing-prototypes]
     113 | void kho_unpreserve_free(void *mem) { }
         |      ^~~~~~~~~~~~~~~~~~~
>> include/linux/kexec_handover.h:114:6: warning: no previous prototype for 'kho_restore_free' [-Wmissing-prototypes]
     114 | void kho_restore_free(void *mem) { }
         |      ^~~~~~~~~~~~~~~~


vim +/kho_alloc_preserve +108 include/linux/kexec_handover.h

   107	
 > 108	void *kho_alloc_preserve(size_t size)
   109	{
   110		return ERR_PTR(-EOPNOTSUPP);
   111	}
   112	
 > 113	void kho_unpreserve_free(void *mem) { }
 > 114	void kho_restore_free(void *mem) { }
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
