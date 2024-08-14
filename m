Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3484612E7F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 01:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723599189; cv=none; b=kzQ2rtfJbs2WchPIQr2QFuGE3ysEO1yyN3KTTpw5lF9FHDQAvhflFWHmOJnwpY+YvmXqWIUiUcHMjfwu2QjM/YS7D7nEwKUk0oizDh+Z1s7CSQYAqccSULRTeNPI7TEJX0u8n3Ff7qJm6kx0+ZdMu6mAAtGZznO5j9pIbCLUqJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723599189; c=relaxed/simple;
	bh=SwrDFIVjTyWTrI1GBJ9VoEGY8eUg67EY/+Iz0yjliQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvTq+hIhkpeCrLVusnFtJ3GYpW555mA+/j/ZdiU20jCI7XR8ayEKX/2/Ciw3mzQVaiUclu0X8jGmskW5LAW8qWT4jE3w75YDx21ohvedWhKDNHGR80P5zjCSQvu0orxCQ+yclENJJjDwrMxSUGFsErm3NVS9pMJID68xaaFteL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJnogCvK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJnogCvK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723599186; x=1755135186;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SwrDFIVjTyWTrI1GBJ9VoEGY8eUg67EY/+Iz0yjliQY=;
  b=EJnogCvKPxzjMO3mNN88bUmanSmsRlGt+jDEVcUsUHoEdzbBzNgGkP6U
   ZTzWPMiW6m4V3eoOwouXp2zpnD/VnidkoEJwf0h65Odr8muFQQ06NgoD4
   E3Bdddqj2RJ57V2m//gGGXjm1U4FCWQXVZ2NEEjZ3qgvYggfxfw2KzlT6
   uGoNeNL+pF2Zl8GrB13tyqohCX/xnxyo0RzvNTDQy7j8g7M3kzRT1T4z/
   oeYyC26Et/FafhQJXL2J7KcCNUwXzQ7gb9Qvs/yg0Phtmin1iovUcI0Vw
   vhgJer1Qj8tjk3DAD7nmhJbOMMuywRagFsbHwSeCF7IRKXFwrO9s45vB0
   A==;
X-CSE-ConnectionGUID: 4T2i/gGHQ7WALs3VaZwBfQ==
X-CSE-MsgGUID: AykCTy9XS5WGQcsWk/CdhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="12994507"
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="12994507"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 18:33:05 -0700
X-CSE-ConnectionGUID: 13RYLHCzQP2jkEhRUpnouA==
X-CSE-MsgGUID: znDI02VdSi+QmtE+i7A06g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,287,1716274800"; 
   d="scan'208";a="58956488"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Aug 2024 18:33:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se2so-0000xW-1q;
	Wed, 14 Aug 2024 01:33:02 +0000
Date: Wed, 14 Aug 2024 09:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18174/23490] mm/vmalloc.o: warning:
 objtool: vmap_pages_range_noflush()+0x51e: unreachable instruction
Message-ID: <202408140906.DDO6C5al-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ffc1b506e4066379411520003b9c59e509b05252
commit: 562117a9ad867364248d8bde9c05962e3f97a751 [18174/23490] mm/vmalloc: Hugepage vmalloc mappings
config: x86_64-buildonly-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240814/202408140906.DDO6C5al-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408140906.DDO6C5al-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408140906.DDO6C5al-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmalloc.c:42:
   In file included from mm/internal.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmalloc.c:230:16: warning: variable 'start' set but not used [-Wunused-but-set-variable]
     230 |         unsigned long start;
         |                       ^
   2 warnings generated.
   mm/vmalloc.c:3278: warning: Function parameter or member 'align' not described in 'pvm_determine_end_from_reverse'
>> mm/vmalloc.o: warning: objtool: vmap_pages_range_noflush()+0x51e: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
