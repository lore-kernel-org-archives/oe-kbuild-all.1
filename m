Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEBA42A98
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717232177; cv=none; b=DJ19AkXO6TrD9xEyE4owRxeebMuSuoRJr82raCY9ed6qXQlGFivfQDq8ATrE/L8KBDSjBZVMKSnMP8ss6KvArGAR7q6qT4OotVA1yciua4YF8bC5qf6f+cJfyFh+gDUD5glzOMsAuFVNLEFiuOtLeOwqGRoSonxGD9Km3VVdFls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717232177; c=relaxed/simple;
	bh=fuFJXtPDdZEfWDF/SBBuy4U6iKiRmb0PspBU6HfzCOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0mhNafJ0F+mvK8W4Z55mmLXvATbXJDoV2IsPWJb4xHctM0g7PQYaBHDXx4mX/dg+tV/9/hQuphw+JsQ9xIy4vaR2sV63RjsOlrPn4HqW4C6Xv7/mniR9ZqrfyRaaW0hYGIif6lRjhKcIxqrFp/POWIn/TAomMfCsjjpEZBrRtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvrb8TkI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvrb8TkI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717232175; x=1748768175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fuFJXtPDdZEfWDF/SBBuy4U6iKiRmb0PspBU6HfzCOU=;
  b=mvrb8TkIa2gVetWJ/9QgwA8JNJM7F/oEorr2y8tCofBXvAVaJqfnmzKP
   tkQ85lm4rqJeZ+26J3rSoLZbh7eGb3U3T7Z/F8jtJNG0OaURPemJiODER
   +5BnrHi5i49L0uZ/kRBj4T2GpFJnAKows3qvZrpdToYHbxXoNUJiX1L0z
   eh+USSBv1VF4CmqNu4CGcNFWFhDq75tRXXNzsa9WRqNz/5G6PUARWAWrj
   Gr2GhQeu7tcs2Hu+SjARUgcMtlRJLeYmQdCI1CdwuHzYWn4wYVPypzZwq
   dcfQ9f82AcM/ls+ETsuJa6VxcuvxQrcOzRF8qmRbxESr+PVMBm7B3dCrm
   Q==;
X-CSE-ConnectionGUID: MFc9zrmLRxmVMphOgKieGg==
X-CSE-MsgGUID: dzw7BXhPQwyUVblMlcKV7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="31278683"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="31278683"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 01:56:15 -0700
X-CSE-ConnectionGUID: ktvSSXDwQQKFKg4xkbosZw==
X-CSE-MsgGUID: 1EDlP3mmT0+mILnV0HgGsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="40830466"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jun 2024 01:55:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDKWp-000Iav-29;
	Sat, 01 Jun 2024 08:55:55 +0000
Date: Sat, 1 Jun 2024 16:55:24 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhai <yan@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 net-next 1/7] net: add rx_sk to trace_kfree_skb
Message-ID: <202406011611.bZ95PKH8-lkp@intel.com>
References: <451ae2a5c2ddb3c127cfddaf4a6579d6e85791f3.1717206060.git.yan@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <451ae2a5c2ddb3c127cfddaf4a6579d6e85791f3.1717206060.git.yan@cloudflare.com>

Hi Yan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Yan-Zhai/net-add-rx_sk-to-trace_kfree_skb/20240601-094726
base:   net-next/main
patch link:    https://lore.kernel.org/r/451ae2a5c2ddb3c127cfddaf4a6579d6e85791f3.1717206060.git.yan%40cloudflare.com
patch subject: [RFC v2 net-next 1/7] net: add rx_sk to trace_kfree_skb
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240601/202406011611.bZ95PKH8-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406011611.bZ95PKH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406011611.bZ95PKH8-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/drop_monitor.c: In function 'net_dm_trace_on_set':
>> net/core/drop_monitor.c:1162:42: error: passing argument 1 of 'register_trace_kfree_skb' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1162 |         rc = register_trace_kfree_skb(ops->kfree_skb_probe, NULL);
         |                                       ~~~^~~~~~~~~~~~~~~~~
         |                                          |
         |                                          void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason)
   In file included from include/trace/events/skb.h:10,
                    from net/core/drop_monitor.c:36:
   include/linux/tracepoint.h:270:38: note: expected 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  struct sock *)' but argument is of type 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason)'
     270 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:434:9: note: in expansion of macro '__DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/skb.h:24:1: note: in expansion of macro 'TRACE_EVENT'
      24 | TRACE_EVENT(kfree_skb,
         | ^~~~~~~~~~~
>> net/core/drop_monitor.c:1177:39: error: passing argument 1 of 'unregister_trace_kfree_skb' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1177 |         unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
         |                                    ~~~^~~~~~~~~~~~~~~~~
         |                                       |
         |                                       void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason)
   include/linux/tracepoint.h:283:40: note: expected 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  struct sock *)' but argument is of type 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason)'
     283 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:434:9: note: in expansion of macro '__DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/skb.h:24:1: note: in expansion of macro 'TRACE_EVENT'
      24 | TRACE_EVENT(kfree_skb,
         | ^~~~~~~~~~~
   net/core/drop_monitor.c: In function 'net_dm_trace_off_set':
   net/core/drop_monitor.c:1200:39: error: passing argument 1 of 'unregister_trace_kfree_skb' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1200 |         unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
         |                                    ~~~^~~~~~~~~~~~~~~~~
         |                                       |
         |                                       void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason)
   include/linux/tracepoint.h:283:40: note: expected 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  struct sock *)' but argument is of type 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason)'
     283 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:434:9: note: in expansion of macro '__DECLARE_TRACE'
     434 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:568:9: note: in expansion of macro 'DECLARE_TRACE'
     568 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/skb.h:24:1: note: in expansion of macro 'TRACE_EVENT'
      24 | TRACE_EVENT(kfree_skb,
         | ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/register_trace_kfree_skb +1162 net/core/drop_monitor.c

8e94c3bc922e702 Ido Schimmel 2019-08-17  1135  
7c747838a55818f Ido Schimmel 2019-08-11  1136  static int net_dm_trace_on_set(struct netlink_ext_ack *extack)
9a8afc8d3962f3e Neil Horman  2009-03-11  1137  {
28315f7999870bb Ido Schimmel 2019-08-11  1138  	const struct net_dm_alert_ops *ops;
70c69274f354ecb Ido Schimmel 2019-08-11  1139  	int cpu, rc;
4b706372f18de53 Neil Horman  2010-07-20  1140  
28315f7999870bb Ido Schimmel 2019-08-11  1141  	ops = net_dm_alert_ops_arr[net_dm_alert_mode];
28315f7999870bb Ido Schimmel 2019-08-11  1142  
cad456d5abbb630 Neil Horman  2012-05-17  1143  	if (!try_module_get(THIS_MODULE)) {
965100966efe85e Ido Schimmel 2019-08-06  1144  		NL_SET_ERR_MSG_MOD(extack, "Failed to take reference on module");
7c747838a55818f Ido Schimmel 2019-08-11  1145  		return -ENODEV;
cad456d5abbb630 Neil Horman  2012-05-17  1146  	}
cad456d5abbb630 Neil Horman  2012-05-17  1147  
70c69274f354ecb Ido Schimmel 2019-08-11  1148  	for_each_possible_cpu(cpu) {
70c69274f354ecb Ido Schimmel 2019-08-11  1149  		struct per_cpu_dm_data *data = &per_cpu(dm_cpu_data, cpu);
44075f563793880 Ido Schimmel 2019-08-11  1150  		struct sk_buff *skb;
70c69274f354ecb Ido Schimmel 2019-08-11  1151  
28315f7999870bb Ido Schimmel 2019-08-11  1152  		INIT_WORK(&data->dm_alert_work, ops->work_item_func);
70c69274f354ecb Ido Schimmel 2019-08-11  1153  		timer_setup(&data->send_timer, sched_send_work, 0);
44075f563793880 Ido Schimmel 2019-08-11  1154  		/* Allocate a new per-CPU skb for the summary alert message and
44075f563793880 Ido Schimmel 2019-08-11  1155  		 * free the old one which might contain stale data from
44075f563793880 Ido Schimmel 2019-08-11  1156  		 * previous tracing.
44075f563793880 Ido Schimmel 2019-08-11  1157  		 */
44075f563793880 Ido Schimmel 2019-08-11  1158  		skb = reset_per_cpu_data(data);
44075f563793880 Ido Schimmel 2019-08-11  1159  		consume_skb(skb);
70c69274f354ecb Ido Schimmel 2019-08-11  1160  	}
70c69274f354ecb Ido Schimmel 2019-08-11  1161  
28315f7999870bb Ido Schimmel 2019-08-11 @1162  	rc = register_trace_kfree_skb(ops->kfree_skb_probe, NULL);
7c747838a55818f Ido Schimmel 2019-08-11  1163  	if (rc) {
7c747838a55818f Ido Schimmel 2019-08-11  1164  		NL_SET_ERR_MSG_MOD(extack, "Failed to connect probe to kfree_skb() tracepoint");
7c747838a55818f Ido Schimmel 2019-08-11  1165  		goto err_module_put;
7c747838a55818f Ido Schimmel 2019-08-11  1166  	}
cad456d5abbb630 Neil Horman  2012-05-17  1167  
28315f7999870bb Ido Schimmel 2019-08-11  1168  	rc = register_trace_napi_poll(ops->napi_poll_probe, NULL);
7c747838a55818f Ido Schimmel 2019-08-11  1169  	if (rc) {
7c747838a55818f Ido Schimmel 2019-08-11  1170  		NL_SET_ERR_MSG_MOD(extack, "Failed to connect probe to napi_poll() tracepoint");
7c747838a55818f Ido Schimmel 2019-08-11  1171  		goto err_unregister_trace;
7c747838a55818f Ido Schimmel 2019-08-11  1172  	}
7c747838a55818f Ido Schimmel 2019-08-11  1173  
7c747838a55818f Ido Schimmel 2019-08-11  1174  	return 0;
7c747838a55818f Ido Schimmel 2019-08-11  1175  
7c747838a55818f Ido Schimmel 2019-08-11  1176  err_unregister_trace:
28315f7999870bb Ido Schimmel 2019-08-11 @1177  	unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
7c747838a55818f Ido Schimmel 2019-08-11  1178  err_module_put:
9398e9c0b1d44ee Ido Schimmel 2021-03-10  1179  	for_each_possible_cpu(cpu) {
9398e9c0b1d44ee Ido Schimmel 2021-03-10  1180  		struct per_cpu_dm_data *data = &per_cpu(dm_cpu_data, cpu);
9398e9c0b1d44ee Ido Schimmel 2021-03-10  1181  		struct sk_buff *skb;
9398e9c0b1d44ee Ido Schimmel 2021-03-10  1182  
9398e9c0b1d44ee Ido Schimmel 2021-03-10  1183  		del_timer_sync(&data->send_timer);
9398e9c0b1d44ee Ido Schimmel 2021-03-10  1184  		cancel_work_sync(&data->dm_alert_work);
9398e9c0b1d44ee Ido Schimmel 2021-03-10  1185  		while ((skb = __skb_dequeue(&data->drop_queue)))
9398e9c0b1d44ee Ido Schimmel 2021-03-10  1186  			consume_skb(skb);
9398e9c0b1d44ee Ido Schimmel 2021-03-10  1187  	}
7c747838a55818f Ido Schimmel 2019-08-11  1188  	module_put(THIS_MODULE);
7c747838a55818f Ido Schimmel 2019-08-11  1189  	return rc;
7c747838a55818f Ido Schimmel 2019-08-11  1190  }
7c747838a55818f Ido Schimmel 2019-08-11  1191  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
