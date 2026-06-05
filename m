Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202A537AA72
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 06:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640480; cv=none; b=t4AATt9ocvXLeh1CXHpGkuRA1KwaeBOSjcX/OBdXQoxRHA29ljGvmLAK/xfVkAYTt4z1ybEnZrT8qXPZYyWFPnS21pcjVmVQtUxsxFSovNQuMpz0JvbNJKLuAGP9dd98F2p/VSeykJk5jmukB2Fpva4X6EfyvO1kApkT1uPG2OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640480; c=relaxed/simple;
	bh=t3BLP2QbwtgHnPePdBZZvIkp341ffQFCVWGxiK/1LMg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gZTaazXGorP9uiwzphBHq95TPPGR9+t+eFohyaftkQMIHjK8x63T0HZLZNG8GgjvSvcNvFzETvtgnKQ2Seifv+FSJofi0cZrzqMfN1yYgt3oHmD2xbGUNfwO1JRjQKq9PJvL7bjVehoD3egil1M39KY+9gtJ+lyQOhpYWn3nOM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OK+qw0fN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OK+qw0fN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780640479; x=1812176479;
  h=date:from:to:cc:subject:message-id;
  bh=t3BLP2QbwtgHnPePdBZZvIkp341ffQFCVWGxiK/1LMg=;
  b=OK+qw0fNKvNJ8puD1N2CLHJBnaqNURsAqrnncvrpOT88I03s3qcBZkyG
   bUOUyzh44bgyOHp9fQcqoJA0zKMII2jf5//+YhQOkDU1oV8xFHCt6JZuX
   eO3ezXicUu0bHkysHlxQeZ2gzCEIaDXsXgC8mDAOLVMqubnPeiRoQ1n7+
   tuG83MdjMdQfrJhd2jnsA9Jv/wlmGotEhWsgBwcJ7S5f9MPwshiQlSsWP
   XYcAPEPokJF8Ql53VqeshldVcfJyIIPoCtBxpUphlDMqwiWIWR8QNeoRD
   bwfcGC5wYSj0GZhzetsqyYdJPjfSbVWSywzKD/+dLDYsZUzqzCmV6c9pA
   g==;
X-CSE-ConnectionGUID: bgtHkvWfRI68UhdVbcZAsg==
X-CSE-MsgGUID: T4E+K9zdSKmvHFAxyuqikw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="92582381"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="92582381"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 23:21:18 -0700
X-CSE-ConnectionGUID: y6GAXnK9Q7G3ksCESEVlpw==
X-CSE-MsgGUID: gdBXP3fqRa+USr+RvYrUcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="268453695"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2026 23:21:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVNve-00000000FcQ-1mVK;
	Fri, 05 Jun 2026 06:21:14 +0000
Date: Fri, 05 Jun 2026 14:21:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-wireless-next-main 5/5]
 net/mac80211/mesh_hwmp.c:405:3: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202606051450.DX9mBmLK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-wireless-next-main
head:   a26c2a22e7e88b2b5afb1349f3994fc564c988b1
commit: 4ac20bd40b7db8568aea5ba1d390241842e41ed8 [5/5] wifi: mac80211: Use struct instead of macro for PREQ frame
config: arm64-randconfig-001-20260605 (https://download.01.org/0day-ci/archive/20260605/202606051450.DX9mBmLK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051450.DX9mBmLK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051450.DX9mBmLK-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/mac80211/mesh_hwmp.c: In function 'hwmp_route_info_get':
>> net/mac80211/mesh_hwmp.c:405:3: error: a label can only be part of a statement and a declaration is not a statement
      struct ieee80211_mesh_hwmp_preq_top *preq_elem_top =
      ^~~~~~
>> net/mac80211/mesh_hwmp.c:407:3: error: expected expression before 'struct'
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
>> net/mac80211/mesh_hwmp.c:412:31: error: 'preq_elem_bottom' undeclared (first use in this function); did you mean 'preq_elem_top'?
      orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
                                  ^~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                      ^
   net/mac80211/mesh_hwmp.c:412:19: note: in expansion of macro 'le32_to_cpu'
      orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
                      ^~~~~~~~~~~
   net/mac80211/mesh_hwmp.c:412:31: note: each undeclared identifier is reported only once for each function it appears in
      orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
                                  ^~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:35:51: note: in definition of macro '__le32_to_cpu'
    #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                      ^
   net/mac80211/mesh_hwmp.c:412:19: note: in expansion of macro 'le32_to_cpu'
      orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
                      ^~~~~~~~~~~


vim +405 net/mac80211/mesh_hwmp.c

   358	
   359	/**
   360	 * hwmp_route_info_get - Update routing info to originator and transmitter
   361	 *
   362	 * @sdata: local mesh subif
   363	 * @mgmt: mesh management frame
   364	 * @hwmp_ie: hwmp information element (PREP or PREQ)
   365	 * @action: type of hwmp ie
   366	 *
   367	 * This function updates the path routing information to the originator and the
   368	 * transmitter of a HWMP PREQ or PREP frame.
   369	 *
   370	 * Returns: metric to frame originator or 0 if the frame should not be further
   371	 * processed
   372	 *
   373	 * Notes: this function is the only place (besides user-provided info) where
   374	 * path routing information is updated.
   375	 */
   376	static u32 hwmp_route_info_get(struct ieee80211_sub_if_data *sdata,
   377				       struct ieee80211_mgmt *mgmt,
   378				       const u8 *hwmp_ie, enum mpath_frame_type action)
   379	{
   380		struct ieee80211_local *local = sdata->local;
   381		struct mesh_path *mpath;
   382		struct sta_info *sta;
   383		bool fresh_info;
   384		const u8 *orig_addr, *ta;
   385		u32 orig_sn, orig_metric;
   386		unsigned long orig_lifetime, exp_time;
   387		u32 last_hop_metric, new_metric;
   388		bool flush_mpath = false;
   389		bool process = true;
   390		u8 hopcount;
   391	
   392		rcu_read_lock();
   393		sta = sta_info_get(sdata, mgmt->sa);
   394		if (!sta) {
   395			rcu_read_unlock();
   396			return 0;
   397		}
   398	
   399		last_hop_metric = airtime_link_metric_get(local, sta);
   400		/* Update and check originator routing info */
   401		fresh_info = true;
   402	
   403		switch (action) {
   404		case MPATH_PREQ:
 > 405			struct ieee80211_mesh_hwmp_preq_top *preq_elem_top =
   406				(void *)hwmp_ie;
 > 407			struct ieee80211_mesh_hwmp_preq_bottom *preq_elem_bottom =
   408				ieee80211_mesh_hwmp_preq_get_bottom(hwmp_ie);
   409	
   410			orig_addr = preq_elem_top->orig_addr;
   411			orig_sn = le32_to_cpu(preq_elem_top->orig_sn);
 > 412			orig_lifetime = le32_to_cpu(preq_elem_bottom->lifetime);
   413			orig_metric = le32_to_cpu(preq_elem_bottom->metric);
   414			hopcount = preq_elem_top->hopcount + 1;
   415			break;
   416		case MPATH_PREP:
   417			/* Originator here refers to the MP that was the target in the
   418			 * Path Request. We divert from the nomenclature in the draft
   419			 * so that we can easily use a single function to gather path
   420			 * information from both PREQ and PREP frames.
   421			 */
   422			orig_addr = PREP_IE_TARGET_ADDR(hwmp_ie);
   423			orig_sn = PREP_IE_TARGET_SN(hwmp_ie);
   424			orig_lifetime = PREP_IE_LIFETIME(hwmp_ie);
   425			orig_metric = PREP_IE_METRIC(hwmp_ie);
   426			hopcount = PREP_IE_HOPCOUNT(hwmp_ie) + 1;
   427			break;
   428		default:
   429			rcu_read_unlock();
   430			return 0;
   431		}
   432		new_metric = orig_metric + last_hop_metric;
   433		if (new_metric < orig_metric)
   434			new_metric = MAX_METRIC;
   435		exp_time = TU_TO_EXP_TIME(orig_lifetime);
   436	
   437		if (ether_addr_equal(orig_addr, sdata->vif.addr)) {
   438			/* This MP is the originator, we are not interested in this
   439			 * frame, except for updating transmitter's path info.
   440			 */
   441			process = false;
   442			fresh_info = false;
   443		} else {
   444			mpath = mesh_path_lookup(sdata, orig_addr);
   445			if (mpath) {
   446				spin_lock_bh(&mpath->state_lock);
   447				if (mpath->flags & MESH_PATH_FIXED)
   448					fresh_info = false;
   449				else if ((mpath->flags & MESH_PATH_ACTIVE) &&
   450				    (mpath->flags & MESH_PATH_SN_VALID)) {
   451					if (SN_GT(mpath->sn, orig_sn) ||
   452					    (mpath->sn == orig_sn &&
   453					     (rcu_access_pointer(mpath->next_hop) !=
   454							      sta ?
   455						      !is_metric_better(new_metric, mpath->metric) :
   456						      new_metric >= mpath->metric))) {
   457						process = false;
   458						fresh_info = false;
   459					}
   460				} else if (!(mpath->flags & MESH_PATH_ACTIVE)) {
   461					bool have_sn, newer_sn, bounced;
   462	
   463					have_sn = mpath->flags & MESH_PATH_SN_VALID;
   464					newer_sn = have_sn && SN_GT(orig_sn, mpath->sn);
   465					bounced = have_sn &&
   466						  (SN_DELTA(orig_sn, mpath->sn) >
   467								MAX_SANE_SN_DELTA);
   468	
   469					if (!have_sn || newer_sn) {
   470						/* if SN is newer than what we had
   471						 * then we can take it */;
   472					} else if (bounced) {
   473						/* if SN is way different than what
   474						 * we had then assume the other side
   475						 * rebooted or restarted */;
   476					} else {
   477						process = false;
   478						fresh_info = false;
   479					}
   480				}
   481			} else {
   482				mpath = mesh_path_add(sdata, orig_addr);
   483				if (IS_ERR(mpath)) {
   484					rcu_read_unlock();
   485					return 0;
   486				}
   487				spin_lock_bh(&mpath->state_lock);
   488			}
   489	
   490			if (fresh_info) {
   491				if (rcu_access_pointer(mpath->next_hop) != sta) {
   492					mpath->path_change_count++;
   493					flush_mpath = true;
   494				}
   495				mesh_path_assign_nexthop(mpath, sta);
   496				mpath->flags |= MESH_PATH_SN_VALID;
   497				mpath->metric = new_metric;
   498				mpath->sn = orig_sn;
   499				mpath->exp_time = time_after(mpath->exp_time, exp_time)
   500						  ?  mpath->exp_time : exp_time;
   501				mpath->hop_count = hopcount;
   502				mesh_path_activate(mpath);
   503				spin_unlock_bh(&mpath->state_lock);
   504				if (flush_mpath)
   505					mesh_fast_tx_flush_mpath(mpath);
   506				ewma_mesh_fail_avg_init(&sta->mesh->fail_avg);
   507				/* init it at a low value - 0 start is tricky */
   508				ewma_mesh_fail_avg_add(&sta->mesh->fail_avg, 1);
   509				mesh_path_tx_pending(mpath);
   510				/* draft says preq_id should be saved to, but there does
   511				 * not seem to be any use for it, skipping by now
   512				 */
   513			} else
   514				spin_unlock_bh(&mpath->state_lock);
   515		}
   516	
   517		/* Update and check transmitter routing info */
   518		ta = mgmt->sa;
   519		if (ether_addr_equal(orig_addr, ta))
   520			fresh_info = false;
   521		else {
   522			fresh_info = true;
   523	
   524			mpath = mesh_path_lookup(sdata, ta);
   525			if (mpath) {
   526				spin_lock_bh(&mpath->state_lock);
   527				if ((mpath->flags & MESH_PATH_FIXED) ||
   528				    ((mpath->flags & MESH_PATH_ACTIVE) &&
   529				     ((rcu_access_pointer(mpath->next_hop) != sta ?
   530					      !is_metric_better(last_hop_metric, mpath->metric) :
   531					       last_hop_metric > mpath->metric))))
   532					fresh_info = false;
   533			} else {
   534				mpath = mesh_path_add(sdata, ta);
   535				if (IS_ERR(mpath)) {
   536					rcu_read_unlock();
   537					return 0;
   538				}
   539				spin_lock_bh(&mpath->state_lock);
   540			}
   541	
   542			if (fresh_info) {
   543				if (rcu_access_pointer(mpath->next_hop) != sta) {
   544					mpath->path_change_count++;
   545					flush_mpath = true;
   546				}
   547				mesh_path_assign_nexthop(mpath, sta);
   548				mpath->metric = last_hop_metric;
   549				mpath->exp_time = time_after(mpath->exp_time, exp_time)
   550						  ?  mpath->exp_time : exp_time;
   551				mpath->hop_count = 1;
   552				mesh_path_activate(mpath);
   553				spin_unlock_bh(&mpath->state_lock);
   554				if (flush_mpath)
   555					mesh_fast_tx_flush_mpath(mpath);
   556				ewma_mesh_fail_avg_init(&sta->mesh->fail_avg);
   557				/* init it at a low value - 0 start is tricky */
   558				ewma_mesh_fail_avg_add(&sta->mesh->fail_avg, 1);
   559				mesh_path_tx_pending(mpath);
   560			} else
   561				spin_unlock_bh(&mpath->state_lock);
   562		}
   563	
   564		rcu_read_unlock();
   565	
   566		return process ? new_metric : 0;
   567	}
   568	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
