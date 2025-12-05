Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CF9354AF3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 15:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947762; cv=none; b=IINC8i0xG6njBCJh5Hgz1sENI7VBJET42/wiz3cFfDcboPRhKfn4dqc122k0FFoTRjvJmYswK63X79f+upyxZAgsBtgZWi3hZYHaBGRLT1qzXMm3gkaRwgW8g3SJGkU0bInsS3mSfXJbWoYvj1tP2SkXY6CnoI88DiX6mCU6lPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947762; c=relaxed/simple;
	bh=c/qarP+hGoY/seTOEniaz6Z/P3QekDTEdHwKIcQ9fGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XD0UUW48GTuPG9Ox6sEULAKg0CugoVcGOElNT7xltPHr6Bp+kwF4YYuqXayzgPfTBte0aLavoKAnu//s+8kG/YOwD5G4qZLHympGNQH4HHiN1VAfjvu/DJPcXwbOlZHsKTOwguKo9QVkWzHrZhegkZnf3rldTQM1aM2UqyRC5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cz+fXbhx; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cz+fXbhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764947758; x=1796483758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/qarP+hGoY/seTOEniaz6Z/P3QekDTEdHwKIcQ9fGg=;
  b=Cz+fXbhxjotLi4fl0/yanz89lLhXlCArqsciS2+AlRnEmbAz63Hx21mI
   ZOqUVpSwWDY6HjxL6VyHgC1bBRu3uKL7UCvrIEtTq8BKgPjTSsq9KFKkq
   BJspce6Oz7ZislK1udM3mQf5QMxgQnaC+zhbGrmTeyh912WDmk1kLF3k4
   kPamZ7qzJ11RZSQy8KxT2UbKtLMwmXmGjK8sGRUNnELMsP9YVHCrNPnJE
   B2gm1AnNaE6UAlnp4T3ivgSxWKibwwbShx988Fo0c1wVNR4IkB5E8ehES
   +2jVclLY2+3RNNzuiBP5LraVfGbte3qShsIqt/K4iv2UgHbcIsi0NAm36
   w==;
X-CSE-ConnectionGUID: 0R/3ZLOZS6SUK77TzNncaw==
X-CSE-MsgGUID: wZ5mTcaCS6CA/jJi2jxTlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="89633808"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="89633808"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 07:15:54 -0800
X-CSE-ConnectionGUID: 1Vo60m7GR8WO+htGKFOvzg==
X-CSE-MsgGUID: /+BjqLR3SjuCN/DRSn3Puw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="226310303"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Dec 2025 07:15:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRXXC-00000000F7r-1GAG;
	Fri, 05 Dec 2025 15:15:50 +0000
Date: Fri, 5 Dec 2025 23:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479]
 drivers/ub/urma/ubcore/ubcore_segment.c:20:25: warning: no previous
 prototype for 'ubcore_alloc_token_id'
Message-ID: <202512052329.KGMXGdpW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4b48fa45408a2757255bdd0c640c1f693b424fe4
commit: e34a52d4eed8912f6dfdc7d68152c45f7a071ca8 [3479/3479] ubcore: implement ubcore connection management and messaging feature.
config: arm64-randconfig-r061-20251205 (https://download.01.org/0day-ci/archive/20251205/202512052329.KGMXGdpW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512052329.KGMXGdpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512052329.KGMXGdpW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_segment.c:20:25: warning: no previous prototype for 'ubcore_alloc_token_id' [-Wmissing-prototypes]
      20 | struct ubcore_token_id *ubcore_alloc_token_id(struct ubcore_device *dev,
         |                         ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_segment.c:51:5: warning: no previous prototype for 'ubcore_free_token_id' [-Wmissing-prototypes]
      51 | int ubcore_free_token_id(struct ubcore_token_id *token_id)
         |     ^~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_segment.c:115:27: warning: no previous prototype for 'ubcore_register_seg' [-Wmissing-prototypes]
     115 | struct ubcore_target_seg *ubcore_register_seg(struct ubcore_device *dev,
         |                           ^~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_segment.c:170:5: warning: no previous prototype for 'ubcore_unregister_seg' [-Wmissing-prototypes]
     170 | int ubcore_unregister_seg(struct ubcore_target_seg *tseg)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_segment.c:204:27: warning: no previous prototype for 'ubcore_import_seg' [-Wmissing-prototypes]
     204 | struct ubcore_target_seg *ubcore_import_seg(struct ubcore_device *dev,
         |                           ^~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcore_segment.c:239:5: warning: no previous prototype for 'ubcore_unimport_seg' [-Wmissing-prototypes]
     239 | int ubcore_unimport_seg(struct ubcore_target_seg *tseg)
         |     ^~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:16:
   drivers/ub/urma/ubcore/ubcore_topo_info.h:56:34: warning: 'union ubcore_eid' declared inside parameter list will not be visible outside of this definition or declaration
      56 | int ubcore_get_primary_eid(union ubcore_eid *eid,
         |                                  ^~~~~~~~~~
   drivers/ub/urma/ubcore/ubcore_topo_info.h:59:49: warning: 'union ubcore_eid' declared inside parameter list will not be visible outside of this definition or declaration
      59 | int ubcore_get_primary_eid_by_bonding_eid(union ubcore_eid *bonding_eid,
         |                                                 ^~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:143:23: warning: no previous prototype for 'ubmad_create_rt_work' [-Wmissing-prototypes]
     143 | struct ubmad_rt_work *ubmad_create_rt_work(struct workqueue_struct *rt_wq,
         |                       ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c: In function 'ubmad_do_post_send_conn_data':
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:365:8: error: implicit declaration of function 'ubcore_post_jetty_send_wr' [-Werror=implicit-function-declaration]
     365 |  ret = ubcore_post_jetty_send_wr(jetty, jfs_wr, &jfs_bad_wr);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c: In function 'ubmad_post_send':
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:506:31: error: passing argument 1 of 'ubcore_get_primary_eid' from incompatible pointer type [-Werror=incompatible-pointer-types]
     506 |  ret = ubcore_get_primary_eid(&send_buf->dst_eid, &dst_primary_eid);
         |                               ^~~~~~~~~~~~~~~~~~
         |                               |
         |                               union ubcore_eid *
   In file included from drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:16:
   drivers/ub/urma/ubcore/ubcore_topo_info.h:56:46: note: expected 'union ubcore_eid *' but argument is of type 'union ubcore_eid *'
      56 | int ubcore_get_primary_eid(union ubcore_eid *eid,
         |                            ~~~~~~~~~~~~~~~~~~^~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:506:51: error: passing argument 2 of 'ubcore_get_primary_eid' from incompatible pointer type [-Werror=incompatible-pointer-types]
     506 |  ret = ubcore_get_primary_eid(&send_buf->dst_eid, &dst_primary_eid);
         |                                                   ^~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   union ubcore_eid *
   In file included from drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:16:
   drivers/ub/urma/ubcore/ubcore_topo_info.h:57:25: note: expected 'union ubcore_eid *' but argument is of type 'union ubcore_eid *'
      57 |       union ubcore_eid *primary_eid);
         |       ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:470:23: warning: variable 'wk_jetty' set but not used [-Wunused-but-set-variable]
     470 |  struct ubcore_jetty *wk_jetty; // well-known jetty
         |                       ^~~~~~~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c: At top level:
>> drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:532:5: warning: no previous prototype for 'ubmad_post_send_conn_ack' [-Wmissing-prototypes]
     532 | int ubmad_post_send_conn_ack(struct ubmad_jetty_resource *rsrc,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:552:5: warning: no previous prototype for 'ubmad_repost_send_conn_data' [-Wmissing-prototypes]
     552 | int ubmad_repost_send_conn_data(struct ubcore_jetty *jetty,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c: In function 'ubmad_post_recv':
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:724:8: error: implicit declaration of function 'ubcore_post_jetty_recv_wr' [-Werror=implicit-function-declaration]
     724 |  ret = ubcore_post_jetty_recv_wr(rsrc->jetty, &jfr_wr, &jfr_bad_wr);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c: At top level:
>> drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:759:6: warning: no previous prototype for 'ubmad_process_rx_msn' [-Wmissing-prototypes]
     759 | bool ubmad_process_rx_msn(struct ubmad_bitmap *rx_bitmap, uint64_t msn)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c: In function 'ubmad_send_work_handler':
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:1007:12: error: implicit declaration of function 'ubcore_poll_jfc' [-Werror=implicit-function-declaration]
    1007 |   cr_cnt = ubcore_poll_jfc(jfc, 1, &cr);
         |            ^~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:1047:8: error: implicit declaration of function 'ubcore_rearm_jfc' [-Werror=implicit-function-declaration]
    1047 |  ret = ubcore_rearm_jfc(jfc, false);
         |        ^~~~~~~~~~~~~~~~
   drivers/ub/urma/ubcore/ubcm/ubmad_datapath.c:989:20: warning: variable 'msg' set but not used [-Wunused-but-set-variable]
     989 |  struct ubmad_msg *msg;
         |                    ^~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/ubcore_alloc_token_id +20 drivers/ub/urma/ubcore/ubcore_segment.c

39ee38e13c0fb8 Wen Chen 2025-11-12   19  
39ee38e13c0fb8 Wen Chen 2025-11-12  @20  struct ubcore_token_id *ubcore_alloc_token_id(struct ubcore_device *dev,
39ee38e13c0fb8 Wen Chen 2025-11-12   21  					      union ubcore_token_id_flag flag,
39ee38e13c0fb8 Wen Chen 2025-11-12   22  					      struct ubcore_udata *udata)
39ee38e13c0fb8 Wen Chen 2025-11-12   23  {
39ee38e13c0fb8 Wen Chen 2025-11-12   24  	struct ubcore_token_id *token_id;
39ee38e13c0fb8 Wen Chen 2025-11-12   25  
39ee38e13c0fb8 Wen Chen 2025-11-12   26  	if (flag.bs.pa == 1 && udata != NULL) {
39ee38e13c0fb8 Wen Chen 2025-11-12   27  		ubcore_log_err("invalid parameter of pa.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12   28  		return ERR_PTR(-EINVAL);
39ee38e13c0fb8 Wen Chen 2025-11-12   29  	}
39ee38e13c0fb8 Wen Chen 2025-11-12   30  
39ee38e13c0fb8 Wen Chen 2025-11-12   31  	if (dev == NULL || dev->ops == NULL ||
39ee38e13c0fb8 Wen Chen 2025-11-12   32  	    dev->ops->alloc_token_id == NULL ||
39ee38e13c0fb8 Wen Chen 2025-11-12   33  	    dev->ops->free_token_id == NULL) {
39ee38e13c0fb8 Wen Chen 2025-11-12   34  		ubcore_log_err("invalid parameter.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12   35  		return ERR_PTR(-EINVAL);
39ee38e13c0fb8 Wen Chen 2025-11-12   36  	}
39ee38e13c0fb8 Wen Chen 2025-11-12   37  
39ee38e13c0fb8 Wen Chen 2025-11-12   38  	token_id = dev->ops->alloc_token_id(dev, flag, udata);
39ee38e13c0fb8 Wen Chen 2025-11-12   39  	if (IS_ERR_OR_NULL(token_id)) {
39ee38e13c0fb8 Wen Chen 2025-11-12   40  		ubcore_log_err("failed to alloc token_id id.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12   41  		return UBCORE_CHECK_RETURN_ERR_PTR(token_id, ENOEXEC);
39ee38e13c0fb8 Wen Chen 2025-11-12   42  	}
39ee38e13c0fb8 Wen Chen 2025-11-12   43  	token_id->flag = flag;
39ee38e13c0fb8 Wen Chen 2025-11-12   44  	token_id->ub_dev = dev;
39ee38e13c0fb8 Wen Chen 2025-11-12   45  	token_id->uctx = ubcore_get_uctx(udata);
39ee38e13c0fb8 Wen Chen 2025-11-12   46  	atomic_set(&token_id->use_cnt, 0);
39ee38e13c0fb8 Wen Chen 2025-11-12   47  	return token_id;
39ee38e13c0fb8 Wen Chen 2025-11-12   48  }
39ee38e13c0fb8 Wen Chen 2025-11-12   49  EXPORT_SYMBOL(ubcore_alloc_token_id);
39ee38e13c0fb8 Wen Chen 2025-11-12   50  
39ee38e13c0fb8 Wen Chen 2025-11-12  @51  int ubcore_free_token_id(struct ubcore_token_id *token_id)
39ee38e13c0fb8 Wen Chen 2025-11-12   52  {
39ee38e13c0fb8 Wen Chen 2025-11-12   53  	struct ubcore_device *dev;
39ee38e13c0fb8 Wen Chen 2025-11-12   54  
39ee38e13c0fb8 Wen Chen 2025-11-12   55  	if (token_id == NULL || token_id->ub_dev == NULL ||
39ee38e13c0fb8 Wen Chen 2025-11-12   56  	    token_id->ub_dev->ops == NULL ||
39ee38e13c0fb8 Wen Chen 2025-11-12   57  	    token_id->ub_dev->ops->free_token_id == NULL) {
39ee38e13c0fb8 Wen Chen 2025-11-12   58  		ubcore_log_err("invalid parameter.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12   59  		return -EINVAL;
39ee38e13c0fb8 Wen Chen 2025-11-12   60  	}
39ee38e13c0fb8 Wen Chen 2025-11-12   61  	dev = token_id->ub_dev;
39ee38e13c0fb8 Wen Chen 2025-11-12   62  
39ee38e13c0fb8 Wen Chen 2025-11-12   63  	if (atomic_read(&token_id->use_cnt)) {
39ee38e13c0fb8 Wen Chen 2025-11-12   64  		ubcore_log_err("The token_id is still being used");
39ee38e13c0fb8 Wen Chen 2025-11-12   65  		return -EBUSY;
39ee38e13c0fb8 Wen Chen 2025-11-12   66  	}
39ee38e13c0fb8 Wen Chen 2025-11-12   67  	return dev->ops->free_token_id(token_id);
39ee38e13c0fb8 Wen Chen 2025-11-12   68  }
39ee38e13c0fb8 Wen Chen 2025-11-12   69  EXPORT_SYMBOL(ubcore_free_token_id);
39ee38e13c0fb8 Wen Chen 2025-11-12   70  
39ee38e13c0fb8 Wen Chen 2025-11-12   71  static int ubcore_check_register_seg_para(struct ubcore_device *dev,
39ee38e13c0fb8 Wen Chen 2025-11-12   72  					  struct ubcore_seg_cfg *cfg,
39ee38e13c0fb8 Wen Chen 2025-11-12   73  					  struct ubcore_udata *udata)
39ee38e13c0fb8 Wen Chen 2025-11-12   74  {
39ee38e13c0fb8 Wen Chen 2025-11-12   75  	if (dev == NULL || cfg == NULL || dev->ops == NULL ||
39ee38e13c0fb8 Wen Chen 2025-11-12   76  	    dev->ops->register_seg == NULL ||
39ee38e13c0fb8 Wen Chen 2025-11-12   77  	    dev->ops->unregister_seg == NULL ||
39ee38e13c0fb8 Wen Chen 2025-11-12   78  	    IS_ERR_OR_NULL(dev->eid_table.eid_entries)) {
39ee38e13c0fb8 Wen Chen 2025-11-12   79  		ubcore_log_err("invalid parameter.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12   80  		return -1;
39ee38e13c0fb8 Wen Chen 2025-11-12   81  	}
39ee38e13c0fb8 Wen Chen 2025-11-12   82  
39ee38e13c0fb8 Wen Chen 2025-11-12   83  	if (ubcore_is_bonding_dev(dev))
39ee38e13c0fb8 Wen Chen 2025-11-12   84  		return 0;
39ee38e13c0fb8 Wen Chen 2025-11-12   85  
39ee38e13c0fb8 Wen Chen 2025-11-12   86  	if (cfg->flag.bs.pa == 1 && udata != NULL) {
39ee38e13c0fb8 Wen Chen 2025-11-12   87  		ubcore_log_err("invalid parameter of pa.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12   88  		return -1;
39ee38e13c0fb8 Wen Chen 2025-11-12   89  	}
39ee38e13c0fb8 Wen Chen 2025-11-12   90  
39ee38e13c0fb8 Wen Chen 2025-11-12   91  	if (dev->transport_type == UBCORE_TRANSPORT_UB &&
39ee38e13c0fb8 Wen Chen 2025-11-12   92  	    ((cfg->flag.bs.token_id_valid == UBCORE_TOKEN_ID_VALID &&
39ee38e13c0fb8 Wen Chen 2025-11-12   93  	      cfg->token_id == NULL) ||
39ee38e13c0fb8 Wen Chen 2025-11-12   94  	     (cfg->flag.bs.token_id_valid == UBCORE_TOKEN_ID_INVALID &&
39ee38e13c0fb8 Wen Chen 2025-11-12   95  	      cfg->token_id != NULL))) {
39ee38e13c0fb8 Wen Chen 2025-11-12   96  		ubcore_log_err("invalid parameter of token_id.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12   97  		return -1;
39ee38e13c0fb8 Wen Chen 2025-11-12   98  	}
39ee38e13c0fb8 Wen Chen 2025-11-12   99  
39ee38e13c0fb8 Wen Chen 2025-11-12  100  	if (dev->transport_type == UBCORE_TRANSPORT_UB &&
39ee38e13c0fb8 Wen Chen 2025-11-12  101  	    cfg->flag.bs.token_id_valid == UBCORE_TOKEN_ID_VALID &&
39ee38e13c0fb8 Wen Chen 2025-11-12  102  	    cfg->token_id->flag.bs.pa != cfg->flag.bs.pa) {
39ee38e13c0fb8 Wen Chen 2025-11-12  103  		ubcore_log_err("invalid parameter of token_id pa.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12  104  		return -1;
39ee38e13c0fb8 Wen Chen 2025-11-12  105  	}
39ee38e13c0fb8 Wen Chen 2025-11-12  106  
39ee38e13c0fb8 Wen Chen 2025-11-12  107  	if (cfg->eid_index >= dev->eid_table.eid_cnt) {
39ee38e13c0fb8 Wen Chen 2025-11-12  108  		ubcore_log_warn("eid_index:%u >= eid_table cnt:%u.\n",
39ee38e13c0fb8 Wen Chen 2025-11-12  109  				cfg->eid_index, dev->eid_table.eid_cnt);
39ee38e13c0fb8 Wen Chen 2025-11-12  110  		return -1;
39ee38e13c0fb8 Wen Chen 2025-11-12  111  	}
39ee38e13c0fb8 Wen Chen 2025-11-12  112  	return 0;
39ee38e13c0fb8 Wen Chen 2025-11-12  113  }
39ee38e13c0fb8 Wen Chen 2025-11-12  114  
39ee38e13c0fb8 Wen Chen 2025-11-12 @115  struct ubcore_target_seg *ubcore_register_seg(struct ubcore_device *dev,
39ee38e13c0fb8 Wen Chen 2025-11-12  116  					      struct ubcore_seg_cfg *cfg,
39ee38e13c0fb8 Wen Chen 2025-11-12  117  					      struct ubcore_udata *udata)
39ee38e13c0fb8 Wen Chen 2025-11-12  118  {
39ee38e13c0fb8 Wen Chen 2025-11-12  119  	union ubcore_token_id_flag flag = { 0 };
39ee38e13c0fb8 Wen Chen 2025-11-12  120  	bool alloc_token_id = false;
39ee38e13c0fb8 Wen Chen 2025-11-12  121  	struct ubcore_seg_cfg tmp_cfg;
39ee38e13c0fb8 Wen Chen 2025-11-12  122  	struct ubcore_target_seg *tseg;
39ee38e13c0fb8 Wen Chen 2025-11-12  123  
39ee38e13c0fb8 Wen Chen 2025-11-12  124  	if (ubcore_check_register_seg_para(dev, cfg, udata) != 0)
39ee38e13c0fb8 Wen Chen 2025-11-12  125  		return ERR_PTR(-EINVAL);
39ee38e13c0fb8 Wen Chen 2025-11-12  126  
39ee38e13c0fb8 Wen Chen 2025-11-12  127  	if (udata == NULL &&
39ee38e13c0fb8 Wen Chen 2025-11-12  128  	    cfg->flag.bs.token_id_valid == UBCORE_TOKEN_ID_INVALID &&
39ee38e13c0fb8 Wen Chen 2025-11-12  129  	    dev->transport_type == UBCORE_TRANSPORT_UB)
39ee38e13c0fb8 Wen Chen 2025-11-12  130  		alloc_token_id = true;
39ee38e13c0fb8 Wen Chen 2025-11-12  131  
39ee38e13c0fb8 Wen Chen 2025-11-12  132  	tmp_cfg = *cfg;
39ee38e13c0fb8 Wen Chen 2025-11-12  133  	if (alloc_token_id == true) {
39ee38e13c0fb8 Wen Chen 2025-11-12  134  		flag.bs.pa = cfg->flag.bs.pa;
39ee38e13c0fb8 Wen Chen 2025-11-12  135  		tmp_cfg.token_id = ubcore_alloc_token_id(dev, flag, NULL);
39ee38e13c0fb8 Wen Chen 2025-11-12  136  		if (IS_ERR_OR_NULL(tmp_cfg.token_id)) {
39ee38e13c0fb8 Wen Chen 2025-11-12  137  			ubcore_log_err("alloc token id failed.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12  138  			return (void *)tmp_cfg.token_id;
39ee38e13c0fb8 Wen Chen 2025-11-12  139  		}
39ee38e13c0fb8 Wen Chen 2025-11-12  140  	}
39ee38e13c0fb8 Wen Chen 2025-11-12  141  
39ee38e13c0fb8 Wen Chen 2025-11-12  142  	tseg = dev->ops->register_seg(dev, &tmp_cfg, udata);
39ee38e13c0fb8 Wen Chen 2025-11-12  143  	if (IS_ERR_OR_NULL(tseg)) {
39ee38e13c0fb8 Wen Chen 2025-11-12  144  		ubcore_log_err_rl("UBEP failed to register segment.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12  145  		if (alloc_token_id == true)
39ee38e13c0fb8 Wen Chen 2025-11-12  146  			(void)ubcore_free_token_id(tmp_cfg.token_id);
39ee38e13c0fb8 Wen Chen 2025-11-12  147  		return UBCORE_CHECK_RETURN_ERR_PTR(tseg, ENOEXEC);
39ee38e13c0fb8 Wen Chen 2025-11-12  148  	}
39ee38e13c0fb8 Wen Chen 2025-11-12  149  
39ee38e13c0fb8 Wen Chen 2025-11-12  150  	tseg->ub_dev = dev;
39ee38e13c0fb8 Wen Chen 2025-11-12  151  	tseg->uctx = ubcore_get_uctx(udata);
39ee38e13c0fb8 Wen Chen 2025-11-12  152  	tseg->seg.len = tmp_cfg.len;
39ee38e13c0fb8 Wen Chen 2025-11-12  153  	tseg->seg.ubva.va = tmp_cfg.va;
39ee38e13c0fb8 Wen Chen 2025-11-12  154  	tseg->token_id = tmp_cfg.token_id;
39ee38e13c0fb8 Wen Chen 2025-11-12  155  
39ee38e13c0fb8 Wen Chen 2025-11-12  156  	(void)memcpy(tseg->seg.ubva.eid.raw,
39ee38e13c0fb8 Wen Chen 2025-11-12  157  		     dev->eid_table.eid_entries[cfg->eid_index].eid.raw,
39ee38e13c0fb8 Wen Chen 2025-11-12  158  		     UBCORE_EID_SIZE);
39ee38e13c0fb8 Wen Chen 2025-11-12  159  	(void)memcpy(&tseg->seg.attr, &cfg->flag,
39ee38e13c0fb8 Wen Chen 2025-11-12  160  		     sizeof(union ubcore_reg_seg_flag));
39ee38e13c0fb8 Wen Chen 2025-11-12  161  	tseg->seg.attr.bs.user_token_id = tmp_cfg.flag.bs.token_id_valid;
39ee38e13c0fb8 Wen Chen 2025-11-12  162  	atomic_set(&tseg->use_cnt, 0);
39ee38e13c0fb8 Wen Chen 2025-11-12  163  	if (tseg->token_id != NULL)
39ee38e13c0fb8 Wen Chen 2025-11-12  164  		atomic_inc(&tseg->token_id->use_cnt);
39ee38e13c0fb8 Wen Chen 2025-11-12  165  
39ee38e13c0fb8 Wen Chen 2025-11-12  166  	return tseg;
39ee38e13c0fb8 Wen Chen 2025-11-12  167  }
39ee38e13c0fb8 Wen Chen 2025-11-12  168  EXPORT_SYMBOL(ubcore_register_seg);
39ee38e13c0fb8 Wen Chen 2025-11-12  169  
39ee38e13c0fb8 Wen Chen 2025-11-12 @170  int ubcore_unregister_seg(struct ubcore_target_seg *tseg)
39ee38e13c0fb8 Wen Chen 2025-11-12  171  {
39ee38e13c0fb8 Wen Chen 2025-11-12  172  	struct ubcore_token_id *token_id = NULL;
39ee38e13c0fb8 Wen Chen 2025-11-12  173  	bool free_token_id = false;
39ee38e13c0fb8 Wen Chen 2025-11-12  174  	struct ubcore_device *dev;
39ee38e13c0fb8 Wen Chen 2025-11-12  175  	int ret;
39ee38e13c0fb8 Wen Chen 2025-11-12  176  
39ee38e13c0fb8 Wen Chen 2025-11-12  177  	if (tseg == NULL || tseg->ub_dev == NULL || tseg->ub_dev->ops == NULL ||
39ee38e13c0fb8 Wen Chen 2025-11-12  178  	    tseg->ub_dev->ops->unregister_seg == NULL) {
39ee38e13c0fb8 Wen Chen 2025-11-12  179  		ubcore_log_err("invalid parameter.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12  180  		return -EINVAL;
39ee38e13c0fb8 Wen Chen 2025-11-12  181  	}
39ee38e13c0fb8 Wen Chen 2025-11-12  182  
39ee38e13c0fb8 Wen Chen 2025-11-12  183  	dev = tseg->ub_dev;
39ee38e13c0fb8 Wen Chen 2025-11-12  184  
39ee38e13c0fb8 Wen Chen 2025-11-12  185  	if (tseg->token_id != NULL)
39ee38e13c0fb8 Wen Chen 2025-11-12  186  		atomic_dec(&tseg->token_id->use_cnt);
39ee38e13c0fb8 Wen Chen 2025-11-12  187  
39ee38e13c0fb8 Wen Chen 2025-11-12  188  	if (tseg->seg.attr.bs.user_token_id == UBCORE_TOKEN_ID_INVALID &&
39ee38e13c0fb8 Wen Chen 2025-11-12  189  	    dev->transport_type == UBCORE_TRANSPORT_UB &&
39ee38e13c0fb8 Wen Chen 2025-11-12  190  	    tseg->token_id != NULL && tseg->uctx == NULL) {
39ee38e13c0fb8 Wen Chen 2025-11-12  191  		free_token_id = true;
39ee38e13c0fb8 Wen Chen 2025-11-12  192  		token_id = tseg->token_id;
39ee38e13c0fb8 Wen Chen 2025-11-12  193  	}
39ee38e13c0fb8 Wen Chen 2025-11-12  194  
39ee38e13c0fb8 Wen Chen 2025-11-12  195  	ret = dev->ops->unregister_seg(tseg);
39ee38e13c0fb8 Wen Chen 2025-11-12  196  
39ee38e13c0fb8 Wen Chen 2025-11-12  197  	if (free_token_id == true && token_id != NULL)
39ee38e13c0fb8 Wen Chen 2025-11-12  198  		(void)ubcore_free_token_id(token_id);
39ee38e13c0fb8 Wen Chen 2025-11-12  199  
39ee38e13c0fb8 Wen Chen 2025-11-12  200  	return ret;
39ee38e13c0fb8 Wen Chen 2025-11-12  201  }
39ee38e13c0fb8 Wen Chen 2025-11-12  202  EXPORT_SYMBOL(ubcore_unregister_seg);
39ee38e13c0fb8 Wen Chen 2025-11-12  203  
39ee38e13c0fb8 Wen Chen 2025-11-12 @204  struct ubcore_target_seg *ubcore_import_seg(struct ubcore_device *dev,
39ee38e13c0fb8 Wen Chen 2025-11-12  205  					    struct ubcore_target_seg_cfg *cfg,
39ee38e13c0fb8 Wen Chen 2025-11-12  206  					    struct ubcore_udata *udata)
39ee38e13c0fb8 Wen Chen 2025-11-12  207  {
39ee38e13c0fb8 Wen Chen 2025-11-12  208  	struct ubcore_target_seg *tseg;
39ee38e13c0fb8 Wen Chen 2025-11-12  209  
39ee38e13c0fb8 Wen Chen 2025-11-12  210  	if (dev == NULL || cfg == NULL || dev->ops == NULL ||
39ee38e13c0fb8 Wen Chen 2025-11-12  211  	    dev->ops->import_seg == NULL || dev->ops->unimport_seg == NULL) {
39ee38e13c0fb8 Wen Chen 2025-11-12  212  		ubcore_log_err("invalid parameter.\n");
39ee38e13c0fb8 Wen Chen 2025-11-12  213  		return ERR_PTR(-EINVAL);
39ee38e13c0fb8 Wen Chen 2025-11-12  214  	}
39ee38e13c0fb8 Wen Chen 2025-11-12  215  
39ee38e13c0fb8 Wen Chen 2025-11-12  216  	if (ubcore_is_bonding_dev(dev)) {
39ee38e13c0fb8 Wen Chen 2025-11-12  217  		if (ubcore_connect_exchange_udata_when_import_seg(&cfg->seg,
39ee38e13c0fb8 Wen Chen 2025-11-12  218  								  udata) != 0) {
39ee38e13c0fb8 Wen Chen 2025-11-12  219  			ubcore_log_err(
39ee38e13c0fb8 Wen Chen 2025-11-12  220  				"failed to exchange udata when import seg\n");
39ee38e13c0fb8 Wen Chen 2025-11-12  221  			return ERR_PTR(-ENOEXEC);
39ee38e13c0fb8 Wen Chen 2025-11-12  222  		}
39ee38e13c0fb8 Wen Chen 2025-11-12  223  	}
39ee38e13c0fb8 Wen Chen 2025-11-12  224  
39ee38e13c0fb8 Wen Chen 2025-11-12  225  	tseg = dev->ops->import_seg(dev, cfg, udata);
39ee38e13c0fb8 Wen Chen 2025-11-12  226  	if (IS_ERR_OR_NULL(tseg)) {
39ee38e13c0fb8 Wen Chen 2025-11-12  227  		ubcore_log_err("UBEP failed to import segment with va\n");
39ee38e13c0fb8 Wen Chen 2025-11-12  228  		return UBCORE_CHECK_RETURN_ERR_PTR(tseg, ENOEXEC);
39ee38e13c0fb8 Wen Chen 2025-11-12  229  	}
39ee38e13c0fb8 Wen Chen 2025-11-12  230  	tseg->ub_dev = dev;
39ee38e13c0fb8 Wen Chen 2025-11-12  231  	tseg->uctx = ubcore_get_uctx(udata);
39ee38e13c0fb8 Wen Chen 2025-11-12  232  	tseg->seg = cfg->seg;
39ee38e13c0fb8 Wen Chen 2025-11-12  233  	atomic_set(&tseg->use_cnt, 0);
39ee38e13c0fb8 Wen Chen 2025-11-12  234  
39ee38e13c0fb8 Wen Chen 2025-11-12  235  	return tseg;
39ee38e13c0fb8 Wen Chen 2025-11-12  236  }
39ee38e13c0fb8 Wen Chen 2025-11-12  237  EXPORT_SYMBOL(ubcore_import_seg);
39ee38e13c0fb8 Wen Chen 2025-11-12  238  

:::::: The code at line 20 was first introduced by commit
:::::: 39ee38e13c0fb848b3c1218b130ec629e82b1f72 ubcore: add segment management support to ubcore module.

:::::: TO: Wen Chen <chenwen54@huawei.com>
:::::: CC: Yongqiang Guo <guoyongqiang12@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
