Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD984C6C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 00:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765671635; cv=none; b=tAb2PzsAMi81G6yygHZjd8IP640ffoSf0K33AmbLejdMNRzllVfB+as74WmzT57oSUvkOVKWdXao0cTpq1jMlMjSdRT2imZq+eWOkxRigjt+2c5ObmkRreRPwh/Z+Uw4RDni/0O5Q/WnZ9uBEKRm9Ng885GoEj22FYQuab2Ynh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765671635; c=relaxed/simple;
	bh=85TQX/juNJlronTJt2qmgex53yBz2B6j6C+IVeqEmlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7aESAusdkXmDbO24Ech8zUREMQUOlddRWZrUHgYVz3SqHL414v4gxaOtUXkDgDcAdb7xFmDgE99zeg4b3EnYvvwOqak0k6fNZS5+j0pDaI11zUcD1v5HMLKaKT89iAUwXbFmy81IpaMqyTt8yC+vr+sfUCoTlVT8vdHj4Adu4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aqMG0FC/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aqMG0FC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765671634; x=1797207634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=85TQX/juNJlronTJt2qmgex53yBz2B6j6C+IVeqEmlw=;
  b=aqMG0FC/6g6oEm1SXZcAFUaHv26FjCP/4z0gvxYl0eQB2mf5yDznxWNd
   BSKfbgI921AXpaOwJrPPGrp0IMvjtJEO9oo2utUtLaR25ykcuhi+zWRJo
   TqhUXWEYGFXXI1vYmj6KTocIRZWjg12MDSC2vN+k1ychF4DNUkrA7Oe1w
   m9R6qzYIbJ9SKuo0GNd8qTml6DdV5i8vca6Srylqed1n/0D9SmABu+eaj
   OhSMYLsLgMt47iQzhdud2WfbgdLLwhIh6qmphTLYKk8AY69yOotukisO9
   i0BI1oaE3t1mv9cFXkixecLN3QaPrZ6kUgbncUJjcL072MUMepVxjIXdX
   Q==;
X-CSE-ConnectionGUID: oB9qhQXUQ2ChdKSnSdyhTg==
X-CSE-MsgGUID: C5HQxcO+S22coi7EH7kzwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="70207760"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="70207760"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 16:20:33 -0800
X-CSE-ConnectionGUID: biNRU4ZnR0ePzkufpJtSjg==
X-CSE-MsgGUID: p/p4vMnNTE+xU7lEJCGtmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="220784803"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Dec 2025 16:20:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUZqg-000000008MT-0Uk7;
	Sun, 14 Dec 2025 00:20:30 +0000
Date: Sun, 14 Dec 2025 08:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC net 1/1] net: sched: Fix ethx:ingress -> ethy:egress
 -> ethx:ingress mirred loop
Message-ID: <202512140745.hsk9Cf0J-lkp@intel.com>
References: <20251213121636.132568-1-jhs@mojatatu.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213121636.132568-1-jhs@mojatatu.com>

Hi Jamal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-Fix-ethx-ingress-ethy-egress-ethx-ingress-mirred-loop/20251213-201906
base:   net/main
patch link:    https://lore.kernel.org/r/20251213121636.132568-1-jhs%40mojatatu.com
patch subject: [PATCH RFC net 1/1] net: sched: Fix ethx:ingress -> ethy:egress -> ethx:ingress mirred loop
config: um-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512140745.hsk9Cf0J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140745.hsk9Cf0J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140745.hsk9Cf0J-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/sched/act_mirred.c: In function 'tcf_mirred_to_dev':
>> net/sched/act_mirred.c:312:28: error: 'struct sk_buff' has no member named 'ttl'
     312 |                 skb_to_send->ttl++;
         |                            ^~
   net/sched/act_mirred.c:315:28: error: 'struct sk_buff' has no member named 'ttl'
     315 |                 skb_to_send->ttl++;
         |                            ^~
   net/sched/act_mirred.c: In function 'tcf_mirred_act':
   net/sched/act_mirred.c:431:16: error: 'struct sk_buff' has no member named 'ttl'
     431 |         if (skb->ttl >= MIRRED_NEST_LIMIT - 1) {
         |                ^~


vim +312 net/sched/act_mirred.c

   246	
   247	static int tcf_mirred_to_dev(struct sk_buff *skb, struct tcf_mirred *m,
   248				     struct net_device *dev,
   249				     const bool m_mac_header_xmit, int m_eaction,
   250				     int retval)
   251	{
   252		struct sk_buff *skb_to_send = skb;
   253		bool want_ingress;
   254		bool is_redirect;
   255		bool expects_nh;
   256		bool at_ingress;
   257		bool dont_clone;
   258		int mac_len;
   259		bool at_nh;
   260		int err;
   261	
   262		is_redirect = tcf_mirred_is_act_redirect(m_eaction);
   263		if (unlikely(!(dev->flags & IFF_UP)) || !netif_carrier_ok(dev)) {
   264			net_notice_ratelimited("tc mirred to Houston: device %s is down\n",
   265					       dev->name);
   266			goto err_cant_do;
   267		}
   268	
   269		/* we could easily avoid the clone only if called by ingress and clsact;
   270		 * since we can't easily detect the clsact caller, skip clone only for
   271		 * ingress - that covers the TC S/W datapath.
   272		 */
   273		at_ingress = skb_at_tc_ingress(skb);
   274		dont_clone = skb_at_tc_ingress(skb) && is_redirect &&
   275			tcf_mirred_can_reinsert(retval);
   276		if (!dont_clone) {
   277			skb_to_send = skb_clone(skb, GFP_ATOMIC);
   278			if (!skb_to_send)
   279				goto err_cant_do;
   280		}
   281	
   282		want_ingress = tcf_mirred_act_wants_ingress(m_eaction);
   283	
   284		/* All mirred/redirected skbs should clear previous ct info */
   285		nf_reset_ct(skb_to_send);
   286		if (want_ingress && !at_ingress) /* drop dst for egress -> ingress */
   287			skb_dst_drop(skb_to_send);
   288	
   289		expects_nh = want_ingress || !m_mac_header_xmit;
   290		at_nh = skb->data == skb_network_header(skb);
   291		if (at_nh != expects_nh) {
   292			mac_len = at_ingress ? skb->mac_len :
   293				  skb_network_offset(skb);
   294			if (expects_nh) {
   295				/* target device/action expect data at nh */
   296				skb_pull_rcsum(skb_to_send, mac_len);
   297			} else {
   298				/* target device/action expect data at mac */
   299				skb_push_rcsum(skb_to_send, mac_len);
   300			}
   301		}
   302	
   303		skb_to_send->skb_iif = skb->dev->ifindex;
   304		skb_to_send->dev = dev;
   305	
   306		if (is_redirect) {
   307			if (skb == skb_to_send)
   308				retval = TC_ACT_CONSUMED;
   309	
   310			skb_set_redirected(skb_to_send, skb_to_send->tc_at_ingress);
   311	
 > 312			skb_to_send->ttl++;
   313			err = tcf_mirred_forward(at_ingress, want_ingress, skb_to_send);
   314		} else {
   315			skb_to_send->ttl++;
   316			err = tcf_mirred_forward(at_ingress, want_ingress, skb_to_send);
   317		}
   318		if (err)
   319			tcf_action_inc_overlimit_qstats(&m->common);
   320	
   321		return retval;
   322	
   323	err_cant_do:
   324		if (is_redirect)
   325			retval = TC_ACT_SHOT;
   326		tcf_action_inc_overlimit_qstats(&m->common);
   327		return retval;
   328	}
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
