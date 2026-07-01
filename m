Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A633B440F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 11:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782904883; cv=none; b=VzcEq0A8Tkythvh1SDOvgpwqPuC6kdNaJtTTyMKi9DMGsuonr9AxTaY3QwwzkhJUPgwikFClJxov5PU+jkQUtha56HIWtbROVmNWAyx0sG+cR/9qIP6NNyb/gmrZoDHC5IQKX/yPlutciyUzzKoD4GrKgrbtHA16I0/p5JJlC6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782904883; c=relaxed/simple;
	bh=Jl1bDqlO1Kd4OmoPVBIGl0EyJszuhaIy+3W32nVYZ6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WYaoJmN/Ez9/Ikwz+dj2bUYmJDrRbzrmHr92AxrE+T3IV0XkcH/hsqiiHQvI30qGsVw4uz69jSXNmuobghOGydfRBeXeBAKqw+93R49IEY2CcCDBbLcI8Dm3N00RBRMf9jtEUfo1Obb5EzHVqlMTeM9sBk6dQq5JwzJxGnmJUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOfZhlNB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOfZhlNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782904880; x=1814440880;
  h=date:from:to:cc:subject:message-id;
  bh=Jl1bDqlO1Kd4OmoPVBIGl0EyJszuhaIy+3W32nVYZ6A=;
  b=XOfZhlNBE3jx0PqGzAvE9IM4V8+xlDBd2uBNi/7cWIQltLPFO5gMxU24
   skL13vw7K3wdee4A4WPJRUvNbb8ZOGIjN7D+ZeAPD65TwDOoXpz15DUQ0
   cmDSeWUFK2sHbVrWTV3QwSZUyUIN0RextqlJDj18P/pKWm5mmMy50tKXJ
   slk6PWUL2rBQiU7INZJjmiJwCIbjgCo7GYxYORFULvu2nfcK6Yy0uq7YI
   ncGS8KXxE9Jf+Bv++kkcC/ITcQYIYnXUJ+So+tQk5WBRYdclS23lTJbFy
   roz3DsQYcJ7ll76+Mf1T2AG+fA/8rb+oZuDpfJbK5ULVrhn6f5kMSbB7e
   Q==;
X-CSE-ConnectionGUID: Ybz5g0u7TH6xu+o+Y5LKaA==
X-CSE-MsgGUID: GAfP3yr+QAG/C2wD9gKanw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="109181923"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="109181923"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:21:19 -0700
X-CSE-ConnectionGUID: qizUHj38Q4qju6ncAo1J2A==
X-CSE-MsgGUID: YS5gc/NMR4Kmu3fx/lVXxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="253184723"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Jul 2026 04:21:16 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wet0C-000000009EV-2XEu;
	Wed, 01 Jul 2026 11:21:12 +0000
Date: Wed, 01 Jul 2026 19:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v4 9/58]
 drivers/iommu/riscv/iommu-bits.h:725:34: error: 'RISCV_IOMMU_CMD_OPCODE'
 undeclared; did you mean 'RISCV_IOMMU_CMD0_OPCODE'?
Message-ID: <202607011901.hGbT9GDM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v4
head:   68a7980b426326a032b7c7bb829239c3f366dc08
commit: 716b4648d9a69485236bbad4d31a0ac91f906066 [9/58] iommu/riscv: Issue IOTINVAL.GVMA when g-stage is active
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260701/202607011901.hGbT9GDM-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011901.hGbT9GDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011901.hGbT9GDM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/iommu/riscv/iommu-bits.h: In function 'riscv_iommu_cmd_inval_gvma':
>> drivers/iommu/riscv/iommu-bits.h:725:34: error: 'RISCV_IOMMU_CMD_OPCODE' undeclared (first use in this function); did you mean 'RISCV_IOMMU_CMD0_OPCODE'?
     725 |         cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_unsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:137:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     137 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-bits.h:725:23: note: in expansion of macro 'FIELD_PREP'
     725 |         cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
         |                       ^~~~~~~~~~
   drivers/iommu/riscv/iommu-bits.h:725:34: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_unsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:137:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     137 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-bits.h:725:23: note: in expansion of macro 'FIELD_PREP'
     725 |         cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
         |                       ^~~~~~~~~~
>> drivers/iommu/riscv/iommu-bits.h:726:34: error: 'RISCV_IOMMU_CMD_FUNC' undeclared (first use in this function); did you mean 'RISCV_IOMMU_CMD0_FUNC'?
     726 |                       FIELD_PREP(RISCV_IOMMU_CMD_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
         |                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_unsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:137:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     137 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-bits.h:726:23: note: in expansion of macro 'FIELD_PREP'
     726 |                       FIELD_PREP(RISCV_IOMMU_CMD_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
         |                       ^~~~~~~~~~
   drivers/iommu/riscv/iommu.c: In function 'riscv_iommu_attach_paging_domain':
   drivers/iommu/riscv/iommu.c:1265:29: error: implicit declaration of function 'virt_to_pfn'; did you mean 'virt_to_phys'? [-Wimplicit-function-declaration]
    1265 |                 dc.msiptp = virt_to_pfn(domain->msi_root) |
         |                             ^~~~~~~~~~~
         |                             virt_to_phys
--
   In file included from <command-line>:
   drivers/iommu/riscv/iommu-bits.h: In function 'riscv_iommu_cmd_inval_gvma':
>> drivers/iommu/riscv/iommu-bits.h:725:34: error: 'RISCV_IOMMU_CMD_OPCODE' undeclared (first use in this function); did you mean 'RISCV_IOMMU_CMD0_OPCODE'?
     725 |         cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_unsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:137:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     137 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-bits.h:725:23: note: in expansion of macro 'FIELD_PREP'
     725 |         cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
         |                       ^~~~~~~~~~
   drivers/iommu/riscv/iommu-bits.h:725:34: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_unsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:137:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     137 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-bits.h:725:23: note: in expansion of macro 'FIELD_PREP'
     725 |         cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
         |                       ^~~~~~~~~~
>> drivers/iommu/riscv/iommu-bits.h:726:34: error: 'RISCV_IOMMU_CMD_FUNC' undeclared (first use in this function); did you mean 'RISCV_IOMMU_CMD0_FUNC'?
     726 |                       FIELD_PREP(RISCV_IOMMU_CMD_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
         |                                  ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_unsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:137:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     137 |                 __BF_FIELD_CHECK_REG(_mask, 0ULL, "FIELD_PREP: ");      \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/riscv/iommu-bits.h:726:23: note: in expansion of macro 'FIELD_PREP'
     726 |                       FIELD_PREP(RISCV_IOMMU_CMD_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
         |                       ^~~~~~~~~~


vim +725 drivers/iommu/riscv/iommu-bits.h

   722	
   723	static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
   724	{
 > 725		cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
 > 726			      FIELD_PREP(RISCV_IOMMU_CMD_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
   727		cmd->dword1 = 0;
   728	}
   729	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
