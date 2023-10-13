Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E448219F9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 22:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQ6baiG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697236262; x=1728772262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gfMw/c/rCJjpy925BVdnAy2o3oIFYnLjXHU6R3XlwM=;
  b=EQ6baiG+M1StTCG2489ayb5TscIpklIadEmoZT7EvXbzQDwhFhYVWc0E
   NrcUrWicB+MFcn2N2La6eSZrYVylOQ9MMRCXn7zShgRv/DhUj/9rhVIhn
   RL7FvpzW1sN5ynUJfofAOziEHy55c81XUOeDLFAVqnB7vA44E6DxKvdIl
   7CStX9EDPZz9QzF4dx9xsqt5mLPgBQmwAO2sAqgFFQazTvnyGwmV9zvmX
   8+WRew/6vVoUe+nQionS4nvBpzLaQ6hSbuopR3Tk/zsLHmwKNPt6fucn4
   QQZqqxHBEfssnfpMMrjOIonWhcveWKfZIWmrC5hKs59cbsgPmvIdMsAGY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388131431"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388131431"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 15:30:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871257782"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="871257782"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 15:30:56 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrQgI-0005TH-2V;
	Fri, 13 Oct 2023 22:30:54 +0000
Date: Sat, 14 Oct 2023 06:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, David Wei <davidhwei@meta.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Vasundhara Volam <vasundhara-v.volam@broadcom.com>
Subject: [isilence:zc/veth 989/1018]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:13325:37: error: implicit
 declaration of function 'rps_may_expire_flow'
Message-ID: <202310140644.V8N2rG2W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: 99ad5c87e39c24a0ee3b1f41edc8c853c498e463 [989/1018] bnxt: Refactor filter insertion logic in bnxt_rx_flow_steer().
config: csky-randconfig-001-20231014 (https://download.01.org/0day-ci/archive/20231014/202310140644.V8N2rG2W-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140644.V8N2rG2W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140644.V8N2rG2W-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_request_irq':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9595:16: warning: variable 'j' set but not used [-Wunused-but-set-variable]
    9595 |         int i, j, rc = 0;
         |                ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_cfg_ntp_filters':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:13325:37: error: implicit declaration of function 'rps_may_expire_flow' [-Werror=implicit-function-declaration]
   13325 |                                 if (rps_may_expire_flow(bp->dev, fltr->base.rxq,
         |                                     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_setup_int_mode':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9305:48: warning: '%s' directive output may be truncated writing 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
    9305 |         snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |                                                ^~                     ~~~~~~
   In function 'bnxt_setup_inta',
       inlined from 'bnxt_setup_int_mode' at drivers/net/ethernet/broadcom/bnxt/bnxt.c:9325:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9305:9: note: 'snprintf' output between 8 and 23 bytes into a destination of size 18
    9305 |         snprintf(bp->irq_tbl[0].name, len, "%s-%s-%d", bp->dev->name, "TxRx",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    9306 |                  0);
         |                  ~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_setup_int_mode':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9292:62: warning: '%s' directive output may be truncated writing between 2 and 4 bytes into a region of size between 2 and 17 [-Wformat-truncation=]
    9292 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                                                              ^~
   In function 'bnxt_setup_msix',
       inlined from 'bnxt_setup_int_mode' at drivers/net/ethernet/broadcom/bnxt/bnxt.c:9323:3:
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9292:58: note: directive argument in the range [-2147483641, 2147483646]
    9292 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                                                          ^~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:9292:17: note: 'snprintf' output between 6 and 33 bytes into a destination of size 18
    9292 |                 snprintf(bp->irq_tbl[map_idx].name, len, "%s-%s-%d", dev->name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    9293 |                          attr, i);
         |                          ~~~~~~~~
   cc1: some warnings being treated as errors


vim +/rps_may_expire_flow +13325 drivers/net/ethernet/broadcom/bnxt/bnxt.c

c0c050c58d84099 Michael Chan   2015-10-22  13284  
c0c050c58d84099 Michael Chan   2015-10-22  13285  static void bnxt_cfg_ntp_filters(struct bnxt *bp)
c0c050c58d84099 Michael Chan   2015-10-22  13286  {
c0c050c58d84099 Michael Chan   2015-10-22  13287  	int i;
c0c050c58d84099 Michael Chan   2015-10-22  13288  
86984372a612499 Pavan Chebbi   2023-01-05  13289  	for (i = 0; i < BNXT_L2_FLTR_HASH_SIZE; i++) {
86984372a612499 Pavan Chebbi   2023-01-05  13290  		struct hlist_head *head;
86984372a612499 Pavan Chebbi   2023-01-05  13291  		struct hlist_node *tmp;
86984372a612499 Pavan Chebbi   2023-01-05  13292  		struct bnxt_l2_filter *fltr;
86984372a612499 Pavan Chebbi   2023-01-05  13293  
86984372a612499 Pavan Chebbi   2023-01-05  13294  		head = &bp->l2_fltr_hash_tbl[i];
86984372a612499 Pavan Chebbi   2023-01-05  13295  		hlist_for_each_entry_safe(fltr, tmp, head, base.hash) {
86984372a612499 Pavan Chebbi   2023-01-05  13296  			if (fltr->base.flags & BNXT_ACT_FUNC_DST) {
86984372a612499 Pavan Chebbi   2023-01-05  13297  				u16 vf_idx = fltr->base.vf_idx;
86984372a612499 Pavan Chebbi   2023-01-05  13298  
86984372a612499 Pavan Chebbi   2023-01-05  13299  				if (bnxt_vf_vnic_state_is_up(bp, vf_idx))
86984372a612499 Pavan Chebbi   2023-01-05  13300  					continue;
86984372a612499 Pavan Chebbi   2023-01-05  13301  
86984372a612499 Pavan Chebbi   2023-01-05  13302  				spin_lock_bh(&bp->ntp_fltr_lock);
86984372a612499 Pavan Chebbi   2023-01-05  13303  				if (!test_and_clear_bit(BNXT_FLTR_INSERTED,
86984372a612499 Pavan Chebbi   2023-01-05  13304  							&fltr->base.state)) {
86984372a612499 Pavan Chebbi   2023-01-05  13305  					spin_unlock_bh(&bp->ntp_fltr_lock);
86984372a612499 Pavan Chebbi   2023-01-05  13306  					continue;
86984372a612499 Pavan Chebbi   2023-01-05  13307  				}
86984372a612499 Pavan Chebbi   2023-01-05  13308  				hlist_del_rcu(&fltr->base.hash);
86984372a612499 Pavan Chebbi   2023-01-05  13309  				spin_unlock_bh(&bp->ntp_fltr_lock);
86984372a612499 Pavan Chebbi   2023-01-05  13310  				bnxt_del_l2_filter(bp, fltr);
86984372a612499 Pavan Chebbi   2023-01-05  13311  			}
86984372a612499 Pavan Chebbi   2023-01-05  13312  		}
86984372a612499 Pavan Chebbi   2023-01-05  13313  	}
c0c050c58d84099 Michael Chan   2015-10-22  13314  	for (i = 0; i < BNXT_NTP_FLTR_HASH_SIZE; i++) {
c0c050c58d84099 Michael Chan   2015-10-22  13315  		struct hlist_head *head;
c0c050c58d84099 Michael Chan   2015-10-22  13316  		struct hlist_node *tmp;
c0c050c58d84099 Michael Chan   2015-10-22  13317  		struct bnxt_ntuple_filter *fltr;
c0c050c58d84099 Michael Chan   2015-10-22  13318  		int rc;
c0c050c58d84099 Michael Chan   2015-10-22  13319  
c0c050c58d84099 Michael Chan   2015-10-22  13320  		head = &bp->ntp_fltr_hash_tbl[i];
61644dbc79b723d Pavan Chebbi   2023-01-04  13321  		hlist_for_each_entry_safe(fltr, tmp, head, base.hash) {
c0c050c58d84099 Michael Chan   2015-10-22  13322  			bool del = false;
c0c050c58d84099 Michael Chan   2015-10-22  13323  
61644dbc79b723d Pavan Chebbi   2023-01-04  13324  			if (test_bit(BNXT_FLTR_VALID, &fltr->base.state)) {
61644dbc79b723d Pavan Chebbi   2023-01-04 @13325  				if (rps_may_expire_flow(bp->dev, fltr->base.rxq,
c0c050c58d84099 Michael Chan   2015-10-22  13326  							fltr->flow_id,
61644dbc79b723d Pavan Chebbi   2023-01-04  13327  							fltr->base.sw_id)) {
c0c050c58d84099 Michael Chan   2015-10-22  13328  					bnxt_hwrm_cfa_ntuple_filter_free(bp,
c0c050c58d84099 Michael Chan   2015-10-22  13329  									 fltr);
c0c050c58d84099 Michael Chan   2015-10-22  13330  					del = true;
c0c050c58d84099 Michael Chan   2015-10-22  13331  				}
c0c050c58d84099 Michael Chan   2015-10-22  13332  			} else {
c0c050c58d84099 Michael Chan   2015-10-22  13333  				rc = bnxt_hwrm_cfa_ntuple_filter_alloc(bp,
c0c050c58d84099 Michael Chan   2015-10-22  13334  								       fltr);
c0c050c58d84099 Michael Chan   2015-10-22  13335  				if (rc)
c0c050c58d84099 Michael Chan   2015-10-22  13336  					del = true;
c0c050c58d84099 Michael Chan   2015-10-22  13337  				else
61644dbc79b723d Pavan Chebbi   2023-01-04  13338  					set_bit(BNXT_FLTR_VALID, &fltr->base.state);
c0c050c58d84099 Michael Chan   2015-10-22  13339  			}
c0c050c58d84099 Michael Chan   2015-10-22  13340  
c0c050c58d84099 Michael Chan   2015-10-22  13341  			if (del) {
c0c050c58d84099 Michael Chan   2015-10-22  13342  				spin_lock_bh(&bp->ntp_fltr_lock);
53fd0968341023b Pavan Chebbi   2023-01-05  13343  				if (!test_and_clear_bit(BNXT_FLTR_INSERTED, &fltr->base.state)) {
53fd0968341023b Pavan Chebbi   2023-01-05  13344  					spin_unlock_bh(&bp->ntp_fltr_lock);
53fd0968341023b Pavan Chebbi   2023-01-05  13345  					continue;
53fd0968341023b Pavan Chebbi   2023-01-05  13346  				}
61644dbc79b723d Pavan Chebbi   2023-01-04  13347  				hlist_del_rcu(&fltr->base.hash);
c0c050c58d84099 Michael Chan   2015-10-22  13348  				bp->ntp_fltr_count--;
c0c050c58d84099 Michael Chan   2015-10-22  13349  				spin_unlock_bh(&bp->ntp_fltr_lock);
9c6b96acbe4adb3 Pavan Chebbi   2023-01-04  13350  				bnxt_del_l2_filter(bp, fltr->l2_fltr);
c0c050c58d84099 Michael Chan   2015-10-22  13351  				synchronize_rcu();
61644dbc79b723d Pavan Chebbi   2023-01-04  13352  				clear_bit(fltr->base.sw_id, bp->ntp_fltr_bmap);
c0c050c58d84099 Michael Chan   2015-10-22  13353  				kfree(fltr);
c0c050c58d84099 Michael Chan   2015-10-22  13354  			}
c0c050c58d84099 Michael Chan   2015-10-22  13355  		}
c0c050c58d84099 Michael Chan   2015-10-22  13356  	}
19241368443ff97 Jeffrey Huang  2016-02-26  13357  	if (test_and_clear_bit(BNXT_HWRM_PF_UNLOAD_SP_EVENT, &bp->sp_event))
9a005c3898aa07c Jonathan Lemon 2020-02-24  13358  		netdev_info(bp->dev, "Receive PF driver unload event!\n");
c0c050c58d84099 Michael Chan   2015-10-22  13359  }
c0c050c58d84099 Michael Chan   2015-10-22  13360  

:::::: The code at line 13325 was first introduced by commit
:::::: 61644dbc79b723d12edae403c245071432949631 bnxt: Refactor bnxt_ntuple_filter structure.

:::::: TO: Pavan Chebbi <pavan.chebbi@broadcom.com>
:::::: CC: David Wei <davidhwei@meta.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
