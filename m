Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A908F1E87A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 15:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705591044; cv=none; b=H68QburXfNPIr87/lfEZjV+xaFu3KiBr4Kjq0bbnuaeTuNDgxN/65dRh4YoSe3ff3ePe07gnku7lbZDqQ6skVgVqkTmjK6VySUnmri1L2vGo9zDNyS6zRp8JVArvOmjLzK0Ntan0bXE32noDQmw+RDSv8nkOhoMg9+Ka/Jri+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705591044; c=relaxed/simple;
	bh=q2zdfSMwVBR0+EEmzvq+H6GgAoKGlY4NMNYUFCuSx8g=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=b98LsOrnT9/GL4OIshXd3cxpuy5v0EZQ/N2YrZ85Zd/l3FMUU9yC5dmwtD//m9DmL+rpPqxrF5WLuP1m3OWUplpx3EEq38iAvze1XDsP0IswzCtORUid502BUwss5ujpdPDjILKKUOE/V2wcSWNg85Ytz1dFd9b2b2wxCkBPiE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VG6fiXkZ; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG6fiXkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705591042; x=1737127042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q2zdfSMwVBR0+EEmzvq+H6GgAoKGlY4NMNYUFCuSx8g=;
  b=VG6fiXkZlwdKQbnMnZicQyBRrA1EKwdCCDiVfPA+eBkONFLfvaTBGwKl
   D/kA98i8tpFj8t5bZB4dsmTzx4aRyY72gNFiUsEIXMurGjooZ7GsCwtX5
   9vSiJpVYJT5sJJt3WDEu4KZ03SQMfbUl0Nj7FFlqE+Z2vdLyN1oHJAhzt
   lTSf8u9ckFdUHJ1XdYjUf4MXS79+Y8u42SiOREPBUDl/WHFoxiMfUUMKW
   NxG1He9UvjFsu4IxYnN4fbqDo20X7WuVYULiGA8Vk6M/os2a1iZl1fcPg
   /Irmm3nP5iT5xGRzCj1I31rO9wnisBgnkaMDKGyf9Q3jPlsPimjOpTiUn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="466852608"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="466852608"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 07:17:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="784826997"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="784826997"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 18 Jan 2024 07:17:20 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQU8r-000358-1G;
	Thu, 18 Jan 2024 15:17:17 +0000
Date: Thu, 18 Jan 2024 23:16:18 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vishal:vv/dax_abi 4/5] include/linux/memory_hotplug.h:266:13:
 error: 'mhp_supports_memmap_on_memory' defined but not used
Message-ID: <202401182300.W4jJUzae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git vv/dax_abi
head:   d3de88ca301b687923a19a41d16a22afcd9c40a1
commit: 8c76ff6fca69d280f0a316831957accd9ded09b8 [4/5] mm/memory_hotplug: export mhp_supports_memmap_on_memory()
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240118/202401182300.W4jJUzae-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401182300.W4jJUzae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401182300.W4jJUzae-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/mmzone.h:1425,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/sh/kernel/asm-offsets.c:14:
>> include/linux/memory_hotplug.h:266:13: warning: 'mhp_supports_memmap_on_memory' defined but not used [-Wunused-function]
     266 | static bool mhp_supports_memmap_on_memory(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
   In file included from include/linux/mmzone.h:1425,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/clk-provider.h:9,
                    from lib/vsprintf.c:23:
   include/linux/memory_hotplug.h: At top level:
>> include/linux/memory_hotplug.h:266:13: warning: 'mhp_supports_memmap_on_memory' defined but not used [-Wunused-function]
     266 | static bool mhp_supports_memmap_on_memory(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mmzone.h:1425,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_bitops.c:9:
>> include/linux/memory_hotplug.h:266:13: error: 'mhp_supports_memmap_on_memory' defined but not used [-Werror=unused-function]
     266 | static bool mhp_supports_memmap_on_memory(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   lib/test_ubsan.c: In function 'test_ubsan_out_of_bounds':
   lib/test_ubsan.c:40:22: warning: variable 'arr' set but not used [-Wunused-but-set-variable]
      40 |         volatile int arr[4];
         |                      ^~~
   lib/test_ubsan.c:39:23: warning: variable 'above' set but not used [-Wunused-but-set-variable]
      39 |         volatile char above[4] = { }; /* Protect surrounding memory. */
         |                       ^~~~~
   lib/test_ubsan.c: In function 'test_ubsan_load_invalid_value':
   lib/test_ubsan.c:62:44: warning: variable 'eptr' set but not used [-Wunused-but-set-variable]
      62 |         enum ubsan_test_enum eval, eval2, *eptr;
         |                                            ^~~~
   lib/test_ubsan.c:61:26: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
      61 |         bool val, val2, *ptr;
         |                          ^~~
   lib/test_ubsan.c: At top level:
   lib/test_ubsan.c:100:28: warning: 'skip_ubsan_array' defined but not used [-Wunused-const-variable=]
     100 | static const test_ubsan_fp skip_ubsan_array[] = {
         |                            ^~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:1425,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_ubsan.c:4:
>> include/linux/memory_hotplug.h:266:13: warning: 'mhp_supports_memmap_on_memory' defined but not used [-Wunused-function]
     266 | static bool mhp_supports_memmap_on_memory(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   lib/test_blackhole_dev.c: In function 'test_blackholedev_init':
   lib/test_blackhole_dev.c:32:24: warning: variable 'ethh' set but not used [-Wunused-but-set-variable]
      32 |         struct ethhdr *ethh;
         |                        ^~~~
   In file included from include/linux/mmzone.h:1425,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_blackhole_dev.c:13:
   include/linux/memory_hotplug.h: At top level:
>> include/linux/memory_hotplug.h:266:13: warning: 'mhp_supports_memmap_on_memory' defined but not used [-Wunused-function]
     266 | static bool mhp_supports_memmap_on_memory(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/comedi/drivers/tests/ni_routes_test.c:22:
   drivers/comedi/drivers/tests/../ni_stc.h:1140:35: warning: 'range_ni_E_ao_ext' defined but not used [-Wunused-const-variable=]
    1140 | static const struct comedi_lrange range_ni_E_ao_ext;
         |                                   ^~~~~~~~~~~~~~~~~
   In file included from include/linux/mmzone.h:1425,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from drivers/comedi/drivers/tests/ni_routes_test.c:20:
>> include/linux/memory_hotplug.h:266:13: warning: 'mhp_supports_memmap_on_memory' defined but not used [-Wunused-function]
     266 | static bool mhp_supports_memmap_on_memory(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/mmzone.h:1425,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/sh/kernel/asm-offsets.c:14:
>> include/linux/memory_hotplug.h:266:13: warning: 'mhp_supports_memmap_on_memory' defined but not used [-Wunused-function]
     266 | static bool mhp_supports_memmap_on_memory(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]


vim +/mhp_supports_memmap_on_memory +266 include/linux/memory_hotplug.h

   265	
 > 266	static bool mhp_supports_memmap_on_memory(void)
   267	{
   268		return false;
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
