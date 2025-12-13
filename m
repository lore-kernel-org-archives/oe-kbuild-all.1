Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0464158DA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 04:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765599661; cv=none; b=XNkOGsqXHQfscUTGsJ2c5xmACzGMujG0D9VWPptoL9xuSXWxQBdk0PAdJKFeeuYoptNMDYeBKlkLaGkKj4g4fs17wu4dkDSs9bLjnfNwSoiwKVhYTosK+V24sJYqh0Of59j+/dltsYpPdo8VsNtpnOdr7WXWm7HhFr3KyvcG6U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765599661; c=relaxed/simple;
	bh=vGZ7moxcgQrPzh5M4+lHbaGmfD7V45Kn9re8hIMgPyE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qtrSPEPtMryz/I+OjP7upDZW0tYmI3sFVoCwawD1qlhTvr7eks1UjOVrTyZuX7m9AOx0eoFje3Q+y1683vkTlZt9nO7bq9YaYW5CwONkUEHlmmhmrG7m5iaIffBtljveNUxD8jmMoGNqS5jXuhDFL8VuObm6zyS5SKNe6NEsRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwvW2/QN; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwvW2/QN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765599659; x=1797135659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vGZ7moxcgQrPzh5M4+lHbaGmfD7V45Kn9re8hIMgPyE=;
  b=kwvW2/QNsL38adBnWaxnb8v9dYO+278r4hN6QGOSGoPWsxDMwaDnFI66
   lWaEORqRdNoZpxGGgfg2d/GuHkZ/1H0cvmWvcTt9TEfreNMMRq4hNC6iB
   RmGovaTZ8+TStip1/39KWa3Cinl706Q0V6+m1LilnkZiW/OafetPyW4bV
   5mLM9leKImrJPEhgStqc99AMt4L04MKf8AdXA5WEZ3TPe2w/9l9cySDcL
   P2x5hXARdaLDNcYlzVT/BSH8i8uWCdYdd//SvKIlF+80VtJsqgBatkutb
   UcmD3DoQVqOQcWfHoQ3TUv/rnabrlrXopppfNOV09JZrnAOCWl+40jntN
   A==;
X-CSE-ConnectionGUID: qcrlSjGkQb27Mqu4NTGe+w==
X-CSE-MsgGUID: Clh7fYvuRja3dIfCqPfCqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78969449"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="78969449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:20:59 -0800
X-CSE-ConnectionGUID: 1BIwW1J0QcuzyEpSXomxsw==
X-CSE-MsgGUID: Tq/DoLCGR4OogJzl3UJB+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="228308097"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 20:20:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUH7o-0000000072R-11An;
	Sat, 13 Dec 2025 04:20:56 +0000
Date: Sat, 13 Dec 2025 12:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1] drivers/android/binder.c:3205:
 warning: Function parameter or struct member 'is_reply' not described in
 'binder_netlink_report'
Message-ID: <202512131252.9pdmHxEy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17fd67ddf0cddeb7325b49d3ca2f7db7824dfccd
commit: 2e05770b48864c4ba5bf63ff815089769200c9ac [1/1] BACKPORT: FROMGIT: binder: introduce transaction reports via netlink
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131252.9pdmHxEy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131252.9pdmHxEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131252.9pdmHxEy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/android/binder.c:2166: warning: Function parameter or struct member 'file' not described in 'binder_task_work_cb'
   drivers/android/binder.c:2166: warning: Excess struct member 'fd' description in 'binder_task_work_cb'
   drivers/android/binder.c:2617: warning: Function parameter or struct member 'offset' not described in 'binder_ptr_fixup'
   drivers/android/binder.c:2617: warning: Function parameter or struct member 'skip_size' not described in 'binder_ptr_fixup'
   drivers/android/binder.c:2617: warning: Function parameter or struct member 'fixup_data' not described in 'binder_ptr_fixup'
   drivers/android/binder.c:2617: warning: Function parameter or struct member 'node' not described in 'binder_ptr_fixup'
   drivers/android/binder.c:2637: warning: Function parameter or struct member 'offset' not described in 'binder_sg_copy'
   drivers/android/binder.c:2637: warning: Function parameter or struct member 'sender_uaddr' not described in 'binder_sg_copy'
   drivers/android/binder.c:2637: warning: Function parameter or struct member 'length' not described in 'binder_sg_copy'
   drivers/android/binder.c:2637: warning: Function parameter or struct member 'node' not described in 'binder_sg_copy'
>> drivers/android/binder.c:3205: warning: Function parameter or struct member 'is_reply' not described in 'binder_netlink_report'
>> drivers/android/binder.c:3205: warning: Excess function parameter 'reply' description in 'binder_netlink_report'
   drivers/android/binder.c:4308: warning: Function parameter or struct member 'thread' not described in 'binder_free_buf'


vim +3205 drivers/android/binder.c

  3191	
  3192	/**
  3193	 * binder_netlink_report() - report a transaction failure via netlink
  3194	 * @proc:	the binder proc sending the transaction
  3195	 * @t:		the binder transaction that failed
  3196	 * @data_size:	the user provided data size for the transaction
  3197	 * @error:	enum binder_driver_return_protocol returned to sender
  3198	 * @reply:	whether the transaction is a reply
  3199	 */
  3200	static void binder_netlink_report(struct binder_proc *proc,
  3201					  struct binder_transaction *t,
  3202					  u32 data_size,
  3203					  u32 error,
  3204					  int is_reply)
> 3205	{
  3206		const char *context = proc->context->name;
  3207		struct sk_buff *skb;
  3208		void *hdr;
  3209	
  3210		if (!genl_has_listeners(&binder_nl_family, &init_net,
  3211					BINDER_NLGRP_REPORT))
  3212			return;
  3213	
  3214		skb = genlmsg_new(GENLMSG_DEFAULT_SIZE, GFP_KERNEL);
  3215		if (!skb)
  3216			return;
  3217	
  3218		hdr = genlmsg_put(skb, 0, 0, &binder_nl_family, 0, BINDER_CMD_REPORT);
  3219		if (!hdr)
  3220			goto free_skb;
  3221	
  3222		if (nla_put_u32(skb, BINDER_A_REPORT_ERROR, error) ||
  3223		    nla_put_string(skb, BINDER_A_REPORT_CONTEXT, context) ||
  3224		    nla_put_u32(skb, BINDER_A_REPORT_FROM_PID, t->from_pid) ||
  3225		    nla_put_u32(skb, BINDER_A_REPORT_FROM_TID, t->from_tid))
  3226			goto cancel_skb;
  3227	
  3228		if (t->to_proc &&
  3229		    nla_put_u32(skb, BINDER_A_REPORT_TO_PID, t->to_proc->pid))
  3230			goto cancel_skb;
  3231	
  3232		if (t->to_thread &&
  3233		    nla_put_u32(skb, BINDER_A_REPORT_TO_TID, t->to_thread->pid))
  3234			goto cancel_skb;
  3235	
  3236		if (is_reply && nla_put_flag(skb, BINDER_A_REPORT_IS_REPLY))
  3237			goto cancel_skb;
  3238	
  3239		if (nla_put_u32(skb, BINDER_A_REPORT_FLAGS, t->flags) ||
  3240		    nla_put_u32(skb, BINDER_A_REPORT_CODE, t->code) ||
  3241		    nla_put_u32(skb, BINDER_A_REPORT_DATA_SIZE, data_size))
  3242			goto cancel_skb;
  3243	
  3244		genlmsg_end(skb, hdr);
  3245		genlmsg_multicast(&binder_nl_family, skb, 0, BINDER_NLGRP_REPORT,
  3246				  GFP_KERNEL);
  3247		return;
  3248	
  3249	cancel_skb:
  3250		genlmsg_cancel(skb, hdr);
  3251	free_skb:
  3252		nlmsg_free(skb);
  3253	}
  3254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
