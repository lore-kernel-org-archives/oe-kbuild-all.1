Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0953E375F8A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 19:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985682; cv=none; b=YkHaO0A4EKUB4SLJ44lrBMSdcTzn0hwPLacGVg7HrFYPmBir2a42riml2bEXi5uAesghWsbrU2lbZKdRDa/ouEDh8UJTDN2QOeIOGyBh0ATKhal65uZlLgSECWrT/0++QuNlAgDoMS9UUeeKitkk9KgKY3hgFyIyHyED0viUQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985682; c=relaxed/simple;
	bh=YweVtBJc9MxrecFfcTEmbDKtixUNDj3YOeCifQnSpNs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FCbhlZN35vabosi6RQLYjmidIWM78tczHJObh+qmN5S+7RV5U+yMk5mEl+QJD8sn5O0/Iu1eYDOYGlS0EvknHAgBuAQulurEl99/EkK8GoNX6UL0VOOMWJOGjO+G1jyjolOkYCi5G5Xz16KRRrPM2ctq3aSlDw0LXrnXJbutEIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmLavzoF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmLavzoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774985681; x=1806521681;
  h=date:from:to:cc:subject:message-id;
  bh=YweVtBJc9MxrecFfcTEmbDKtixUNDj3YOeCifQnSpNs=;
  b=OmLavzoFEcbKpDVPAO9tPGReIMY4ho+YohcQkkG5avZLsuabdQGAdRgO
   vOZzaOSI47PWgIYWsBAG5Bl3CArnHiFJ3SmmYrVwSykUMu3+uI3IGvTRP
   ZAsnMqKVnXQnZOhr0W7SaqTirZNNvUMUY5+uc7xxo4CdVHycmf5QX56N0
   BvTwG/Jf284AuZQCwvbtWUYFf9VJDUxz8F4AHJgHlZpfqbkQUgMzDZq/f
   J5aUoESebdn87Me1KK8xdhVOYAaW7Hek0YmMj+I08cxTGuGhd+xKCKnpC
   2ISh/BBECQ4m6kEUKWwzrEsk1kbMryigNItvRAf5dYkBw6rzxoO/Wyrlh
   Q==;
X-CSE-ConnectionGUID: /LvrlwwcQ/O8LB7rNOwFtQ==
X-CSE-MsgGUID: LPWerZ8XQNC/DLI5FYbS0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="98621397"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="98621397"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 12:34:41 -0700
X-CSE-ConnectionGUID: 6h7kutD5QLuyxzYfzYj9RQ==
X-CSE-MsgGUID: siU91RXSSQamGDPnn2gpvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="223580282"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Mar 2026 12:34:39 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7erE-000000004C5-3MhG;
	Tue, 31 Mar 2026 19:34:36 +0000
Date: Wed, 01 Apr 2026 03:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2025-10 1/1]
 drivers/net/ethernet/qlogic/qede/qede_main.c:199:35: error: initialization of
 'void (*)(void *, u16,  u16)' {aka 'void (*)(void *, short unsigned int, 
 short unsigned int)'} from incompatible pointer type 'void (*)(void *, void
 *, u8)' {aka 'void (*)(void...
Message-ID: <202604010311.zM0nzdrO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15-2025-10
head:   54ced75907e9359b3d5ff3ded077a04aadc98663
commit: 54ced75907e9359b3d5ff3ded077a04aadc98663 [1/1] FROMGIT: HID: logitech-hidpp: Prevent use-after-free on force feedback initialisation failure
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20260401/202604010311.zM0nzdrO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010311.zM0nzdrO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010311.zM0nzdrO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/inet_sock.h:22,
                    from include/linux/udp.h:16,
                    from drivers/net/ethernet/qlogic/qede/qede_main.c:23:
   include/net/sock.h: In function '__dst_negative_advice':
   include/net/sock.h:2125:35: warning: cast between incompatible function types from 'struct dst_entry * (*)(struct dst_entry *)' to 'void (*)(struct sock *, struct dst_entry *)' [-Wcast-function-type]
    2125 |                 negative_advice = (android_dst_ops_negative_advice_new_t)dst->ops->negative_advice;
         |                                   ^
   drivers/net/ethernet/qlogic/qede/qede_main.c: At top level:
   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: warning: braces around scalar initializer
     197 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:199:17: error: field name not in record or union initializer
     199 |                 .arfs_filter_op = qede_arfs_filter_op,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:199:17: note: (near initialization for 'qede_ll_ops.ports_update')
>> drivers/net/ethernet/qlogic/qede/qede_main.c:199:35: error: initialization of 'void (*)(void *, u16,  u16)' {aka 'void (*)(void *, short unsigned int,  short unsigned int)'} from incompatible pointer type 'void (*)(void *, void *, u8)' {aka 'void (*)(void *, void *, unsigned char)'} [-Werror=incompatible-pointer-types]
     199 |                 .arfs_filter_op = qede_arfs_filter_op,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:199:35: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:201:17: error: field name not in record or union initializer
     201 |                 .link_update = qede_link_update,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:201:17: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:201:32: warning: excess elements in scalar initializer
     201 |                 .link_update = qede_link_update,
         |                                ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:201:32: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:17: error: field name not in record or union initializer
     202 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:17: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:46: warning: excess elements in scalar initializer
     202 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:46: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:203:17: error: field name not in record or union initializer
     203 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:203:17: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:203:44: warning: excess elements in scalar initializer
     203 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:203:44: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:17: error: field name not in record or union initializer
     204 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:17: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:41: warning: excess elements in scalar initializer
     204 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:41: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:205:17: error: field name not in record or union initializer
     205 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:205:17: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:205:42: warning: excess elements in scalar initializer
     205 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:205:42: note: (near initialization for 'qede_ll_ops.ports_update')
   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     197 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: note: (near initialization for 'qede_ll_ops')
   drivers/net/ethernet/qlogic/qede/qede_main.c:208:25: warning: initialized field overwritten [-Woverride-init]
     208 |         .ports_update = qede_udp_ports_update,
         |                         ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:208:25: note: (near initialization for 'qede_ll_ops.ports_update')
   cc1: some warnings being treated as errors


vim +199 drivers/net/ethernet/qlogic/qede/qede_main.c

e712d52b9f2a8e Yuval Mintz             2015-10-26  195  
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  196  static struct qed_eth_cb_ops qede_ll_ops = {
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  197  	{
e4917d46a6537c Chopra, Manish          2017-04-13  198  #ifdef CONFIG_RFS_ACCEL
e4917d46a6537c Chopra, Manish          2017-04-13 @199  		.arfs_filter_op = qede_arfs_filter_op,
e4917d46a6537c Chopra, Manish          2017-04-13  200  #endif
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  201  		.link_update = qede_link_update,
ccc67ef50b9085 Tomer Tayar             2019-01-28  202  		.schedule_recovery_handler = qede_schedule_recovery_handler,
a8736ea83b8052 Igor Russkikh           2020-05-14  203  		.schedule_hw_err_handler = qede_schedule_hw_err_handler,
d25b859ccd614d Sudarsana Reddy Kalluru 2018-05-22  204  		.get_generic_tlv_data = qede_get_generic_tlv_data,
d25b859ccd614d Sudarsana Reddy Kalluru 2018-05-22  205  		.get_protocol_tlv_data = qede_get_eth_tlv_data,
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  206  	},
eff169608c2501 Yuval Mintz             2016-05-11  207  	.force_mac = qede_force_mac,
97379f15c21e7a Chopra, Manish          2017-04-24  208  	.ports_update = qede_udp_ports_update,
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  209  };
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  210  

:::::: The code at line 199 was first introduced by commit
:::::: e4917d46a6537c5bf05acc2e42df3b67d87775e4 qede: Add aRFS support

:::::: TO: Chopra, Manish <Manish.Chopra@cavium.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
