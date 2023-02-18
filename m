Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A0964F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 05:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676698912; x=1708234912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=60k7Z4hEP272+1CYbR92eDn5dnWGKi3sANse/yWfgXo=;
  b=hHJx4uhZ429FYd3rCZmDUoKYalYlAX+VhWiszu15c2k3XMiVvCm3l1vG
   5g4l7P4jXKlpTMmO/PnWXeS15VDXqYMYC/7NOevBMERfNE0bWacYZo4Vd
   Sn2rPYrrCh/GqbTnejR79O72QcawFx/YaeHfzn/eA1C9Hs4Xh4QXE4Z7g
   eflVHBt9gtwolnGHsCUnhZGqDP+2R070gkTXg3E7EaSU/TAhkbuA1gEdm
   +ynV4rwm9RuAbzpmSUoKh77N5/BYLMMaYw5EG4SvciH1115wvp4rQVyqx
   3ZHiH8CT4KwcOGQk44Lhga4EQz44UQ1PQrMW0YyB5Iv8fWluL8F9scvgH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="330814666"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="330814666"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 21:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="670793508"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="670793508"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Feb 2023 21:41:49 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTFym-000C9Z-2J;
	Sat, 18 Feb 2023 05:41:48 +0000
Date: Sat, 18 Feb 2023 13:41:06 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <jakub.kicinski@netronome.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 193/9999] net/llc/af_llc.c:975:72: warning:
 suggest braces around empty body in an 'if' statement
Message-ID: <202302181343.Cn1RsRri-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   53b696f0584acce2e90db69272a2a11aab138370
commit: 796d0f369aff2845b3623b8bec20002b1b376ca8 [193/9999] llc: fix another potential sk_buff leak in llc_ui_sendmsg()
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230218/202302181343.Cn1RsRri-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=796d0f369aff2845b3623b8bec20002b1b376ca8
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 796d0f369aff2845b3623b8bec20002b1b376ca8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/clk/ drivers/nvmem/ kernel/sched/ mm/kasan/ net/llc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181343.Cn1RsRri-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/llc/af_llc.c: In function 'llc_ui_sendmsg':
>> net/llc/af_llc.c:975:72: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     975 |                         __func__, llc->laddr.lsap, llc->daddr.lsap, rc);
         |                                                                        ^
   net/llc/af_llc.c:991: warning: Excess function parameter 'uaddrlen' description in 'llc_ui_getname'


vim +/if +975 net/llc/af_llc.c

^1da177e4c3f41 Linus Torvalds           2005-04-16  890  
^1da177e4c3f41 Linus Torvalds           2005-04-16  891  /**
^1da177e4c3f41 Linus Torvalds           2005-04-16  892   *	llc_ui_sendmsg - Transmit data provided by the socket user.
^1da177e4c3f41 Linus Torvalds           2005-04-16  893   *	@sock: Socket to transmit data from.
^1da177e4c3f41 Linus Torvalds           2005-04-16  894   *	@msg: Various user related information.
^1da177e4c3f41 Linus Torvalds           2005-04-16  895   *	@len: Length of data to transmit.
^1da177e4c3f41 Linus Torvalds           2005-04-16  896   *
^1da177e4c3f41 Linus Torvalds           2005-04-16  897   *	Transmit data provided by the socket user.
^1da177e4c3f41 Linus Torvalds           2005-04-16  898   *	Returns non-negative upon success, negative otherwise.
^1da177e4c3f41 Linus Torvalds           2005-04-16  899   */
1b784140474e4f Ying Xue                 2015-03-02  900  static int llc_ui_sendmsg(struct socket *sock, struct msghdr *msg, size_t len)
^1da177e4c3f41 Linus Torvalds           2005-04-16  901  {
^1da177e4c3f41 Linus Torvalds           2005-04-16  902  	struct sock *sk = sock->sk;
^1da177e4c3f41 Linus Torvalds           2005-04-16  903  	struct llc_sock *llc = llc_sk(sk);
342dfc306fb321 Steffen Hurrle           2014-01-17  904  	DECLARE_SOCKADDR(struct sockaddr_llc *, addr, msg->msg_name);
^1da177e4c3f41 Linus Torvalds           2005-04-16  905  	int flags = msg->msg_flags;
^1da177e4c3f41 Linus Torvalds           2005-04-16  906  	int noblock = flags & MSG_DONTWAIT;
796d0f369aff28 Eric Biggers             2019-10-06  907  	struct sk_buff *skb = NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  908  	size_t size = 0;
^1da177e4c3f41 Linus Torvalds           2005-04-16  909  	int rc = -EINVAL, copied = 0, hdrlen;
^1da177e4c3f41 Linus Torvalds           2005-04-16  910  
0dc47877a3de00 Harvey Harrison          2008-03-05  911  	dprintk("%s: sending from %02X to %02X\n", __func__,
^1da177e4c3f41 Linus Torvalds           2005-04-16  912  		llc->laddr.lsap, llc->daddr.lsap);
^1da177e4c3f41 Linus Torvalds           2005-04-16  913  	lock_sock(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  914  	if (addr) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  915  		if (msg->msg_namelen < sizeof(*addr))
796d0f369aff28 Eric Biggers             2019-10-06  916  			goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  917  	} else {
^1da177e4c3f41 Linus Torvalds           2005-04-16  918  		if (llc_ui_addr_null(&llc->addr))
796d0f369aff28 Eric Biggers             2019-10-06  919  			goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  920  		addr = &llc->addr;
^1da177e4c3f41 Linus Torvalds           2005-04-16  921  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  922  	/* must bind connection to sap if user hasn't done it. */
^1da177e4c3f41 Linus Torvalds           2005-04-16  923  	if (sock_flag(sk, SOCK_ZAPPED)) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  924  		/* bind to sap with null dev, exclusive. */
^1da177e4c3f41 Linus Torvalds           2005-04-16  925  		rc = llc_ui_autobind(sock, addr);
^1da177e4c3f41 Linus Torvalds           2005-04-16  926  		if (rc)
796d0f369aff28 Eric Biggers             2019-10-06  927  			goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  928  	}
774ccb4f64020d Arnaldo Carvalho de Melo 2005-09-22  929  	hdrlen = llc->dev->hard_header_len + llc_ui_header_len(sk, addr);
^1da177e4c3f41 Linus Torvalds           2005-04-16  930  	size = hdrlen + len;
774ccb4f64020d Arnaldo Carvalho de Melo 2005-09-22  931  	if (size > llc->dev->mtu)
774ccb4f64020d Arnaldo Carvalho de Melo 2005-09-22  932  		size = llc->dev->mtu;
^1da177e4c3f41 Linus Torvalds           2005-04-16  933  	copied = size - hdrlen;
2c5d5b13c6eb79 Eric Dumazet             2018-05-07  934  	rc = -EINVAL;
2c5d5b13c6eb79 Eric Dumazet             2018-05-07  935  	if (copied < 0)
796d0f369aff28 Eric Biggers             2019-10-06  936  		goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  937  	release_sock(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  938  	skb = sock_alloc_send_skb(sk, size, noblock, &rc);
^1da177e4c3f41 Linus Torvalds           2005-04-16  939  	lock_sock(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  940  	if (!skb)
796d0f369aff28 Eric Biggers             2019-10-06  941  		goto out;
774ccb4f64020d Arnaldo Carvalho de Melo 2005-09-22  942  	skb->dev      = llc->dev;
^1da177e4c3f41 Linus Torvalds           2005-04-16  943  	skb->protocol = llc_proto_type(addr->sllc_arphrd);
^1da177e4c3f41 Linus Torvalds           2005-04-16  944  	skb_reserve(skb, hdrlen);
6ce8e9ce5989ae Al Viro                  2014-04-06  945  	rc = memcpy_from_msg(skb_put(skb, copied), msg, copied);
^1da177e4c3f41 Linus Torvalds           2005-04-16  946  	if (rc)
^1da177e4c3f41 Linus Torvalds           2005-04-16  947  		goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  948  	if (sk->sk_type == SOCK_DGRAM || addr->sllc_ua) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  949  		llc_build_and_send_ui_pkt(llc->sap, skb, addr->sllc_mac,
^1da177e4c3f41 Linus Torvalds           2005-04-16  950  					  addr->sllc_sap);
796d0f369aff28 Eric Biggers             2019-10-06  951  		skb = NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  952  		goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  953  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  954  	if (addr->sllc_test) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  955  		llc_build_and_send_test_pkt(llc->sap, skb, addr->sllc_mac,
^1da177e4c3f41 Linus Torvalds           2005-04-16  956  					    addr->sllc_sap);
796d0f369aff28 Eric Biggers             2019-10-06  957  		skb = NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  958  		goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  959  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  960  	if (addr->sllc_xid) {
^1da177e4c3f41 Linus Torvalds           2005-04-16  961  		llc_build_and_send_xid_pkt(llc->sap, skb, addr->sllc_mac,
^1da177e4c3f41 Linus Torvalds           2005-04-16  962  					   addr->sllc_sap);
796d0f369aff28 Eric Biggers             2019-10-06  963  		skb = NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  964  		goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  965  	}
^1da177e4c3f41 Linus Torvalds           2005-04-16  966  	rc = -ENOPROTOOPT;
^1da177e4c3f41 Linus Torvalds           2005-04-16  967  	if (!(sk->sk_type == SOCK_STREAM && !addr->sllc_ua))
^1da177e4c3f41 Linus Torvalds           2005-04-16  968  		goto out;
^1da177e4c3f41 Linus Torvalds           2005-04-16  969  	rc = llc_ui_send_data(sk, skb, noblock);
796d0f369aff28 Eric Biggers             2019-10-06  970  	skb = NULL;
^1da177e4c3f41 Linus Torvalds           2005-04-16  971  out:
^1da177e4c3f41 Linus Torvalds           2005-04-16  972  	kfree_skb(skb);
796d0f369aff28 Eric Biggers             2019-10-06  973  	if (rc)
^1da177e4c3f41 Linus Torvalds           2005-04-16  974  		dprintk("%s: failed sending from %02X to %02X: %d\n",
0dc47877a3de00 Harvey Harrison          2008-03-05 @975  			__func__, llc->laddr.lsap, llc->daddr.lsap, rc);
^1da177e4c3f41 Linus Torvalds           2005-04-16  976  	release_sock(sk);
^1da177e4c3f41 Linus Torvalds           2005-04-16  977  	return rc ? : copied;
^1da177e4c3f41 Linus Torvalds           2005-04-16  978  }
^1da177e4c3f41 Linus Torvalds           2005-04-16  979  

:::::: The code at line 975 was first introduced by commit
:::::: 0dc47877a3de00ceadea0005189656ae8dc52669 net: replace remaining __FUNCTION__ occurrences

:::::: TO: Harvey Harrison <harvey.harrison@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
