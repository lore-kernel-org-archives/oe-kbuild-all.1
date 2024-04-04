Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C661A71B27
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Apr 2024 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712222027; cv=none; b=ZfSQcE+agXHaWOQzo7VT8v4c7im9/R2hAY8eB9sqR49hxcUqtAi6FdlIwKjGncrXS4Xj1F5/9lQKdhCFoFsjKkiHaQq0/o7cWiSiBCWE6GVPfai2wxTKLYbYfQtv1EXuq8RDbumby85JUfG+BWlq6wN6yNiSXlO2StfTHOXJcN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712222027; c=relaxed/simple;
	bh=WGHhTuy0A5fDWAL+y4qKtOX22asxfzUER+5abp7m6gw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XV6U0SnKRLxpQe9YBKs2I6cPnL/m+5W6fN6G/MpGaS0lBya1yoRrPxu0AQWukezpL7g2ZMPEEtF7+QskUINDXpbRNhDgQwrmUSW4+lBvsFX6sZyqdAIae0XZkBGYLFrNoFFvuBVqJJnzieilfcXJ1fC0OenZO72o1/IVMbZfg+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWyOIYRD; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWyOIYRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712222023; x=1743758023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WGHhTuy0A5fDWAL+y4qKtOX22asxfzUER+5abp7m6gw=;
  b=aWyOIYRDJ11QnPWXv4IeGE4RiSOC7v5pM9tOaTym56WszkDwnrI6nAqY
   bI+r5FdwG5YRXcqKR1UDz8lFhgqri3Re5VstRd3tCMepD1/L0ZzToICa1
   KrxGRr1bLiZotWxPPF7o7XXMFoZJeeR0SxlYJajbAEPLGzUKr2UuW1ZLE
   xdKaWNHtXjNExrYONkHH3FxIp6+u0XajU+2hqgQ8K9Kglfm6v92f2PSls
   Z6meAPnW9KaCBhgO6qANqnyLagMkxZsWEmtFtiGdE4uLk97smh4p+ySxz
   AFSMUkon616Ou6RaedrQlOmpSsRVMqIiINQc/mWFpki9UUbUc8bWkQKIb
   Q==;
X-CSE-ConnectionGUID: Wstgnc2NQr6/RZEslexmcg==
X-CSE-MsgGUID: EpEuj87sRBS2mFURTOoZJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7332642"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="7332642"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 02:13:38 -0700
X-CSE-ConnectionGUID: UTlku0ZuTEeImzs8rmjE/Q==
X-CSE-MsgGUID: laR0FZfHQmyH1FoPVMTzRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="23372616"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Apr 2024 02:13:37 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsJA7-0000p4-0p;
	Thu, 04 Apr 2024 09:13:35 +0000
Date: Thu, 4 Apr 2024 17:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <duanzi@zju.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 20434/22045]
 net/sched/act_mirred.c:217:21: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202404041743.yILerkAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e89315eb08769716cbf7e08f49672222cf0eca47
commit: 66b5f39a891163c63bedcb59610991c784b416a4 [20434/22045] net: sched: protect against stack overflow in TC act_mirred
config: arm64-randconfig-r112-20240401 (https://download.01.org/0day-ci/archive/20240404/202404041743.yILerkAq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240404/202404041743.yILerkAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404041743.yILerkAq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sched/act_mirred.c:217:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] <asn:3> *__p @@     got unsigned int * @@
   net/sched/act_mirred.c:217:21: sparse:     expected unsigned int [noderef] <asn:3> *__p
   net/sched/act_mirred.c:217:21: sparse:     got unsigned int *
>> net/sched/act_mirred.c:217:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] <asn:3> *__p @@     got unsigned int * @@
   net/sched/act_mirred.c:217:21: sparse:     expected unsigned int [noderef] <asn:3> *__p
   net/sched/act_mirred.c:217:21: sparse:     got unsigned int *
>> net/sched/act_mirred.c:217:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] <asn:3> *__p @@     got unsigned int * @@
   net/sched/act_mirred.c:217:21: sparse:     expected unsigned int [noderef] <asn:3> *__p
   net/sched/act_mirred.c:217:21: sparse:     got unsigned int *
>> net/sched/act_mirred.c:217:21: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned int [noderef] <asn:3> *__p @@     got unsigned int * @@
   net/sched/act_mirred.c:217:21: sparse:     expected unsigned int [noderef] <asn:3> *__p
   net/sched/act_mirred.c:217:21: sparse:     got unsigned int *
   net/sched/act_mirred.c:217:21: sparse: sparse: dereference of noderef expression
   net/sched/act_mirred.c:217:21: sparse: sparse: dereference of noderef expression
   net/sched/act_mirred.c:217:21: sparse: sparse: dereference of noderef expression
   net/sched/act_mirred.c:217:21: sparse: sparse: dereference of noderef expression
   net/sched/act_mirred.c:217:21: sparse: sparse: dereference of noderef expression
   net/sched/act_mirred.c:217:21: sparse: sparse: dereference of noderef expression
   net/sched/act_mirred.c:217:21: sparse: sparse: dereference of noderef expression
   net/sched/act_mirred.c:217:21: sparse: sparse: dereference of noderef expression
   In file included from include/net/act_api.h:13,
                    from include/net/pkt_cls.h:8,
                    from net/sched/act_mirred.c:28:
   In function 'net_generic',
       inlined from 'tc_action_net_exit' at include/net/act_api.h:137:30,
       inlined from 'mirred_exit_net' at net/sched/act_mirred.c:444:2:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'mirred_exit_net':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
   In function 'net_generic',
       inlined from 'mirred_init_net' at net/sched/act_mirred.c:437:29:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'mirred_init_net':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
   In function 'net_generic',
       inlined from 'tcf_mirred_walker' at net/sched/act_mirred.c:357:29:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'tcf_mirred_walker':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
   In function 'net_generic',
       inlined from 'tcf_mirred_init' at net/sched/act_mirred.c:102:29:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'tcf_mirred_init':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~
   In function 'net_generic',
       inlined from 'tcf_mirred_search' at net/sched/act_mirred.c:365:29:
   include/net/netns/generic.h:46:22: warning: array subscript <unknown> is outside array bounds of 'void *[0]' [-Warray-bounds=]
      46 |         ptr = ng->ptr[id];
         |               ~~~~~~~^~~~
   include/net/netns/generic.h: In function 'tcf_mirred_search':
   include/net/netns/generic.h:35:23: note: while referencing 'ptr'
      35 |                 void *ptr[0];
         |                       ^~~

vim +217 net/sched/act_mirred.c

   199	
   200	static int tcf_mirred_act(struct sk_buff *skb, const struct tc_action *a,
   201				  struct tcf_result *res)
   202	{
   203		struct tcf_mirred *m = to_mirred(a);
   204		struct sk_buff *skb2 = skb;
   205		bool m_mac_header_xmit;
   206		struct net_device *dev;
   207		unsigned int rec_level;
   208		int retval, err = 0;
   209		bool use_reinsert;
   210		bool want_ingress;
   211		bool is_redirect;
   212		bool expects_nh;
   213		int m_eaction;
   214		int mac_len;
   215		bool at_nh;
   216	
 > 217		rec_level = __this_cpu_inc_return(mirred_rec_level);
   218		if (unlikely(rec_level > MIRRED_RECURSION_LIMIT)) {
   219			net_warn_ratelimited("Packet exceeded mirred recursion limit on dev %s\n",
   220					     netdev_name(skb->dev));
   221			__this_cpu_dec(mirred_rec_level);
   222			return TC_ACT_SHOT;
   223		}
   224	
   225		tcf_lastuse_update(&m->tcf_tm);
   226		bstats_cpu_update(this_cpu_ptr(m->common.cpu_bstats), skb);
   227	
   228		m_mac_header_xmit = READ_ONCE(m->tcfm_mac_header_xmit);
   229		m_eaction = READ_ONCE(m->tcfm_eaction);
   230		retval = READ_ONCE(m->tcf_action);
   231		dev = rcu_dereference_bh(m->tcfm_dev);
   232		if (unlikely(!dev)) {
   233			pr_notice_once("tc mirred: target device is gone\n");
   234			goto out;
   235		}
   236	
   237		if (unlikely(!(dev->flags & IFF_UP))) {
   238			net_notice_ratelimited("tc mirred to Houston: device %s is down\n",
   239					       dev->name);
   240			goto out;
   241		}
   242	
   243		/* we could easily avoid the clone only if called by ingress and clsact;
   244		 * since we can't easily detect the clsact caller, skip clone only for
   245		 * ingress - that covers the TC S/W datapath.
   246		 */
   247		is_redirect = tcf_mirred_is_act_redirect(m_eaction);
   248		use_reinsert = skb_at_tc_ingress(skb) && is_redirect &&
   249			       tcf_mirred_can_reinsert(retval);
   250		if (!use_reinsert) {
   251			skb2 = skb_clone(skb, GFP_ATOMIC);
   252			if (!skb2)
   253				goto out;
   254		}
   255	
   256		want_ingress = tcf_mirred_act_wants_ingress(m_eaction);
   257	
   258		expects_nh = want_ingress || !m_mac_header_xmit;
   259		at_nh = skb->data == skb_network_header(skb);
   260		if (at_nh != expects_nh) {
   261			mac_len = skb_at_tc_ingress(skb) ? skb->mac_len :
   262				  skb_network_header(skb) - skb_mac_header(skb);
   263			if (expects_nh) {
   264				/* target device/action expect data at nh */
   265				skb_pull_rcsum(skb2, mac_len);
   266			} else {
   267				/* target device/action expect data at mac */
   268				skb_push_rcsum(skb2, mac_len);
   269			}
   270		}
   271	
   272		skb2->skb_iif = skb->dev->ifindex;
   273		skb2->dev = dev;
   274	
   275		/* mirror is always swallowed */
   276		if (is_redirect) {
   277			skb2->tc_redirected = 1;
   278			skb2->tc_from_ingress = skb2->tc_at_ingress;
   279	
   280			/* let's the caller reinsert the packet, if possible */
   281			if (use_reinsert) {
   282				res->ingress = want_ingress;
   283				res->qstats = this_cpu_ptr(m->common.cpu_qstats);
   284				skb_tc_reinsert(skb, res);
   285				__this_cpu_dec(mirred_rec_level);
   286				return TC_ACT_CONSUMED;
   287			}
   288		}
   289	
   290		if (!want_ingress)
   291			err = dev_queue_xmit(skb2);
   292		else
   293			err = netif_receive_skb(skb2);
   294	
   295		if (err) {
   296	out:
   297			qstats_overlimit_inc(this_cpu_ptr(m->common.cpu_qstats));
   298			if (tcf_mirred_is_act_redirect(m_eaction))
   299				retval = TC_ACT_SHOT;
   300		}
   301		__this_cpu_dec(mirred_rec_level);
   302	
   303		return retval;
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
