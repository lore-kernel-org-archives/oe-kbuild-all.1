Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC5CA6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 16:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194749; cv=none; b=bT2uh6lOwz/wPZkd0MGwzBkz/h/KhMOA1GeozYBG+Unt5X1OJH1ESvshu+UacNvkxwE7wiTeHpypYW00a0czkW2g6j6TeAb8za+YKM+H1979mOS1vW1vufTAjYfiPLuwLY4v2/E/WJkdanJ/aplrwndArOggG8wX8Ie3pNb2v30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194749; c=relaxed/simple;
	bh=vzcYKa0daWUmLvkngqDa/93eCgrJjoZ7lTIiV8Y6jTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Hu5Q2dx6IUCRaP8PqJ0lSKemz3jhxa4RKMgII9z0+MfPPo/WmCR+CFqBbX2FBSO3PjDsSoyJQGk7d8S9csC9KI2B4OD7Y+1x82AAGh5YKJFUR1+Dux54lBeZ8yXtAbkTduVFBEMEsnhpmT70/9Xu2BlATR49Qr+CnzPIVsf6q9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eVKYosjL; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eVKYosjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781194747; x=1812730747;
  h=date:from:to:cc:subject:message-id;
  bh=vzcYKa0daWUmLvkngqDa/93eCgrJjoZ7lTIiV8Y6jTw=;
  b=eVKYosjLnL+Pm94BViQ213HKSIjtVfouWRf4gHd9ClOdrs2HHSeDEXom
   dGRrO+T18tdb4V6MA0csi6aPKIkbcFHwBmK16dT81txr+9Kpml5AVkIYG
   ExhDWtLSJrAIcLtZVESWuLNR7Lo9JmFGLQR3qnfMoQgCdJsoL/05bdqk4
   Sp32Zy0LlhgmGyWAAOyWSC+aqVYIk7LZ+LXx0rMroG0E+Y+pPPaRfH/gS
   0ZJSk8oWLupmcp3+3OIsGU7Ywz9O6W3AcHK4ygrOLQBjgu2lpOu/4Gx4B
   yAiSy6sX6/tIl+3wcMPKBq3RCt1qNw0aJGvXP+BVyN8cVJ16lrgePNACB
   A==;
X-CSE-ConnectionGUID: 3P0lUOLKTxuyJ6f2r/dyHA==
X-CSE-MsgGUID: sugf3JMbReaRkM3X7BXZ5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92579340"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92579340"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:19:06 -0700
X-CSE-ConnectionGUID: T5fzRLLuSgucbc33A+mieg==
X-CSE-MsgGUID: jVfvwAkRSsaTu0MO9mZtuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="284617305"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2026 09:19:05 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXi7S-00000000NSM-0fa0;
	Thu, 11 Jun 2026 16:19:02 +0000
Date: Fri, 12 Jun 2026 00:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 10787/13002]
 net/netfilter/nfnetlink_cthelper.c:254:22: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202606120047.vL3vIu66-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: ac46f3f35b6e68fb062ae7cf780d516c0cf4c00a [10787/13002] netfilter: nf_conntrack_helper: add refcounting from datapath
config: x86_64-randconfig-r113-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120047.vL3vIu66-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120047.vL3vIu66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120047.vL3vIu66-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nfnetlink_cthelper.c:254:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int ( [noderef] __rcu *help )( ... ) @@     got int ( * )( ... ) @@
   net/netfilter/nfnetlink_cthelper.c:254:22: sparse:     expected int ( [noderef] __rcu *help )( ... )
   net/netfilter/nfnetlink_cthelper.c:254:22: sparse:     got int ( * )( ... )

vim +254 net/netfilter/nfnetlink_cthelper.c

12f7a505331e6b Pablo Neira Ayuso 2012-05-13  212  
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  213  static int
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  214  nfnl_cthelper_create(const struct nlattr * const tb[],
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  215  		     struct nf_conntrack_tuple *tuple)
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  216  {
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  217  	struct nf_conntrack_helper *helper;
83d90219a5df8d Liping Zhang      2017-03-25  218  	struct nfnl_cthelper *nfcth;
157ffffeb5dc1b Florian Westphal  2017-04-16  219  	unsigned int size;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  220  	int ret;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  221  
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  222  	if (!tb[NFCTH_TUPLE] || !tb[NFCTH_POLICY] || !tb[NFCTH_PRIV_DATA_LEN])
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  223  		return -EINVAL;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  224  
6031487d4e273d Pablo Neira Ayuso 2026-06-04  225  	nfcth = kzalloc_obj(*nfcth, GFP_KERNEL_ACCOUNT);
83d90219a5df8d Liping Zhang      2017-03-25  226  	if (nfcth == NULL)
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  227  		return -ENOMEM;
6031487d4e273d Pablo Neira Ayuso 2026-06-04  228  
6031487d4e273d Pablo Neira Ayuso 2026-06-04  229  	helper = kzalloc_obj(*helper, GFP_KERNEL_ACCOUNT);
6031487d4e273d Pablo Neira Ayuso 2026-06-04  230  	if (!helper) {
6031487d4e273d Pablo Neira Ayuso 2026-06-04  231  		ret = -ENOMEM;
6031487d4e273d Pablo Neira Ayuso 2026-06-04  232  		goto err_cth;
6031487d4e273d Pablo Neira Ayuso 2026-06-04  233  	}
6031487d4e273d Pablo Neira Ayuso 2026-06-04  234  
6031487d4e273d Pablo Neira Ayuso 2026-06-04  235  	nfcth->helper = helper;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  236  
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  237  	ret = nfnl_cthelper_parse_expect_policy(helper, tb[NFCTH_POLICY]);
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  238  	if (ret < 0)
6031487d4e273d Pablo Neira Ayuso 2026-06-04  239  		goto err_helper;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  240  
872f690341948b Francis Laniel    2020-11-15  241  	nla_strscpy(helper->name,
4b83a9049a983b Eric Dumazet      2018-05-21  242  		    tb[NFCTH_NAME], NF_CT_HELPER_NAME_LEN);
157ffffeb5dc1b Florian Westphal  2017-04-16  243  	size = ntohl(nla_get_be32(tb[NFCTH_PRIV_DATA_LEN]));
c593642c8be046 Pankaj Bharadiya  2019-12-09  244  	if (size > sizeof_field(struct nf_conn_help, data)) {
157ffffeb5dc1b Florian Westphal  2017-04-16  245  		ret = -ENOMEM;
6031487d4e273d Pablo Neira Ayuso 2026-06-04  246  		goto err_helper;
157ffffeb5dc1b Florian Westphal  2017-04-16  247  	}
703acd70f24965 Pablo Neira Ayuso 2020-05-24  248  	helper->data_len = size;
157ffffeb5dc1b Florian Westphal  2017-04-16  249  
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  250  	helper->flags |= NF_CT_HELPER_F_USERSPACE;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  251  	memcpy(&helper->tuple, tuple, sizeof(struct nf_conntrack_tuple));
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  252  
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  253  	helper->me = THIS_MODULE;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13 @254  	helper->help = nfnl_userspace_cthelper;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  255  	helper->from_nlattr = nfnl_cthelper_from_nlattr;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  256  	helper->to_nlattr = nfnl_cthelper_to_nlattr;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  257  
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  258  	/* Default to queue number zero, this can be updated at any time. */
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  259  	if (tb[NFCTH_QUEUE_NUM])
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  260  		helper->queue_num = ntohl(nla_get_be32(tb[NFCTH_QUEUE_NUM]));
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  261  
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  262  	if (tb[NFCTH_STATUS]) {
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  263  		int status = ntohl(nla_get_be32(tb[NFCTH_STATUS]));
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  264  
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  265  		switch(status) {
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  266  		case NFCT_HELPER_STATUS_ENABLED:
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  267  			helper->flags |= NF_CT_HELPER_F_CONFIGURED;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  268  			break;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  269  		case NFCT_HELPER_STATUS_DISABLED:
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  270  			helper->flags &= ~NF_CT_HELPER_F_CONFIGURED;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  271  			break;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  272  		}
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  273  	}
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  274  
6031487d4e273d Pablo Neira Ayuso 2026-06-04  275  	ret = __nf_conntrack_helper_register(helper);
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  276  	if (ret < 0)
6031487d4e273d Pablo Neira Ayuso 2026-06-04  277  		goto err_helper;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  278  
83d90219a5df8d Liping Zhang      2017-03-25  279  	list_add_tail(&nfcth->list, &nfnl_cthelper_list);
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  280  	return 0;
6031487d4e273d Pablo Neira Ayuso 2026-06-04  281  err_helper:
6031487d4e273d Pablo Neira Ayuso 2026-06-04  282  	kfree(helper);
6031487d4e273d Pablo Neira Ayuso 2026-06-04  283  err_cth:
83d90219a5df8d Liping Zhang      2017-03-25  284  	kfree(nfcth);
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  285  	return ret;
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  286  }
12f7a505331e6b Pablo Neira Ayuso 2012-05-13  287  

:::::: The code at line 254 was first introduced by commit
:::::: 12f7a505331e6b2754684b509f2ac8f0011ce644 netfilter: add user-space connection tracking helper infrastructure

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
