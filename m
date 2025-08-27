Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC26B30FF13
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Aug 2025 23:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756338236; cv=none; b=jeWFJ51SiwtyoE9RCUeTs+e5aq0BZoVFCI7TQpZNR8AZS6SyjsnafOBqqnxleyKjgYZ7HJCacB9XG2XPMZhsW8Qe98L/sSLzCiug0m9rm0RBb/rVVRuBntjH4Bd4OLZcmCJFtMB/+92jZhYr6jLzqOvwp3gkshCtYPyZRRY7CDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756338236; c=relaxed/simple;
	bh=RRW/Ro67ONh/dopMsdrEsNsFYGax1Rk+B9o7S2dTEYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E7FBFm+G9kkDVvqGksvOShdrAqMDKYdOfgOQLr0DJ+ALfNe+sTtPK2KGYM4VccjOGfBO7Y0vMdR5xljhE+qnYKW3kNunCwzuYj4EUOn9fUVU1lRjMEOAb3uPBmN9nkOzVN9DBbjwRkVYKZWvjiUQ2I5qo16DcIC8jgCvnmLubH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eh6FgzTU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eh6FgzTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756338235; x=1787874235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RRW/Ro67ONh/dopMsdrEsNsFYGax1Rk+B9o7S2dTEYM=;
  b=eh6FgzTU8O6th3B86uFIuIvRoQqA5nJJgCtbsBzp+yl91IfuG6UbIfqQ
   IoDYiWlAV0t+RuKSLTQOBLtrnug5tuRSVdTN9UDXliuGiek3Xd/7Zi/Vo
   /wknoBH3rNgdnRDjh1DC+ieDriI9WywWBzj2Vkamu9HczbZ4Pn9Vddw9X
   JAjdQjiFOiHznOeQSiMjUWHAwsiKSZIfG55vowhF+L0PnHUUmPhll6DeV
   4wvk0iWRwfje2i5KDXf1RXCwTj+Jg1GRJuIoKEpu74NoCz8hOF0ts3zh2
   S9Hk7NlQzINBMA/Btk8hRRkQI/qJrVJz7erSzFDSAOobzO5mM/MadeJ1S
   A==;
X-CSE-ConnectionGUID: 5OVz1v/WR36O4O9VWuyhEw==
X-CSE-MsgGUID: pQeKpqU+RR62v1BN1Rk1ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58531224"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58531224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 16:43:53 -0700
X-CSE-ConnectionGUID: xKXhK2aXSKu9a82mmsK1dw==
X-CSE-MsgGUID: T7Y0WFP0SFWJNvYvzVzSOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170128407"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Aug 2025 16:43:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urPnw-000THV-2h;
	Wed, 27 Aug 2025 23:43:48 +0000
Date: Thu, 28 Aug 2025 07:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 6/6] drivers/android/binder.c:3205:
 warning: Function parameter or struct member 'is_reply' not described in
 'binder_netlink_report'
Message-ID: <202508280720.kZyY27aI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   cbb0a15dcc1e73dbac44e679650711638f54754b
commit: 2e05770b48864c4ba5bf63ff815089769200c9ac [6/6] BACKPORT: FROMGIT: binder: introduce transaction reports via netlink
config: i386-buildonly-randconfig-003-20250828 (https://download.01.org/0day-ci/archive/20250828/202508280720.kZyY27aI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250828/202508280720.kZyY27aI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508280720.kZyY27aI-lkp@intel.com/

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
