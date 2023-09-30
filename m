Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D51138C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696063213; x=1727599213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/QtJsh30WSYCW8GzDGEVQZYn8zUGpW6BRkFOCJUXgs=;
  b=gTjKOWPhYNvklL0FDGNpVrFKCIGweeC0+kGmcqqWhLCg57gPn0ts865M
   G4E45WF4WEklNBLETxhS8Ng51HMtv8rklruOWtwmJkz4Icn9h6TxsB+iK
   LJqQ/kkO2tSzCF+Ad7f9h9pwOy1U9AAD/xAT+JzndTLABAYdbdAnTV20k
   psOC0nDnhNdcjiH0zSFrWyhaJHJyDR7wzbSqExxc3VB0XDrCrSCnyedP+
   wj/3Dj/7mGyljH7OEX68Zky6llyHcxp7HKV5ZgRHUWw47lXcnMhK4gul/
   aOT0WrY5lGPgJawnVbQ2fbgpq7CG2Bv3oBY9/2pMtYWH1w6ZO3StFxBc+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="4004911"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="4004911"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 01:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865962826"
X-IronPort-AV: E=Sophos;i="6.03,189,1694761200"; 
   d="scan'208";a="865962826"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2023 01:40:10 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmVWC-0003vD-1B;
	Sat, 30 Sep 2023 08:40:08 +0000
Date: Sat, 30 Sep 2023 16:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-6.7-next 234/306]
 arch/x86/kernel/cpu/topology.c:145:27: warning: left shift of negative value
Message-ID: <202309301655.OhgUGGxH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-6.7-next
head:   a126cc9f2f87fe0931a7bf053665560587086082
commit: fc97c8fd71a5a32cb6938a2731c245e483f6fbb7 [234/306] [SUBMITTED 20230811] extrawarn: don't turn off -Wshift-negative-value for gcc-9
config: i386-randconfig-003-20230930 (https://download.01.org/0day-ci/archive/20230930/202309301655.OhgUGGxH-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230930/202309301655.OhgUGGxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301655.OhgUGGxH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/topology.c: In function 'detect_extended_topology':
>> arch/x86/kernel/cpu/topology.c:145:27: warning: left shift of negative value [-Wshift-negative-value]
     145 |  core_select_mask = (~(-1 << pkg_mask_width)) >> ht_mask_width;
         |                           ^~
   arch/x86/kernel/cpu/topology.c:146:26: warning: left shift of negative value [-Wshift-negative-value]
     146 |  die_select_mask = (~(-1 << die_plus_mask_width)) >>
         |                          ^~
--
   drivers/md/bcache/util.c: In function 'bch_hprint':
>> drivers/md/bcache/util.c:111:16: warning: left shift of negative value [-Wshift-negative-value]
     111 |   t = q & ~(~0 << 10);
         |                ^~
--
   In file included from drivers/md/bcache/bcache.h:193,
                    from drivers/md/bcache/btree.c:24:
   drivers/md/bcache/btree.c: In function 'btree_split':
>> drivers/md/bcache/bcache_ondisk.h:79:31: warning: left shift of negative value [-Wshift-negative-value]
      79 | #define MAX_KEY_INODE   (~(~0 << 20))
         |                               ^~
   drivers/md/bcache/bcache_ondisk.h:73:51: note: in definition of macro 'KEY'
      73 |  .high = (1ULL << 63) | ((__u64) (size) << 20) | (inode), \
         |                                                   ^~~~~
   drivers/md/bcache/bcache_ondisk.h:81:24: note: in expansion of macro 'MAX_KEY_INODE'
      81 | #define MAX_KEY    KEY(MAX_KEY_INODE, MAX_KEY_OFFSET, 0)
         |                        ^~~~~~~~~~~~~
   drivers/md/bcache/btree.c:2312:28: note: in expansion of macro 'MAX_KEY'
    2312 |   bkey_copy_key(&n3->key, &MAX_KEY);
         |                            ^~~~~~~
   drivers/md/bcache/btree.c: In function 'bch_refill_keybuf':
>> drivers/md/bcache/bcache_ondisk.h:79:31: warning: left shift of negative value [-Wshift-negative-value]
      79 | #define MAX_KEY_INODE   (~(~0 << 20))
         |                               ^~
   drivers/md/bcache/bcache_ondisk.h:73:51: note: in definition of macro 'KEY'
      73 |  .high = (1ULL << 63) | ((__u64) (size) << 20) | (inode), \
         |                                                   ^~~~~
   drivers/md/bcache/bcache_ondisk.h:81:24: note: in expansion of macro 'MAX_KEY_INODE'
      81 | #define MAX_KEY    KEY(MAX_KEY_INODE, MAX_KEY_OFFSET, 0)
         |                        ^~~~~~~~~~~~~
   drivers/md/bcache/btree.c:2705:16: note: in expansion of macro 'MAX_KEY'
    2705 |   buf->start = MAX_KEY;
         |                ^~~~~~~
>> drivers/md/bcache/bcache_ondisk.h:79:31: warning: left shift of negative value [-Wshift-negative-value]
      79 | #define MAX_KEY_INODE   (~(~0 << 20))
         |                               ^~
   drivers/md/bcache/bcache_ondisk.h:73:51: note: in definition of macro 'KEY'
      73 |  .high = (1ULL << 63) | ((__u64) (size) << 20) | (inode), \
         |                                                   ^~~~~
   drivers/md/bcache/bcache_ondisk.h:81:24: note: in expansion of macro 'MAX_KEY_INODE'
      81 | #define MAX_KEY    KEY(MAX_KEY_INODE, MAX_KEY_OFFSET, 0)
         |                        ^~~~~~~~~~~~~
   drivers/md/bcache/btree.c:2706:14: note: in expansion of macro 'MAX_KEY'
    2706 |   buf->end = MAX_KEY;
         |              ^~~~~~~
   drivers/md/bcache/btree.c: In function 'bch_keybuf_init':
>> drivers/md/bcache/bcache_ondisk.h:79:31: warning: left shift of negative value [-Wshift-negative-value]
      79 | #define MAX_KEY_INODE   (~(~0 << 20))
         |                               ^~
   drivers/md/bcache/bcache_ondisk.h:73:51: note: in definition of macro 'KEY'
      73 |  .high = (1ULL << 63) | ((__u64) (size) << 20) | (inode), \
         |                                                   ^~~~~
   drivers/md/bcache/bcache_ondisk.h:81:24: note: in expansion of macro 'MAX_KEY_INODE'
      81 | #define MAX_KEY    KEY(MAX_KEY_INODE, MAX_KEY_OFFSET, 0)
         |                        ^~~~~~~~~~~~~
   drivers/md/bcache/btree.c:2797:22: note: in expansion of macro 'MAX_KEY'
    2797 |  buf->last_scanned = MAX_KEY;
         |                      ^~~~~~~
--
   In file included from drivers/md/bcache/bcache.h:193,
                    from drivers/md/bcache/super.c:10:
   drivers/md/bcache/super.c: In function 'run_cache_set':
>> drivers/md/bcache/bcache_ondisk.h:79:31: warning: left shift of negative value [-Wshift-negative-value]
      79 | #define MAX_KEY_INODE   (~(~0 << 20))
         |                               ^~
   drivers/md/bcache/bcache_ondisk.h:73:51: note: in definition of macro 'KEY'
      73 |  .high = (1ULL << 63) | ((__u64) (size) << 20) | (inode), \
         |                                                   ^~~~~
   drivers/md/bcache/bcache_ondisk.h:81:24: note: in expansion of macro 'MAX_KEY_INODE'
      81 | #define MAX_KEY    KEY(MAX_KEY_INODE, MAX_KEY_OFFSET, 0)
         |                        ^~~~~~~~~~~~~
   drivers/md/bcache/super.c:2093:33: note: in expansion of macro 'MAX_KEY'
    2093 |   bkey_copy_key(&c->root->key, &MAX_KEY);
         |                                 ^~~~~~~
--
   In file included from drivers/md/bcache/bcache.h:193,
                    from drivers/md/bcache/debug.c:9:
   drivers/md/bcache/debug.c: In function 'bch_dump_read':
>> drivers/md/bcache/bcache_ondisk.h:79:31: warning: left shift of negative value [-Wshift-negative-value]
      79 | #define MAX_KEY_INODE   (~(~0 << 20))
         |                               ^~
   drivers/md/bcache/bcache_ondisk.h:73:51: note: in definition of macro 'KEY'
      73 |  .high = (1ULL << 63) | ((__u64) (size) << 20) | (inode), \
         |                                                   ^~~~~
   drivers/md/bcache/bcache_ondisk.h:81:24: note: in expansion of macro 'MAX_KEY_INODE'
      81 | #define MAX_KEY    KEY(MAX_KEY_INODE, MAX_KEY_OFFSET, 0)
         |                        ^~~~~~~~~~~~~
   drivers/md/bcache/debug.c:195:47: note: in expansion of macro 'MAX_KEY'
     195 |   w = bch_keybuf_next_rescan(i->c, &i->keys, &MAX_KEY, dump_pred);
         |                                               ^~~~~~~
--
   In file included from drivers/md/bcache/bcache.h:193,
                    from drivers/md/bcache/movinggc.c:8:
   drivers/md/bcache/movinggc.c: In function 'read_moving':
>> drivers/md/bcache/bcache_ondisk.h:79:31: warning: left shift of negative value [-Wshift-negative-value]
      79 | #define MAX_KEY_INODE   (~(~0 << 20))
         |                               ^~
   drivers/md/bcache/bcache_ondisk.h:73:51: note: in definition of macro 'KEY'
      73 |  .high = (1ULL << 63) | ((__u64) (size) << 20) | (inode), \
         |                                                   ^~~~~
   drivers/md/bcache/bcache_ondisk.h:81:24: note: in expansion of macro 'MAX_KEY_INODE'
      81 | #define MAX_KEY    KEY(MAX_KEY_INODE, MAX_KEY_OFFSET, 0)
         |                        ^~~~~~~~~~~~~
   drivers/md/bcache/movinggc.c:139:10: note: in expansion of macro 'MAX_KEY'
     139 |         &MAX_KEY, moving_pred);
         |          ^~~~~~~
--
   drivers/iio/adc/ti-ads1015.c: In function 'ads1015_write_event':
>> drivers/iio/adc/ti-ads1015.c:678:46: warning: left shift of negative value [-Wshift-negative-value]
     678 |   if (val >= 1 << (realbits - 1) || val < -1 << (realbits - 1)) {
         |                                              ^~
   In file included from include/linux/kernel.h:27,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/nospec-branch.h:14,
                    from arch/x86/include/asm/paravirt_types.h:20,
                    from arch/x86/include/asm/ptrace.h:97,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/iio/adc/ti-ads1015.c:14:
   drivers/iio/adc/ti-ads1015.c: In function 'ads1015_enable_event_config':
   drivers/iio/adc/ti-ads1015.c:752:23: warning: left shift of negative value [-Wshift-negative-value]
     752 |   low_thresh = max(-1 << (chan->scan_type.realbits - 1),
         |                       ^~
   include/linux/minmax.h:31:27: note: in definition of macro '__cmp'
      31 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:77:19: note: in expansion of macro '__careful_cmp'
      77 | #define max(x, y) __careful_cmp(x, y, >)
         |                   ^~~~~~~~~~~~~
   drivers/iio/adc/ti-ads1015.c:752:16: note: in expansion of macro 'max'
     752 |   low_thresh = max(-1 << (chan->scan_type.realbits - 1),
         |                ^~~
   drivers/iio/adc/ti-ads1015.c:752:23: warning: left shift of negative value [-Wshift-negative-value]
     752 |   low_thresh = max(-1 << (chan->scan_type.realbits - 1),
         |                       ^~
   include/linux/minmax.h:31:40: note: in definition of macro '__cmp'
      31 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                        ^
   include/linux/minmax.h:77:19: note: in expansion of macro '__careful_cmp'
      77 | #define max(x, y) __careful_cmp(x, y, >)
         |                   ^~~~~~~~~~~~~
   drivers/iio/adc/ti-ads1015.c:752:16: note: in expansion of macro 'max'
     752 |   low_thresh = max(-1 << (chan->scan_type.realbits - 1),
         |                ^~~
   drivers/iio/adc/ti-ads1015.c:752:23: warning: left shift of negative value [-Wshift-negative-value]
     752 |   low_thresh = max(-1 << (chan->scan_type.realbits - 1),
         |                       ^~
   include/linux/minmax.h:34:25: note: in definition of macro '__cmp_once'
      34 |   typeof(x) unique_x = (x);  \
         |                         ^
   include/linux/minmax.h:77:19: note: in expansion of macro '__careful_cmp'
      77 | #define max(x, y) __careful_cmp(x, y, >)
         |                   ^~~~~~~~~~~~~
   drivers/iio/adc/ti-ads1015.c:752:16: note: in expansion of macro 'max'
     752 |   low_thresh = max(-1 << (chan->scan_type.realbits - 1),
         |                ^~~
   drivers/iio/adc/ti-ads1015.c: In function 'ads1015_probe':
   drivers/iio/adc/ti-ads1015.c:1014:40: warning: left shift of negative value [-Wshift-negative-value]
    1014 |   data->thresh_data[i].low_thresh = -1 << (realbits - 1);
         |                                        ^~
--
   In file included from drivers/comedi/drivers/ni_atmio.c:207:
   drivers/comedi/drivers/ni_mio_common.c: In function 'set_ith_rtsi_brd_reg':
>> drivers/comedi/drivers/ni_mio_common.c:5386:22: warning: left shift of negative value [-Wshift-negative-value]
    5386 |  reg_i_mask = ~((~0) << reg_i_sz);
         |                      ^~
   drivers/comedi/drivers/ni_mio_common.c: In function 'get_ith_rtsi_brd_reg':
   drivers/comedi/drivers/ni_mio_common.c:5406:22: warning: left shift of negative value [-Wshift-negative-value]
    5406 |  reg_i_mask = ~((~0) << reg_i_sz);
         |                      ^~
   At top level:
   drivers/comedi/drivers/ni_atmio.c:209:35: warning: 'device_ids' defined but not used [-Wunused-const-variable=]
     209 | static const struct pnp_device_id device_ids[] = {
         |                                   ^~~~~~~~~~
--
   drivers/mtd/nand/raw/mxic_nand.c: In function 'mxic_nfc_exec_op':
>> drivers/mtd/nand/raw/mxic_nand.c:73:37: warning: left shift of negative value [-Wshift-negative-value]
      73 | #define OP_CMD_BYTES(x)  (((x) - 1) << 13)
         |                                     ^~
   drivers/mtd/nand/raw/mxic_nand.c:409:11: note: in expansion of macro 'OP_CMD_BYTES'
     409 |           OP_CMD_BYTES(0), nfc->regs + SS_CTRL(0));
         |           ^~~~~~~~~~~~


vim +145 arch/x86/kernel/cpu/topology.c

95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   86  
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   87  /*
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13   88   * Check for extended topology enumeration cpuid leaf, and if it
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   89   * exists, use it for populating initial_apicid and cpu topology
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   90   * detection.
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   91   */
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   92  int detect_extended_topology(struct cpuinfo_x86 *c)
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   93  {
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   94  #ifdef CONFIG_SMP
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   95  	unsigned int eax, ebx, ecx, edx, sub_index;
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13   96  	unsigned int ht_mask_width, core_plus_mask_width, die_plus_mask_width;
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06   97  	unsigned int core_select_mask, core_level_siblings;
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13   98  	unsigned int die_select_mask, die_level_siblings;
2b12a7a126d62b arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14   99  	unsigned int pkg_mask_width;
cb09a379724d29 arch/x86/kernel/cpu/topology.c             Yazen Ghannam   2020-11-09  100  	bool die_level_present = false;
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  101  	int leaf;
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06  102  
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  103  	leaf = detect_extended_topology_leaf(c);
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  104  	if (leaf < 0)
95f3d39ccf7aae arch/x86/kernel/cpu/topology.c             Thomas Gleixner 2018-06-06  105  		return -1;
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  106  
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  107  	/*
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  108  	 * Populate HT related information from sub-leaf level 0.
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  109  	 */
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  110  	cpuid_count(leaf, SMT_LEVEL, &eax, &ebx, &ecx, &edx);
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  111  	c->initial_apicid = edx;
edc0a2b5957652 arch/x86/kernel/cpu/topology.c             Zhang Rui       2023-03-23  112  	core_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
edc0a2b5957652 arch/x86/kernel/cpu/topology.c             Zhang Rui       2023-03-23  113  	smp_num_siblings = max_t(int, smp_num_siblings, LEVEL_MAX_SIBLINGS(ebx));
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  114  	core_plus_mask_width = ht_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  115  	die_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
2b12a7a126d62b arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14  116  	pkg_mask_width = die_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  117  
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  118  	sub_index = 1;
2b12a7a126d62b arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14  119  	while (true) {
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  120  		cpuid_count(leaf, sub_index, &eax, &ebx, &ecx, &edx);
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  121  
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  122  		/*
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  123  		 * Check for the Core type in the implemented sub leaves.
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  124  		 */
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  125  		if (LEAFB_SUBTYPE(ecx) == CORE_TYPE) {
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  126  			core_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  127  			core_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  128  			die_level_siblings = core_level_siblings;
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  129  			die_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  130  		}
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  131  		if (LEAFB_SUBTYPE(ecx) == DIE_TYPE) {
cb09a379724d29 arch/x86/kernel/cpu/topology.c             Yazen Ghannam   2020-11-09  132  			die_level_present = true;
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  133  			die_level_siblings = LEVEL_MAX_SIBLINGS(ebx);
7745f03eb39587 arch/x86/kernel/cpu/topology.c             Len Brown       2019-05-13  134  			die_plus_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  135  		}
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  136  
2b12a7a126d62b arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14  137  		if (LEAFB_SUBTYPE(ecx) != INVALID_TYPE)
2b12a7a126d62b arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14  138  			pkg_mask_width = BITS_SHIFT_NEXT_LEVEL(eax);
2b12a7a126d62b arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14  139  		else
2b12a7a126d62b arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14  140  			break;
2b12a7a126d62b arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14  141  
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  142  		sub_index++;
2b12a7a126d62b arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14  143  	}
bbb65d2d365efe arch/x86/kernel/cpu/addon_cpuid_features.c Suresh Siddha   2008-08-23  144  
71eac7063698b7 arch/x86/kernel/cpu/topology.c             Zhang Rui       2022-10-14 @145  	core_select_mask = (~(-1 << pkg_mask_width)) >> ht_mask_width;

:::::: The code at line 145 was first introduced by commit
:::::: 71eac7063698b7d7b8fafb1683ac24a034541141 x86/topology: Fix duplicated core ID within a package

:::::: TO: Zhang Rui <rui.zhang@intel.com>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
