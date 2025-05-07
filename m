Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10601C6FF5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612069; cv=none; b=Q/nEK4uHz62ZcHDg0b/cyLZ44QA5cZXrQR5HHWxVUbdgl2+tgoiNETzR87+2dhdMqmMRFlshc39yGjykeOigxXOVGnVzOS1ccYP2h8vRVD1HoYu2zSNoLhNesobtp81XnnkwHeop7NdKgR0RZnMu+H1O++20/Dj142hnD5JVAmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612069; c=relaxed/simple;
	bh=XNaXTwTfMsUq2KDPD+ZwoJCi2ZuhmlkB49Q8UqLYPRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oi4ueO+JcPumfNzqmd/naSi6zEJSZKA2ktzFzIoxbcHACGYSH1VBwsxxei6eoxPCUvDiqJ49z662KiNMSBx1gvRDCRDnWuPjmoqDb5ATjlWfygazhv5N9AT4I+mgFaUvJPV50FhS6OlxCga+zzEz/1imhume4y/0zQNQdM/M3GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeFXCcUY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeFXCcUY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746612066; x=1778148066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XNaXTwTfMsUq2KDPD+ZwoJCi2ZuhmlkB49Q8UqLYPRw=;
  b=CeFXCcUY1Omg8pOV82h1OlH5jE9LiFYXkk+3qtRKHxrnNTsAsmpM3CAf
   eFLAtu4HHPHS0E73UO56JZWifLbibGEiuslUoVfFW1vGhgelesPSQpFQ/
   TwjekMKxfy6FWJ8DdATpO+STdJDS3AJ2QF0n/ex7yaPGlPSvO0dkunWKr
   A+wNP9UtDvomL3txxVd8KZ+NfA464QpB5q9VzrlxzlbTLOVrn1Ri6wOyz
   pwMrdPmnnAy4rta4eewxoF0cUUL/4KkjyEQtXqzAyy+5wuN3GQWBTYm/m
   AbEAwwVTPFp4jKAELyNfKLV3jyyT+Rq6Ol4g+Dme9NlGvaq16gJ1NZo6C
   g==;
X-CSE-ConnectionGUID: WepsOsF+T36R7ZyJSTMxeQ==
X-CSE-MsgGUID: ZLPvdjTHT62UZ2jF9QhpUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58527543"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="58527543"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:01:05 -0700
X-CSE-ConnectionGUID: W50DtydrQPe6s8bvBrU2Ig==
X-CSE-MsgGUID: 6r28UfSLSf67FsKyQ2YXkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="159199340"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 03:01:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbaI-0007YV-04;
	Wed, 07 May 2025 10:01:02 +0000
Date: Wed, 7 May 2025 18:00:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 7222/9308] drivers/scsi/qedf/qedf_main.c:702:9:
 error: positional initialization of field in 'struct' declared with
 'designated_init' attribute
Message-ID: <202505071735.vZqsL4b5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: c2ea09b193d274bd321895920d6f8e728c29cff6 [7222/9308] randstruct: gcc-plugin: Remove bogus void member
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250507/202505071735.vZqsL4b5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071735.vZqsL4b5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071735.vZqsL4b5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/qedf/qedf_main.c:702:9: warning: braces around scalar initializer
     702 |         {
         |         ^
   drivers/scsi/qedf/qedf_main.c:702:9: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:703:17: error: field name not in record or union initializer
     703 |                 .link_update = qedf_link_update,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:703:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:703:32: error: initialization of 'u32 (*)(void *)' {aka 'unsigned int (*)(void *)'} from incompatible pointer type 'void (*)(void *, struct qed_link_output *)' [-Werror=incompatible-pointer-types]
     703 |                 .link_update = qedf_link_update,
         |                                ^~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:703:32: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:704:17: error: field name not in record or union initializer
     704 |                 .bw_update = qedf_bw_update,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:704:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:704:30: warning: excess elements in scalar initializer
     704 |                 .bw_update = qedf_bw_update,
         |                              ^~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:704:30: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:705:17: error: field name not in record or union initializer
     705 |                 .schedule_recovery_handler = qedf_schedule_recovery_handler,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:705:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:705:46: warning: excess elements in scalar initializer
     705 |                 .schedule_recovery_handler = qedf_schedule_recovery_handler,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:705:46: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:706:17: error: field name not in record or union initializer
     706 |                 .dcbx_aen = qedf_dcbx_handler,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:706:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:706:29: warning: excess elements in scalar initializer
     706 |                 .dcbx_aen = qedf_dcbx_handler,
         |                             ^~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:706:29: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:707:17: error: field name not in record or union initializer
     707 |                 .get_generic_tlv_data = qedf_get_generic_tlv_data,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:707:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:707:41: warning: excess elements in scalar initializer
     707 |                 .get_generic_tlv_data = qedf_get_generic_tlv_data,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:707:41: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:708:17: error: field name not in record or union initializer
     708 |                 .get_protocol_tlv_data = qedf_get_protocol_tlv_data,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:708:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:708:42: warning: excess elements in scalar initializer
     708 |                 .get_protocol_tlv_data = qedf_get_protocol_tlv_data,
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:708:42: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:709:17: error: field name not in record or union initializer
     709 |                 .schedule_hw_err_handler = qedf_schedule_hw_err_handler,
         |                 ^
   drivers/scsi/qedf/qedf_main.c:709:17: note: (near initialization for 'qedf_cb_ops.get_login_failures')
   drivers/scsi/qedf/qedf_main.c:709:44: warning: excess elements in scalar initializer
     709 |                 .schedule_hw_err_handler = qedf_schedule_hw_err_handler,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qedf/qedf_main.c:709:44: note: (near initialization for 'qedf_cb_ops.get_login_failures')
>> drivers/scsi/qedf/qedf_main.c:702:9: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     702 |         {
         |         ^
   drivers/scsi/qedf/qedf_main.c:702:9: note: (near initialization for 'qedf_cb_ops')
   cc1: some warnings being treated as errors
--
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: warning: braces around scalar initializer
     206 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: note: (near initialization for 'qede_ll_ops.force_mac')
>> drivers/net/ethernet/qlogic/qede/qede_main.c:210:17: error: field name not in record or union initializer
     210 |                 .link_update = qede_link_update,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:17: note: (near initialization for 'qede_ll_ops.force_mac')
>> drivers/net/ethernet/qlogic/qede/qede_main.c:210:32: error: initialization of 'void (*)(void *, u8 *, bool)' {aka 'void (*)(void *, unsigned char *, _Bool)'} from incompatible pointer type 'void (*)(void *, struct qed_link_output *)' [-Werror=incompatible-pointer-types]
     210 |                 .link_update = qede_link_update,
         |                                ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:210:32: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:211:17: error: field name not in record or union initializer
     211 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:211:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:211:46: warning: excess elements in scalar initializer
     211 |                 .schedule_recovery_handler = qede_schedule_recovery_handler,
         |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:211:46: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:17: error: field name not in record or union initializer
     212 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:44: warning: excess elements in scalar initializer
     212 |                 .schedule_hw_err_handler = qede_schedule_hw_err_handler,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:212:44: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:213:17: error: field name not in record or union initializer
     213 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:213:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:213:41: warning: excess elements in scalar initializer
     213 |                 .get_generic_tlv_data = qede_get_generic_tlv_data,
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:213:41: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:214:17: error: field name not in record or union initializer
     214 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                 ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:214:17: note: (near initialization for 'qede_ll_ops.force_mac')
   drivers/net/ethernet/qlogic/qede/qede_main.c:214:42: warning: excess elements in scalar initializer
     214 |                 .get_protocol_tlv_data = qede_get_eth_tlv_data,
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:214:42: note: (near initialization for 'qede_ll_ops.force_mac')
>> drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     206 |         {
         |         ^
   drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: note: (near initialization for 'qede_ll_ops')
   drivers/net/ethernet/qlogic/qede/qede_main.c:216:22: warning: initialized field overwritten [-Woverride-init]
     216 |         .force_mac = qede_force_mac,
         |                      ^~~~~~~~~~~~~~
   drivers/net/ethernet/qlogic/qede/qede_main.c:216:22: note: (near initialization for 'qede_ll_ops.force_mac')
   cc1: some warnings being treated as errors


vim +702 drivers/scsi/qedf/qedf_main.c

61d8658b4a435ea Dupuis, Chad   2017-02-15  700  
61d8658b4a435ea Dupuis, Chad   2017-02-15  701  static struct qed_fcoe_cb_ops qedf_cb_ops = {
61d8658b4a435ea Dupuis, Chad   2017-02-15 @702  	{
61d8658b4a435ea Dupuis, Chad   2017-02-15  703  		.link_update = qedf_link_update,
6e7c8eea929e547 Saurav Kashyap 2020-04-16  704  		.bw_update = qedf_bw_update,
f6b172f21999cf5 Chad Dupuis    2020-04-16  705  		.schedule_recovery_handler = qedf_schedule_recovery_handler,
61d8658b4a435ea Dupuis, Chad   2017-02-15  706  		.dcbx_aen = qedf_dcbx_handler,
8673daf4f55bf3b Chad Dupuis    2018-05-22  707  		.get_generic_tlv_data = qedf_get_generic_tlv_data,
642a0b37e669465 Chad Dupuis    2018-05-22  708  		.get_protocol_tlv_data = qedf_get_protocol_tlv_data,
55e049910e08caf Saurav Kashyap 2020-09-07  709  		.schedule_hw_err_handler = qedf_schedule_hw_err_handler,
61d8658b4a435ea Dupuis, Chad   2017-02-15  710  	}
61d8658b4a435ea Dupuis, Chad   2017-02-15  711  };
61d8658b4a435ea Dupuis, Chad   2017-02-15  712  

:::::: The code at line 702 was first introduced by commit
:::::: 61d8658b4a435eac729966cc94cdda077a8df5cd scsi: qedf: Add QLogic FastLinQ offload FCoE driver framework.

:::::: TO: Dupuis, Chad <chad.dupuis@cavium.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
