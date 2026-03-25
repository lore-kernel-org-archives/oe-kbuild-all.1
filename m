Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E771684A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 04:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774412216; cv=none; b=AqL/D96Ov8Ixwrny6eVd+p6g8YA2ZDGJGCr3M2fLApjZi9YN35Tpf/u7L8CW4eoacpFf1SM6mcWJlx2OFFvs98Hnu9R1YBNgukvfUIkkLsMf7GHMd0iEZ4M9VOhiqIJl+dLu5CYnLDl+uWjTn9wpigW/KBoAUp4qqzKjZv5V4/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774412216; c=relaxed/simple;
	bh=y8nP3vGUumiiNhTbfihr46Y0W2PLAb05BDOLVPR4BeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tXih/R7gdWpFzgl/Zc8KZ8+K+qjTKLcUcaVoAbp4pNgBQNZQckbOt+iGyaZrGvUvQHtbgEK9sFVcF6JMwfDeQueQcQX2HLNAKmNeuop6CDw8gBRBcOx0jutTWWQdf4U5kAliTDIadaVhSeAQoD/0hEFJ8auUOo8a+2wnzE5+OHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TX3owSOF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TX3owSOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774412216; x=1805948216;
  h=date:from:to:cc:subject:message-id;
  bh=y8nP3vGUumiiNhTbfihr46Y0W2PLAb05BDOLVPR4BeA=;
  b=TX3owSOFpTHIa1A0TG4mDFmJFdjnOxzAOEsbFw55RUnIK+psM+DCTGN7
   bb/41VgUeOBaDy9prd1XTn9m3FnnUkRjhS6X7z2d7Tb9hGmTcqVj396FP
   boob8zmcNAhCI91JY67tPo5SJi3uSzdAwon9C9fH926+LmqISyT+wUu5b
   hwRR9CjS+hORdEKpnIVHHRm+Z+kfbADcC8nN/0On4vkJPTsdQTlC/lvr7
   x1q8nKQAMBlMYjR1Ql5eogUHMYfetaDdAkoXybspBUylMZt+TrZmmocTS
   Pe2RtwK74YpgbIXaJvQ0j/6W2gt9bW0Ewp79C7W+v2Mr8y7Vr/zE8/Uoe
   Q==;
X-CSE-ConnectionGUID: a1EzXmOFQb6qSox05D6cyQ==
X-CSE-MsgGUID: UGT6K4+RQoeX8vIonW3FnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75410457"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75410457"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 21:16:55 -0700
X-CSE-ConnectionGUID: wU89lHEfSVGZ/uOibAujHg==
X-CSE-MsgGUID: lwYNzSX9QLG9x33h+9ddoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229028605"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Mar 2026 21:16:54 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Ffn-000000005wD-0csy;
	Wed, 25 Mar 2026 04:16:51 +0000
Date: Wed, 25 Mar 2026 12:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 44/44]
 drivers/android/binder.c:3205: warning: Function parameter or struct member
 'is_reply' not described in 'binder_netlink_report'
Message-ID: <202603251240.aybLAxBh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Li,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: 2e05770b48864c4ba5bf63ff815089769200c9ac [44/44] BACKPORT: FROMGIT: binder: introduce transaction reports via netlink
config: arm64-randconfig-004-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251240.aybLAxBh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251240.aybLAxBh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251240.aybLAxBh-lkp@intel.com/

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
