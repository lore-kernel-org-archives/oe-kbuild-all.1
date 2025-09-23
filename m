Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D401231987A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758616812; cv=none; b=okUV+luW/ss08ojT1eBvUxGgnME0AizX+YD2Yyc4Ji/YyzpN6mw0Y0SVCX8c6zHNB565mL3LRRonzHKDvSA6OGi/rDoBR8zp7xTF7xY0jPy+HZDXv02oL+eIeQSbtV150vHd20OBpZJAeudtEjPe8+5g41BJaNgzzVBAxvoC7qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758616812; c=relaxed/simple;
	bh=GcQkSutu7Un14sHe5cnY3+H36dTybY20Akf2SL53B0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/D6QQbWqxn4Mgq7Ck98LSadoxVQlXa9MRB1zPbz1bHZN3+4gAYoB9RdS4x8UBdBaLNf5xbo6PXytc3DbURf/s5tY40Sq4jMb7AG5jspdjtyRrFFOSMwIT0hzkJd3MbksqAyhCzNT4Vm4lOfXaOTUDNoUIQPL/sJNZt9W94nxVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inlb2Y4V; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inlb2Y4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758616810; x=1790152810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GcQkSutu7Un14sHe5cnY3+H36dTybY20Akf2SL53B0U=;
  b=inlb2Y4VNsj/sNxc3aIyeITRLToc2guCjmqy5XCC7kVWHOqp84MSklvs
   oc+0Frd8U3DU4PIWhMJ4CC58Tuo5QFpn6foFUIgDu7ZSTIdlfRy+jpqUv
   7ylh6CqZfcFzFrcau6r2JjYzvqp2aYhIBUkcXTBsCoSHPXsIRb/7un7P1
   tlARb6fMHveF5d2P7fQamGrypAsaKvJ3cpLXRCu5u3JTn4ZaDIz24cC61
   OfjLO7qWmp8s+kgjS0lABzptA0WplBt6TmN+yk+5kyzE7N+Ku27mrbpfR
   hujrU03DkLP/8gNtfNojkwUTCzqSIlWJOlORwFAA0xVHXgyy/hqKrfD6j
   g==;
X-CSE-ConnectionGUID: iCXuOsqYSVazbcafeFc0cw==
X-CSE-MsgGUID: At8kk6bqQMOiYvB9F93WGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72250023"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="72250023"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:40:09 -0700
X-CSE-ConnectionGUID: k0jmGNpZSeyu/yG5Hqs46g==
X-CSE-MsgGUID: o3DoR6MeQ72ZpNGdiobLRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="181007191"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 23 Sep 2025 01:40:08 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0yZB-0002vL-2v;
	Tue, 23 Sep 2025 08:40:05 +0000
Date: Tue, 23 Sep 2025 16:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: error: positional
 initialization of field in 'struct' declared with 'designated_init'
 attribute
Message-ID: <202509231636.Gj6dGi2b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   89928190f5b0cb4eb2eede797030f8e9e17c3c4f
commit: db44404d1b9bf39dac01e0dc252e02d4d5adce9d [1/1] randstruct: gcc-plugin: Remove bogus void member
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250923/202509231636.Gj6dGi2b-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231636.Gj6dGi2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231636.Gj6dGi2b-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: warning: braces around scalar initializer
     197 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: note: (near initialization for 'qede_ll_ops.force_mac')
>> drivers/net/ethernet/qlogic/qede/qede_main.c:199:17: error: field name not in record or union initializer
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
   drivers/net/ethernet/qlogic/qede/qede_main.c:201:32: warning: excess elements in scalar initializer
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
>> drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     197 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:197:9: note: (near initialization for 'qede_ll_ops')
   drivers/net/ethernet/qlogic/qede/qede_main.c:207:22: warning: initialized field overwritten [-Woverride-init]
     207 |         .force_mac = qede_force_mac,
         |                      ^~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:207:22: note: (near initialization for 'qede_ll_ops.force_mac')
   cc1: some warnings being treated as errors


vim +197 drivers/net/ethernet/qlogic/qede/qede_main.c

e712d52b9f2a8e Yuval Mintz             2015-10-26  195  
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  196  static struct qed_eth_cb_ops qede_ll_ops = {
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26 @197  	{
e4917d46a6537c Chopra, Manish          2017-04-13  198  #ifdef CONFIG_RFS_ACCEL
e4917d46a6537c Chopra, Manish          2017-04-13 @199  		.arfs_filter_op = qede_arfs_filter_op,
e4917d46a6537c Chopra, Manish          2017-04-13  200  #endif
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  201  		.link_update = qede_link_update,
ccc67ef50b9085 Tomer Tayar             2019-01-28  202  		.schedule_recovery_handler = qede_schedule_recovery_handler,
a8736ea83b8052 Igor Russkikh           2020-05-14  203  		.schedule_hw_err_handler = qede_schedule_hw_err_handler,
d25b859ccd614d Sudarsana Reddy Kalluru 2018-05-22 @204  		.get_generic_tlv_data = qede_get_generic_tlv_data,
d25b859ccd614d Sudarsana Reddy Kalluru 2018-05-22  205  		.get_protocol_tlv_data = qede_get_eth_tlv_data,
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  206  	},
eff169608c2501 Yuval Mintz             2016-05-11  207  	.force_mac = qede_force_mac,
97379f15c21e7a Chopra, Manish          2017-04-24  208  	.ports_update = qede_udp_ports_update,
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  209  };
a2ec6172d29cf3 Sudarsana Kalluru       2015-10-26  210  

:::::: The code at line 197 was first introduced by commit
:::::: a2ec6172d29cf3aed92e9db40e83e36329db1dd5 qede: Add support for link

:::::: TO: Sudarsana Kalluru <Sudarsana.Kalluru@qlogic.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
