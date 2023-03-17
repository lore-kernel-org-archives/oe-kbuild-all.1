Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DF9626
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 02:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679021947; x=1710557947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZD0S82dYmiwAi0cefV4b0Z98GMD1Cnk8mYMjhQS7/Y=;
  b=K104RhEwkyQy2CKg5sVSMG7ncKBZKuzotvzO5/ftRomf5PjQaYQ/uyPA
   lsjdcr0nLJqNuiNF8oghodcsLEQG7d5q7lPl7zQszbr9HY51ES+0KOG6U
   mpyhN1uSbAacJtzEpvoKYLDCRkoTIEvj1/0+BR4u5l5ZC1CoP4GLTKGeg
   +pKDpBKFqKmqiJNj2eeLS43hdLU9g+eOYyF4xojqnYqKUvLs1b3vyY7qk
   1H7zluOnaYni6DIB1Q/Dej5yRJ64RLZrl/bx8NItaoWa7bX4ifaFbAOx2
   jWo5NNvta0jrT9e35D1Sj8IKV2HZQWOe3C+WSRrA8bg0lqQvBg1uE/WFM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="339707730"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="339707730"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 19:54:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="710359280"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="710359280"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Mar 2023 19:54:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd0F2-00090o-0d;
	Fri, 17 Mar 2023 02:54:52 +0000
Date: Fri, 17 Mar 2023 10:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:block-for-next 1/9] arch/x86/include/asm/bitops.h:252:9:
 warning: 'tmp' may be used uninitialized in this function
Message-ID: <202303171045.ExeVo14r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux block-for-next
head:   a084a3355b4ab79c64e557f93e56a0c5d7c952cb
commit: d354197f2169268c6fbb0aec6f06f2257a01099d [1/9] Enable -Wmaybe-uninitialized
config: x86_64-randconfig-a001-20230313 (https://download.01.org/0day-ci/archive/20230317/202303171045.ExeVo14r-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/bvanassche/linux/commit/d354197f2169268c6fbb0aec6f06f2257a01099d
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche block-for-next
        git checkout d354197f2169268c6fbb0aec6f06f2257a01099d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/acpi/ drivers/char/tpm/ drivers/clk/ drivers/dma-buf/ drivers/gpu/drm/ drivers/hwmon/ drivers/i3c/ drivers/iio/proximity/ drivers/iommu/iommufd/ fs/afs/ kernel/futex/ kernel/sched/ kernel/trace/ lib/ mm/ net/bridge/ net/mctp/ net/mptcp/ net/netfilter/ security/apparmor/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171045.ExeVo14r-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:68,
                    from lib/find_bit.c:15:
   lib/find_bit.c: In function '__find_nth_and_andnot_bit':
>> arch/x86/include/asm/bitops.h:252:9: warning: 'tmp' may be used uninitialized in this function [-Wmaybe-uninitialized]
     252 |         asm("rep; bsf %1,%0"
         |         ^~~
   lib/find_bit.c:73:56: note: 'tmp' was declared here
      73 |         unsigned long sz = (size), nr = (num), idx, w, tmp;                     \
         |                                                        ^~~
   lib/find_bit.c:163:16: note: in expansion of macro 'FIND_NTH_BIT'
     163 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx] & ~addr3[idx], size, n);
         |                ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:68,
                    from lib/find_bit.c:15:
   lib/find_bit.c: In function '__find_nth_bit':
>> arch/x86/include/asm/bitops.h:252:9: warning: 'tmp' may be used uninitialized in this function [-Wmaybe-uninitialized]
     252 |         asm("rep; bsf %1,%0"
         |         ^~~
   lib/find_bit.c:73:56: note: 'tmp' was declared here
      73 |         unsigned long sz = (size), nr = (num), idx, w, tmp;                     \
         |                                                        ^~~
   lib/find_bit.c:140:16: note: in expansion of macro 'FIND_NTH_BIT'
     140 |         return FIND_NTH_BIT(addr[idx], size, n);
         |                ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:68,
                    from lib/find_bit.c:15:
   lib/find_bit.c: In function '__find_nth_and_bit':
>> arch/x86/include/asm/bitops.h:252:9: warning: 'tmp' may be used uninitialized in this function [-Wmaybe-uninitialized]
     252 |         asm("rep; bsf %1,%0"
         |         ^~~
   lib/find_bit.c:73:56: note: 'tmp' was declared here
      73 |         unsigned long sz = (size), nr = (num), idx, w, tmp;                     \
         |                                                        ^~~
   lib/find_bit.c:147:16: note: in expansion of macro 'FIND_NTH_BIT'
     147 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, n);
         |                ^~~~~~~~~~~~
   In file included from include/linux/bitops.h:68,
                    from lib/find_bit.c:15:
   lib/find_bit.c: In function '__find_nth_andnot_bit':
>> arch/x86/include/asm/bitops.h:252:9: warning: 'tmp' may be used uninitialized in this function [-Wmaybe-uninitialized]
     252 |         asm("rep; bsf %1,%0"
         |         ^~~
   lib/find_bit.c:73:56: note: 'tmp' was declared here
      73 |         unsigned long sz = (size), nr = (num), idx, w, tmp;                     \
         |                                                        ^~~
   lib/find_bit.c:154:16: note: in expansion of macro 'FIND_NTH_BIT'
     154 |         return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size, n);
         |                ^~~~~~~~~~~~
--
   mm/gup.c: In function 'internal_get_user_pages_fast':
>> mm/gup.c:2937:20: warning: 'seq' may be used uninitialized in this function [-Wmaybe-uninitialized]
    2937 |                 if (read_seqcount_retry(&current->mm->write_protect_seq, seq)) {
         |                    ^
   mm/gup.c:2905:18: note: 'seq' was declared here
    2905 |         unsigned seq;
         |                  ^~~
--
   drivers/acpi/pci_root.c: In function 'acpi_pci_osc_control_set':
>> drivers/acpi/pci_root.c:391:50: warning: 'cxl_result' may be used uninitialized in this function [-Wmaybe-uninitialized]
     391 |                         cxl_missing = cxl_ctrl & ~(*cxl_mask);
         |                                                  ^~~~~~~~~~~~
--
   fs/afs/fsclient.c: In function 'afs_deliver_fs_get_capabilities':
>> fs/afs/fsclient.c:1674:50: warning: 'count' may be used uninitialized in this function [-Wmaybe-uninitialized]
    1674 |                 afs_extract_discard(call, (count - 1) * sizeof(__be32));
         |                                           ~~~~~~~^~~~
--
   drivers/clk/clkdev.c: In function 'vclkdev_alloc':
   drivers/clk/clkdev.c:173:17: warning: function 'vclkdev_alloc' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     173 |                 vscnprintf(cla->dev_id, sizeof(cla->dev_id), dev_fmt, ap);
         |                 ^~~~~~~~~~
   In file included from include/linux/module.h:12,
                    from drivers/clk/clkdev.c:9:
   drivers/clk/clkdev.c: In function 'devm_clk_hw_register_clkdev':
>> include/linux/list.h:137:9: warning: 'cl' may be used uninitialized in this function [-Wmaybe-uninitialized]
     137 |         __list_del(entry->prev, entry->next);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/clkdev.c:372:28: note: 'cl' was declared here
     372 |         struct clk_lookup *cl;
         |                            ^~
--
   drivers/dma-buf/dma-fence-unwrap.c: In function '__dma_fence_unwrap_merge':
>> drivers/dma-buf/dma-fence-unwrap.c:129:74: warning: 'sel' may be used uninitialized in this function [-Wmaybe-uninitialized]
     129 |                                 fences[sel] = dma_fence_unwrap_next(&iter[sel]);
         |                                                                          ^
--
   In file included from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:19,
                    from net/bridge/br_multicast.c:10:
   net/bridge/br_multicast.c: In function 'br_ip6_multicast_alloc_query.constprop':
>> include/linux/jiffies.h:107:22: warning: 'llqt' may be used uninitialized in this function [-Wmaybe-uninitialized]
     107 |          ((long)((b) - (a)) < 0))
         |                      ^
   net/bridge/br_multicast.c:1092:23: note: 'llqt' was declared here
    1092 |         unsigned long llqt;
         |                       ^~~~
   In file included from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/mm_types.h:19,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:19,
                    from net/bridge/br_multicast.c:10:
   net/bridge/br_multicast.c: In function 'br_ip4_multicast_alloc_query.constprop':
>> include/linux/jiffies.h:107:22: warning: 'lmqt' may be used uninitialized in this function [-Wmaybe-uninitialized]
     107 |          ((long)((b) - (a)) < 0))
         |                      ^
   net/bridge/br_multicast.c:943:23: note: 'lmqt' was declared here
     943 |         unsigned long lmqt;
         |                       ^~~~
--
   drivers/hwmon/adt7475.c: In function 'load_config':
>> drivers/hwmon/adt7475.c:1497:15: warning: 'prop2' may be used uninitialized in this function [-Wmaybe-uninitialized]
    1497 |         ret = of_property_read_string(client->dev.of_node, propname, &function);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adt7475.c:1525:29: note: 'prop2' was declared here
    1525 |         const char *prop1, *prop2;
         |                             ^~~~~
>> drivers/hwmon/adt7475.c:1471:15: warning: 'prop1' may be used uninitialized in this function [-Wmaybe-uninitialized]
    1471 |         ret = of_property_read_string(client->dev.of_node, propname, &function);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwmon/adt7475.c:1525:21: note: 'prop1' was declared here
    1525 |         const char *prop1, *prop2;
         |                     ^~~~~
--
   drivers/hwmon/pwm-fan.c: In function 'pwm_fan_probe':
>> drivers/hwmon/pwm-fan.c:594:35: warning: 'fan_channel_config' may be used uninitialized in this function [-Wmaybe-uninitialized]
     594 |                 fan_channel_config[i] = HWMON_F_INPUT;
         |                                   ^
--
   In file included from include/linux/if_arp.h:22,
                    from net/mctp/af_mctp.c:10:
   net/mctp/af_mctp.c: In function 'mctp_sendmsg':
>> include/linux/skbuff.h:2716:19: warning: 'hlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
    2716 |         skb->data += len;
         |                   ^~
   net/mctp/af_mctp.c:102:13: note: 'hlen' was declared here
     102 |         int hlen;
         |             ^~~~
--
   security/apparmor/policy_unpack.c: In function 'unpack_secmark':
>> security/apparmor/policy_unpack.c:597:31: warning: 'size' may be used uninitialized in this function [-Wmaybe-uninitialized]
     597 |                 for (i = 0; i < size; i++)
         |                             ~~^~~~~~
..


vim +/tmp +252 arch/x86/include/asm/bitops.h

8238b4579866b7 Mikulas Patocka 2022-08-26  249  
fdb6649ab7c142 Vincent Mailhol 2022-09-07  250  static __always_inline unsigned long variable__ffs(unsigned long word)
fdb6649ab7c142 Vincent Mailhol 2022-09-07  251  {
fdb6649ab7c142 Vincent Mailhol 2022-09-07 @252  	asm("rep; bsf %1,%0"
fdb6649ab7c142 Vincent Mailhol 2022-09-07  253  		: "=r" (word)
fdb6649ab7c142 Vincent Mailhol 2022-09-07  254  		: "rm" (word));
fdb6649ab7c142 Vincent Mailhol 2022-09-07  255  	return word;
fdb6649ab7c142 Vincent Mailhol 2022-09-07  256  }
fdb6649ab7c142 Vincent Mailhol 2022-09-07  257  

:::::: The code at line 252 was first introduced by commit
:::::: fdb6649ab7c142e497539a471e573c2593b9c923 x86/asm/bitops: Use __builtin_ctzl() to evaluate constant expressions

:::::: TO: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
