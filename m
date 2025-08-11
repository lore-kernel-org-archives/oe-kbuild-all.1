Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35E22E2EFD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 21:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754946843; cv=none; b=BjEFr8qBG+cGUovRe1tyTPpCW7Ps3nNbR66CNREuxtXRthEGQdHBJKqncNghA6GZT3CuhyJMJDZP/GXv6wmDMCVyeXdKaXN2fbInNvxPI7BV5VPFGm7NqYUmKXA0JipS8vx1XiaMRpfSuhTUCL3WTO7eN80cB1BtxBN34PDIdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754946843; c=relaxed/simple;
	bh=W/P6JII1BebSoq14TiAgmC+f7uvzT3oUVr24Pwcdfws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c6zhctqFFpR4GoG1FeFQIDh4aGdfZ/w7YNLVyhI8kB3BhkK+yQMcLtZNH6SsSTEleIfzE3Alv2QYWDa5Uyqe2xHdM866l5XbE/pru6WLjDNHkz0ubHpv+O+IXhuis4tLKZhAZMArjdmgpR+vkK+9u2f5uxJmlN5NX4YO40IXmAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HPYi8rqM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HPYi8rqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754946842; x=1786482842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/P6JII1BebSoq14TiAgmC+f7uvzT3oUVr24Pwcdfws=;
  b=HPYi8rqMHECQWzyHq9/13RXdK6MefW7DlJ8RXFqsWLEi0c3Z1f6jAj0e
   bKzNBoF/MsCtCoQUtkOZL/nfC6/gcRRBhYvgjip3blEf8gdaKiziNkMQQ
   eBrst9dhNLnnJa7cpiTMdKu0+XODgt2f8k/wZY9X+YIQuzCZNIfnHAON6
   bN6Nc6Yu5eey4cJueAgQ/9zL5tuOJJ/F/yOj/NpjNwJIhxuVaUaNCtc6h
   4Fl0ydUNrX1IhFCjr9FZuL22JL805qvcaYrWrGZKjFrW51js3n1XAlJx1
   QYm6trd5yDHlCsK2GoEgOADuUFzKsjDdt5sAFuPI14RkHhJdm8DjGqKkQ
   w==;
X-CSE-ConnectionGUID: ERKZ8p5qQo2aund6n6Y+5w==
X-CSE-MsgGUID: z+kBEPkeRPiNSowuxmJAjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57277560"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57277560"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 14:14:00 -0700
X-CSE-ConnectionGUID: ueoo70UJSyaNH2NziqbNxg==
X-CSE-MsgGUID: kOCDxZ51Q7eIvtJctHDyzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="197017053"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Aug 2025 14:13:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulZq5-0006ED-0e;
	Mon, 11 Aug 2025 21:13:53 +0000
Date: Tue, 12 Aug 2025 05:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:declare_bitmap 3/3] sound/pci/asihpi/asihpi.c:45:12: warning:
 'index' defined but not used
Message-ID: <202508120559.5YWcwUWI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux declare_bitmap
head:   01ab0916a9bf06c1c2c964b3747e9a02f812285c
commit: 01ab0916a9bf06c1c2c964b3747e9a02f812285c [3/3] bitmap: move DECLARE_BITMAP() macro to include/linux/bitmap.h
config: x86_64-buildonly-randconfig-003-20250812 (https://download.01.org/0day-ci/archive/20250812/202508120559.5YWcwUWI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120559.5YWcwUWI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508120559.5YWcwUWI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/cpumask.h:890:48: note: in expansion of macro 'cpumask_bits'
     890 |         bitmap_shift_right(cpumask_bits(dstp), cpumask_bits(srcp), n,
         |                                                ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_shift_left':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:903:27: note: in expansion of macro 'cpumask_bits'
     903 |         bitmap_shift_left(cpumask_bits(dstp), cpumask_bits(srcp), n,
         |                           ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:903:47: note: in expansion of macro 'cpumask_bits'
     903 |         bitmap_shift_left(cpumask_bits(dstp), cpumask_bits(srcp), n,
         |                                               ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_copy':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:915:21: note: in expansion of macro 'cpumask_bits'
     915 |         bitmap_copy(cpumask_bits(dstp), cpumask_bits(srcp), large_cpumask_bits);
         |                     ^~~~~~~~~~~~
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:915:41: note: in expansion of macro 'cpumask_bits'
     915 |         bitmap_copy(cpumask_bits(dstp), cpumask_bits(srcp), large_cpumask_bits);
         |                                         ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_parse_user':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:952:44: note: in expansion of macro 'cpumask_bits'
     952 |         return bitmap_parse_user(buf, len, cpumask_bits(dstp), nr_cpumask_bits);
         |                                            ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_parselist_user':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:966:48: note: in expansion of macro 'cpumask_bits'
     966 |         return bitmap_parselist_user(buf, len, cpumask_bits(dstp),
         |                                                ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumask_parse':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:979:44: note: in expansion of macro 'cpumask_bits'
     979 |         return bitmap_parse(buf, UINT_MAX, cpumask_bits(dstp), nr_cpumask_bits);
         |                                            ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpulist_parse':
   include/linux/cpumask_types.h:18:37: error: 'struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:991:38: note: in expansion of macro 'cpumask_bits'
     991 |         return bitmap_parselist(buf, cpumask_bits(dstp), nr_cpumask_bits);
         |                                      ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumap_print_to_pagebuf':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:1303:51: note: in expansion of macro 'cpumask_bits'
    1303 |         return bitmap_print_to_pagebuf(list, buf, cpumask_bits(mask),
         |                                                   ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumap_print_bitmask_to_buf':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:1327:49: note: in expansion of macro 'cpumask_bits'
    1327 |         return bitmap_print_bitmask_to_buf(buf, cpumask_bits(mask),
         |                                                 ^~~~~~~~~~~~
   include/linux/cpumask.h: In function 'cpumap_print_list_to_buf':
   include/linux/cpumask_types.h:18:37: error: 'const struct cpumask' has no member named 'bits'
      18 | #define cpumask_bits(maskp) ((maskp)->bits)
         |                                     ^~
   include/linux/cpumask.h:1349:46: note: in expansion of macro 'cpumask_bits'
    1349 |         return bitmap_print_list_to_buf(buf, cpumask_bits(mask),
         |                                              ^~~~~~~~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/io.h:11:
   sound/pci/asihpi/asihpi.c: At top level:
   include/linux/compiler.h:197:82: error: expression in static assertion is not an integer
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:202:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:525:20: note: in expansion of macro 'ARRAY_SIZE'
     525 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:509:9: note: in expansion of macro 'module_param_array_named'
     509 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/asihpi/asihpi.c:50:1: note: in expansion of macro 'module_param_array'
      50 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/asihpi/asihpi.c:45:12: warning: 'index' defined but not used [-Wunused-variable]
      45 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* index 0-MAX */
         |            ^~~~~


vim +/index +45 sound/pci/asihpi/asihpi.c

b2e65c8e913321 Eliot Blennerhassett 2011-03-25  44  
719f82d3987aad Eliot Blennerhassett 2010-04-21 @45  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;	/* index 0-MAX */
719f82d3987aad Eliot Blennerhassett 2010-04-21  46  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;	/* ID for this card */
a67ff6a54095e2 Rusty Russell        2011-12-15  47  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_PNP;
a67ff6a54095e2 Rusty Russell        2011-12-15  48  static bool enable_hpi_hwdep = 1;
719f82d3987aad Eliot Blennerhassett 2010-04-21  49  

:::::: The code at line 45 was first introduced by commit
:::::: 719f82d3987aad4cc9f46d19c35f362672545cad ALSA: Add support of AudioScience ASI boards

:::::: TO: Eliot Blennerhassett <eblennerhassett@audioscience.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
