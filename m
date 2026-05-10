Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F0C308F15
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 22:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778452315; cv=none; b=nC3QmYazogbrEHZbFv88nFsnqKY09ndTfV0tP9J7fuCoJm1UwDdK3q+rnTqmw1UwPGsDDb3x6y0tToFcdc9okkdUCysV4lzfRmvqErvWKIY8c/g2O/LE543BQDnwn10/WQ5PfpTzXd8y5JE+9Iq/D+iPkj5tbhHuqdZSy51NTqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778452315; c=relaxed/simple;
	bh=eJWZnv1Bm5GPDzv8GjThCl7yeexH1B7vehtzhrl9/D4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o5f6WD4LgTH7otWhBUxIDsXMd39SyJQzI7HdXeMaoI43N8ZdBVkSTzXlFzRhV0Uh9+JXgwpZe1oSNABmKAq9jPsCqHlOtrADT/JQkprJic7lgQWD2jLU5i4pWdEDas+L33zVPVbsd3KX7zvh9R4SAfLNkgVTkfKzN7O500Nlf8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jy/7GgA1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy/7GgA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778452313; x=1809988313;
  h=date:from:to:cc:subject:message-id;
  bh=eJWZnv1Bm5GPDzv8GjThCl7yeexH1B7vehtzhrl9/D4=;
  b=Jy/7GgA1MRWoZOOcSN7J0fiGPV6NCkVCPZl6dl9ssn/aaT+vLYmucc+D
   nupYoqz5/33E9XYzRtd/u/5xJf85Dk2rr6ydjDktcMPa9m5HpRyjpKgR1
   JVfV6TYi0KYpoSD6DOP1lO4YJcfvX7Ora58C/T+vo6yda7mVDtIBLzn57
   3OdhReb+aHNr+vtsaXwazZZv+ZumbeXFipbg7135kuQgHTZpbw/a6B808
   QgvysRe5/BWeqBvLehiMWxmoj2WPGCTKjYWYRbQ0upGLJrhkBjzLPrYhJ
   9fhypv3xrXaCGH58CtqGybxZgHnBFv+HJMDmBg5ohxYN1PhJjAF384rLt
   A==;
X-CSE-ConnectionGUID: wbkPFT70QY2yOlRMYxm/2Q==
X-CSE-MsgGUID: FqHFboSmQOip8pT09800Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="78486913"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="78486913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 15:31:51 -0700
X-CSE-ConnectionGUID: 5BLLcfuTRUaDQIbSmHEWgA==
X-CSE-MsgGUID: oOwyz1GvRziDtV5wppNMOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="260756728"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 May 2026 15:31:50 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMCge-000000007ok-0hzv;
	Sun, 10 May 2026 22:31:48 +0000
Date: Mon, 11 May 2026 00:31:46 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: net/core/drop_monitor.c:1164:42: error: passing argument 1
 of 'register_trace_kfree_skb' from incompatible pointer type
Message-ID: <202605110041.nJRQPlCh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-constify-sk_skb_reason_drop-sock-parameter/20260510-230935
head:   daff210bd24b88ed46a00a4f88b96722e9fe4a3d
commit: c2c014f764c7b7e3341d8ea76f1bcae8c284b06e net: constify sk_skb_reason_drop() sock parameter
date:   7 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260511/202605110041.nJRQPlCh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110041.nJRQPlCh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605110041.nJRQPlCh-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/drop_monitor.c: In function 'net_dm_trace_on_set':
>> net/core/drop_monitor.c:1164:42: error: passing argument 1 of 'register_trace_kfree_skb' from incompatible pointer type [-Wincompatible-pointer-types]
    1164 |         rc = register_trace_kfree_skb(ops->kfree_skb_probe, NULL);
         |                                       ~~~^~~~~~~~~~~~~~~~~
         |                                          |
         |                                          void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  struct sock *)
   In file included from include/trace/events/skb.h:10,
                    from net/core/drop_monitor.c:36:
   include/linux/tracepoint.h:271:38: note: expected 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  const struct sock *)' but argument is of type 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  struct sock *)'
     271 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
         |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:300:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     300 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:526:9: note: in expansion of macro '__DECLARE_TRACE'
     526 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:664:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     664 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/events/skb.h:24:1: note: in expansion of macro 'TRACE_EVENT'
      24 | TRACE_EVENT(kfree_skb,
         | ^~~~~~~~~~~
>> net/core/drop_monitor.c:1179:39: error: passing argument 1 of 'unregister_trace_kfree_skb' from incompatible pointer type [-Wincompatible-pointer-types]
    1179 |         unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
         |                                    ~~~^~~~~~~~~~~~~~~~~
         |                                       |
         |                                       void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  struct sock *)
   include/linux/tracepoint.h:284:40: note: expected 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  const struct sock *)' but argument is of type 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  struct sock *)'
     284 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:300:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     300 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:526:9: note: in expansion of macro '__DECLARE_TRACE'
     526 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:664:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     664 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/events/skb.h:24:1: note: in expansion of macro 'TRACE_EVENT'
      24 | TRACE_EVENT(kfree_skb,
         | ^~~~~~~~~~~
   net/core/drop_monitor.c: In function 'net_dm_trace_off_set':
   net/core/drop_monitor.c:1202:39: error: passing argument 1 of 'unregister_trace_kfree_skb' from incompatible pointer type [-Wincompatible-pointer-types]
    1202 |         unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
         |                                    ~~~^~~~~~~~~~~~~~~~~
         |                                       |
         |                                       void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  struct sock *)
   include/linux/tracepoint.h:284:40: note: expected 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  const struct sock *)' but argument is of type 'void (*)(void *, struct sk_buff *, void *, enum skb_drop_reason,  struct sock *)'
     284 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
         |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:300:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
     300 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:526:9: note: in expansion of macro '__DECLARE_TRACE'
     526 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:664:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
     664 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/events/skb.h:24:1: note: in expansion of macro 'TRACE_EVENT'
      24 | TRACE_EVENT(kfree_skb,
         | ^~~~~~~~~~~


vim +/register_trace_kfree_skb +1164 net/core/drop_monitor.c

8e94c3bc922e70 Ido Schimmel    2019-08-17  1137  
7c747838a55818 Ido Schimmel    2019-08-11  1138  static int net_dm_trace_on_set(struct netlink_ext_ack *extack)
9a8afc8d3962f3 Neil Horman     2009-03-11  1139  {
28315f7999870b Ido Schimmel    2019-08-11  1140  	const struct net_dm_alert_ops *ops;
70c69274f354ec Ido Schimmel    2019-08-11  1141  	int cpu, rc;
4b706372f18de5 Neil Horman     2010-07-20  1142  
28315f7999870b Ido Schimmel    2019-08-11  1143  	ops = net_dm_alert_ops_arr[net_dm_alert_mode];
28315f7999870b Ido Schimmel    2019-08-11  1144  
cad456d5abbb63 Neil Horman     2012-05-17  1145  	if (!try_module_get(THIS_MODULE)) {
965100966efe85 Ido Schimmel    2019-08-06  1146  		NL_SET_ERR_MSG_MOD(extack, "Failed to take reference on module");
7c747838a55818 Ido Schimmel    2019-08-11  1147  		return -ENODEV;
cad456d5abbb63 Neil Horman     2012-05-17  1148  	}
cad456d5abbb63 Neil Horman     2012-05-17  1149  
70c69274f354ec Ido Schimmel    2019-08-11  1150  	for_each_possible_cpu(cpu) {
70c69274f354ec Ido Schimmel    2019-08-11  1151  		struct per_cpu_dm_data *data = &per_cpu(dm_cpu_data, cpu);
44075f56379388 Ido Schimmel    2019-08-11  1152  		struct sk_buff *skb;
70c69274f354ec Ido Schimmel    2019-08-11  1153  
28315f7999870b Ido Schimmel    2019-08-11  1154  		INIT_WORK(&data->dm_alert_work, ops->work_item_func);
70c69274f354ec Ido Schimmel    2019-08-11  1155  		timer_setup(&data->send_timer, sched_send_work, 0);
44075f56379388 Ido Schimmel    2019-08-11  1156  		/* Allocate a new per-CPU skb for the summary alert message and
44075f56379388 Ido Schimmel    2019-08-11  1157  		 * free the old one which might contain stale data from
44075f56379388 Ido Schimmel    2019-08-11  1158  		 * previous tracing.
44075f56379388 Ido Schimmel    2019-08-11  1159  		 */
44075f56379388 Ido Schimmel    2019-08-11  1160  		skb = reset_per_cpu_data(data);
44075f56379388 Ido Schimmel    2019-08-11  1161  		consume_skb(skb);
70c69274f354ec Ido Schimmel    2019-08-11  1162  	}
70c69274f354ec Ido Schimmel    2019-08-11  1163  
28315f7999870b Ido Schimmel    2019-08-11 @1164  	rc = register_trace_kfree_skb(ops->kfree_skb_probe, NULL);
7c747838a55818 Ido Schimmel    2019-08-11  1165  	if (rc) {
7c747838a55818 Ido Schimmel    2019-08-11  1166  		NL_SET_ERR_MSG_MOD(extack, "Failed to connect probe to kfree_skb() tracepoint");
7c747838a55818 Ido Schimmel    2019-08-11  1167  		goto err_module_put;
7c747838a55818 Ido Schimmel    2019-08-11  1168  	}
cad456d5abbb63 Neil Horman     2012-05-17  1169  
28315f7999870b Ido Schimmel    2019-08-11  1170  	rc = register_trace_napi_poll(ops->napi_poll_probe, NULL);
7c747838a55818 Ido Schimmel    2019-08-11  1171  	if (rc) {
7c747838a55818 Ido Schimmel    2019-08-11  1172  		NL_SET_ERR_MSG_MOD(extack, "Failed to connect probe to napi_poll() tracepoint");
7c747838a55818 Ido Schimmel    2019-08-11  1173  		goto err_unregister_trace;
7c747838a55818 Ido Schimmel    2019-08-11  1174  	}
7c747838a55818 Ido Schimmel    2019-08-11  1175  
7c747838a55818 Ido Schimmel    2019-08-11  1176  	return 0;
7c747838a55818 Ido Schimmel    2019-08-11  1177  
7c747838a55818 Ido Schimmel    2019-08-11  1178  err_unregister_trace:
28315f7999870b Ido Schimmel    2019-08-11 @1179  	unregister_trace_kfree_skb(ops->kfree_skb_probe, NULL);
7c747838a55818 Ido Schimmel    2019-08-11  1180  err_module_put:
9398e9c0b1d44e Ido Schimmel    2021-03-10  1181  	for_each_possible_cpu(cpu) {
9398e9c0b1d44e Ido Schimmel    2021-03-10  1182  		struct per_cpu_dm_data *data = &per_cpu(dm_cpu_data, cpu);
9398e9c0b1d44e Ido Schimmel    2021-03-10  1183  		struct sk_buff *skb;
9398e9c0b1d44e Ido Schimmel    2021-03-10  1184  
8fa7292fee5c52 Thomas Gleixner 2025-04-05  1185  		timer_delete_sync(&data->send_timer);
9398e9c0b1d44e Ido Schimmel    2021-03-10  1186  		cancel_work_sync(&data->dm_alert_work);
9398e9c0b1d44e Ido Schimmel    2021-03-10  1187  		while ((skb = __skb_dequeue(&data->drop_queue)))
9398e9c0b1d44e Ido Schimmel    2021-03-10  1188  			consume_skb(skb);
9398e9c0b1d44e Ido Schimmel    2021-03-10  1189  	}
7c747838a55818 Ido Schimmel    2019-08-11  1190  	module_put(THIS_MODULE);
7c747838a55818 Ido Schimmel    2019-08-11  1191  	return rc;
7c747838a55818 Ido Schimmel    2019-08-11  1192  }
7c747838a55818 Ido Schimmel    2019-08-11  1193  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
