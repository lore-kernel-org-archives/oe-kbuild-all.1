Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED692D46BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755072343; cv=none; b=OSjLTKOCit1gnw4QLOF+Tty25d56xc3UjliucZNcgxa0qR9g2oaeCxtiRwyTn7WUt9XbT6O5IsljxBVk0ob66F+lkE9Qiaw8xh3OIh7+e1VFZ0HloFI4+dmpkMDn2Kt1s8tM0yd1RQKIh25s8VqIZFj8HBc5ybQids4hYgGWJWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755072343; c=relaxed/simple;
	bh=pOzW0iaiwlTtpZb5b3OM9zkZdWwYGmmIvJp+Dp34L8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IpBKDOLWVzNVBuMUn21cvcQ4jVFgvLPZJERJmk3ybrxyJRmNLiaY2svwagykAvadVjc7iWdGb8+pFCQsgf/yjXj8rZYk8Q4HPZqidzBJ+Riswf5Qr8mwITsYO601hsET0INcjLkdwg6cNn3A2TgihZonTvDa8hodyFA+xRreK80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czM/GNr7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czM/GNr7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755072341; x=1786608341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOzW0iaiwlTtpZb5b3OM9zkZdWwYGmmIvJp+Dp34L8Y=;
  b=czM/GNr750SLMUAww018CmpXD8nsjpB99XMC6eRB4cPHlUe1b6s43slI
   vRS8m9ME84doPcYaIAXR+qxd1GfmC4PdxlW8MSJ5gxs0HI6pZ/my6wo3S
   3j8Rhc3mSJi9pvHVKtv8xUFU3O4xHXp4gpmnj7RiLYOpoFTaCMjw5TKo0
   ehptM4cRu+Qw6z0TeoTp44nS8HUveS2Z+b/I5ahNjg87gikxeVKTwYPn3
   eD6aTtjnvzXwB0XgHVCiHnH6QYMWZTGpItG3ZRPNFaRegR4YEHLkmp9Gc
   CWGkMynYfGgXvEUpw7ifwWhpBn2uYCWe9n1KMaEuPIsYrAQ0SVZKOx/Bm
   g==;
X-CSE-ConnectionGUID: P9Li3BG6SfSlkvDWKQfiRg==
X-CSE-MsgGUID: WZdg3I3iSu6NhJFsRe2X3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56569698"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56569698"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 01:05:40 -0700
X-CSE-ConnectionGUID: 3KJClRALRzyRJaqHhFICJg==
X-CSE-MsgGUID: eCgoiGJtSR+RFhY9qdiB9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171667327"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 13 Aug 2025 01:05:39 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um6UK-0003VL-1n;
	Wed, 13 Aug 2025 08:05:36 +0000
Date: Wed, 13 Aug 2025 10:05:25 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3112/3112] kernel/bpf/cgroup.c:1020: warning:
 Function parameter or member 'atype' not described in
 '__cgroup_bpf_run_filter_skb'
Message-ID: <202508131002.XNIVvfek-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e195b7942b542210e5af0c057618b438e634bdae
commit: fac4c1ea584023bedd1568f2303d698b6dfa19d7 [3112/3112] bpf: Migrate cgroup_bpf to internal cgroup_bpf_attach_type enum
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250813/202508131002.XNIVvfek-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7d886fab74d4037d654d02bed24dd97c0ba863d6)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131002.XNIVvfek-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131002.XNIVvfek-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/cgroup.c:583: warning: Function parameter or member 'new_prog' not described in '__cgroup_bpf_replace'
   kernel/bpf/cgroup.c:583: warning: Excess function parameter 'type' description in '__cgroup_bpf_replace'
   kernel/bpf/cgroup.c:683: warning: Function parameter or member 'link' not described in '__cgroup_bpf_detach'
>> kernel/bpf/cgroup.c:1020: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_skb'
>> kernel/bpf/cgroup.c:1020: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_skb'
>> kernel/bpf/cgroup.c:1072: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sk'
>> kernel/bpf/cgroup.c:1072: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sk'
>> kernel/bpf/cgroup.c:1098: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sock_addr'
>> kernel/bpf/cgroup.c:1098: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sock_addr'
>> kernel/bpf/cgroup.c:1145: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sock_ops'
>> kernel/bpf/cgroup.c:1145: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sock_ops'
>> kernel/bpf/cgroup.c:1261: warning: Function parameter or member 'atype' not described in '__cgroup_bpf_run_filter_sysctl'
>> kernel/bpf/cgroup.c:1261: warning: Excess function parameter 'type' description in '__cgroup_bpf_run_filter_sysctl'


vim +1020 kernel/bpf/cgroup.c

fdb5c4531c1e0e Sean Young         2018-06-19   993  
3007098494bec6 Daniel Mack        2016-11-23   994  /**
b2cd12574aa3e1 David Ahern        2016-12-01   995   * __cgroup_bpf_run_filter_skb() - Run a program for packet filtering
8f917bba0042f1 Willem de Bruijn   2017-04-11   996   * @sk: The socket sending or receiving traffic
3007098494bec6 Daniel Mack        2016-11-23   997   * @skb: The skb that is being sent or received
3007098494bec6 Daniel Mack        2016-11-23   998   * @type: The type of program to be exectuted
3007098494bec6 Daniel Mack        2016-11-23   999   *
3007098494bec6 Daniel Mack        2016-11-23  1000   * If no socket is passed, or the socket is not of type INET or INET6,
3007098494bec6 Daniel Mack        2016-11-23  1001   * this function does nothing and returns 0.
3007098494bec6 Daniel Mack        2016-11-23  1002   *
3007098494bec6 Daniel Mack        2016-11-23  1003   * The program type passed in via @type must be suitable for network
3007098494bec6 Daniel Mack        2016-11-23  1004   * filtering. No further check is performed to assert that.
3007098494bec6 Daniel Mack        2016-11-23  1005   *
e7a3160d092aa4 brakmo             2019-05-28  1006   * For egress packets, this function can return:
e7a3160d092aa4 brakmo             2019-05-28  1007   *   NET_XMIT_SUCCESS    (0)	- continue with packet output
e7a3160d092aa4 brakmo             2019-05-28  1008   *   NET_XMIT_DROP       (1)	- drop packet and notify TCP to call cwr
e7a3160d092aa4 brakmo             2019-05-28  1009   *   NET_XMIT_CN         (2)	- continue with packet output and notify TCP
e7a3160d092aa4 brakmo             2019-05-28  1010   *				  to call cwr
e7a3160d092aa4 brakmo             2019-05-28  1011   *   -EPERM			- drop packet
e7a3160d092aa4 brakmo             2019-05-28  1012   *
e7a3160d092aa4 brakmo             2019-05-28  1013   * For ingress packets, this function will return -EPERM if any
e7a3160d092aa4 brakmo             2019-05-28  1014   * attached program was found and if it returned != 1 during execution.
e7a3160d092aa4 brakmo             2019-05-28  1015   * Otherwise 0 is returned.
3007098494bec6 Daniel Mack        2016-11-23  1016   */
b2cd12574aa3e1 David Ahern        2016-12-01  1017  int __cgroup_bpf_run_filter_skb(struct sock *sk,
3007098494bec6 Daniel Mack        2016-11-23  1018  				struct sk_buff *skb,
fac4c1ea584023 Dave Marchevsky    2022-01-07  1019  				enum cgroup_bpf_attach_type atype)
3007098494bec6 Daniel Mack        2016-11-23 @1020  {
324bda9e6c5add Alexei Starovoitov 2017-10-02  1021  	unsigned int offset = skb->data - skb_network_header(skb);
324bda9e6c5add Alexei Starovoitov 2017-10-02  1022  	struct sock *save_sk;
b39b5f411dcfce Song Liu           2018-10-19  1023  	void *saved_data_end;
3007098494bec6 Daniel Mack        2016-11-23  1024  	struct cgroup *cgrp;
324bda9e6c5add Alexei Starovoitov 2017-10-02  1025  	int ret;
3007098494bec6 Daniel Mack        2016-11-23  1026  
3007098494bec6 Daniel Mack        2016-11-23  1027  	if (!sk || !sk_fullsock(sk))
3007098494bec6 Daniel Mack        2016-11-23  1028  		return 0;
3007098494bec6 Daniel Mack        2016-11-23  1029  
324bda9e6c5add Alexei Starovoitov 2017-10-02  1030  	if (sk->sk_family != AF_INET && sk->sk_family != AF_INET6)
3007098494bec6 Daniel Mack        2016-11-23  1031  		return 0;
3007098494bec6 Daniel Mack        2016-11-23  1032  
3007098494bec6 Daniel Mack        2016-11-23  1033  	cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
324bda9e6c5add Alexei Starovoitov 2017-10-02  1034  	save_sk = skb->sk;
8f917bba0042f1 Willem de Bruijn   2017-04-11  1035  	skb->sk = sk;
3007098494bec6 Daniel Mack        2016-11-23  1036  	__skb_push(skb, offset);
b39b5f411dcfce Song Liu           2018-10-19  1037  
b39b5f411dcfce Song Liu           2018-10-19  1038  	/* compute pointers for the bpf prog */
b39b5f411dcfce Song Liu           2018-10-19  1039  	bpf_compute_and_save_data_end(skb, &saved_data_end);
b39b5f411dcfce Song Liu           2018-10-19  1040  
fac4c1ea584023 Dave Marchevsky    2022-01-07  1041  	if (atype == CGROUP_INET_EGRESS) {
e7a3160d092aa4 brakmo             2019-05-28  1042  		ret = BPF_PROG_CGROUP_INET_EGRESS_RUN_ARRAY(
fac4c1ea584023 Dave Marchevsky    2022-01-07  1043  			cgrp->bpf.effective[atype], skb, __bpf_prog_run_save_cb);
e7a3160d092aa4 brakmo             2019-05-28  1044  	} else {
fac4c1ea584023 Dave Marchevsky    2022-01-07  1045  		ret = BPF_PROG_RUN_ARRAY(cgrp->bpf.effective[atype], skb,
6cab5e90ab2bd3 Alexei Starovoitov 2019-01-28  1046  					  __bpf_prog_run_save_cb);
e7a3160d092aa4 brakmo             2019-05-28  1047  		ret = (ret == 1 ? 0 : -EPERM);
e7a3160d092aa4 brakmo             2019-05-28  1048  	}
b39b5f411dcfce Song Liu           2018-10-19  1049  	bpf_restore_data_end(skb, saved_data_end);
3007098494bec6 Daniel Mack        2016-11-23  1050  	__skb_pull(skb, offset);
8f917bba0042f1 Willem de Bruijn   2017-04-11  1051  	skb->sk = save_sk;
e7a3160d092aa4 brakmo             2019-05-28  1052  
e7a3160d092aa4 brakmo             2019-05-28  1053  	return ret;
3007098494bec6 Daniel Mack        2016-11-23  1054  }
b2cd12574aa3e1 David Ahern        2016-12-01  1055  EXPORT_SYMBOL(__cgroup_bpf_run_filter_skb);
61023658760032 David Ahern        2016-12-01  1056  
61023658760032 David Ahern        2016-12-01  1057  /**
61023658760032 David Ahern        2016-12-01  1058   * __cgroup_bpf_run_filter_sk() - Run a program on a sock
61023658760032 David Ahern        2016-12-01  1059   * @sk: sock structure to manipulate
61023658760032 David Ahern        2016-12-01  1060   * @type: The type of program to be exectuted
61023658760032 David Ahern        2016-12-01  1061   *
61023658760032 David Ahern        2016-12-01  1062   * socket is passed is expected to be of type INET or INET6.
61023658760032 David Ahern        2016-12-01  1063   *
61023658760032 David Ahern        2016-12-01  1064   * The program type passed in via @type must be suitable for sock
61023658760032 David Ahern        2016-12-01  1065   * filtering. No further check is performed to assert that.
61023658760032 David Ahern        2016-12-01  1066   *
61023658760032 David Ahern        2016-12-01  1067   * This function will return %-EPERM if any if an attached program was found
61023658760032 David Ahern        2016-12-01  1068   * and if it returned != 1 during execution. In all other cases, 0 is returned.
61023658760032 David Ahern        2016-12-01  1069   */
61023658760032 David Ahern        2016-12-01  1070  int __cgroup_bpf_run_filter_sk(struct sock *sk,
fac4c1ea584023 Dave Marchevsky    2022-01-07  1071  			       enum cgroup_bpf_attach_type atype)
61023658760032 David Ahern        2016-12-01 @1072  {
61023658760032 David Ahern        2016-12-01  1073  	struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
324bda9e6c5add Alexei Starovoitov 2017-10-02  1074  	int ret;
61023658760032 David Ahern        2016-12-01  1075  
fac4c1ea584023 Dave Marchevsky    2022-01-07  1076  	ret = BPF_PROG_RUN_ARRAY(cgrp->bpf.effective[atype], sk, BPF_PROG_RUN);
324bda9e6c5add Alexei Starovoitov 2017-10-02  1077  	return ret == 1 ? 0 : -EPERM;
61023658760032 David Ahern        2016-12-01  1078  }
61023658760032 David Ahern        2016-12-01  1079  EXPORT_SYMBOL(__cgroup_bpf_run_filter_sk);
40304b2a1567fe Lawrence Brakmo    2017-06-30  1080  
4fbac77d2d092b Andrey Ignatov     2018-03-30  1081  /**
4fbac77d2d092b Andrey Ignatov     2018-03-30  1082   * __cgroup_bpf_run_filter_sock_addr() - Run a program on a sock and
4fbac77d2d092b Andrey Ignatov     2018-03-30  1083   *                                       provided by user sockaddr
4fbac77d2d092b Andrey Ignatov     2018-03-30  1084   * @sk: sock struct that will use sockaddr
4fbac77d2d092b Andrey Ignatov     2018-03-30  1085   * @uaddr: sockaddr struct provided by user
4fbac77d2d092b Andrey Ignatov     2018-03-30  1086   * @type: The type of program to be exectuted
1cedee13d25ab1 Andrey Ignatov     2018-05-25  1087   * @t_ctx: Pointer to attach type specific context
4fbac77d2d092b Andrey Ignatov     2018-03-30  1088   *
4fbac77d2d092b Andrey Ignatov     2018-03-30  1089   * socket is expected to be of type INET or INET6.
4fbac77d2d092b Andrey Ignatov     2018-03-30  1090   *
4fbac77d2d092b Andrey Ignatov     2018-03-30  1091   * This function will return %-EPERM if an attached program is found and
4fbac77d2d092b Andrey Ignatov     2018-03-30  1092   * returned value != 1 during execution. In all other cases, 0 is returned.
4fbac77d2d092b Andrey Ignatov     2018-03-30  1093   */
4fbac77d2d092b Andrey Ignatov     2018-03-30  1094  int __cgroup_bpf_run_filter_sock_addr(struct sock *sk,
4fbac77d2d092b Andrey Ignatov     2018-03-30  1095  				      struct sockaddr *uaddr,
fac4c1ea584023 Dave Marchevsky    2022-01-07  1096  				      enum cgroup_bpf_attach_type atype,
1cedee13d25ab1 Andrey Ignatov     2018-05-25  1097  				      void *t_ctx)
4fbac77d2d092b Andrey Ignatov     2018-03-30 @1098  {
4fbac77d2d092b Andrey Ignatov     2018-03-30  1099  	struct bpf_sock_addr_kern ctx = {
4fbac77d2d092b Andrey Ignatov     2018-03-30  1100  		.sk = sk,
4fbac77d2d092b Andrey Ignatov     2018-03-30  1101  		.uaddr = uaddr,
1cedee13d25ab1 Andrey Ignatov     2018-05-25  1102  		.t_ctx = t_ctx,
4fbac77d2d092b Andrey Ignatov     2018-03-30  1103  	};
1cedee13d25ab1 Andrey Ignatov     2018-05-25  1104  	struct sockaddr_storage unspec;
4fbac77d2d092b Andrey Ignatov     2018-03-30  1105  	struct cgroup *cgrp;
4fbac77d2d092b Andrey Ignatov     2018-03-30  1106  	int ret;
4fbac77d2d092b Andrey Ignatov     2018-03-30  1107  
4fbac77d2d092b Andrey Ignatov     2018-03-30  1108  	/* Check socket family since not all sockets represent network
4fbac77d2d092b Andrey Ignatov     2018-03-30  1109  	 * endpoint (e.g. AF_UNIX).
4fbac77d2d092b Andrey Ignatov     2018-03-30  1110  	 */
4fbac77d2d092b Andrey Ignatov     2018-03-30  1111  	if (sk->sk_family != AF_INET && sk->sk_family != AF_INET6)
4fbac77d2d092b Andrey Ignatov     2018-03-30  1112  		return 0;
4fbac77d2d092b Andrey Ignatov     2018-03-30  1113  
1cedee13d25ab1 Andrey Ignatov     2018-05-25  1114  	if (!ctx.uaddr) {
1cedee13d25ab1 Andrey Ignatov     2018-05-25  1115  		memset(&unspec, 0, sizeof(unspec));
1cedee13d25ab1 Andrey Ignatov     2018-05-25  1116  		ctx.uaddr = (struct sockaddr *)&unspec;
1cedee13d25ab1 Andrey Ignatov     2018-05-25  1117  	}
1cedee13d25ab1 Andrey Ignatov     2018-05-25  1118  
4fbac77d2d092b Andrey Ignatov     2018-03-30  1119  	cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
fac4c1ea584023 Dave Marchevsky    2022-01-07  1120  	ret = BPF_PROG_RUN_ARRAY(cgrp->bpf.effective[atype], &ctx, BPF_PROG_RUN);
4fbac77d2d092b Andrey Ignatov     2018-03-30  1121  
4fbac77d2d092b Andrey Ignatov     2018-03-30  1122  	return ret == 1 ? 0 : -EPERM;
4fbac77d2d092b Andrey Ignatov     2018-03-30  1123  }
4fbac77d2d092b Andrey Ignatov     2018-03-30  1124  EXPORT_SYMBOL(__cgroup_bpf_run_filter_sock_addr);
4fbac77d2d092b Andrey Ignatov     2018-03-30  1125  
40304b2a1567fe Lawrence Brakmo    2017-06-30  1126  /**
40304b2a1567fe Lawrence Brakmo    2017-06-30  1127   * __cgroup_bpf_run_filter_sock_ops() - Run a program on a sock
40304b2a1567fe Lawrence Brakmo    2017-06-30  1128   * @sk: socket to get cgroup from
40304b2a1567fe Lawrence Brakmo    2017-06-30  1129   * @sock_ops: bpf_sock_ops_kern struct to pass to program. Contains
40304b2a1567fe Lawrence Brakmo    2017-06-30  1130   * sk with connection information (IP addresses, etc.) May not contain
40304b2a1567fe Lawrence Brakmo    2017-06-30  1131   * cgroup info if it is a req sock.
40304b2a1567fe Lawrence Brakmo    2017-06-30  1132   * @type: The type of program to be exectuted
40304b2a1567fe Lawrence Brakmo    2017-06-30  1133   *
40304b2a1567fe Lawrence Brakmo    2017-06-30  1134   * socket passed is expected to be of type INET or INET6.
40304b2a1567fe Lawrence Brakmo    2017-06-30  1135   *
40304b2a1567fe Lawrence Brakmo    2017-06-30  1136   * The program type passed in via @type must be suitable for sock_ops
40304b2a1567fe Lawrence Brakmo    2017-06-30  1137   * filtering. No further check is performed to assert that.
40304b2a1567fe Lawrence Brakmo    2017-06-30  1138   *
40304b2a1567fe Lawrence Brakmo    2017-06-30  1139   * This function will return %-EPERM if any if an attached program was found
40304b2a1567fe Lawrence Brakmo    2017-06-30  1140   * and if it returned != 1 during execution. In all other cases, 0 is returned.
40304b2a1567fe Lawrence Brakmo    2017-06-30  1141   */
40304b2a1567fe Lawrence Brakmo    2017-06-30  1142  int __cgroup_bpf_run_filter_sock_ops(struct sock *sk,
40304b2a1567fe Lawrence Brakmo    2017-06-30  1143  				     struct bpf_sock_ops_kern *sock_ops,
fac4c1ea584023 Dave Marchevsky    2022-01-07  1144  				     enum cgroup_bpf_attach_type atype)
40304b2a1567fe Lawrence Brakmo    2017-06-30 @1145  {
40304b2a1567fe Lawrence Brakmo    2017-06-30  1146  	struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
324bda9e6c5add Alexei Starovoitov 2017-10-02  1147  	int ret;
40304b2a1567fe Lawrence Brakmo    2017-06-30  1148  
fac4c1ea584023 Dave Marchevsky    2022-01-07  1149  	ret = BPF_PROG_RUN_ARRAY(cgrp->bpf.effective[atype], sock_ops,
324bda9e6c5add Alexei Starovoitov 2017-10-02  1150  				 BPF_PROG_RUN);
324bda9e6c5add Alexei Starovoitov 2017-10-02  1151  	return ret == 1 ? 0 : -EPERM;
40304b2a1567fe Lawrence Brakmo    2017-06-30  1152  }
40304b2a1567fe Lawrence Brakmo    2017-06-30  1153  EXPORT_SYMBOL(__cgroup_bpf_run_filter_sock_ops);
ebc614f687369f Roman Gushchin     2017-11-05  1154  

:::::: The code at line 1020 was first introduced by commit
:::::: 3007098494bec614fb55dee7bc0410bb7db5ad18 cgroup: add support for eBPF programs

:::::: TO: Daniel Mack <daniel@zonque.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
