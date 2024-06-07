Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5907714F9D8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 22:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717797710; cv=none; b=VqGPO41cmBahVcum97DxvgTyMGE6KpJFv2xD+rnQGGQmJW6awAqv15urBbEDap5RIaIIOQRbXMXcJOZhGpJvubIy7PvgCcfL4jGFOaK7YIeuW7NjmHcGaKXZ+daqHjiFAcpGvDtOB6Z76Wq6Cmmm8TolxyjXIU5qyfqHc+dC/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717797710; c=relaxed/simple;
	bh=5D8rY+C7G96ZuG5H14GW2a/qDK+Or9ZCgce5wkQ94jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3VHtZ/npnDA7Jv6kZeNskkMgemUIe4Cq0Q7twCI7Vre8kSnIV/2kD64s+ahMEcNb2EbaGsbNVBZTsQ2kERq+X/hbfeOuBOrfXzVys73ygiNNfV5ItKGqnYRAZNzUBZBP0OQXPEon1JipkWYYSGSXE3Sl1MaIKWsTtq+I7Fz/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GqiupVYK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GqiupVYK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717797709; x=1749333709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5D8rY+C7G96ZuG5H14GW2a/qDK+Or9ZCgce5wkQ94jQ=;
  b=GqiupVYKaaXPLVZzQRB1IG+yMTTrWwLH2oyCnzChhhcrnSrdyxRXVAQY
   DwIYZfln8JQUfbrqtDu72LLWfAy96tu6+QLqO7ICa0gwNlZlUe30D5mou
   PskNtIP7ZNSAk3RtDctU6Ju1yzyLnfrPwyzu+mb5Kjg42OVuMUr2UUIli
   VJrrnVYDI3h+HD9u1d4DJ4xr2mdUdgHjZs98CuYPwHwqgh9tZ8TVjcZfl
   LxhaooXjfuDuM3IiKueeqn5mu7YF1k+8QHpHOnIDK1BXkJyOeqLPmbT3L
   lL6+TYa484Ydr2nwQWMN2W3i29I15pg7fPxm/yh5VUQG4AMk2vJPYtvJC
   w==;
X-CSE-ConnectionGUID: +3gqOx5BRHy0qS1RwIlcMw==
X-CSE-MsgGUID: C4Y9818sQs2XHnH7389AeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14379740"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="14379740"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 15:01:48 -0700
X-CSE-ConnectionGUID: c+lwd0MFRQSahUbsSbFeDw==
X-CSE-MsgGUID: rSvNt2C0TZGiMnvKzIh2fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="38537816"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2024 15:01:47 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFhea-0000bS-2n;
	Fri, 07 Jun 2024 22:01:44 +0000
Date: Sat, 8 Jun 2024 06:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/2] cacheinfo: Add function to get cacheinfo for a
 given (cpu, cachelevel)
Message-ID: <202406080532.iXfzeNQG-lkp@intel.com>
References: <20240606164047.318378-2-tony.luck@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606164047.318378-2-tony.luck@intel.com>

Hi Tony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c3f38fa61af77b49866b006939479069cd451173]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Luck/cacheinfo-Add-function-to-get-cacheinfo-for-a-given-cpu-cachelevel/20240607-004316
base:   c3f38fa61af77b49866b006939479069cd451173
patch link:    https://lore.kernel.org/r/20240606164047.318378-2-tony.luck%40intel.com
patch subject: [PATCH v3 1/2] cacheinfo: Add function to get cacheinfo for a given (cpu, cachelevel)
config: riscv-randconfig-001-20240608 (https://download.01.org/0day-ci/archive/20240608/202406080532.iXfzeNQG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406080532.iXfzeNQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406080532.iXfzeNQG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/cacheinfo.h:6,
                    from arch/riscv/include/asm/cacheinfo.h:9,
                    from arch/riscv/include/asm/elf.h:16,
                    from arch/riscv/kernel/vector.c:19:
   include/linux/elf.h:38:5: warning: "ELF_CLASS" is not defined, evaluates to 0 [-Wundef]
      38 | #if ELF_CLASS == ELFCLASS32
         |     ^~~~~~~~~
>> arch/riscv/include/asm/elf.h:137: warning: "SET_PERSONALITY" redefined
     137 | #define SET_PERSONALITY(ex)                                     \
         | 
   include/linux/elf.h:16: note: this is the location of the previous definition
      16 | #define SET_PERSONALITY(ex) \
         | 
--
   In file included from arch/riscv/include/asm/elf.h:16,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/cacheinfo.h:6,
                    from drivers/cache/ax45mp_cache.c:9:
>> arch/riscv/include/asm/cacheinfo.h:12:65: warning: 'struct cacheinfo' declared inside parameter list will not be visible outside of this definition or declaration
      12 |         const struct attribute_group * (*get_priv_group)(struct cacheinfo
         |                                                                 ^~~~~~~~~
>> arch/riscv/include/asm/cacheinfo.h:17:42: warning: 'enum cache_type' declared inside parameter list will not be visible outside of this definition or declaration
      17 | uintptr_t get_cache_size(u32 level, enum cache_type type);
         |                                          ^~~~~~~~~~
   arch/riscv/include/asm/cacheinfo.h:18:46: warning: 'enum cache_type' declared inside parameter list will not be visible outside of this definition or declaration
      18 | uintptr_t get_cache_geometry(u32 level, enum cache_type type);
         |                                              ^~~~~~~~~~


vim +12 arch/riscv/include/asm/cacheinfo.h

087958a17658dc Yash Shah 2020-02-20  10  
087958a17658dc Yash Shah 2020-02-20  11  struct riscv_cacheinfo_ops {
087958a17658dc Yash Shah 2020-02-20 @12  	const struct attribute_group * (*get_priv_group)(struct cacheinfo
087958a17658dc Yash Shah 2020-02-20  13  							*this_leaf);
087958a17658dc Yash Shah 2020-02-20  14  };
087958a17658dc Yash Shah 2020-02-20  15  
087958a17658dc Yash Shah 2020-02-20  16  void riscv_set_cacheinfo_ops(struct riscv_cacheinfo_ops *ops);
38f5bd23deae24 Zong Li   2020-08-31 @17  uintptr_t get_cache_size(u32 level, enum cache_type type);
38f5bd23deae24 Zong Li   2020-08-31  18  uintptr_t get_cache_geometry(u32 level, enum cache_type type);
087958a17658dc Yash Shah 2020-02-20  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
