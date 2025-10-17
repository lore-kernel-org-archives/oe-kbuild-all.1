Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AD9306B2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 17:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760723340; cv=none; b=HJPa+NdzQUlvg70IHPm6loyohdZx8T0spgQQrkQSOhn/I/hzR970DEABBOsm0nRrlb3Nh6Z1fHqjD75VHS0+/7pb4gKtWG2Lt4gsqhJIod+J1tKwYB8mHMlzqYSICD0e1rWrgMHmoAp4QVu4D6pKdx8s3qQYTHQZSm1bHURdgnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760723340; c=relaxed/simple;
	bh=VSBaJAEjb+QhA14JtrkfCJ9jZ2zKpCDqekh3R9KtV2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMQDL+rgrvg9XW/wEHxCwjeKYQwh4sCUcOlD9RhSmuVV17CahDbNdTsL6NNu7WkLWvlQX0vV7aPeFSVxhd8PD/0WPs92zumZ4AimtbPowHXGGLLuSc8WIRajA6GTqpVZK0TfQ/fFkEUIs5fEn+ZbzqVG3WArzG36HNFIP/XbEjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzOCY548; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzOCY548"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760723338; x=1792259338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VSBaJAEjb+QhA14JtrkfCJ9jZ2zKpCDqekh3R9KtV2s=;
  b=nzOCY548jyprw4nGENiIux/pRzhKs4QgPczv9DHD4qqwMgoG4hjOMquz
   gK9lBFuvKZrl755wKbzk8Qb2bZNI3O4YbWnx50i0AREPvBNDazLdO2H7a
   lDnGtriHdf1LdQ5I9rHDvJJ9HaJ6Irggtqf4e2lA0H4tyrD75zX8Es16h
   Xpce2JFhB1exQ3tY0JaHUlcfVu7nACH8B5dUAthQo5L4cUnvmd/DKktVz
   StdbTn0hVba3QHoqIWrUCb+n1mPRNU2iBAGn30lgw+2A+sUg7r7HF8oF7
   6cJNlD46KJ8qzk5sbWSSTPTo6pGrL6PhNaVIiWSO4Kd03jptOSiNu+XJt
   Q==;
X-CSE-ConnectionGUID: CqKbP2D1QCyDFh5JeDn3uQ==
X-CSE-MsgGUID: XSFpjxHaRY+74WCTM0bn6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74056158"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="74056158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 10:48:57 -0700
X-CSE-ConnectionGUID: nx03lFQ4Rni62dFpUAYshA==
X-CSE-MsgGUID: bF1EmUgSTkCoB8cb2CJJUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; 
   d="scan'208";a="213764560"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2025 10:48:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9oZ0-0007cV-0C;
	Fri, 17 Oct 2025 17:48:32 +0000
Date: Sat, 18 Oct 2025 01:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 drivers/net/ethernet/qlogic/qede/qede_main.c:199:35: error: initialization
 of 'void (*)(void *, u16,  u16)' {aka 'void (*)(void *, short unsigned int,
  short unsigned int)'} from incompatible pointer type 'void (*)(void *, void
 *, u8)' {aka 'void (*)(void...
Message-ID: <202510180133.vcDKJ78Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   34ff804b81297bab2f9bcd59e33e6c61925ca2d1
commit: 34ff804b81297bab2f9bcd59e33e6c61925ca2d1 [1/1] UPSTREAM: crypto: af_alg - Disallow concurrent writes in af_alg_sendmsg
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251018/202510180133.vcDKJ78Y-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180133.vcDKJ78Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180133.vcDKJ78Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/inet_sock.h:22,
                    from include/linux/udp.h:16,
                    from drivers/net/ethernet/qlogic/qede/qede_main.c:23:
   include/net/sock.h: In function '__dst_negative_advice':
   include/net/sock.h:2120:35: warning: cast between incompatible function types from 'struct dst_entry * (*)(struct dst_entry *)' to 'void (*)(struct sock *, struct dst_entry *)' [-Wcast-function-type]
    2120 |                 negative_advice = (android_dst_ops_negative_advice_new_t)dst->ops->negative_advice;
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
