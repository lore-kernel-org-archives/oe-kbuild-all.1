Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792003FE37A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501469; cv=none; b=m8WkZMYeQM+yj8YV22qbK7BbLrZTdhjj2A2uLBfcId+mQGJi0miA3Fgkf1XG1fWQHtku3F+ebR0O5AeBgF9l/tzPMLn9RKaI/JVwkZEpCxoAhu8uwyAClCi6c+w6eg70G4KqL5RM8XlWz0ALP8MKFrdpfy1Xm69ss/BeIftBfFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501469; c=relaxed/simple;
	bh=MnvECqvAkFwt/JicwNZ8r+n3wekC/bucfhsHGceqCXo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KsQTai1XP3eToZS97E9DdmQz4+csHGGzMiiY+pnQ7qqnwkmj2GjceIrp70zdmRDSCmEoqqihFgOvPbV5gK6wi0z1QJ+7RwF0xY6catZru8PfBRshdadpkYZ5XRWeyycD0MeJ94rGeS7r6/Sx2Ikl0TlnGeE3f0lfCjn7sEd1Tz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5yOIHCz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5yOIHCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783501467; x=1815037467;
  h=date:from:to:cc:subject:message-id;
  bh=MnvECqvAkFwt/JicwNZ8r+n3wekC/bucfhsHGceqCXo=;
  b=d5yOIHCzk6wtzfh6DGl+ex+4XkVzfzNdXOJxwGgi9bKg6fvHwmNtn1VT
   PWJ+fpKTbP9mVDipvfyDkM0Hov2by10H5CIKF6Q+iTF/otVnKHeKGOTTh
   UOiDp0j8ioY5icgQg7B4XHjHFa1DEjh1JnIoR7SpcN1Q/xmJq2S+240KF
   fPZiOFt/rDdMyL/rBRgD922M93FtML2M7UceHCSog9rxYdyMSSqcUdE42
   /Qa3qXet7crQaqgiWfsFIaScsV06Bc/32gbePyb93tmbgzmbKBinkS0V8
   bQBaH8Qtbk30E+G9c84NxA9MUj/HACi2F8nJwp2m00L1s15i/n7MQBEvS
   A==;
X-CSE-ConnectionGUID: xNGjLF8gTjyjwbYdHCnfZA==
X-CSE-MsgGUID: z8uxuWPHS6O7eXUPLZMmSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84277607"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84277607"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 02:04:25 -0700
X-CSE-ConnectionGUID: Iug1oSWxTlKHeU+kEHydrw==
X-CSE-MsgGUID: kGrAMDtYTdO2nhUS5pYWGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253742211"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 08 Jul 2026 02:04:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whOCa-00000000GBn-3OWj;
	Wed, 08 Jul 2026 09:04:20 +0000
Date: Wed, 08 Jul 2026 17:03:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2025-10 4/4]
 drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: warning: braces around
 scalar initializer
Message-ID: <202607081715.wrW3ZWYt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15-2025-10
head:   4c0914b864b51decdd7928c67acb2d938279911e
commit: d2dca14b9f2c3e17c56ed5380f1c7cbf16c4870e [4/4] BACKPORT: bpf: Allow fall back to interpreter for programs with stack size <= 512
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607081715.wrW3ZWYt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081715.wrW3ZWYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081715.wrW3ZWYt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/net/inet_sock.h:22,
                    from include/linux/udp.h:16,
                    from drivers/net/ethernet/qlogic/qede/qede_main.c:23:
   include/net/sock.h: In function '__dst_negative_advice':
   include/net/sock.h:2125:35: warning: cast between incompatible function types from 'struct dst_entry * (*)(struct dst_entry *)' to 'void (*)(struct sock *, struct dst_entry *)' [-Wcast-function-type]
    2125 |                 negative_advice = (android_dst_ops_negative_advice_new_t)dst->ops->negative_advice;
         |                                   ^
   drivers/net/ethernet/qlogic/qede/qede_main.c: At top level:
>> drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: warning: braces around scalar initializer
     197 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:199:17: error: field name not in record or union initializer
     199 |                 .arfs_filter_op = qede_arfs_filter_op,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:199:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:199:35: error: initialization of 'void (*)(void *, u8 *, bool)' {aka 'void (*)(void *, unsigned char *, _Bool)'} from incompatible pointer type 'void (*)(void *, void *, u8)' {aka 'void (*)(void *, void *, unsigned char)'} [-Werror=incompatible-pointer-types]
     199 |                 .arfs_filter_op = qede_arfs_filter_op,
         |                                   ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:199:35: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:201:17: error: field name not in record or union initializer
     201 |                 .link_update = qede_link_update,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:201:17: note: (near initialization for 'qede_ll_ops.force_mac')
>> drivers/net/ethernet/qlogic/qede/qede_main.c:201:32: warning: excess elements in scalar initializer
     201 |                 .link_update = qede_link_update,
         |                                ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:201:32: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:17: error: field name not in record or union initializer
     202 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:46: warning: excess elements in scalar initializer
     202 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:202:46: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:203:17: error: field name not in record or union initializer
     203 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:203:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:203:44: warning: excess elements in scalar initializer
     203 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:203:44: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:17: error: field name not in record or union initializer
     204 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:41: warning: excess elements in scalar initializer
     204 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:204:41: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:205:17: error: field name not in record or union initializer
     205 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:205:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:205:42: warning: excess elements in scalar initializer
     205 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:205:42: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     197 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: note: (near initialization for 'qede_ll_ops')
   drivers/net/ethernet/qlogic/qede/qede_main.c:207:22: warning: initialized field overwritten [-Woverride-init]
     207 |         .force_mac = qede_force_mac,
         |                      ^~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:207:22: note: (near initialization for 'qede_ll_ops.force_mac')
   cc1: some warnings being treated as errors


vim +197 drivers/net/ethernet/qlogic/qede/qede_main.c

e712d52b9f2a8ec Yuval Mintz             2015-10-26  195  
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  196  static struct qed_eth_cb_ops qede_ll_ops = {
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26 @197  	{
e4917d46a6537c5 Chopra, Manish          2017-04-13  198  #ifdef CONFIG_RFS_ACCEL
e4917d46a6537c5 Chopra, Manish          2017-04-13  199  		.arfs_filter_op = qede_arfs_filter_op,
e4917d46a6537c5 Chopra, Manish          2017-04-13  200  #endif
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26 @201  		.link_update = qede_link_update,
ccc67ef50b9085b Tomer Tayar             2019-01-28  202  		.schedule_recovery_handler = qede_schedule_recovery_handler,
a8736ea83b80526 Igor Russkikh           2020-05-14  203  		.schedule_hw_err_handler = qede_schedule_hw_err_handler,
d25b859ccd614d2 Sudarsana Reddy Kalluru 2018-05-22  204  		.get_generic_tlv_data = qede_get_generic_tlv_data,
d25b859ccd614d2 Sudarsana Reddy Kalluru 2018-05-22  205  		.get_protocol_tlv_data = qede_get_eth_tlv_data,
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  206  	},
eff169608c25019 Yuval Mintz             2016-05-11  207  	.force_mac = qede_force_mac,
97379f15c21e7ae Chopra, Manish          2017-04-24  208  	.ports_update = qede_udp_ports_update,
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  209  };
a2ec6172d29cf3a Sudarsana Kalluru       2015-10-26  210  

:::::: The code at line 197 was first introduced by commit
:::::: a2ec6172d29cf3aed92e9db40e83e36329db1dd5 qede: Add support for link

:::::: TO: Sudarsana Kalluru <Sudarsana.Kalluru@qlogic.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
