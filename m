Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1128F70
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LV/3HXLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699084556; x=1730620556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HbouDLfy3h5aIJD/KUOzRGVTPsul3r/4s9KVzRsofBE=;
  b=LV/3HXLOiJ/6NY034mRSQk004l1GejvEdYnJ4cKgHErqiWrkMm2VrbAt
   n1GVVrUL1hOU6TyUH6ZcoAOcMZXldjlPV60WKMppqlcevgO6JWVmFsv3d
   k8xlnWph/Rc7NeBh/f/qxy+AMKmLsJuF4goZtkzKxH6SSE8adPYoctLy9
   jzkyBrk8cNOxLEE3uNbgSPbqb2icqfdQKXaoEjrY3F58gB+1Vxo5pZG03
   yc0MgLUBlmZ5wQeOkVkNeIoBDmymkBMGif5u3B7Kj4TN2DTp7So3Dxynv
   HPlahzFX64s6dkYbyy0E6pgl6a1fUUf33f+tVKJTYhXerxhdSuI64DDLQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="7702898"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="7702898"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 00:55:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="935330730"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="935330730"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Nov 2023 00:55:53 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzBVX-0003ed-1b;
	Sat, 04 Nov 2023 07:55:51 +0000
Date: Sat, 4 Nov 2023 15:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 16102/16110] /bin/bash: line 1: 54552
 Segmentation fault      LLVM_OBJCOPY="loongarch64-linux-objcopy" pahole -J
 --btf_gen_floats -j --lang_exclude=rust
 --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base
 vmlinux drivers/cxl/core/cxl_core.ko
Message-ID: <202311041515.Rg81QtyA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e27090b1413ff236ca1aec26d6b022149115de2c
commit: b13c6d07aed6a74d1c826688c0fc2070424a89b2 [16102/16110] Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
config: loongarch-buildonly-randconfig-r001-20220908 (https://download.01.org/0day-ci/archive/20231104/202311041515.Rg81QtyA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041515.Rg81QtyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041515.Rg81QtyA-lkp@intel.com/

All errors (new ones prefixed by >>):

   die__process: DW_TAG_compile_unit, DW_TAG_type_unit, DW_TAG_partial_unit or DW_TAG_skeleton_unit expected got lexical_block (0xb)!
   die__process: DW_TAG_compile_unit, DW_TAG_type_unit, DW_TAG_partial_unit or DW_TAG_skeleton_unit expected got subprogram (0x2e)!
   die__process_unit: DW_TAG_member (0xd) @ <0x3af80> not handled!
   die__process_unit: tag not supported 0xd (member)!
   die__process_unit: DW_TAG_formal_parameter (0x5) @ <0x3af8e> not handled!
   die__process_unit: tag not supported 0x5 (formal_parameter)!
   die__process_unit: DW_TAG_member (0xd) @ <0x3fe63> not handled!
   die__process_unit: DW_TAG_member (0xd) @ <0x3fe70> not handled!
   die__process_unit: DW_TAG_call_site (0x48) @ <0x3fe7d> not handled!
   die__process_unit: tag not supported 0x48 (call_site)!
   tag__recode_dwarf_type: couldn't find 0x3af55 type for 0x3fe98 (subroutine_type)!
   tag__recode_dwarf_type: couldn't find 0x3af8b type for 0x3ff89 (pointer_type)!
   namespace__recode_dwarf_types: couldn't find 0x3dc3c type for 0x3feb8 (member)!
   namespace__recode_dwarf_types: couldn't find 0x3b3a4 type for 0x3fec5 (member)!
   namespace__recode_dwarf_types: couldn't find 0x3b0e4 type for 0x3fed2 (member)!
   namespace__recode_dwarf_types: couldn't find 0x3b0e4 type for 0x3fedf (member)!
   namespace__recode_dwarf_types: couldn't find 0x3b3d3 type for 0x3feec (member)!
   namespace__recode_dwarf_types: couldn't find 0x3dd7a type for 0x3fef9 (member)!
   namespace__recode_dwarf_types: couldn't find 0x3d81e type for 0x3ff06 (member)!
   namespace__recode_dwarf_types: couldn't find 0x3fddf type for 0x3ff13 (member)!
   namespace__recode_dwarf_types: couldn't find 0x3b400 type for 0x3ff20 (member)!
   namespace__recode_dwarf_types: couldn't find 0x3b0e4 type for 0x3ff2d (member)!
   namespace__recode_dwarf_types: couldn't find 0x3b0e4 type for 0x3ff3a (member)!
   namespace__recode_dwarf_types: couldn't find 0x3d81e type for 0x3ff47 (member)!
   namespace__recode_dwarf_types: couldn't find 0x3b0e4 type for 0x3ff54 (member)!
   namespace__recode_dwarf_types: couldn't find 0x3b05a type for 0x3ff61 (member)!
   namespace__recode_dwarf_types: couldn't find 0x434ab type for 0x3ff6e (member)!
>> /bin/bash: line 1: 54552 Segmentation fault      LLVM_OBJCOPY="loongarch64-linux-objcopy" pahole -J --btf_gen_floats -j --lang_exclude=rust --skip_encoding_btf_inconsistent_proto --btf_gen_optimized --btf_base vmlinux drivers/cxl/core/cxl_core.ko

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
