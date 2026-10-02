Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E7A4E2F1F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955258; cv=none; b=ZpVLPBj49jSxNQYpi2ojE1EQbBY5ZBEdVh4T2xkOwA99YGu40Pj0eI3aM+yM/Y+H8K9+QQ3EVK7/wQ3nIAMMqJlaJHtvZXiooFe9HwKZ63rEAzYVdVXRUoOSkm2oI6cARv92VMy4932I/6pSXX1tGCUY4kiiclCOM7VtVdDwwHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955258; c=relaxed/simple;
	bh=/Z7aCx3pRxPEsjne0XKvU++wgcS5ypUH6Go36LELkIE=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YyfMO0ora1S1BS/VKWaCpWDMIYhdlfbXxeopNdW+jj2aFgh4rpDWzyXgx1CIPsogemQSrYyanhwwF1itilDVRjqI+TwXC/8AsMNFc60M9yXEX2LOO+0OjrjhPizbNd0ioLyrCJy2NCkMZ9cAQba4ld+YVattkURzaLR36SuuQ3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IaWeXdOy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaWeXdOy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955256; x=1822491256;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=/Z7aCx3pRxPEsjne0XKvU++wgcS5ypUH6Go36LELkIE=;
  b=IaWeXdOyLOe0BLbrNi4dbI9qchU8V2/IyfmPJVw7fsH8B7xHdOtODfnj
   vQ0Z3dU4I6KtEDEhzD9MM5CxyIvp5dgFhlr7BOyeYe3ugIem5ohOxuE8c
   kU7nyD69u32htH31gkpVwXDMI3yA9OXU/6Xj+SuwlKs6Q5Lbpd7Ob7kX+
   v4lxRstw0HOG3+g1kjtyLPIz7rFtvXsrLqrE+e5YrH5x/YXcLapz3wRfp
   ytesLDVblnjI1h1VUIAMVSaiOj8wgFSKXantpyovbzDfZ7tqec8+OPNqd
   kGaLp07hgHlfRyMGhQbe4ZUnXMiMc7DTa8Nd3KZ3wGlxS4guTU2qIoGeY
   w==;
X-CSE-ConnectionGUID: AMQWy3I0QyqrDE4u4USipQ==
X-CSE-MsgGUID: GeAK1SdYQ22XHjgD7TDncQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90856902"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90856902"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:34:15 -0700
X-CSE-ConnectionGUID: 73tes70YQCu9CEiLuX5rPA==
X-CSE-MsgGUID: LRbfFxhjTMCrtIPvjUxCnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="304232288"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2026 08:34:14 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCfH1-00000000TBx-3753
	for oe-kbuild-all@lists.linux.dev;
	Fri, 02 Oct 2026 15:34:11 +0000
Date: Fri, 2 Oct 2026 23:33:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: net/sched: cap the accounted backlog before it can wrap
Message-ID: <202610022321.jJGpwLoe-lkp@intel.com>
References: <202610022321.jJGpwLoe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610022321.jJGpwLoe-lkp@intel.com>

Hi Jamal,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-cap-the-accounted-backlog-before-it-can-wrap/20261002-034431
base:   
patch link:    https://lore.kernel.org/r/202610022321.jJGpwLoe-lkp%40intel.com
config: sh-randconfig-1001-20261002 (https://download.01.org/0day-ci/archive/20261002/202610022321.jJGpwLoe-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610022321.jJGpwLoe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610022321.jJGpwLoe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sched/sch_cake.c:1742:66: warning: "/*" within comment [-Wcomment]
    1742 |  * consumed by a terminal TC action (reason in *qerr); else *flow/*host


vim +1742 net/sched/sch_cake.c

  1740	
  1741	/* Run the optional external classifier. Returns true when the packet was
> 1742	 * consumed by a terminal TC action (reason in *qerr); else *flow/*host
  1743	 * hold the filter's overrides (0 if none).
  1744	 */
  1745	static bool cake_tcf_classify(struct Qdisc *sch, struct sk_buff *skb,
  1746				      u16 *flow, u16 *host, int *qerr)
  1747	{
  1748		struct cake_sched_data *q = qdisc_priv(sch);
  1749		struct tcf_proto *filter;
  1750		struct tcf_result res;
  1751		int result;
  1752	
  1753		*flow = 0;
  1754		*host = 0;
  1755	
  1756		filter = rcu_dereference_bh(q->filter_list);
  1757		if (!filter)
  1758			return false;
  1759	
  1760		*qerr = NET_XMIT_SUCCESS | __NET_XMIT_BYPASS;
  1761		result = tcf_classify_qdisc(skb, filter, &res, false);
  1762	
  1763		if (result >= 0) {
  1764	#ifdef CONFIG_NET_CLS_ACT
  1765			switch (result) {
  1766			case TC_ACT_STOLEN:
  1767			case TC_ACT_QUEUED:
  1768			case TC_ACT_TRAP:
  1769				*qerr = NET_XMIT_SUCCESS | __NET_XMIT_STOLEN;
  1770				fallthrough;
  1771			case TC_ACT_SHOT:
  1772				return true;
  1773			}
  1774	#endif
  1775			if (TC_H_MIN(res.classid) <= CAKE_QUEUES)
  1776				*flow = TC_H_MIN(res.classid);
  1777			if (TC_H_MAJ(res.classid) <= (CAKE_QUEUES << 16))
  1778				*host = TC_H_MAJ(res.classid) >> 16;
  1779		}
  1780		return false;
  1781	}
  1782	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
