Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00363AD23
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 01:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728091435; cv=none; b=bZaM68pidMjbGAyIzIsUuoSKfEqo7D7NA60skJOdpS80SAs3+qeIEUrkXGwRCfk42WjXiAYalreIEXszrBJA8u1Xvw5Ru/MkQrbY4UlEJM3Hl+Ua3Wkxzlf/CkzGZ6SKE+ZKTIWJTFxthD8vgVhnDDrkLcAFiz0Eh8cSMtrYvqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728091435; c=relaxed/simple;
	bh=3x+4r4dDaCC1yVRqmyi4uI1aae+dxTUIo6tYAh5L5ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgJZ/y4l3eUbm0lbIeI+QJnY3cBwDVQ70OtgLSBqN+Nh99OsSLk6n9bximpEpL6yfXm5E3MM0GMDjgDGSYqQXlze4ni2lBlMlnyjnm+ShpT5sydcxITbZ+b/J45IQ1CgXe16Oyfg6Qap7Zm/1HbqS0D9fhfZtmlpzHi+2aRGvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dh9OdPSk; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dh9OdPSk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728091434; x=1759627434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3x+4r4dDaCC1yVRqmyi4uI1aae+dxTUIo6tYAh5L5ug=;
  b=dh9OdPSknNRdUrxbK04rVnYKMG+M5aQlF5qnliD9IPOm2/+9k/t+S1rs
   bt2N3N0TP/n6MmVFRCGjAnNcqFCUCPw+A8V2BFIMxpf9IPqE2Dx2ggDPu
   if9ikTVuoWXnw4eTKzGlQnXLIibRT9BRSOSUecePKnxw78w2jfZP9wpt9
   W9UjVcoRJw/kMROhMKNIIP1AFBV43SRz2w9r+lN59LqQj+vZSL4hNlOUE
   hmfTweo6CIQmsuD/iLe+e54AwB3/oMlXLPbRjjLiSq+yWw4u7r7kiYKDs
   SMmInvCnSVgh68JJcT0ELq2ra0byuxj35CzPyjET5RVkQrGIQ4reQ9WVh
   w==;
X-CSE-ConnectionGUID: kYgq7ghxQn+pIRlXqmeO4w==
X-CSE-MsgGUID: 5YmRcVbrROaxRKoQrZA+zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31028302"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="31028302"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 18:23:52 -0700
X-CSE-ConnectionGUID: DfM0c8fpQnGkQB2pLOfrgw==
X-CSE-MsgGUID: xPaZ9UjfQbKJWTAEu6i+kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79644565"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Oct 2024 18:23:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swtWM-0002PO-0X;
	Sat, 05 Oct 2024 01:23:46 +0000
Date: Sat, 5 Oct 2024 09:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 12024/12031] block/blk-wbt.c:1016:70: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202410050954.JZPM54j7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: 3796036b9f46addfd1485d7ebecff5da4fc9cb27 [12024/12031] rue/io: introduce wbt class for cgroup priority
config: x86_64-randconfig-121-20241005 (https://download.01.org/0day-ci/archive/20241005/202410050954.JZPM54j7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410050954.JZPM54j7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410050954.JZPM54j7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-wbt.c:1016:70: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned long rw @@     got restricted blk_opf_t [usertype] opf @@
   block/blk-wbt.c:1016:70: sparse:     expected unsigned long rw
   block/blk-wbt.c:1016:70: sparse:     got restricted blk_opf_t [usertype] opf
>> block/blk-wbt.c:870:19: sparse: sparse: restricted blk_opf_t degrades to integer
   block/blk-wbt.c:870:35: sparse: sparse: restricted blk_opf_t degrades to integer
   block/blk-wbt.c:872:18: sparse: sparse: restricted blk_opf_t degrades to integer
   block/blk-wbt.c:874:23: sparse: sparse: restricted blk_opf_t degrades to integer

vim +1016 block/blk-wbt.c

   862	
   863	static inline unsigned int throtl_info_get_limit(struct wbt_throtl_info *ti,
   864							 unsigned long rw)
   865	{
   866		unsigned int limit;
   867	
   868		if (!throtl_info_enabled(ti))
   869			return UINT_MAX;
 > 870		if ((rw & REQ_OP_MASK) == REQ_OP_DISCARD)
   871			return ti->wb_background;
   872		if (rw & REQ_HIPRIO || current_is_kswapd())
   873			limit = ti->max_depth;
   874		else if (rw & REQ_BACKGROUND)
   875			limit = ti->wb_background;
   876		else
   877			limit = ti->wb_normal;
   878	
   879		return limit;
   880	}
   881	
   882	static void throtl_info_rqw_done(struct rq_wb *rwb, struct wbt_throtl_info *ti,
   883					 struct rq_wait *rqw, enum wbt_flags wbt_acct)
   884	{
   885		int inflight, limit;
   886	
   887		if (!(wbt_acct & WBT_CLASS_TRACKED))
   888			return;
   889	
   890		inflight = atomic_dec_return(&rqw->inflight);
   891	
   892		if (!throtl_info_enabled(ti)) {
   893			throtl_info_wake_all(ti);
   894			return;
   895		}
   896	
   897		if (wbt_acct & WBT_DISCARD)
   898			limit = ti->wb_background;
   899		else
   900			limit = ti->wb_normal;
   901	
   902		/*
   903		 * Don't wake anyone up if we are above the normal limit.
   904		 */
   905		if (inflight && inflight >= limit)
   906			return;
   907	
   908		if (wq_has_sleeper(&rqw->wait)) {
   909			int diff = limit - inflight;
   910	
   911			if (!inflight || diff >= ti->wb_background / 2)
   912				wake_up_nr(&rqw->wait, diff);
   913		}
   914	}
   915	
   916	static void wbt_class_timer_fn(struct timer_list *t)
   917	{
   918		struct rq_wb *rwb = from_timer(rwb, t, wbt_class_timer);
   919		struct wbt_throtl_info *ti;
   920		u64 rd_expired_cnt;
   921		int highest_class = WBT_CLASS_NR;
   922		int i;
   923	
   924		for (i = 0; i < WBT_CLASS_NR; i++) {
   925			ti = rwb_to_wbt_class_info(rwb, i);
   926			rd_expired_cnt = atomic64_read(&ti->read_expired_cnt);
   927			atomic64_set(&ti->read_expired_cnt, 0);
   928	
   929			if (rd_expired_cnt && highest_class == WBT_CLASS_NR)
   930				highest_class = i;
   931		}
   932	
   933		if (highest_class == WBT_CLASS_NR)
   934			goto depth_scale_up;
   935	
   936		/*expired read did happen!!! throttle from the lowest class*/
   937		for (i = WBT_CLASS_NR - 1; i >= highest_class; i--) {
   938			struct wbt_throtl_info *throtl_ti =
   939				rwb_to_wbt_class_info(rwb, i);
   940	
   941			if (!throtl_info_enabled(throtl_ti))
   942				continue;
   943	
   944			/*skip if can't be scaled down*/
   945			if (!RUE_CALL_TYPE(IO, throtl_info_scale_down, bool, throtl_ti, true))
   946				continue;
   947	
   948			/*current_depth changed, recal wb_normal and wb_background */
   949			RUE_CALL_VOID(IO, throtl_info_calc_limit, throtl_ti);
   950	
   951			if (throtl_info_inflight(throtl_ti) >
   952			    throtl_ti->wb_background) {
   953				/*
   954				 * we did throttle some buffer write,
   955				 * go and observe the effect
   956				 */
   957				break;
   958			}
   959		}
   960		goto out;
   961	
   962	depth_scale_up:
   963		/*amazing!!! everything goes fine, try to scale up queue depth*/
   964		for (i = 0; i < WBT_CLASS_NR; i++) {
   965			struct wbt_throtl_info *ti = rwb_to_wbt_class_info(rwb, i);
   966	
   967			if (ti->current_depth < ti->max_depth) {
   968				if (RUE_CALL_TYPE(IO, throtl_info_scale_up, bool, ti, false)) {
   969					RUE_CALL_VOID(IO, throtl_info_calc_limit, ti);
   970					throtl_info_wake_all(ti);
   971					goto out;
   972				}
   973			}
   974		}
   975	
   976	out:
   977		for (i = 0; i < WBT_CLASS_NR; i++) {
   978			ti = rwb_to_wbt_class_info(rwb, i);
   979			if (throtl_info_inflight(ti) ||
   980			    ti->current_depth < ti->max_depth) {
   981				mod_timer(t, jiffies + nsecs_to_jiffies(rwb->win_nsec));
   982				break;
   983			}
   984		}
   985	}
   986	
   987	static void wbt_class_account_bio_begin(struct rq_wb *rwb, struct bio *bio)
   988	{
   989		int i;
   990		enum wbt_flags flags;
   991		struct wbt_throtl_info *ti = bio_to_wbt_class_info(rwb, bio);
   992	
   993		flags = bio_to_wbt_class_flags(bio);
   994		if (bio_op(bio) == REQ_OP_READ)
   995			atomic64_inc(&ti->read_cnt);
   996	
   997		if (bio_op(bio) == REQ_OP_WRITE &&
   998		    (bio->bi_opf & (REQ_SYNC | REQ_IDLE)) == (REQ_SYNC | REQ_IDLE))
   999			atomic64_inc(&ti->direct_write_cnt);
  1000	
  1001		if (bio_op(bio) == REQ_OP_WRITE && (bio->bi_opf & REQ_SYNC) &&
  1002		    !(bio->bi_opf & REQ_IDLE))
  1003			atomic64_inc(&ti->wr_sync_cnt);
  1004	
  1005		if (flags & WBT_CLASS_TRACKED) {
  1006			i = wbt_flags_to_counter_idx(flags);
  1007			atomic64_inc(&ti->tracked_cnt[i]);
  1008		}
  1009	}
  1010	
  1011	static bool wbt_class_inflight_cb(struct rq_wait *rqw, void *private_data)
  1012	{
  1013		struct wbt_wait_data *data = private_data;
  1014	
  1015		return rq_wait_inc_below(rqw,
> 1016					 throtl_info_get_limit(data->ti, data->opf));
  1017	}
  1018	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
