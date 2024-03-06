Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEFF52F6B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709710700; cv=none; b=Xzt4w+3TwSNo+/lFhejB30Mbm1lixxa732Dczk7joxf7t1HArpPFNB6AQFHjHsghoyup2PBCkBEUK3yR74hUeSdZ2G3wy+s/lcXMIGtYfvOBnK5aprPcRzQvMKaJHXNCikQO3HCg3ZekyvBXJcLRaotV66XGuF/hs1NbtEiWq7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709710700; c=relaxed/simple;
	bh=yjoZls9WtTC7w+ABJBmwXBQk9ILieaR0gloFSQKAshE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lB8EOzqvGw/TMg7oJ5PmFGMt4hmmYO0EbH1hGCFtKfqmxmCJ/1HgTGLt4Q2kbEvhblHr/UrNWiun4cfEXbU3JGSuG01DdLg/HY8BZi4WJasygiVj2/4AqVmWkJAWCx+mdbEH1kDiO3vDx+0IrFVgJ4Gjnlco8Yzkug53x0pwbBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=an9Jqskf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="an9Jqskf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709710697; x=1741246697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjoZls9WtTC7w+ABJBmwXBQk9ILieaR0gloFSQKAshE=;
  b=an9JqskfX6+Eegn2wsRhyRLRhh3cmTdA+F1Dhy9fWlKlDIDBpAke4g+n
   1g/RKk9kLOpMsvEaU2AuggazdwXrgbm1zRwKdw561ASCQhT9CON520KiO
   60G0/rk7PKtosvSp12EMG8lZ9CFDjkTE1RNn3AUWQEsjWPqdKh2rNXGLB
   7fql3/vZ8g+MViB0YSFhSizNi5L8gVW92i8i6uDZD7wd9IOZPvWMIO9cU
   NqVjI3sZ7dts5Cye3RSQlpoJitKHzbqSEwMtX2N64DsIzizUJ4CWFT0+6
   9BJXDtP6yhj0JYQ+3VCeoA40ZHLuVjwkKMPpqRX7XYSXAQ+b9pnpagtNf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4479316"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4479316"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 23:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9530388"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2024 23:38:14 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhlqu-00042F-0y;
	Wed, 06 Mar 2024 07:38:12 +0000
Date: Wed, 6 Mar 2024 15:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 23841/27434]
 drivers/thirdparty/bnxt/tf_ulp/ulp_flow_db.c:852:1: error: conflicting types
 for 'ulp_flow_db_flush_flows' due to enum/integer mismatch; have 'int(struct
 bnxt_ulp_context *, enum bnxt_ulp_fdb_type)'
Message-ID: <202403061534.LHCIuBvx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: cbe224488e92e2e20a7d2b686fd28491f1e98744 [23841/27434] drivers: add thirdparty drivers
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240306/202403061534.LHCIuBvx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061534.LHCIuBvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403061534.LHCIuBvx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/thirdparty/bnxt/tf_ulp/ulp_flow_db.c:852:1: error: conflicting types for 'ulp_flow_db_flush_flows' due to enum/integer mismatch; have 'int(struct bnxt_ulp_context *, enum bnxt_ulp_fdb_type)' [-Werror=enum-int-mismatch]
     852 | ulp_flow_db_flush_flows(struct bnxt_ulp_context *ulp_ctx,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/thirdparty/bnxt/tf_ulp/ulp_flow_db.c:14:
   drivers/thirdparty/bnxt/tf_ulp/ulp_flow_db.h:114:1: note: previous declaration of 'ulp_flow_db_flush_flows' with type 'int(struct bnxt_ulp_context *, u32)' {aka 'int(struct bnxt_ulp_context *, unsigned int)'}
     114 | ulp_flow_db_flush_flows(struct bnxt_ulp_context *ulp_ctx,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/bnxt/tf_ulp/ulp_flow_db.c:1192:6: error: no previous prototype for 'ulp_flow_db_debug_fid_dump' [-Werror=missing-prototypes]
    1192 | void ulp_flow_db_debug_fid_dump(struct bnxt_ulp_context *ulp_ctxt,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/bnxt/tf_ulp/ulp_flow_db.c:1197:5: error: no previous prototype for 'ulp_flow_db_debug_dump' [-Werror=missing-prototypes]
    1197 | int ulp_flow_db_debug_dump(struct bnxt_ulp_context *ulp_ctxt, u32 flow_id)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from drivers/thirdparty/i40e/i40e_main.c:9:
>> drivers/thirdparty/i40e/i40e_helper.h:16:12: warning: conflicting types for 'i40e_allocate_dma_mem_d' due to enum/integer mismatch; have 'int(struct i40e_hw *, struct i40e_dma_mem *, enum i40e_memory_type,  u64,  u32)' {aka 'int(struct i40e_hw *, struct i40e_dma_mem *, enum i40e_memory_type,  long long unsigned int,  unsigned int)'} [-Wenum-int-mismatch]
      16 | inline int i40e_allocate_dma_mem_d(struct i40e_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/thirdparty/i40e/i40e_type.h:8,
                    from drivers/thirdparty/i40e/i40e.h:48,
                    from drivers/thirdparty/i40e/i40e_main.c:8:
   drivers/thirdparty/i40e/i40e_osdep.h:64:25: note: previous declaration of 'i40e_allocate_dma_mem_d' with type 'i40e_status(struct i40e_hw *, struct i40e_dma_mem *, enum i40e_memory_type,  u64,  u32)' {aka 'enum i40e_status_code(struct i40e_hw *, struct i40e_dma_mem *, enum i40e_memory_type,  long long unsigned int,  unsigned int)'}
      64 |                         i40e_allocate_dma_mem_d(h, m, unused, s, a)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_alloc.h:23:13: note: in expansion of macro 'i40e_allocate_dma_mem'
      23 | i40e_status i40e_allocate_dma_mem(struct i40e_hw *hw,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/i40e/i40e_helper.h:42:12: warning: conflicting types for 'i40e_free_dma_mem_d' due to enum/integer mismatch; have 'int(struct i40e_hw *, struct i40e_dma_mem *)' [-Wenum-int-mismatch]
      42 | inline int i40e_free_dma_mem_d(struct i40e_hw *hw, struct i40e_dma_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_osdep.h:66:33: note: previous declaration of 'i40e_free_dma_mem_d' with type 'i40e_status(struct i40e_hw *, struct i40e_dma_mem *)' {aka 'enum i40e_status_code(struct i40e_hw *, struct i40e_dma_mem *)'}
      66 | #define i40e_free_dma_mem(h, m) i40e_free_dma_mem_d(h, m)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_alloc.h:27:13: note: in expansion of macro 'i40e_free_dma_mem'
      27 | i40e_status i40e_free_dma_mem(struct i40e_hw *hw,
         |             ^~~~~~~~~~~~~~~~~
>> drivers/thirdparty/i40e/i40e_helper.h:60:12: warning: conflicting types for 'i40e_allocate_virt_mem_d' due to enum/integer mismatch; have 'int(struct i40e_hw *, struct i40e_virt_mem *, u32)' {aka 'int(struct i40e_hw *, struct i40e_virt_mem *, unsigned int)'} [-Wenum-int-mismatch]
      60 | inline int i40e_allocate_virt_mem_d(struct i40e_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_osdep.h:73:41: note: previous declaration of 'i40e_allocate_virt_mem_d' with type 'i40e_status(struct i40e_hw *, struct i40e_virt_mem *, u32)' {aka 'enum i40e_status_code(struct i40e_hw *, struct i40e_virt_mem *, unsigned int)'}
      73 | #define i40e_allocate_virt_mem(h, m, s) i40e_allocate_virt_mem_d(h, m, s)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_alloc.h:29:13: note: in expansion of macro 'i40e_allocate_virt_mem'
      29 | i40e_status i40e_allocate_virt_mem(struct i40e_hw *hw,
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/i40e/i40e_helper.h:78:12: warning: conflicting types for 'i40e_free_virt_mem_d' due to enum/integer mismatch; have 'int(struct i40e_hw *, struct i40e_virt_mem *)' [-Wenum-int-mismatch]
      78 | inline int i40e_free_virt_mem_d(struct i40e_hw *hw, struct i40e_virt_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_osdep.h:74:34: note: previous declaration of 'i40e_free_virt_mem_d' with type 'i40e_status(struct i40e_hw *, struct i40e_virt_mem *)' {aka 'enum i40e_status_code(struct i40e_hw *, struct i40e_virt_mem *)'}
      74 | #define i40e_free_virt_mem(h, m) i40e_free_virt_mem_d(h, m)
         |                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_alloc.h:32:13: note: in expansion of macro 'i40e_free_virt_mem'
      32 | i40e_status i40e_free_virt_mem(struct i40e_hw *hw,
         |             ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/thirdparty/iavf/iavf_main.c:5:
>> drivers/thirdparty/iavf/iavf_helper.h:17:12: warning: conflicting types for 'iavf_allocate_dma_mem_d' due to enum/integer mismatch; have 'int(struct iavf_hw *, struct iavf_dma_mem *, enum iavf_memory_type,  u64,  u32)' {aka 'int(struct iavf_hw *, struct iavf_dma_mem *, enum iavf_memory_type,  long long unsigned int,  unsigned int)'} [-Wenum-int-mismatch]
      17 | inline int iavf_allocate_dma_mem_d(struct iavf_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/thirdparty/iavf/iavf_type.h:8,
                    from drivers/thirdparty/iavf/iavf.h:45,
                    from drivers/thirdparty/iavf/iavf_main.c:4:
   drivers/thirdparty/iavf/iavf_osdep.h:64:9: note: previous declaration of 'iavf_allocate_dma_mem_d' with type 'enum iavf_status(struct iavf_hw *, struct iavf_dma_mem *, enum iavf_memory_type,  u64,  u32)' {aka 'enum iavf_status(struct iavf_hw *, struct iavf_dma_mem *, enum iavf_memory_type,  long long unsigned int,  unsigned int)'}
      64 |         iavf_allocate_dma_mem_d(h, m, unused, s, a)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_alloc.h:23:18: note: in expansion of macro 'iavf_allocate_dma_mem'
      23 | enum iavf_status iavf_allocate_dma_mem(struct iavf_hw *hw,
         |                  ^~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/iavf/iavf_helper.h:43:12: warning: conflicting types for 'iavf_free_dma_mem_d' due to enum/integer mismatch; have 'int(struct iavf_hw *, struct iavf_dma_mem *)' [-Wenum-int-mismatch]
      43 | inline int iavf_free_dma_mem_d(struct iavf_hw *hw, struct iavf_dma_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_osdep.h:66:33: note: previous declaration of 'iavf_free_dma_mem_d' with type 'enum iavf_status(struct iavf_hw *, struct iavf_dma_mem *)'
      66 | #define iavf_free_dma_mem(h, m) iavf_free_dma_mem_d(h, m)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_alloc.h:27:18: note: in expansion of macro 'iavf_free_dma_mem'
      27 | enum iavf_status iavf_free_dma_mem(struct iavf_hw *hw,
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/thirdparty/iavf/iavf_helper.h:61:12: warning: conflicting types for 'iavf_allocate_virt_mem_d' due to enum/integer mismatch; have 'int(struct iavf_hw *, struct iavf_virt_mem *, u32)' {aka 'int(struct iavf_hw *, struct iavf_virt_mem *, unsigned int)'} [-Wenum-int-mismatch]
      61 | inline int iavf_allocate_virt_mem_d(struct iavf_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_osdep.h:73:41: note: previous declaration of 'iavf_allocate_virt_mem_d' with type 'enum iavf_status(struct iavf_hw *, struct iavf_virt_mem *, u32)' {aka 'enum iavf_status(struct iavf_hw *, struct iavf_virt_mem *, unsigned int)'}
      73 | #define iavf_allocate_virt_mem(h, m, s) iavf_allocate_virt_mem_d(h, m, s)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_alloc.h:29:18: note: in expansion of macro 'iavf_allocate_virt_mem'
      29 | enum iavf_status iavf_allocate_virt_mem(struct iavf_hw *hw,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/iavf/iavf_helper.h:79:12: warning: conflicting types for 'iavf_free_virt_mem_d' due to enum/integer mismatch; have 'int(struct iavf_hw *, struct iavf_virt_mem *)' [-Wenum-int-mismatch]
      79 | inline int iavf_free_virt_mem_d(struct iavf_hw *hw, struct iavf_virt_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_osdep.h:74:34: note: previous declaration of 'iavf_free_virt_mem_d' with type 'enum iavf_status(struct iavf_hw *, struct iavf_virt_mem *)'
      74 | #define iavf_free_virt_mem(h, m) iavf_free_virt_mem_d(h, m)
         |                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_alloc.h:32:18: note: in expansion of macro 'iavf_free_virt_mem'
      32 | enum iavf_status iavf_free_virt_mem(struct iavf_hw *hw,
         |                  ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/thirdparty/i40e/i40e_main.c:9:
>> drivers/thirdparty/i40e/i40e_helper.h:16:12: warning: conflicting types for 'i40e_allocate_dma_mem_d' due to enum/integer mismatch; have 'int(struct i40e_hw *, struct i40e_dma_mem *, enum i40e_memory_type,  u64,  u32)' {aka 'int(struct i40e_hw *, struct i40e_dma_mem *, enum i40e_memory_type,  long long unsigned int,  unsigned int)'} [-Wenum-int-mismatch]
      16 | inline int i40e_allocate_dma_mem_d(struct i40e_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/thirdparty/i40e/i40e_type.h:8,
                    from drivers/thirdparty/i40e/i40e.h:48,
                    from drivers/thirdparty/i40e/i40e_main.c:8:
   drivers/thirdparty/i40e/i40e_osdep.h:64:25: note: previous declaration of 'i40e_allocate_dma_mem_d' with type 'i40e_status(struct i40e_hw *, struct i40e_dma_mem *, enum i40e_memory_type,  u64,  u32)' {aka 'enum i40e_status_code(struct i40e_hw *, struct i40e_dma_mem *, enum i40e_memory_type,  long long unsigned int,  unsigned int)'}
      64 |                         i40e_allocate_dma_mem_d(h, m, unused, s, a)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_alloc.h:23:13: note: in expansion of macro 'i40e_allocate_dma_mem'
      23 | i40e_status i40e_allocate_dma_mem(struct i40e_hw *hw,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/i40e/i40e_helper.h:42:12: warning: conflicting types for 'i40e_free_dma_mem_d' due to enum/integer mismatch; have 'int(struct i40e_hw *, struct i40e_dma_mem *)' [-Wenum-int-mismatch]
      42 | inline int i40e_free_dma_mem_d(struct i40e_hw *hw, struct i40e_dma_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_osdep.h:66:33: note: previous declaration of 'i40e_free_dma_mem_d' with type 'i40e_status(struct i40e_hw *, struct i40e_dma_mem *)' {aka 'enum i40e_status_code(struct i40e_hw *, struct i40e_dma_mem *)'}
      66 | #define i40e_free_dma_mem(h, m) i40e_free_dma_mem_d(h, m)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_alloc.h:27:13: note: in expansion of macro 'i40e_free_dma_mem'
      27 | i40e_status i40e_free_dma_mem(struct i40e_hw *hw,
         |             ^~~~~~~~~~~~~~~~~
>> drivers/thirdparty/i40e/i40e_helper.h:60:12: warning: conflicting types for 'i40e_allocate_virt_mem_d' due to enum/integer mismatch; have 'int(struct i40e_hw *, struct i40e_virt_mem *, u32)' {aka 'int(struct i40e_hw *, struct i40e_virt_mem *, unsigned int)'} [-Wenum-int-mismatch]
      60 | inline int i40e_allocate_virt_mem_d(struct i40e_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_osdep.h:73:41: note: previous declaration of 'i40e_allocate_virt_mem_d' with type 'i40e_status(struct i40e_hw *, struct i40e_virt_mem *, u32)' {aka 'enum i40e_status_code(struct i40e_hw *, struct i40e_virt_mem *, unsigned int)'}
      73 | #define i40e_allocate_virt_mem(h, m, s) i40e_allocate_virt_mem_d(h, m, s)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_alloc.h:29:13: note: in expansion of macro 'i40e_allocate_virt_mem'
      29 | i40e_status i40e_allocate_virt_mem(struct i40e_hw *hw,
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/i40e/i40e_helper.h:78:12: warning: conflicting types for 'i40e_free_virt_mem_d' due to enum/integer mismatch; have 'int(struct i40e_hw *, struct i40e_virt_mem *)' [-Wenum-int-mismatch]
      78 | inline int i40e_free_virt_mem_d(struct i40e_hw *hw, struct i40e_virt_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_osdep.h:74:34: note: previous declaration of 'i40e_free_virt_mem_d' with type 'i40e_status(struct i40e_hw *, struct i40e_virt_mem *)' {aka 'enum i40e_status_code(struct i40e_hw *, struct i40e_virt_mem *)'}
      74 | #define i40e_free_virt_mem(h, m) i40e_free_virt_mem_d(h, m)
         |                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/i40e/i40e_alloc.h:32:13: note: in expansion of macro 'i40e_free_virt_mem'
      32 | i40e_status i40e_free_virt_mem(struct i40e_hw *hw,
         |             ^~~~~~~~~~~~~~~~~~
   In file included from drivers/thirdparty/i40e/i40e_trace.h:228,
                    from drivers/thirdparty/i40e/i40e_main.c:32:
   include/trace/define_trace.h:95:42: fatal error: ./i40e_trace.h: No such file or directory
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |                                          ^
   compilation terminated.
--
   In file included from drivers/thirdparty/iavf/iavf_main.c:5:
>> drivers/thirdparty/iavf/iavf_helper.h:17:12: warning: conflicting types for 'iavf_allocate_dma_mem_d' due to enum/integer mismatch; have 'int(struct iavf_hw *, struct iavf_dma_mem *, enum iavf_memory_type,  u64,  u32)' {aka 'int(struct iavf_hw *, struct iavf_dma_mem *, enum iavf_memory_type,  long long unsigned int,  unsigned int)'} [-Wenum-int-mismatch]
      17 | inline int iavf_allocate_dma_mem_d(struct iavf_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/thirdparty/iavf/iavf_type.h:8,
                    from drivers/thirdparty/iavf/iavf.h:45,
                    from drivers/thirdparty/iavf/iavf_main.c:4:
   drivers/thirdparty/iavf/iavf_osdep.h:64:9: note: previous declaration of 'iavf_allocate_dma_mem_d' with type 'enum iavf_status(struct iavf_hw *, struct iavf_dma_mem *, enum iavf_memory_type,  u64,  u32)' {aka 'enum iavf_status(struct iavf_hw *, struct iavf_dma_mem *, enum iavf_memory_type,  long long unsigned int,  unsigned int)'}
      64 |         iavf_allocate_dma_mem_d(h, m, unused, s, a)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_alloc.h:23:18: note: in expansion of macro 'iavf_allocate_dma_mem'
      23 | enum iavf_status iavf_allocate_dma_mem(struct iavf_hw *hw,
         |                  ^~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/iavf/iavf_helper.h:43:12: warning: conflicting types for 'iavf_free_dma_mem_d' due to enum/integer mismatch; have 'int(struct iavf_hw *, struct iavf_dma_mem *)' [-Wenum-int-mismatch]
      43 | inline int iavf_free_dma_mem_d(struct iavf_hw *hw, struct iavf_dma_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_osdep.h:66:33: note: previous declaration of 'iavf_free_dma_mem_d' with type 'enum iavf_status(struct iavf_hw *, struct iavf_dma_mem *)'
      66 | #define iavf_free_dma_mem(h, m) iavf_free_dma_mem_d(h, m)
         |                                 ^~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_alloc.h:27:18: note: in expansion of macro 'iavf_free_dma_mem'
      27 | enum iavf_status iavf_free_dma_mem(struct iavf_hw *hw,
         |                  ^~~~~~~~~~~~~~~~~
>> drivers/thirdparty/iavf/iavf_helper.h:61:12: warning: conflicting types for 'iavf_allocate_virt_mem_d' due to enum/integer mismatch; have 'int(struct iavf_hw *, struct iavf_virt_mem *, u32)' {aka 'int(struct iavf_hw *, struct iavf_virt_mem *, unsigned int)'} [-Wenum-int-mismatch]
      61 | inline int iavf_allocate_virt_mem_d(struct iavf_hw *hw,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_osdep.h:73:41: note: previous declaration of 'iavf_allocate_virt_mem_d' with type 'enum iavf_status(struct iavf_hw *, struct iavf_virt_mem *, u32)' {aka 'enum iavf_status(struct iavf_hw *, struct iavf_virt_mem *, unsigned int)'}
      73 | #define iavf_allocate_virt_mem(h, m, s) iavf_allocate_virt_mem_d(h, m, s)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_alloc.h:29:18: note: in expansion of macro 'iavf_allocate_virt_mem'
      29 | enum iavf_status iavf_allocate_virt_mem(struct iavf_hw *hw,
         |                  ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/thirdparty/iavf/iavf_helper.h:79:12: warning: conflicting types for 'iavf_free_virt_mem_d' due to enum/integer mismatch; have 'int(struct iavf_hw *, struct iavf_virt_mem *)' [-Wenum-int-mismatch]
      79 | inline int iavf_free_virt_mem_d(struct iavf_hw *hw, struct iavf_virt_mem *mem)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_osdep.h:74:34: note: previous declaration of 'iavf_free_virt_mem_d' with type 'enum iavf_status(struct iavf_hw *, struct iavf_virt_mem *)'
      74 | #define iavf_free_virt_mem(h, m) iavf_free_virt_mem_d(h, m)
         |                                  ^~~~~~~~~~~~~~~~~~~~
   drivers/thirdparty/iavf/iavf_alloc.h:32:18: note: in expansion of macro 'iavf_free_virt_mem'
      32 | enum iavf_status iavf_free_virt_mem(struct iavf_hw *hw,
         |                  ^~~~~~~~~~~~~~~~~~
   In file included from drivers/thirdparty/iavf/iavf_trace.h:228,
                    from drivers/thirdparty/iavf/iavf_main.c:12:
   include/trace/define_trace.h:95:42: fatal error: ./iavf_trace.h: No such file or directory
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |                                          ^
   compilation terminated.


vim +852 drivers/thirdparty/bnxt/tf_ulp/ulp_flow_db.c

   842	
   843	/**
   844	 * Flush all flows in the flow database.
   845	 *
   846	 * @ulp_ctxt: Ptr to ulp context
   847	 * @flow_type: - specify default or regular
   848	 *
   849	 * returns 0 on success or negative number on failure
   850	 */
   851	int
 > 852	ulp_flow_db_flush_flows(struct bnxt_ulp_context *ulp_ctx,
   853				enum bnxt_ulp_fdb_type flow_type)
   854	{
   855		struct bnxt_ulp_flow_db *flow_db;
   856		u32 fid = 0;
   857	
   858		if (!ulp_ctx)
   859			return -EINVAL;
   860	
   861		flow_db = bnxt_ulp_cntxt_ptr2_flow_db_get(ulp_ctx);
   862		if (!flow_db) {
   863			netdev_dbg(ulp_ctx->bp->dev, "Flow database not found\n");
   864			return -EINVAL;
   865		}
   866	
   867		mutex_lock(&ulp_ctx->cfg_data->flow_db_lock);
   868		while (!ulp_flow_db_next_entry_get(ulp_ctx, flow_db, flow_type, &fid))
   869			ulp_mapper_resources_free(ulp_ctx, flow_type, fid);
   870		mutex_unlock(&ulp_ctx->cfg_data->flow_db_lock);
   871	
   872		return 0;
   873	}
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
