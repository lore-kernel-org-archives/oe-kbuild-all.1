Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CE9B653
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 05:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707109641; cv=none; b=Xfm0Iz1aQU882VKNevPDE/vJ6lNY0LzSqBqcDDPd6tQQnn43JCS+U5N2fMN61oVCB0VjC5oi5Ct6YqwDsEdA+DBW8Lk9/T1EefVE9vvvEPBBubTvi5nbmlSdI4LnSIggosF+VZ+FwuafBp1A4+8idc6crxHEQbNw64Voc44G1Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707109641; c=relaxed/simple;
	bh=nvIyRVfbAWBaRzNILryCxsCLS17HCXH/21fAWheFcSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M8oAvk5yx2/mlYUfzUfora2+3nPmXJUjObwbTVOdJyUBU5EgFSonF4ZAFF5t6/rqsILDEo4P1N4Zml+F9iqYtEiCpIb6dAALas/WIquHHOyHWxqj8GURzFCRNGJ8Rf84b2LOGNOFU7Z8hVq/I5sft0KQSjtP5ehWmSFO2uLwRI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d5Vzth4C; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d5Vzth4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707109640; x=1738645640;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nvIyRVfbAWBaRzNILryCxsCLS17HCXH/21fAWheFcSE=;
  b=d5Vzth4C8p5wAFzZrfRhUot2rpsd8ALwc5m+a5CvwnhyhVukF9cVBXlw
   S7TIhTr0/1VKyL3UgJ+UGcutcijXes+GwTUlWrre/nx76hR1iUln1T+ax
   ree/RIWqvUcS8Ouf6/Ucv/Rg3UgnLpPloCoA8gY7YovCHbMVgiNx83Brf
   w4ncxPtujKHQsC5jvGDBq2WjaV1evlqershrwQcsoupHoxWZEYFZ9PY8W
   MRpDB5p2akfRdrkcYyhCSlDiooXPzdcsdlh8w2V/c6zT20ZqewNCENHaq
   +JhHa/Ei1vitHgMxLxq4MqFHWcWXRT86sFzSJ6+8sd4G63+SEQ5STvK6B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="343526"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="343526"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 21:07:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5238653"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2024 21:07:12 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWrCH-00009g-2r;
	Mon, 05 Feb 2024 05:07:09 +0000
Date: Mon, 5 Feb 2024 13:07:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@ucw.cz>
Subject: [cip:linux-4.4.y-st-rt 412/872] net/sched/cls_api.c:243:9: warning:
 unused variable 'name'
Message-ID: <202402051331.AJO8bOwW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt
head:   35edf5997b50add89f3349bf1da2b2cfbc2754ce
commit: 69f31f361fec8e21c44f629edd9b15c5014d759e [412/872] net: sched: prevent UAF on tc_ctl_tfilter when temporarily dropping rtnl_lock
config: i386-buildonly-randconfig-005-20240129 (https://download.01.org/0day-ci/archive/20240205/202402051331.AJO8bOwW-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051331.AJO8bOwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051331.AJO8bOwW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sched/cls_api.c: In function 'tc_ctl_tfilter':
>> net/sched/cls_api.c:243:9: warning: unused variable 'name' [-Wunused-variable]
       char name[IFNAMSIZ];
            ^~~~
>> net/sched/cls_api.c:242:19: warning: unused variable 'kind' [-Wunused-variable]
       struct nlattr *kind = tca[TCA_KIND];
                      ^~~~
   net/sched/cls_api.c:1: warning: no structured comments found


vim +/name +243 net/sched/cls_api.c

^1da177e4c3f41 Linus Torvalds                2005-04-16  120  
661d2967b3f1b3 Thomas Graf                   2013-03-21  121  static int tc_ctl_tfilter(struct sk_buff *skb, struct nlmsghdr *n)
^1da177e4c3f41 Linus Torvalds                2005-04-16  122  {
3b1e0a655f8eba YOSHIFUJI Hideaki             2008-03-26  123  	struct net *net = sock_net(skb->sk);
add93b610a4e66 Patrick McHardy               2008-01-22  124  	struct nlattr *tca[TCA_MAX + 1];
^1da177e4c3f41 Linus Torvalds                2005-04-16  125  	struct tcmsg *t;
^1da177e4c3f41 Linus Torvalds                2005-04-16  126  	u32 protocol;
^1da177e4c3f41 Linus Torvalds                2005-04-16  127  	u32 prio;
^1da177e4c3f41 Linus Torvalds                2005-04-16  128  	u32 nprio;
^1da177e4c3f41 Linus Torvalds                2005-04-16  129  	u32 parent;
^1da177e4c3f41 Linus Torvalds                2005-04-16  130  	struct net_device *dev;
^1da177e4c3f41 Linus Torvalds                2005-04-16  131  	struct Qdisc  *q;
25d8c0d55f241c John Fastabend                2014-09-12  132  	struct tcf_proto __rcu **back;
25d8c0d55f241c John Fastabend                2014-09-12  133  	struct tcf_proto __rcu **chain;
^1da177e4c3f41 Linus Torvalds                2005-04-16  134  	struct tcf_proto *tp;
dc7f9f6e883855 Eric Dumazet                  2011-07-05  135  	const struct tcf_proto_ops *tp_ops;
20fea08b5fb639 Eric Dumazet                  2007-11-14  136  	const struct Qdisc_class_ops *cops;
^1da177e4c3f41 Linus Torvalds                2005-04-16  137  	unsigned long cl;
^1da177e4c3f41 Linus Torvalds                2005-04-16  138  	unsigned long fh;
^1da177e4c3f41 Linus Torvalds                2005-04-16  139  	int err;
67bce5821c9ac8 Daniel Borkmann               2016-12-21  140  	int tp_created;
^1da177e4c3f41 Linus Torvalds                2005-04-16  141  
4e8bbb819d1594 Stéphane Graber               2014-04-30  142  	if ((n->nlmsg_type != RTM_GETTFILTER) &&
5f013c9bc70214 David S. Miller               2014-05-12  143  	    !netlink_ns_capable(skb, net->user_ns, CAP_NET_ADMIN))
dfc47ef8639fac Eric W. Biederman             2012-11-16  144  		return -EPERM;
de179c8c12e9e5 Hong zhi guo                  2013-03-25  145  
^1da177e4c3f41 Linus Torvalds                2005-04-16  146  replay:
67bce5821c9ac8 Daniel Borkmann               2016-12-21  147  	tp_created = 0;
67bce5821c9ac8 Daniel Borkmann               2016-12-21  148  
de179c8c12e9e5 Hong zhi guo                  2013-03-25  149  	err = nlmsg_parse(n, sizeof(*t), tca, TCA_MAX, NULL);
de179c8c12e9e5 Hong zhi guo                  2013-03-25  150  	if (err < 0)
de179c8c12e9e5 Hong zhi guo                  2013-03-25  151  		return err;
de179c8c12e9e5 Hong zhi guo                  2013-03-25  152  
942b81653a5252 David S. Miller               2012-06-26  153  	t = nlmsg_data(n);
^1da177e4c3f41 Linus Torvalds                2005-04-16  154  	protocol = TC_H_MIN(t->tcm_info);
^1da177e4c3f41 Linus Torvalds                2005-04-16  155  	prio = TC_H_MAJ(t->tcm_info);
^1da177e4c3f41 Linus Torvalds                2005-04-16  156  	nprio = prio;
^1da177e4c3f41 Linus Torvalds                2005-04-16  157  	parent = t->tcm_parent;
^1da177e4c3f41 Linus Torvalds                2005-04-16  158  	cl = 0;
^1da177e4c3f41 Linus Torvalds                2005-04-16  159  
^1da177e4c3f41 Linus Torvalds                2005-04-16  160  	if (prio == 0) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  161  		/* If no priority is given, user wants we allocated it. */
cc7ec456f82da7 Eric Dumazet                  2011-01-19  162  		if (n->nlmsg_type != RTM_NEWTFILTER ||
cc7ec456f82da7 Eric Dumazet                  2011-01-19  163  		    !(n->nlmsg_flags & NLM_F_CREATE))
^1da177e4c3f41 Linus Torvalds                2005-04-16  164  			return -ENOENT;
^1da177e4c3f41 Linus Torvalds                2005-04-16  165  		prio = TC_H_MAKE(0x80000000U, 0U);
^1da177e4c3f41 Linus Torvalds                2005-04-16  166  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16  167  
^1da177e4c3f41 Linus Torvalds                2005-04-16  168  	/* Find head of filter chain. */
^1da177e4c3f41 Linus Torvalds                2005-04-16  169  
^1da177e4c3f41 Linus Torvalds                2005-04-16  170  	/* Find link */
7316ae88c43d47 Tom Goff                      2010-03-19  171  	dev = __dev_get_by_index(net, t->tcm_ifindex);
aa767bfea48289 Stephen Hemminger             2008-01-21  172  	if (dev == NULL)
^1da177e4c3f41 Linus Torvalds                2005-04-16  173  		return -ENODEV;
^1da177e4c3f41 Linus Torvalds                2005-04-16  174  
^1da177e4c3f41 Linus Torvalds                2005-04-16  175  	/* Find qdisc */
^1da177e4c3f41 Linus Torvalds                2005-04-16  176  	if (!parent) {
af356afa010f3c Patrick McHardy               2009-09-04  177  		q = dev->qdisc;
^1da177e4c3f41 Linus Torvalds                2005-04-16  178  		parent = q->handle;
aa767bfea48289 Stephen Hemminger             2008-01-21  179  	} else {
aa767bfea48289 Stephen Hemminger             2008-01-21  180  		q = qdisc_lookup(dev, TC_H_MAJ(t->tcm_parent));
aa767bfea48289 Stephen Hemminger             2008-01-21  181  		if (q == NULL)
^1da177e4c3f41 Linus Torvalds                2005-04-16  182  			return -EINVAL;
aa767bfea48289 Stephen Hemminger             2008-01-21  183  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16  184  
^1da177e4c3f41 Linus Torvalds                2005-04-16  185  	/* Is it classful? */
cc7ec456f82da7 Eric Dumazet                  2011-01-19  186  	cops = q->ops->cl_ops;
cc7ec456f82da7 Eric Dumazet                  2011-01-19  187  	if (!cops)
^1da177e4c3f41 Linus Torvalds                2005-04-16  188  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds                2005-04-16  189  
71ebe5e9194739 Patrick McHardy               2009-09-04  190  	if (cops->tcf_chain == NULL)
71ebe5e9194739 Patrick McHardy               2009-09-04  191  		return -EOPNOTSUPP;
71ebe5e9194739 Patrick McHardy               2009-09-04  192  
^1da177e4c3f41 Linus Torvalds                2005-04-16  193  	/* Do we search for filter, attached to class? */
^1da177e4c3f41 Linus Torvalds                2005-04-16  194  	if (TC_H_MIN(parent)) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  195  		cl = cops->get(q, parent);
^1da177e4c3f41 Linus Torvalds                2005-04-16  196  		if (cl == 0)
^1da177e4c3f41 Linus Torvalds                2005-04-16  197  			return -ENOENT;
^1da177e4c3f41 Linus Torvalds                2005-04-16  198  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16  199  
^1da177e4c3f41 Linus Torvalds                2005-04-16  200  	/* And the last stroke */
^1da177e4c3f41 Linus Torvalds                2005-04-16  201  	chain = cops->tcf_chain(q, cl);
^1da177e4c3f41 Linus Torvalds                2005-04-16  202  	err = -EINVAL;
^1da177e4c3f41 Linus Torvalds                2005-04-16  203  	if (chain == NULL)
^1da177e4c3f41 Linus Torvalds                2005-04-16  204  		goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  205  
^1da177e4c3f41 Linus Torvalds                2005-04-16  206  	/* Check the chain for existence of proto-tcf with this priority */
25d8c0d55f241c John Fastabend                2014-09-12  207  	for (back = chain;
25d8c0d55f241c John Fastabend                2014-09-12  208  	     (tp = rtnl_dereference(*back)) != NULL;
25d8c0d55f241c John Fastabend                2014-09-12  209  	     back = &tp->next) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  210  		if (tp->prio >= prio) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  211  			if (tp->prio == prio) {
cc7ec456f82da7 Eric Dumazet                  2011-01-19  212  				if (!nprio ||
cc7ec456f82da7 Eric Dumazet                  2011-01-19  213  				    (tp->protocol != protocol && protocol))
^1da177e4c3f41 Linus Torvalds                2005-04-16  214  					goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  215  			} else
^1da177e4c3f41 Linus Torvalds                2005-04-16  216  				tp = NULL;
^1da177e4c3f41 Linus Torvalds                2005-04-16  217  			break;
^1da177e4c3f41 Linus Torvalds                2005-04-16  218  		}
^1da177e4c3f41 Linus Torvalds                2005-04-16  219  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16  220  
^1da177e4c3f41 Linus Torvalds                2005-04-16  221  	if (tp == NULL) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  222  		/* Proto-tcf does not exist, create new one */
^1da177e4c3f41 Linus Torvalds                2005-04-16  223  
add93b610a4e66 Patrick McHardy               2008-01-22  224  		if (tca[TCA_KIND] == NULL || !protocol)
^1da177e4c3f41 Linus Torvalds                2005-04-16  225  			goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  226  
^1da177e4c3f41 Linus Torvalds                2005-04-16  227  		err = -ENOENT;
cc7ec456f82da7 Eric Dumazet                  2011-01-19  228  		if (n->nlmsg_type != RTM_NEWTFILTER ||
cc7ec456f82da7 Eric Dumazet                  2011-01-19  229  		    !(n->nlmsg_flags & NLM_F_CREATE))
^1da177e4c3f41 Linus Torvalds                2005-04-16  230  			goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  231  
^1da177e4c3f41 Linus Torvalds                2005-04-16  232  
^1da177e4c3f41 Linus Torvalds                2005-04-16  233  		/* Create new proto tcf */
^1da177e4c3f41 Linus Torvalds                2005-04-16  234  
^1da177e4c3f41 Linus Torvalds                2005-04-16  235  		err = -ENOBUFS;
aa767bfea48289 Stephen Hemminger             2008-01-21  236  		tp = kzalloc(sizeof(*tp), GFP_KERNEL);
aa767bfea48289 Stephen Hemminger             2008-01-21  237  		if (tp == NULL)
^1da177e4c3f41 Linus Torvalds                2005-04-16  238  			goto errout;
f2df824948d559 Patrick McHardy               2008-05-20  239  		err = -ENOENT;
add93b610a4e66 Patrick McHardy               2008-01-22  240  		tp_ops = tcf_proto_lookup_ops(tca[TCA_KIND]);
^1da177e4c3f41 Linus Torvalds                2005-04-16  241  		if (tp_ops == NULL) {
add93b610a4e66 Patrick McHardy               2008-01-22 @242  			struct nlattr *kind = tca[TCA_KIND];
^1da177e4c3f41 Linus Torvalds                2005-04-16 @243  			char name[IFNAMSIZ];
^1da177e4c3f41 Linus Torvalds                2005-04-16  244  
69f31f361fec8e Thadeu Lima de Souza Cascardo 2022-05-02  245  			if (cl)
69f31f361fec8e Thadeu Lima de Souza Cascardo 2022-05-02  246  				cops->put(q, cl);
69f31f361fec8e Thadeu Lima de Souza Cascardo 2022-05-02  247  			cl = 0;
69f31f361fec8e Thadeu Lima de Souza Cascardo 2022-05-02  248  #ifdef CONFIG_MODULES
^1da177e4c3f41 Linus Torvalds                2005-04-16  249  			if (kind != NULL &&
add93b610a4e66 Patrick McHardy               2008-01-22  250  			    nla_strlcpy(name, kind, IFNAMSIZ) < IFNAMSIZ) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  251  				rtnl_unlock();
^1da177e4c3f41 Linus Torvalds                2005-04-16  252  				request_module("cls_%s", name);
^1da177e4c3f41 Linus Torvalds                2005-04-16  253  				rtnl_lock();
^1da177e4c3f41 Linus Torvalds                2005-04-16  254  				tp_ops = tcf_proto_lookup_ops(kind);
^1da177e4c3f41 Linus Torvalds                2005-04-16  255  				/* We dropped the RTNL semaphore in order to
^1da177e4c3f41 Linus Torvalds                2005-04-16  256  				 * perform the module load.  So, even if we
^1da177e4c3f41 Linus Torvalds                2005-04-16  257  				 * succeeded in loading the module we have to
^1da177e4c3f41 Linus Torvalds                2005-04-16  258  				 * replay the request.  We indicate this using
^1da177e4c3f41 Linus Torvalds                2005-04-16  259  				 * -EAGAIN.
^1da177e4c3f41 Linus Torvalds                2005-04-16  260  				 */
^1da177e4c3f41 Linus Torvalds                2005-04-16  261  				if (tp_ops != NULL) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  262  					module_put(tp_ops->owner);
^1da177e4c3f41 Linus Torvalds                2005-04-16  263  					err = -EAGAIN;
^1da177e4c3f41 Linus Torvalds                2005-04-16  264  				}
^1da177e4c3f41 Linus Torvalds                2005-04-16  265  			}
^1da177e4c3f41 Linus Torvalds                2005-04-16  266  #endif
^1da177e4c3f41 Linus Torvalds                2005-04-16  267  			kfree(tp);
^1da177e4c3f41 Linus Torvalds                2005-04-16  268  			goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  269  		}
^1da177e4c3f41 Linus Torvalds                2005-04-16  270  		tp->ops = tp_ops;
^1da177e4c3f41 Linus Torvalds                2005-04-16  271  		tp->protocol = protocol;
25d8c0d55f241c John Fastabend                2014-09-12  272  		tp->prio = nprio ? :
25d8c0d55f241c John Fastabend                2014-09-12  273  			       TC_H_MAJ(tcf_auto_prio(rtnl_dereference(*back)));
^1da177e4c3f41 Linus Torvalds                2005-04-16  274  		tp->q = q;
^1da177e4c3f41 Linus Torvalds                2005-04-16  275  		tp->classify = tp_ops->classify;
^1da177e4c3f41 Linus Torvalds                2005-04-16  276  		tp->classid = parent;
aa767bfea48289 Stephen Hemminger             2008-01-21  277  
aa767bfea48289 Stephen Hemminger             2008-01-21  278  		err = tp_ops->init(tp);
aa767bfea48289 Stephen Hemminger             2008-01-21  279  		if (err != 0) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  280  			module_put(tp_ops->owner);
^1da177e4c3f41 Linus Torvalds                2005-04-16  281  			kfree(tp);
^1da177e4c3f41 Linus Torvalds                2005-04-16  282  			goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  283  		}
^1da177e4c3f41 Linus Torvalds                2005-04-16  284  
12186be7d2e110 Minoru Usui                   2009-06-02  285  		tp_created = 1;
^1da177e4c3f41 Linus Torvalds                2005-04-16  286  
add93b610a4e66 Patrick McHardy               2008-01-22  287  	} else if (tca[TCA_KIND] && nla_strcmp(tca[TCA_KIND], tp->ops->kind))
^1da177e4c3f41 Linus Torvalds                2005-04-16  288  		goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  289  
^1da177e4c3f41 Linus Torvalds                2005-04-16  290  	fh = tp->ops->get(tp, t->tcm_handle);
^1da177e4c3f41 Linus Torvalds                2005-04-16  291  
^1da177e4c3f41 Linus Torvalds                2005-04-16  292  	if (fh == 0) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  293  		if (n->nlmsg_type == RTM_DELTFILTER && t->tcm_handle == 0) {
25d8c0d55f241c John Fastabend                2014-09-12  294  			struct tcf_proto *next = rtnl_dereference(tp->next);
25d8c0d55f241c John Fastabend                2014-09-12  295  
25d8c0d55f241c John Fastabend                2014-09-12  296  			RCU_INIT_POINTER(*back, next);
^1da177e4c3f41 Linus Torvalds                2005-04-16  297  
7316ae88c43d47 Tom Goff                      2010-03-19  298  			tfilter_notify(net, skb, n, tp, fh, RTM_DELTFILTER);
1e052be69d045c Cong Wang                     2015-03-06  299  			tcf_destroy(tp, true);
^1da177e4c3f41 Linus Torvalds                2005-04-16  300  			err = 0;
^1da177e4c3f41 Linus Torvalds                2005-04-16  301  			goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  302  		}
^1da177e4c3f41 Linus Torvalds                2005-04-16  303  
^1da177e4c3f41 Linus Torvalds                2005-04-16  304  		err = -ENOENT;
aa767bfea48289 Stephen Hemminger             2008-01-21  305  		if (n->nlmsg_type != RTM_NEWTFILTER ||
aa767bfea48289 Stephen Hemminger             2008-01-21  306  		    !(n->nlmsg_flags & NLM_F_CREATE))
^1da177e4c3f41 Linus Torvalds                2005-04-16  307  			goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  308  	} else {
^1da177e4c3f41 Linus Torvalds                2005-04-16  309  		switch (n->nlmsg_type) {
^1da177e4c3f41 Linus Torvalds                2005-04-16  310  		case RTM_NEWTFILTER:
^1da177e4c3f41 Linus Torvalds                2005-04-16  311  			err = -EEXIST;
12186be7d2e110 Minoru Usui                   2009-06-02  312  			if (n->nlmsg_flags & NLM_F_EXCL) {
12186be7d2e110 Minoru Usui                   2009-06-02  313  				if (tp_created)
1e052be69d045c Cong Wang                     2015-03-06  314  					tcf_destroy(tp, true);
^1da177e4c3f41 Linus Torvalds                2005-04-16  315  				goto errout;
12186be7d2e110 Minoru Usui                   2009-06-02  316  			}
^1da177e4c3f41 Linus Torvalds                2005-04-16  317  			break;
^1da177e4c3f41 Linus Torvalds                2005-04-16  318  		case RTM_DELTFILTER:
^1da177e4c3f41 Linus Torvalds                2005-04-16  319  			err = tp->ops->delete(tp, fh);
1e052be69d045c Cong Wang                     2015-03-06  320  			if (err == 0) {
1e052be69d045c Cong Wang                     2015-03-06  321  				struct tcf_proto *next = rtnl_dereference(tp->next);
1e052be69d045c Cong Wang                     2015-03-06  322  
7c230d0e546a3c Jamal Hadi Salim              2016-10-24  323  				tfilter_notify(net, skb, n, tp,
7c230d0e546a3c Jamal Hadi Salim              2016-10-24  324  					       t->tcm_handle, RTM_DELTFILTER);
d744318574090c WANG Cong                     2015-05-05  325  				if (tcf_destroy(tp, false))
1e052be69d045c Cong Wang                     2015-03-06  326  					RCU_INIT_POINTER(*back, next);
1e052be69d045c Cong Wang                     2015-03-06  327  			}
^1da177e4c3f41 Linus Torvalds                2005-04-16  328  			goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  329  		case RTM_GETTFILTER:
7316ae88c43d47 Tom Goff                      2010-03-19  330  			err = tfilter_notify(net, skb, n, tp, fh, RTM_NEWTFILTER);
^1da177e4c3f41 Linus Torvalds                2005-04-16  331  			goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  332  		default:
^1da177e4c3f41 Linus Torvalds                2005-04-16  333  			err = -EINVAL;
^1da177e4c3f41 Linus Torvalds                2005-04-16  334  			goto errout;
^1da177e4c3f41 Linus Torvalds                2005-04-16  335  		}
^1da177e4c3f41 Linus Torvalds                2005-04-16  336  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16  337  
2f7ef2f8790f5b Cong Wang                     2014-04-25  338  	err = tp->ops->change(net, skb, tp, cl, t->tcm_handle, tca, &fh,
2f7ef2f8790f5b Cong Wang                     2014-04-25  339  			      n->nlmsg_flags & NLM_F_CREATE ? TCA_ACT_NOREPLACE : TCA_ACT_REPLACE);
12186be7d2e110 Minoru Usui                   2009-06-02  340  	if (err == 0) {
12186be7d2e110 Minoru Usui                   2009-06-02  341  		if (tp_created) {
25d8c0d55f241c John Fastabend                2014-09-12  342  			RCU_INIT_POINTER(tp->next, rtnl_dereference(*back));
25d8c0d55f241c John Fastabend                2014-09-12  343  			rcu_assign_pointer(*back, tp);
12186be7d2e110 Minoru Usui                   2009-06-02  344  		}
7316ae88c43d47 Tom Goff                      2010-03-19  345  		tfilter_notify(net, skb, n, tp, fh, RTM_NEWTFILTER);
12186be7d2e110 Minoru Usui                   2009-06-02  346  	} else {
12186be7d2e110 Minoru Usui                   2009-06-02  347  		if (tp_created)
1e052be69d045c Cong Wang                     2015-03-06  348  			tcf_destroy(tp, true);
12186be7d2e110 Minoru Usui                   2009-06-02  349  	}
^1da177e4c3f41 Linus Torvalds                2005-04-16  350  
^1da177e4c3f41 Linus Torvalds                2005-04-16  351  errout:
^1da177e4c3f41 Linus Torvalds                2005-04-16  352  	if (cl)
^1da177e4c3f41 Linus Torvalds                2005-04-16  353  		cops->put(q, cl);
^1da177e4c3f41 Linus Torvalds                2005-04-16  354  	if (err == -EAGAIN)
^1da177e4c3f41 Linus Torvalds                2005-04-16  355  		/* Replay the request. */
^1da177e4c3f41 Linus Torvalds                2005-04-16  356  		goto replay;
^1da177e4c3f41 Linus Torvalds                2005-04-16  357  	return err;
^1da177e4c3f41 Linus Torvalds                2005-04-16  358  }
^1da177e4c3f41 Linus Torvalds                2005-04-16  359  

:::::: The code at line 243 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
