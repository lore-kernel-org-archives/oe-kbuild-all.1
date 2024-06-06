Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB6347A62
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 18:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717698762; cv=none; b=JQ1/bdPOkVUkCkkw2NVyQBqEC++ffg2F0+lrUzaZs7yweyiUbw+LkHzBBu0QEgSXW3C2ADPpWcLaT2W4j+ETopbtMQytVT3Lvl05uPSidjSWU3dPIRhbqBwst3+BfQqxBR2+auDLVzJqbE+LopSFmjLMaNe+FpGTkIQYhJCGwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717698762; c=relaxed/simple;
	bh=i4TugZ1c07BzL3lyhgTUtMDul9bvn81ui6Fbwy7ToSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHtQRq1FssR2TnAlOb1J/gJfAo6fhB6tpd+K2wDNi7FHR99/SViytXT4tLyHJpcb3iAMItDo3ETl4HG5/5Gd0Ysqz5JHZ5Z9/L5GgFKf0m/V3SJf3lnbndLGe+QDVDXLQcUUwiCHsSu3vkap//aDVCTsNoYx80iiIpmAdXYEbGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Li4wO0J7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Li4wO0J7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717698760; x=1749234760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i4TugZ1c07BzL3lyhgTUtMDul9bvn81ui6Fbwy7ToSo=;
  b=Li4wO0J7UkLrjAYHELbqp20tgAJDTl+pl3aFmXZ4MoHXe7hsbSF083W+
   Yng81JA9+Hm0XJ3Dnwx6NYaOdchxpQxmzNMxGPJ2I7dnX8BPNdd9cB7dL
   gmROzATVi7JRNn4vS1OOPnM8Ov5bMTDfhqifXZrEMG2vwb9d/ogR0F/IP
   wAiCUlP6RStN4DrroEGTRVi9FzJiE7sWqH/gbygVak4aNvLkPvQOhEP62
   eEtLRCuGzQeELGB5Gc0g8W4cbVGtWAZ4WocmtOZPGYjM9ritIntIloxaW
   QVn+so5lvWgV0kqCy2eil/tfzdGoXNOPVZTBMIS4KISGwQGCNTvu3YO3q
   Q==;
X-CSE-ConnectionGUID: pIO2ijBATyOHe3zw6FppZg==
X-CSE-MsgGUID: PfWikRmASVOy7UAwONGwXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14510922"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14510922"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 11:32:39 -0700
X-CSE-ConnectionGUID: GAfszuWOQWypP+NvIu9ixQ==
X-CSE-MsgGUID: R8xYojJtSRqKt8mQX7J22g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38137955"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 06 Jun 2024 11:32:38 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFHud-0003Zg-2f;
	Thu, 06 Jun 2024 18:32:35 +0000
Date: Fri, 7 Jun 2024 02:32:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/2] cacheinfo: Add function to get cacheinfo for a
 given (cpu, cachelevel)
Message-ID: <202406070207.1yEOv8RD-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on c3f38fa61af77b49866b006939479069cd451173]

url:    https://github.com/intel-lab-lkp/linux/commits/Tony-Luck/cacheinfo-Add-function-to-get-cacheinfo-for-a-given-cpu-cachelevel/20240607-004316
base:   c3f38fa61af77b49866b006939479069cd451173
patch link:    https://lore.kernel.org/r/20240606164047.318378-2-tony.luck%40intel.com
patch subject: [PATCH v3 1/2] cacheinfo: Add function to get cacheinfo for a given (cpu, cachelevel)
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240607/202406070207.1yEOv8RD-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070207.1yEOv8RD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070207.1yEOv8RD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/cacheinfo.h:9,
                    from arch/riscv/include/asm/elf.h:16,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:93,
                    from init/noinitramfs.c:11:
   include/linux/cacheinfo.h: In function 'get_cpu_cacheinfo_level':
>> include/linux/cacheinfo.h:126:9: error: implicit declaration of function 'lockdep_assert_cpus_held'; did you mean 'lockdep_assert_not_held'? [-Werror=implicit-function-declaration]
     126 |         lockdep_assert_cpus_held();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         lockdep_assert_not_held
   include/linux/cpu.h: At top level:
>> include/linux/cpu.h:158:20: warning: conflicting types for 'lockdep_assert_cpus_held'; have 'void(void)'
     158 | static inline void lockdep_assert_cpus_held(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/cpu.h:158:20: error: static declaration of 'lockdep_assert_cpus_held' follows non-static declaration
   include/linux/cacheinfo.h:126:9: note: previous implicit declaration of 'lockdep_assert_cpus_held' with type 'void(void)'
     126 |         lockdep_assert_cpus_held();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/cpu.h:17,
                    from include/linux/cacheinfo.h:6,
                    from arch/riscv/include/asm/cacheinfo.h:9,
                    from arch/riscv/include/asm/elf.h:16,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from mm/filemap.c:23:
>> include/linux/node.h:96:25: error: field 'dev' has incomplete type
      96 |         struct device   dev;
         |                         ^~~
>> include/linux/cpu.h:30:23: error: field 'dev' has incomplete type
      30 |         struct device dev;
         |                       ^~~
>> include/linux/cpu.h:45:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int cpu_add_dev_attr(struct device_attribute *attr);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:46:40: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      46 | extern void cpu_remove_dev_attr(struct device_attribute *attr);
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:52:41: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      52 |                                  struct device_attribute *attr, char *buf);
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:54:43: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      54 |                                    struct device_attribute *attr, char *buf);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:56:43: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      56 |                                    struct device_attribute *attr, char *buf);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:58:50: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      58 |                                           struct device_attribute *attr, char *buf);
         |                                                  ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:60:37: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      60 |                              struct device_attribute *attr, char *buf);
         |                                     ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:62:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      62 |                             struct device_attribute *attr, char *buf);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:64:48: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      64 |                                         struct device_attribute *attr,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:67:46: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      67 |                                       struct device_attribute *attr, char *buf);
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:68:58: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      68 | extern ssize_t cpu_show_srbds(struct device *dev, struct device_attribute *attr, char *buf);
         |                                                          ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:70:48: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      70 |                                         struct device_attribute *attr,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:73:41: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      73 |                                  struct device_attribute *attr, char *buf);
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:75:53: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      75 |                                              struct device_attribute *attr, char *buf);
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:77:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      77 |                             struct device_attribute *attr, char *buf);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:79:55: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      79 |                                                struct device_attribute *attr, char *buf);
         |                                                       ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/cpu.h:17,
                    from include/linux/cacheinfo.h:6,
                    from arch/riscv/include/asm/cacheinfo.h:9,
                    from arch/riscv/include/asm/elf.h:16,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from mm/page-writeback.c:21:
>> include/linux/node.h:96:25: error: field 'dev' has incomplete type
      96 |         struct device   dev;
         |                         ^~~
>> include/linux/cpu.h:30:23: error: field 'dev' has incomplete type
      30 |         struct device dev;
         |                       ^~~
>> include/linux/cpu.h:45:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int cpu_add_dev_attr(struct device_attribute *attr);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:46:40: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      46 | extern void cpu_remove_dev_attr(struct device_attribute *attr);
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:52:41: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      52 |                                  struct device_attribute *attr, char *buf);
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:54:43: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      54 |                                    struct device_attribute *attr, char *buf);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:56:43: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      56 |                                    struct device_attribute *attr, char *buf);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:58:50: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      58 |                                           struct device_attribute *attr, char *buf);
         |                                                  ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:60:37: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      60 |                              struct device_attribute *attr, char *buf);
         |                                     ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:62:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      62 |                             struct device_attribute *attr, char *buf);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:64:48: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      64 |                                         struct device_attribute *attr,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:67:46: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      67 |                                       struct device_attribute *attr, char *buf);
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:68:58: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      68 | extern ssize_t cpu_show_srbds(struct device *dev, struct device_attribute *attr, char *buf);
         |                                                          ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:70:48: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      70 |                                         struct device_attribute *attr,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:73:41: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      73 |                                  struct device_attribute *attr, char *buf);
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:75:53: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      75 |                                              struct device_attribute *attr, char *buf);
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:77:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      77 |                             struct device_attribute *attr, char *buf);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:79:55: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      79 |                                                struct device_attribute *attr, char *buf);
         |                                                       ^~~~~~~~~~~~~~~~
   mm/page-writeback.c: In function 'cgwb_calc_thresh':
   mm/page-writeback.c:900:39: warning: variable 'gdtc' set but not used [-Wunused-but-set-variable]
     900 |         struct dirty_throttle_control gdtc = { GDTC_INIT_NO_WB };
         |                                       ^~~~
--
   In file included from include/linux/cacheinfo.h:6,
                    from arch/riscv/include/asm/cacheinfo.h:9,
                    from arch/riscv/include/asm/elf.h:16,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/memory.h:19,
                    from mm/mm_init.c:13:
>> include/linux/cpu.h:30:23: error: field 'dev' has incomplete type
      30 |         struct device dev;
         |                       ^~~
>> include/linux/cpu.h:45:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int cpu_add_dev_attr(struct device_attribute *attr);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:46:40: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      46 | extern void cpu_remove_dev_attr(struct device_attribute *attr);
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:52:41: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      52 |                                  struct device_attribute *attr, char *buf);
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:54:43: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      54 |                                    struct device_attribute *attr, char *buf);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:56:43: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      56 |                                    struct device_attribute *attr, char *buf);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:58:50: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      58 |                                           struct device_attribute *attr, char *buf);
         |                                                  ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:60:37: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      60 |                              struct device_attribute *attr, char *buf);
         |                                     ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:62:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      62 |                             struct device_attribute *attr, char *buf);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:64:48: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      64 |                                         struct device_attribute *attr,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:67:46: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      67 |                                       struct device_attribute *attr, char *buf);
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:68:58: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      68 | extern ssize_t cpu_show_srbds(struct device *dev, struct device_attribute *attr, char *buf);
         |                                                          ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:70:48: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      70 |                                         struct device_attribute *attr,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:73:41: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      73 |                                  struct device_attribute *attr, char *buf);
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:75:53: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      75 |                                              struct device_attribute *attr, char *buf);
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:77:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      77 |                             struct device_attribute *attr, char *buf);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:79:55: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      79 |                                                struct device_attribute *attr, char *buf);
         |                                                       ^~~~~~~~~~~~~~~~
--
   In file included from include/linux/cpu.h:17,
                    from include/linux/cacheinfo.h:6,
                    from arch/riscv/include/asm/cacheinfo.h:9,
                    from arch/riscv/include/asm/elf.h:16,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from mm/slub.c:14:
>> include/linux/node.h:96:25: error: field 'dev' has incomplete type
      96 |         struct device   dev;
         |                         ^~~
>> include/linux/cpu.h:30:23: error: field 'dev' has incomplete type
      30 |         struct device dev;
         |                       ^~~
>> include/linux/cpu.h:45:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      45 | extern int cpu_add_dev_attr(struct device_attribute *attr);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:46:40: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      46 | extern void cpu_remove_dev_attr(struct device_attribute *attr);
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:52:41: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      52 |                                  struct device_attribute *attr, char *buf);
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:54:43: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      54 |                                    struct device_attribute *attr, char *buf);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:56:43: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      56 |                                    struct device_attribute *attr, char *buf);
         |                                           ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:58:50: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      58 |                                           struct device_attribute *attr, char *buf);
         |                                                  ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:60:37: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      60 |                              struct device_attribute *attr, char *buf);
         |                                     ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:62:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      62 |                             struct device_attribute *attr, char *buf);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:64:48: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      64 |                                         struct device_attribute *attr,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:67:46: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      67 |                                       struct device_attribute *attr, char *buf);
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:68:58: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      68 | extern ssize_t cpu_show_srbds(struct device *dev, struct device_attribute *attr, char *buf);
         |                                                          ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:70:48: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      70 |                                         struct device_attribute *attr,
         |                                                ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:73:41: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      73 |                                  struct device_attribute *attr, char *buf);
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:75:53: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      75 |                                              struct device_attribute *attr, char *buf);
         |                                                     ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:77:36: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      77 |                             struct device_attribute *attr, char *buf);
         |                                    ^~~~~~~~~~~~~~~~
   include/linux/cpu.h:79:55: warning: 'struct device_attribute' declared inside parameter list will not be visible outside of this definition or declaration
      79 |                                                struct device_attribute *attr, char *buf);
         |                                                       ^~~~~~~~~~~~~~~~
   mm/slub.c: In function 'slab_post_alloc_hook':
   mm/slub.c:3904:29: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
    3904 |         struct slabobj_ext *obj_exts;
         |                             ^~~~~~~~
..


vim +126 include/linux/cacheinfo.h

   115	
   116	/*
   117	 * Get the cacheinfo structure for the cache associated with @cpu at
   118	 * level @level.
   119	 * cpuhp lock must be held.
   120	 */
   121	static inline struct cacheinfo *get_cpu_cacheinfo_level(int cpu, int level)
   122	{
   123		struct cpu_cacheinfo *ci = get_cpu_cacheinfo(cpu);
   124		int i;
   125	
 > 126		lockdep_assert_cpus_held();
   127	
   128		for (i = 0; i < ci->num_leaves; i++) {
   129			if (ci->info_list[i].level == level) {
   130				if (ci->info_list[i].attributes & CACHE_ID)
   131					return &ci->info_list[i];
   132				return NULL;
   133			}
   134		}
   135	
   136		return NULL;
   137	}
   138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
