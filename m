Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0266714B08C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715352381; cv=none; b=WYqkYBHb207ouWHy3SL/1ZPpsgk1HdPI64mxYYp5K77nmLEAVx8EszVnK8p6H3XUHg+Qi32dneOpyijzontaVsVzMdAwkOI8pKCYHUa+0hcXvegYcVInvUQPjoVE+uAjWtbOH+x5wXbRB5PekScJRedJTZDB/NW02K74uEVuc+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715352381; c=relaxed/simple;
	bh=2enKvBpTEoM39ltg9DnuifzxQEf3NS9w3cQjco4H6dg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HB1jFnnlgJjRpVfIxTdnhyJg96Ha+qC+GhixMoSPmMDBWa+vdvQNcCXR2vfKeCYIbhUjGioEXzvO9ok1OaxtnVrDAp62YXxIa3NQYMMDobrUPzS5W/SSnjZRCtMLKmRG1YsZTc5od5g3abQoRFop76l9b5s8x//mqA0qi0MErwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/LOXBzg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/LOXBzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715352379; x=1746888379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2enKvBpTEoM39ltg9DnuifzxQEf3NS9w3cQjco4H6dg=;
  b=f/LOXBzgVdrJcp1LcL9w/P9yYXMa+h6QcQn+7pDveYerj847t0bkZ/Xi
   m5E2GNf5uJ2Pb++3QOUxrspTRJsdT9tJ5ALK6eXid6E455s0GnX96TvEz
   nwWszIf6IKj3LKXo7gSxWNNkFiU+7H7dUOytqDr5SoqC8UooT4Ww6SOQf
   32QlIJ6Oq3jPDOO0YDcjKTeUaEaxI0AAzz1pbTjijEQTUKyxhPp4lUwr7
   PMQpvg2M5bIm7Vv0S/vinEQvJ5GRpMkzQFOlO3e0+lspczR6n1wZeVTUx
   4LRvI03gjHNXApO1P5GKYdpYqrY3OTKoV79pV4bdz4elji68SOydCGIe1
   A==;
X-CSE-ConnectionGUID: 7X5yQ3myTuuy4LXnHWzZcw==
X-CSE-MsgGUID: 5uYQjIgdQZGRH+3PaIMnjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11498416"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11498416"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:46:18 -0700
X-CSE-ConnectionGUID: 940X7bQPTMKBgJ3EOjdRnA==
X-CSE-MsgGUID: kXcqnEKnRVuYyVRqlizuxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="30190528"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 May 2024 07:46:17 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5RVm-0006GJ-1l;
	Fri, 10 May 2024 14:46:14 +0000
Date: Fri, 10 May 2024 22:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14777/22394]
 drivers/scsi/huawei/hifc/hifc_portmng.o: warning: objtool: missing symbol
 for section .text
Message-ID: <202405102258.1OIgsP3m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a786a35ec1aeb84a5ff258956854c2eaebec12b7
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [14777/22394] scsi/hifc: add hifc driver FC service module
config: x86_64-buildonly-randconfig-004-20240510 (https://download.01.org/0day-ci/archive/20240510/202405102258.1OIgsP3m-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405102258.1OIgsP3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405102258.1OIgsP3m-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/huawei/hifc/hifc_portmng.c:6:
   In file included from drivers/scsi/huawei/hifc/hifc_module.h:10:
   In file included from drivers/scsi/huawei/hifc/unf_common.h:9:
   In file included from drivers/scsi/huawei/hifc/unf_scsi_common.h:10:
   In file included from drivers/scsi/huawei/hifc/hifc_knl_adp.h:30:
   In file included from include/scsi/scsi_host.h:12:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_portmng.c:570:5: warning: no previous prototype for function 'hifc_dfx_get_rxtx_error_state' [-Wmissing-prototypes]
     570 | int hifc_dfx_get_rxtx_error_state(void *v_hba, void *v_buff_out)
         |     ^
   drivers/scsi/huawei/hifc/hifc_portmng.c:570:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     570 | int hifc_dfx_get_rxtx_error_state(void *v_hba, void *v_buff_out)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_portmng.c:1118:14: warning: no previous prototype for function 'hifc_port_info' [-Wmissing-prototypes]
    1118 | unsigned int hifc_port_info(struct unf_hinicam_pkg *v_input)
         |              ^
   drivers/scsi/huawei/hifc/hifc_portmng.c:1118:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1118 | unsigned int hifc_port_info(struct unf_hinicam_pkg *v_input)
         | ^
         | static 
   3 warnings generated.
>> drivers/scsi/huawei/hifc/hifc_portmng.o: warning: objtool: missing symbol for section .text
--
   In file included from drivers/scsi/huawei/hifc/hifc_cmdq.c:21:
   In file included from drivers/scsi/huawei/hifc/hifc_knl_adp.h:30:
   In file included from include/scsi/scsi_host.h:12:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1316:5: warning: no previous prototype for function 'hifc_set_cmdq_ctxts' [-Wmissing-prototypes]
    1316 | int hifc_set_cmdq_ctxts(struct hifc_hwdev *hwdev)
         |     ^
   drivers/scsi/huawei/hifc/hifc_cmdq.c:1316:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1316 | int hifc_set_cmdq_ctxts(struct hifc_hwdev *hwdev)
         | ^
         | static 
   2 warnings generated.
>> drivers/scsi/huawei/hifc/hifc_cmdq.o: warning: objtool: missing symbol for section .text
--
   In file included from drivers/scsi/huawei/hifc/unf_event.c:8:
   In file included from drivers/scsi/huawei/hifc/unf_common.h:9:
   In file included from drivers/scsi/huawei/hifc/unf_scsi_common.h:10:
   In file included from drivers/scsi/huawei/hifc/hifc_knl_adp.h:30:
   In file included from include/scsi/scsi_host.h:12:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_event.c:18:14: warning: no previous prototype for function 'unf_init_event_msg' [-Wmissing-prototypes]
      18 | unsigned int unf_init_event_msg(struct unf_lport_s *v_lport)
         |              ^
   drivers/scsi/huawei/hifc/unf_event.c:18:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      18 | unsigned int unf_init_event_msg(struct unf_lport_s *v_lport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_event.c:69:6: warning: no previous prototype for function 'unf_init_event_node' [-Wmissing-prototypes]
      69 | void unf_init_event_node(struct unf_cm_event_report *v_event_node)
         |      ^
   drivers/scsi/huawei/hifc/unf_event.c:69:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      69 | void unf_init_event_node(struct unf_cm_event_report *v_event_node)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_event.c:85:29: warning: no previous prototype for function 'unf_get_free_event_node' [-Wmissing-prototypes]
      85 | struct unf_cm_event_report *unf_get_free_event_node(void *v_lport)
         |                             ^
   drivers/scsi/huawei/hifc/unf_event.c:85:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      85 | struct unf_cm_event_report *unf_get_free_event_node(void *v_lport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_event.c:128:6: warning: no previous prototype for function 'unf_check_event_mgr_status' [-Wmissing-prototypes]
     128 | void unf_check_event_mgr_status(struct unf_event_mgr *v_event_mgr)
         |      ^
   drivers/scsi/huawei/hifc/unf_event.c:128:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     128 | void unf_check_event_mgr_status(struct unf_event_mgr *v_event_mgr)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_event.c:142:6: warning: no previous prototype for function 'unf_release_event' [-Wmissing-prototypes]
     142 | void unf_release_event(void *v_lport, void *v_event_node)
         |      ^
   drivers/scsi/huawei/hifc/unf_event.c:142:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     142 | void unf_release_event(void *v_lport, void *v_event_node)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_event.c:166:6: warning: no previous prototype for function 'unf_post_event' [-Wmissing-prototypes]
     166 | void unf_post_event(void *v_lport, void *v_event_node)
         |      ^
   drivers/scsi/huawei/hifc/unf_event.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     166 | void unf_post_event(void *v_lport, void *v_event_node)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_event.c:249:6: warning: no previous prototype for function 'unf_wait_event_mgr_complete' [-Wmissing-prototypes]
     249 | void unf_wait_event_mgr_complete(struct unf_event_mgr *v_event_mgr)
         |      ^
   drivers/scsi/huawei/hifc/unf_event.c:249:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     249 | void unf_wait_event_mgr_complete(struct unf_event_mgr *v_event_mgr)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_event.c:355:6: warning: no previous prototype for function 'unf_release_global_event' [-Wmissing-prototypes]
     355 | void unf_release_global_event(void *v_event_node)
         |      ^
   drivers/scsi/huawei/hifc/unf_event.c:355:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     355 | void unf_release_global_event(void *v_event_node)
         | ^
         | static 
   9 warnings generated.
>> drivers/scsi/huawei/hifc/unf_event.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
