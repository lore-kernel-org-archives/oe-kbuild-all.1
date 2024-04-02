Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0942865BD1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 12:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712060030; cv=none; b=aTw+OwqtiTQFbdN+lsLAJ+8+6cA0RImd8E3k6MaeUl7LQ+yaav5kRSwdEWfsqo2feCFje4xYYwc1f3qmtQ2tcNJDsDGww7GcM7v4RjhA3Ym8DsyCFOsEXaSfJFc4lLwZ3oA/yWoNLl2I7/3oDbhAnZSNKVSgNyHDSH3bDGQjGzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712060030; c=relaxed/simple;
	bh=VwoAYoVp7wP6/yafqn1eqQIHKvV/NTccYkQ1sNQpSok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EP/tC3X/Wlg4oUgWwCBuyOwXna9hAvZWrDENvAQPOr2475o1K88Bi6ANTv+LYJGdXvvAFfE13TnJ+KBlbdtZGEWKAOKdBDsx/q0mZJNTw5DvMlMdBfbO9/4V/SceEcT5vpf2DSagWjsizd7GhmYdcXuLJoBtqX7SNo46S1q2I5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H2Vuw4Kx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2Vuw4Kx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712060028; x=1743596028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VwoAYoVp7wP6/yafqn1eqQIHKvV/NTccYkQ1sNQpSok=;
  b=H2Vuw4KxsJe+savycId4eyQL5bby3OSwcYLYRlGb/ObFTHUClSBORhlS
   EpHj5KB0IAWa3iTx7xCu+cCwZAtDfvs6xjjI6Ao+EH2A7sxH3cZEstYEr
   QfVytkc3eUv0VIh62lwTsYOzWEZnIJgQF8D9Va2j+LzQNFQxGl36IjaaK
   O3YXdRYgkjQeOyROcVJOyYyn7KEJYSqWcPeBBVP6B1wx4X2/bfVmLbYed
   hGIaeIcwyNhSFfZM1G3DngYEuU3dNyDzh90jhJmejztYjFOJtCtytIniu
   vvdJVnM/2wmRYVilsHTaHzD854yrNo3vhyCmWqosvTFhYC0WxCpL3HqUT
   A==;
X-CSE-ConnectionGUID: /Ua0OIIeQ8qBhYio2hWmCg==
X-CSE-MsgGUID: R+ebn+grTyCyQyZ6o2Bfrg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7440343"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7440343"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 05:13:47 -0700
X-CSE-ConnectionGUID: bovrcWhhRQOa4QUB1uL5Qw==
X-CSE-MsgGUID: MmBsJ4OFRni0rs7dkTQG9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="18105403"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2024 05:13:45 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrd1K-0001Av-0W;
	Tue, 02 Apr 2024 12:13:42 +0000
Date: Tue, 2 Apr 2024 20:13:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14777/22023]
 drivers/scsi/huawei/hifc/.tmp_hifc_module.o: warning: objtool: missing
 symbol for section .text
Message-ID: <202404022024.yOXMtyZl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9268ff82cb11f4d613c20c217cafbf2bb1a85b45
commit: 7fc993d55d1b54ae40e29dfac825a18d04d644c6 [14777/22023] scsi/hifc: add hifc driver FC service module
config: x86_64-buildonly-randconfig-001-20240329 (https://download.01.org/0day-ci/archive/20240402/202404022024.yOXMtyZl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404022024.yOXMtyZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404022024.yOXMtyZl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/huawei/hifc/hifc_module.c:7:
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
   drivers/scsi/huawei/hifc/hifc_module.c:46:5: warning: no previous prototype for function 'hifc_init_module' [-Wmissing-prototypes]
      46 | int hifc_init_module(void)
         |     ^
   drivers/scsi/huawei/hifc/hifc_module.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      46 | int hifc_init_module(void)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_module.c:88:6: warning: no previous prototype for function 'hifc_exit_module' [-Wmissing-prototypes]
      88 | void hifc_exit_module(void)
         |      ^
   drivers/scsi/huawei/hifc/hifc_module.c:88:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      88 | void hifc_exit_module(void)
         | ^
         | static 
   3 warnings generated.
>> drivers/scsi/huawei/hifc/.tmp_hifc_module.o: warning: objtool: missing symbol for section .text
--
   In file included from drivers/scsi/huawei/hifc/hifc_sml.c:9:
   In file included from drivers/scsi/huawei/hifc/hifc_knl_adp.h:30:
   In file included from include/scsi/scsi_host.h:12:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_sml.c:114:5: warning: no previous prototype for function 'hifc_sm_ctr_rd32_clear' [-Wmissing-prototypes]
     114 | int hifc_sm_ctr_rd32_clear(void *hwdev, u8 node, u8 instance,
         |     ^
   drivers/scsi/huawei/hifc/hifc_sml.c:114:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     114 | int hifc_sm_ctr_rd32_clear(void *hwdev, u8 node, u8 instance,
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_sml.c:152:5: warning: no previous prototype for function 'hifc_sm_ctr_wr32' [-Wmissing-prototypes]
     152 | int hifc_sm_ctr_wr32(void *hwdev, u8 node, u8 instance, u32 ctr_id, u32 value)
         |     ^
   drivers/scsi/huawei/hifc/hifc_sml.c:152:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     152 | int hifc_sm_ctr_wr32(void *hwdev, u8 node, u8 instance, u32 ctr_id, u32 value)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_sml.c:212:5: warning: no previous prototype for function 'hifc_sm_ctr_wr64' [-Wmissing-prototypes]
     212 | int hifc_sm_ctr_wr64(void *hwdev, u8 node, u8 instance, u32 ctr_id, u64 value)
         |     ^
   drivers/scsi/huawei/hifc/hifc_sml.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     212 | int hifc_sm_ctr_wr64(void *hwdev, u8 node, u8 instance, u32 ctr_id, u64 value)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_sml.c:279:5: warning: no previous prototype for function 'hifc_sm_ctr_wr64_pair' [-Wmissing-prototypes]
     279 | int hifc_sm_ctr_wr64_pair(void *hwdev, u8 node, u8 instance,
         |     ^
   drivers/scsi/huawei/hifc/hifc_sml.c:279:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     279 | int hifc_sm_ctr_wr64_pair(void *hwdev, u8 node, u8 instance,
         | ^
         | static 
   5 warnings generated.
>> drivers/scsi/huawei/hifc/.tmp_hifc_sml.o: warning: objtool: missing symbol for section .text
--
   In file included from drivers/scsi/huawei/hifc/hifc_wqe.c:7:
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
   1 warning generated.
>> drivers/scsi/huawei/hifc/.tmp_hifc_wqe.o: warning: objtool: missing symbol for section .text
--
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/unf_npiv.c:173:14: warning: no previous prototype for function 'unf_alloc_vp_index' [-Wmissing-prototypes]
     173 | unsigned int unf_alloc_vp_index(struct unf_vport_pool_s *v_vport_pool,
         |              ^
   drivers/scsi/huawei/hifc/unf_npiv.c:173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     173 | unsigned int unf_alloc_vp_index(struct unf_vport_pool_s *v_vport_pool,
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:229:6: warning: no previous prototype for function 'unf_free_vp_index' [-Wmissing-prototypes]
     229 | void unf_free_vp_index(struct unf_vport_pool_s *v_vport_pool,
         |      ^
   drivers/scsi/huawei/hifc/unf_npiv.c:229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     229 | void unf_free_vp_index(struct unf_vport_pool_s *v_vport_pool,
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:255:21: warning: no previous prototype for function 'unf_get_free_vport' [-Wmissing-prototypes]
     255 | struct unf_lport_s *unf_get_free_vport(struct unf_lport_s *v_lport)
         |                     ^
   drivers/scsi/huawei/hifc/unf_npiv.c:255:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     255 | struct unf_lport_s *unf_get_free_vport(struct unf_lport_s *v_lport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:287:6: warning: no previous prototype for function 'unf_vport_back_to_pool' [-Wmissing-prototypes]
     287 | void unf_vport_back_to_pool(void *v_vport)
         |      ^
   drivers/scsi/huawei/hifc/unf_npiv.c:287:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     287 | void unf_vport_back_to_pool(void *v_vport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:312:6: warning: no previous prototype for function 'unf_init_vport_from_lport' [-Wmissing-prototypes]
     312 | void unf_init_vport_from_lport(struct unf_lport_s *v_vport,
         |      ^
   drivers/scsi/huawei/hifc/unf_npiv.c:312:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     312 | void unf_init_vport_from_lport(struct unf_lport_s *v_vport,
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:339:6: warning: no previous prototype for function 'unf_check_vport_pool_status' [-Wmissing-prototypes]
     339 | void unf_check_vport_pool_status(struct unf_lport_s *v_lport)
         |      ^
   drivers/scsi/huawei/hifc/unf_npiv.c:339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     339 | void unf_check_vport_pool_status(struct unf_lport_s *v_lport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:366:6: warning: no previous prototype for function 'unf_vport_deinit' [-Wmissing-prototypes]
     366 | void unf_vport_deinit(void *v_vport)
         |      ^
   drivers/scsi/huawei/hifc/unf_npiv.c:366:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     366 | void unf_vport_deinit(void *v_vport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:410:14: warning: no previous prototype for function 'unf_vport_init' [-Wmissing-prototypes]
     410 | unsigned int unf_vport_init(void *v_vport)
         |              ^
   drivers/scsi/huawei/hifc/unf_npiv.c:410:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     410 | unsigned int unf_vport_init(void *v_vport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:928:6: warning: no previous prototype for function 'unf_vport_abort_all_sfs_exch' [-Wmissing-prototypes]
     928 | void unf_vport_abort_all_sfs_exch(struct unf_lport_s *vport)
         |      ^
   drivers/scsi/huawei/hifc/unf_npiv.c:928:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     928 | void unf_vport_abort_all_sfs_exch(struct unf_lport_s *vport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:979:6: warning: no previous prototype for function 'unf_vport_abort_ini_io_exch' [-Wmissing-prototypes]
     979 | void unf_vport_abort_ini_io_exch(struct unf_lport_s *vport)
         |      ^
   drivers/scsi/huawei/hifc/unf_npiv.c:979:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     979 | void unf_vport_abort_ini_io_exch(struct unf_lport_s *vport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:1028:6: warning: no previous prototype for function 'unf_vport_abort_all_exch' [-Wmissing-prototypes]
    1028 | void unf_vport_abort_all_exch(struct unf_lport_s *vport)
         |      ^
   drivers/scsi/huawei/hifc/unf_npiv.c:1028:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1028 | void unf_vport_abort_all_exch(struct unf_lport_s *vport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:1037:14: warning: no previous prototype for function 'unf_vport_wait_all_exch_removed' [-Wmissing-prototypes]
    1037 | unsigned int unf_vport_wait_all_exch_removed(struct unf_lport_s *vport)
         |              ^
   drivers/scsi/huawei/hifc/unf_npiv.c:1037:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1037 | unsigned int unf_vport_wait_all_exch_removed(struct unf_lport_s *vport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:1114:14: warning: no previous prototype for function 'unf_vport_wait_rports_removed' [-Wmissing-prototypes]
    1114 | unsigned int unf_vport_wait_rports_removed(struct unf_lport_s *vport)
         |              ^
   drivers/scsi/huawei/hifc/unf_npiv.c:1114:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1114 | unsigned int unf_vport_wait_rports_removed(struct unf_lport_s *vport)
         | ^
         | static 
   drivers/scsi/huawei/hifc/unf_npiv.c:1303:5: warning: no previous prototype for function 'unf_process_vports_linkup' [-Wmissing-prototypes]
    1303 | int unf_process_vports_linkup(void *v_arg_in, void *v_arg_out)
         |     ^
   drivers/scsi/huawei/hifc/unf_npiv.c:1303:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1303 | int unf_process_vports_linkup(void *v_arg_in, void *v_arg_out)
         | ^
         | static 
   15 warnings generated.
>> drivers/scsi/huawei/hifc/.tmp_unf_npiv.o: warning: objtool: missing symbol for section .text
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
>> drivers/scsi/huawei/hifc/.tmp_unf_event.o: warning: objtool: missing symbol for section .text
--
   In file included from drivers/scsi/huawei/hifc/hifc_cqm_main.c:13:
   In file included from drivers/scsi/huawei/hifc/hifc_knl_adp.h:30:
   In file included from include/scsi/scsi_host.h:12:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:46:6: warning: no previous prototype for function 'cqm_test_mode_init' [-Wmissing-prototypes]
      46 | void cqm_test_mode_init(struct cqm_handle_s *cqm_handle,
         |      ^
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      46 | void cqm_test_mode_init(struct cqm_handle_s *cqm_handle,
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:95:5: warning: no previous prototype for function 'cqm_service_capability_init' [-Wmissing-prototypes]
      95 | s32 cqm_service_capability_init(struct cqm_handle_s *cqm_handle,
         |     ^
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      95 | s32 cqm_service_capability_init(struct cqm_handle_s *cqm_handle,
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:114:5: warning: no previous prototype for function 'cqm_capability_init' [-Wmissing-prototypes]
     114 | s32 cqm_capability_init(void *ex_handle)
         |     ^
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:114:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     114 | s32 cqm_capability_init(void *ex_handle)
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:431:5: warning: no previous prototype for function 'cqm_db_addr_alloc' [-Wmissing-prototypes]
     431 | s32 cqm_db_addr_alloc(void *ex_handle, void __iomem **db_addr,
         |     ^
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:431:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     431 | s32 cqm_db_addr_alloc(void *ex_handle, void __iomem **db_addr,
         | ^
         | static 
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:476:6: warning: no previous prototype for function 'cqm_db_addr_free' [-Wmissing-prototypes]
     476 | void cqm_db_addr_free(void *ex_handle, void __iomem *db_addr,
         |      ^
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:476:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     476 | void cqm_db_addr_free(void *ex_handle, void __iomem *db_addr,
         | ^
         | static 
   6 warnings generated.
   drivers/scsi/huawei/hifc/hifc_cqm_main.c:592: warning: Excess function parameter 'service_type' description in 'cqm_service_unregister'
>> drivers/scsi/huawei/hifc/.tmp_hifc_cqm_main.o: warning: objtool: missing symbol for section .text
--
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
>> drivers/scsi/huawei/hifc/.tmp_hifc_portmng.o: warning: objtool: missing symbol for section .text
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
