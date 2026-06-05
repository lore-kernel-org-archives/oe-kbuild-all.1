Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3DE3B71C0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 10:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780654720; cv=none; b=dBxjm0MFc5YfNiyXgIKs1cuHQxGZqIEhiswnaoz8SUBjFnewqNQZzSZlcDEtUxnxGSLGSCtJErjaxB+cRlTNsN/Py1ar8X67Xd3ebBl4Y5UUUJviPxO65Q0YZ2Ky0BtCqMYzR5RLxy9TrlMb1z2gH3E85or1L7EZIa1cqhJtUE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780654720; c=relaxed/simple;
	bh=+ucqhbURkdIFMhGUk0U4xjWR8KIS0zaxZ0/FGSv9sZk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bm8fuDg/WKojaadC4QxEgJAtTOp5ABXUdvyfcoXanV5DkdgDfxzJiPLvHk423O/ZBENwvK3j7MuSEwMNi5QVGMoF2SsXuNmnkD3Xn43ux59ZjPLaXWKZ9cmWcIllq42/hThEpYFH+OG0shdUGyBsspHVhOLhjcXkuRer9uO0wME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbejiVJK; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbejiVJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780654719; x=1812190719;
  h=date:from:to:cc:subject:message-id;
  bh=+ucqhbURkdIFMhGUk0U4xjWR8KIS0zaxZ0/FGSv9sZk=;
  b=PbejiVJKKokckQF/fqPLMJuJgiSLnKm73SMtT5rQagCw+7lm2BIoa7yy
   CUxXlQpiaClY+G10UumKxu2v9tUvT+Fhwb0BYE6rkwdckFHC6swnGp8zp
   T+H9SzP0rnKET8rPp+8NRUfcIuZZxPw7DQgF9XITvHK0Litq+Y4ce99Ef
   W4rlaYwK/f7W57nmTh4Mj0AMfAKmDDaEjPt9xo7qg/fm4spWUawv/PuTH
   a8kijpzu1e6WBW11Ef20df69cZAE//OGzb6cBRvG629cV1sWTQmRY8K4e
   Mc/lFkCE4PK8Wlj+pG6P8dEUbAPu60eVnAiBGHH6Ujc98cz5V6zxuJZjh
   Q==;
X-CSE-ConnectionGUID: oP4vKR0yT3WnO4B4VDvdDw==
X-CSE-MsgGUID: Felodi23QiWBX4pNao23uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="104152080"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="104152080"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 03:18:35 -0700
X-CSE-ConnectionGUID: oMMlzhsVQwehi3VbfFesJQ==
X-CSE-MsgGUID: Y/+uyPZFSOe9Rw3dpXCXWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="238452337"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2026 03:18:34 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVRdI-00000000Fr0-06Z3;
	Fri, 05 Jun 2026 10:18:32 +0000
Date: Fri, 05 Jun 2026 18:17:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-wireless-next-main 5/5]
 net/mac80211/mesh_hwmp.c:419:31: error: 'prep_elem_bottom' undeclared; did
 you mean 'prep_elem_top'?
Message-ID: <202606051835.vv2BnM5J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-wireless-next-main
head:   a26c2a22e7e88b2b5afb1349f3994fc564c988b1
commit: a91c65cb99d1e03c8d8f0244258cbdd2d60faa86 [5/5] wifi: mac80211: Use struct instead of macro for PREP frame
config: arm64-randconfig-001-20260605 (https://download.01.org/0day-ci/archive/20260605/202606051835.vv2BnM5J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051835.vv2BnM5J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051835.vv2BnM5J-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/mac80211/mesh_hwmp.c: In function 'hwmp_route_info_get':
   net/mac80211/mesh_hwmp.c:395:3: error: a label can only be part of a statement and a declaration is not a statement
      struct ieee80211_mesh_hwmp_preq_top *preq_elem_top =
      ^~~~~~
   net/mac80211/mesh_hwmp.c:397:3: error: expected expression before 'struct'
      struct ieee80211_mesh_hwmp_preq_bottom *preq_elem_bottom =
      ^~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/arm64/include/uapi/asm/byteorder.h:23,
                    from include/asm-generic/qrwlock_types.h:6,
                    from arch/arm64/include/asm/spinlock_types.h:13,
                    from include/linux/spinlock_types_raw.h:7,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/slab.h:15,
                    from net/mac80211/mesh_hwmp.c:8:
   net/mac80211/mesh_hwmp.c:402:31: error: 'preq_elem_bottom' undeclared (first use in this function); did you mean 'preq_elem_top'?
      orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
                                  ^~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                      ^
   net/mac80211/mesh_hwmp.c:402:19: note: in expansion of macro 'le32_to_cpu'
      orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
                      ^~~~~~~~~~~
   net/mac80211/mesh_hwmp.c:402:31: note: each undeclared identifier is reported only once for each function it appears in
      orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
                                  ^~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                      ^
   net/mac80211/mesh_hwmp.c:402:19: note: in expansion of macro 'le32_to_cpu'
      orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
                      ^~~~~~~~~~~
   net/mac80211/mesh_hwmp.c:412:3: error: a label can only be part of a statement and a declaration is not a statement
      struct ieee80211_mesh_hwmp_prep_top *prep_elem_top =
      ^~~~~~
   net/mac80211/mesh_hwmp.c:414:3: error: expected expression before 'struct'
      struct ieee80211_mesh_hwmp_prep_bottom *prep_elem_bottom =
      ^~~~~~
   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/arm64/include/uapi/asm/byteorder.h:23,
                    from include/asm-generic/qrwlock_types.h:6,
                    from arch/arm64/include/asm/spinlock_types.h:13,
                    from include/linux/spinlock_types_raw.h:7,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/slab.h:15,
                    from net/mac80211/mesh_hwmp.c:8:
>> net/mac80211/mesh_hwmp.c:419:31: error: 'prep_elem_bottom' undeclared (first use in this function); did you mean 'prep_elem_top'?
      orig_lifetime = le32_to_cpu(prep_elem_bottom->lifetime);
                                  ^~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                      ^
   net/mac80211/mesh_hwmp.c:419:19: note: in expansion of macro 'le32_to_cpu'
      orig_lifetime = le32_to_cpu(prep_elem_bottom->lifetime);
                      ^~~~~~~~~~~


vim +419 net/mac80211/mesh_hwmp.c

   348	
   349	/**
   350	 * hwmp_route_info_get - Update routing info to originator and transmitter
   351	 *
   352	 * @sdata: local mesh subif
   353	 * @mgmt: mesh management frame
   354	 * @hwmp_ie: hwmp information element (PREP or PREQ)
   355	 * @action: type of hwmp ie
   356	 *
   357	 * This function updates the path routing information to the originator and the
   358	 * transmitter of a HWMP PREQ or PREP frame.
   359	 *
   360	 * Returns: metric to frame originator or 0 if the frame should not be further
   361	 * processed
   362	 *
   363	 * Notes: this function is the only place (besides user-provided info) where
   364	 * path routing information is updated.
   365	 */
   366	static u32 hwmp_route_info_get(struct ieee80211_sub_if_data *sdata,
   367				       struct ieee80211_mgmt *mgmt,
   368				       const u8 *hwmp_ie, enum mpath_frame_type action)
   369	{
   370		struct ieee80211_local *local = sdata->local;
   371		struct mesh_path *mpath;
   372		struct sta_info *sta;
   373		bool fresh_info;
   374		const u8 *orig_addr, *ta;
   375		u32 orig_sn, orig_metric;
   376		unsigned long orig_lifetime, exp_time;
   377		u32 last_hop_metric, new_metric;
   378		bool flush_mpath = false;
   379		bool process = true;
   380		u8 hopcount;
   381	
   382		rcu_read_lock();
   383		sta = sta_info_get(sdata, mgmt->sa);
   384		if (!sta) {
   385			rcu_read_unlock();
   386			return 0;
   387		}
   388	
   389		last_hop_metric = airtime_link_metric_get(local, sta);
   390		/* Update and check originator routing info */
   391		fresh_info = true;
   392	
   393		switch (action) {
   394		case MPATH_PREQ:
   395			struct ieee80211_mesh_hwmp_preq_top *preq_elem_top =
   396				(void *)hwmp_ie;
   397			struct ieee80211_mesh_hwmp_preq_bottom *preq_elem_bottom =
   398				ieee80211_mesh_hwmp_preq_get_bottom(hwmp_ie);
   399	
   400			orig_addr = preq_elem_top->orig_addr;
   401			orig_sn = le32_to_cpu(preq_elem_top->orig_sn);
   402			orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
   403			orig_metric = le32_to_cpu(preq_elem_bottom->metric);
   404			hopcount = preq_elem_top->hopcount + 1;
   405			break;
   406		case MPATH_PREP:
   407			/* Originator here refers to the MP that was the target in the
   408			 * Path Request. We divert from the nomenclature in the draft
   409			 * so that we can easily use a single function to gather path
   410			 * information from both PREQ and PREP frames.
   411			 */
   412			struct ieee80211_mesh_hwmp_prep_top *prep_elem_top =
   413				(void *)hwmp_ie;
   414			struct ieee80211_mesh_hwmp_prep_bottom *prep_elem_bottom =
   415				ieee80211_mesh_hwmp_prep_get_bottom(hwmp_ie);
   416	
   417			orig_addr = prep_elem_top->target_addr;
   418			orig_sn = le32_to_cpu(prep_elem_top->target_sn);
 > 419			orig_lifetime = le32_to_cpu(prep_elem_bottom->lifetime);
   420			orig_metric = le32_to_cpu(prep_elem_bottom->metric);
   421			hopcount = prep_elem_top->hopcount + 1;
   422			break;
   423		default:
   424			rcu_read_unlock();
   425			return 0;
   426		}
   427		new_metric = orig_metric + last_hop_metric;
   428		if (new_metric < orig_metric)
   429			new_metric = MAX_METRIC;
   430		exp_time = TU_TO_EXP_TIME(orig_lifetime);
   431	
   432		if (ether_addr_equal(orig_addr, sdata->vif.addr)) {
   433			/* This MP is the originator, we are not interested in this
   434			 * frame, except for updating transmitter's path info.
   435			 */
   436			process = false;
   437			fresh_info = false;
   438		} else {
   439			mpath = mesh_path_lookup(sdata, orig_addr);
   440			if (mpath) {
   441				spin_lock_bh(&mpath->state_lock);
   442				if (mpath->flags & MESH_PATH_FIXED)
   443					fresh_info = false;
   444				else if ((mpath->flags & MESH_PATH_ACTIVE) &&
   445				    (mpath->flags & MESH_PATH_SN_VALID)) {
   446					if (SN_GT(mpath->sn, orig_sn) ||
   447					    (mpath->sn == orig_sn &&
   448					     (rcu_access_pointer(mpath->next_hop) !=
   449							      sta ?
   450						      !is_metric_better(new_metric, mpath->metric) :
   451						      new_metric >= mpath->metric))) {
   452						process = false;
   453						fresh_info = false;
   454					}
   455				} else if (!(mpath->flags & MESH_PATH_ACTIVE)) {
   456					bool have_sn, newer_sn, bounced;
   457	
   458					have_sn = mpath->flags & MESH_PATH_SN_VALID;
   459					newer_sn = have_sn && SN_GT(orig_sn, mpath->sn);
   460					bounced = have_sn &&
   461						  (SN_DELTA(orig_sn, mpath->sn) >
   462								MAX_SANE_SN_DELTA);
   463	
   464					if (!have_sn || newer_sn) {
   465						/* if SN is newer than what we had
   466						 * then we can take it */;
   467					} else if (bounced) {
   468						/* if SN is way different than what
   469						 * we had then assume the other side
   470						 * rebooted or restarted */;
   471					} else {
   472						process = false;
   473						fresh_info = false;
   474					}
   475				}
   476			} else {
   477				mpath = mesh_path_add(sdata, orig_addr);
   478				if (IS_ERR(mpath)) {
   479					rcu_read_unlock();
   480					return 0;
   481				}
   482				spin_lock_bh(&mpath->state_lock);
   483			}
   484	
   485			if (fresh_info) {
   486				if (rcu_access_pointer(mpath->next_hop) != sta) {
   487					mpath->path_change_count++;
   488					flush_mpath = true;
   489				}
   490				mesh_path_assign_nexthop(mpath, sta);
   491				mpath->flags |= MESH_PATH_SN_VALID;
   492				mpath->metric = new_metric;
   493				mpath->sn = orig_sn;
   494				mpath->exp_time = time_after(mpath->exp_time, exp_time)
   495						  ?  mpath->exp_time : exp_time;
   496				mpath->hop_count = hopcount;
   497				mesh_path_activate(mpath);
   498				spin_unlock_bh(&mpath->state_lock);
   499				if (flush_mpath)
   500					mesh_fast_tx_flush_mpath(mpath);
   501				ewma_mesh_fail_avg_init(&sta->mesh->fail_avg);
   502				/* init it at a low value - 0 start is tricky */
   503				ewma_mesh_fail_avg_add(&sta->mesh->fail_avg, 1);
   504				mesh_path_tx_pending(mpath);
   505				/* draft says preq_id should be saved to, but there does
   506				 * not seem to be any use for it, skipping by now
   507				 */
   508			} else
   509				spin_unlock_bh(&mpath->state_lock);
   510		}
   511	
   512		/* Update and check transmitter routing info */
   513		ta = mgmt->sa;
   514		if (ether_addr_equal(orig_addr, ta))
   515			fresh_info = false;
   516		else {
   517			fresh_info = true;
   518	
   519			mpath = mesh_path_lookup(sdata, ta);
   520			if (mpath) {
   521				spin_lock_bh(&mpath->state_lock);
   522				if ((mpath->flags & MESH_PATH_FIXED) ||
   523				    ((mpath->flags & MESH_PATH_ACTIVE) &&
   524				     ((rcu_access_pointer(mpath->next_hop) != sta ?
   525					      !is_metric_better(last_hop_metric, mpath->metric) :
   526					       last_hop_metric > mpath->metric))))
   527					fresh_info = false;
   528			} else {
   529				mpath = mesh_path_add(sdata, ta);
   530				if (IS_ERR(mpath)) {
   531					rcu_read_unlock();
   532					return 0;
   533				}
   534				spin_lock_bh(&mpath->state_lock);
   535			}
   536	
   537			if (fresh_info) {
   538				if (rcu_access_pointer(mpath->next_hop) != sta) {
   539					mpath->path_change_count++;
   540					flush_mpath = true;
   541				}
   542				mesh_path_assign_nexthop(mpath, sta);
   543				mpath->metric = last_hop_metric;
   544				mpath->exp_time = time_after(mpath->exp_time, exp_time)
   545						  ?  mpath->exp_time : exp_time;
   546				mpath->hop_count = 1;
   547				mesh_path_activate(mpath);
   548				spin_unlock_bh(&mpath->state_lock);
   549				if (flush_mpath)
   550					mesh_fast_tx_flush_mpath(mpath);
   551				ewma_mesh_fail_avg_init(&sta->mesh->fail_avg);
   552				/* init it at a low value - 0 start is tricky */
   553				ewma_mesh_fail_avg_add(&sta->mesh->fail_avg, 1);
   554				mesh_path_tx_pending(mpath);
   555			} else
   556				spin_unlock_bh(&mpath->state_lock);
   557		}
   558	
   559		rcu_read_unlock();
   560	
   561		return process ? new_metric : 0;
   562	}
   563	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
