Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6E125634
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 19:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744487517; cv=none; b=K2sd3vKObMr4fGL0bNfBJ2/phdNcNZzg0iLpMhEyM6T2JGuR0Bk+1urPgAEp52x6Mhv3vB0rMSDXE3LxKx+usHcixj+f2hYtWlRQzxYJ5GqZ5aihlQvpBYoMOLXtvvjeqvtaUWV1HBS5VcZGrxkimCO1Hn31FXsGu9xOeGckS3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744487517; c=relaxed/simple;
	bh=I0Fza7K4jMjDAX7uA+Gk9mS+ClYkHjLFbhQ3VKMbGMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYvTODT3J/nCPsg4TjX/zz73hzA10JTPnMlFwt33Gi6xX2A+l5FLqNJNunYNxTcx/uLnaLB7+z9e+hiLq7cE1QsqBpz1qXYSqRsN/OroGEHbaYH1fvJQg3fVImv3JHHM2S7HDPC1lYgOg4sCsjLj5l+aOogpjYiFCNULcopuQ7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xpj1CyX9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xpj1CyX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744487516; x=1776023516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I0Fza7K4jMjDAX7uA+Gk9mS+ClYkHjLFbhQ3VKMbGMg=;
  b=Xpj1CyX9e8pCO7akeIhD9sUXnChRGttLJvxJRJ86wwt7I4nGOY/WUrsk
   RyrbOEzEcST98hkG6UGfDGvrZcYCP91vHc4VEF4DKF3n7g91ZAJC2WJQE
   nbOsDWohScmp0wUs41CzmkraTYucbUenExSLiHeK0LajgzR/HAKXYCACP
   f0Zx6vM16mxqFGuPLNy03WZbX8YKTtQdWl8LS55mQ9kxIYvMdzJw4gZBJ
   DvSMqhveP8qwaCLGRgus2aMxepn7EywtPSyzspIe1eY8HjblrO/OqggQF
   SteAaY9s+Ca+Gx+OQyObBtfy3Q/jvYnQfPdVLVjh1hnjUVIDPV1h8gUhn
   w==;
X-CSE-ConnectionGUID: cyNi7vdRRJigURovv4UaOQ==
X-CSE-MsgGUID: NpmaT2Q4SH6T3mbxXeNv/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45915436"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="45915436"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 12:51:55 -0700
X-CSE-ConnectionGUID: jKI1fYJsQIOqDaKCC+Ob6g==
X-CSE-MsgGUID: n1syhNvvTuGO+M7Tan+5gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134229529"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Apr 2025 12:51:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3gtL-000C5M-2S;
	Sat, 12 Apr 2025 19:51:51 +0000
Date: Sun, 13 Apr 2025 03:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:migration 15/16] include/linux/zsmalloc.h:48:33:
 error: storage size of 'zsmalloc_mops' isn't known
Message-ID: <202504130358.OBRw4Hrg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux migration
head:   803af5b7e068ea5c68e5b908e799abf3f254c646
commit: b7c53a88ac7997eba3eec3a42f7d17cc5e5a3a47 [15/16] mm: stop storing migration_ops in page->mapping
config: sparc64-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130358.OBRw4Hrg-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130358.OBRw4Hrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130358.OBRw4Hrg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/block/zram/zram_drv.h:19,
                    from drivers/block/zram/zram_drv.c:38:
>> include/linux/zsmalloc.h:48:33: error: storage size of 'zsmalloc_mops' isn't known
      48 | const struct movable_operations zsmalloc_mops;
         |                                 ^~~~~~~~~~~~~


vim +48 include/linux/zsmalloc.h

    40	
    41	void *zs_obj_read_begin(struct zs_pool *pool, unsigned long handle,
    42				void *local_copy);
    43	void zs_obj_read_end(struct zs_pool *pool, unsigned long handle,
    44			     void *handle_mem);
    45	void zs_obj_write(struct zs_pool *pool, unsigned long handle,
    46			  void *handle_mem, size_t mem_len);
    47	
  > 48	const struct movable_operations zsmalloc_mops;
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
