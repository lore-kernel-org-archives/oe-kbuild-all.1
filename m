Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E108C2CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 07:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681801287; x=1713337287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=itkDfR3Nc+sL7YsmHsEzXqf4k7S8kaxbgR1ADbBKfGs=;
  b=cTDl3YzkTsDOrC+oGClvfBPi0n0YI3ONEVeahsQOx6hj6hUiaqi6CDEn
   qM+XOQdoMvTqlyCWyukvxbCSvvWJNvHFVyiKg2dEq3ZhRy9e1Rl0RDbku
   nvXsAii/XZrH77AKxJUcInWNitzvDccbbtyo3dfhS4PhVySaOXrvvs36B
   bOxQgbEP2QxommmwtK2YdxQAOGWZEh1ljcg5pDRkcusDaFgrjqBi6lIDD
   lY7kJK4vdR7XuLsdHGIB2jUSfTx7SCYRciYGthE3/WGOtOhyQrS2Ix0ox
   Taxq5ZDbIZFTTept1ehxkd59yv6OaMxqceCI/vURAJlu3wEYm0RYt6BEa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="333894025"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="333894025"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 00:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="865268896"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="865268896"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Apr 2023 00:01:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pofLA-000d5L-0S;
	Tue, 18 Apr 2023 07:01:24 +0000
Date: Tue, 18 Apr 2023 15:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 22736/22738]
 net/xfrm/xfrm_input.c:597:11: error: no member named 'verified_cnt' in
 'struct sec_path'
Message-ID: <202304181429.m9KcNuox-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   e7b6eb419efc6972c8af8f5e67f8e4f02db41420
commit: 9bf7728b3bacb05cf63d8f09a2d64235e311d2f7 [22736/22738] FROMLIST: xfrm: Ensure policy checked for nested ESP tunnels
config: x86_64-randconfig-a013-20230417 (https://download.01.org/0day-ci/archive/20230418/202304181429.m9KcNuox-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-5.15
        git checkout 9bf7728b3bacb05cf63d8f09a2d64235e311d2f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181429.m9KcNuox-lkp@intel.com/

Note: the android-common/android14-5.15 HEAD e7b6eb419efc6972c8af8f5e67f8e4f02db41420 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> net/xfrm/xfrm_input.c:597:11: error: no member named 'verified_cnt' in 'struct sec_path'
                       sp->verified_cnt < sp->len &&
                       ~~  ^
   1 error generated.


vim +597 net/xfrm/xfrm_input.c

   458	
   459	int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
   460	{
   461		const struct xfrm_state_afinfo *afinfo;
   462		struct net *net = dev_net(skb->dev);
   463		const struct xfrm_mode *inner_mode;
   464		int err;
   465		__be32 seq;
   466		__be32 seq_hi;
   467		struct xfrm_state *x = NULL;
   468		xfrm_address_t *daddr;
   469		u32 mark = skb->mark;
   470		unsigned int family = AF_UNSPEC;
   471		int decaps = 0;
   472		int async = 0;
   473		bool xfrm_gro = false;
   474		bool crypto_done = false;
   475		struct xfrm_offload *xo = xfrm_offload(skb);
   476		struct sec_path *sp;
   477	
   478		if (encap_type < 0) {
   479			x = xfrm_input_state(skb);
   480	
   481			if (unlikely(x->km.state != XFRM_STATE_VALID)) {
   482				if (x->km.state == XFRM_STATE_ACQ)
   483					XFRM_INC_STATS(net, LINUX_MIB_XFRMACQUIREERROR);
   484				else
   485					XFRM_INC_STATS(net,
   486						       LINUX_MIB_XFRMINSTATEINVALID);
   487	
   488				if (encap_type == -1)
   489					dev_put(skb->dev);
   490				goto drop;
   491			}
   492	
   493			family = x->outer_mode.family;
   494	
   495			/* An encap_type of -1 indicates async resumption. */
   496			if (encap_type == -1) {
   497				async = 1;
   498				seq = XFRM_SKB_CB(skb)->seq.input.low;
   499				goto resume;
   500			}
   501	
   502			/* encap_type < -1 indicates a GRO call. */
   503			encap_type = 0;
   504			seq = XFRM_SPI_SKB_CB(skb)->seq;
   505	
   506			if (xo && (xo->flags & CRYPTO_DONE)) {
   507				crypto_done = true;
   508				family = XFRM_SPI_SKB_CB(skb)->family;
   509	
   510				if (!(xo->status & CRYPTO_SUCCESS)) {
   511					if (xo->status &
   512					    (CRYPTO_TRANSPORT_AH_AUTH_FAILED |
   513					     CRYPTO_TRANSPORT_ESP_AUTH_FAILED |
   514					     CRYPTO_TUNNEL_AH_AUTH_FAILED |
   515					     CRYPTO_TUNNEL_ESP_AUTH_FAILED)) {
   516	
   517						xfrm_audit_state_icvfail(x, skb,
   518									 x->type->proto);
   519						x->stats.integrity_failed++;
   520						XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEPROTOERROR);
   521						goto drop;
   522					}
   523	
   524					if (xo->status & CRYPTO_INVALID_PROTOCOL) {
   525						XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEPROTOERROR);
   526						goto drop;
   527					}
   528	
   529					XFRM_INC_STATS(net, LINUX_MIB_XFRMINBUFFERERROR);
   530					goto drop;
   531				}
   532	
   533				if ((err = xfrm_parse_spi(skb, nexthdr, &spi, &seq)) != 0) {
   534					XFRM_INC_STATS(net, LINUX_MIB_XFRMINHDRERROR);
   535					goto drop;
   536				}
   537			}
   538	
   539			goto lock;
   540		}
   541	
   542		family = XFRM_SPI_SKB_CB(skb)->family;
   543	
   544		/* if tunnel is present override skb->mark value with tunnel i_key */
   545		switch (family) {
   546		case AF_INET:
   547			if (XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4)
   548				mark = be32_to_cpu(XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4->parms.i_key);
   549			break;
   550		case AF_INET6:
   551			if (XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6)
   552				mark = be32_to_cpu(XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6->parms.i_key);
   553			break;
   554		}
   555	
   556		sp = secpath_set(skb);
   557		if (!sp) {
   558			XFRM_INC_STATS(net, LINUX_MIB_XFRMINERROR);
   559			goto drop;
   560		}
   561	
   562		seq = 0;
   563		if (!spi && (err = xfrm_parse_spi(skb, nexthdr, &spi, &seq)) != 0) {
   564			secpath_reset(skb);
   565			XFRM_INC_STATS(net, LINUX_MIB_XFRMINHDRERROR);
   566			goto drop;
   567		}
   568	
   569		daddr = (xfrm_address_t *)(skb_network_header(skb) +
   570					   XFRM_SPI_SKB_CB(skb)->daddroff);
   571		do {
   572			sp = skb_sec_path(skb);
   573	
   574			if (sp->len == XFRM_MAX_DEPTH) {
   575				secpath_reset(skb);
   576				XFRM_INC_STATS(net, LINUX_MIB_XFRMINBUFFERERROR);
   577				goto drop;
   578			}
   579	
   580			x = xfrm_state_lookup(net, mark, daddr, spi, nexthdr, family);
   581			if (x == NULL) {
   582				secpath_reset(skb);
   583				XFRM_INC_STATS(net, LINUX_MIB_XFRMINNOSTATES);
   584				xfrm_audit_state_notfound(skb, family, spi, seq);
   585				goto drop;
   586			}
   587	
   588			/* If nested tunnel, check outer states before context is lost.
   589			 * Only nested tunnels need to be checked, since IP addresses change
   590			 * as a result of the tunnel mode decapsulation. Similarly, this check
   591			 * is limited to nested tunnels to avoid performing another policy
   592			 * check on non-nested tunnels. On success, this check also updates the
   593			 * secpath's verified_cnt variable, skipping future verifications of
   594			 * previously-verified secpath entries.
   595			 */
   596			if ((x->outer_mode.flags & XFRM_MODE_FLAG_TUNNEL) &&
 > 597			    sp->verified_cnt < sp->len &&
   598			    !xfrm_policy_check(NULL, XFRM_POLICY_IN, skb, family)) {
   599				goto drop;
   600			}
   601	
   602			skb->mark = xfrm_smark_get(skb->mark, x);
   603	
   604			sp->xvec[sp->len++] = x;
   605	
   606			skb_dst_force(skb);
   607			if (!skb_dst(skb)) {
   608				XFRM_INC_STATS(net, LINUX_MIB_XFRMINERROR);
   609				goto drop;
   610			}
   611	
   612	lock:
   613			spin_lock(&x->lock);
   614	
   615			if (unlikely(x->km.state != XFRM_STATE_VALID)) {
   616				if (x->km.state == XFRM_STATE_ACQ)
   617					XFRM_INC_STATS(net, LINUX_MIB_XFRMACQUIREERROR);
   618				else
   619					XFRM_INC_STATS(net,
   620						       LINUX_MIB_XFRMINSTATEINVALID);
   621				goto drop_unlock;
   622			}
   623	
   624			if ((x->encap ? x->encap->encap_type : 0) != encap_type) {
   625				XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEMISMATCH);
   626				goto drop_unlock;
   627			}
   628	
   629			if (xfrm_replay_check(x, skb, seq)) {
   630				XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATESEQERROR);
   631				goto drop_unlock;
   632			}
   633	
   634			if (xfrm_state_check_expire(x)) {
   635				XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEEXPIRED);
   636				goto drop_unlock;
   637			}
   638	
   639			spin_unlock(&x->lock);
   640	
   641			if (xfrm_tunnel_check(skb, x, family)) {
   642				XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEMODEERROR);
   643				goto drop;
   644			}
   645	
   646			seq_hi = htonl(xfrm_replay_seqhi(x, seq));
   647	
   648			XFRM_SKB_CB(skb)->seq.input.low = seq;
   649			XFRM_SKB_CB(skb)->seq.input.hi = seq_hi;
   650	
   651			dev_hold(skb->dev);
   652	
   653			if (crypto_done)
   654				nexthdr = x->type_offload->input_tail(x, skb);
   655			else
   656				nexthdr = x->type->input(x, skb);
   657	
   658			if (nexthdr == -EINPROGRESS)
   659				return 0;
   660	resume:
   661			dev_put(skb->dev);
   662	
   663			spin_lock(&x->lock);
   664			if (nexthdr < 0) {
   665				if (nexthdr == -EBADMSG) {
   666					xfrm_audit_state_icvfail(x, skb,
   667								 x->type->proto);
   668					x->stats.integrity_failed++;
   669				}
   670				XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEPROTOERROR);
   671				goto drop_unlock;
   672			}
   673	
   674			/* only the first xfrm gets the encap type */
   675			encap_type = 0;
   676	
   677			if (xfrm_replay_recheck(x, skb, seq)) {
   678				XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATESEQERROR);
   679				goto drop_unlock;
   680			}
   681	
   682			xfrm_replay_advance(x, seq);
   683	
   684			x->curlft.bytes += skb->len;
   685			x->curlft.packets++;
   686	
   687			spin_unlock(&x->lock);
   688	
   689			XFRM_MODE_SKB_CB(skb)->protocol = nexthdr;
   690	
   691			inner_mode = &x->inner_mode;
   692	
   693			if (x->sel.family == AF_UNSPEC) {
   694				inner_mode = xfrm_ip2inner_mode(x, XFRM_MODE_SKB_CB(skb)->protocol);
   695				if (inner_mode == NULL) {
   696					XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEMODEERROR);
   697					goto drop;
   698				}
   699			}
   700	
   701			if (xfrm_inner_mode_input(x, inner_mode, skb)) {
   702				XFRM_INC_STATS(net, LINUX_MIB_XFRMINSTATEMODEERROR);
   703				goto drop;
   704			}
   705	
   706			if (x->outer_mode.flags & XFRM_MODE_FLAG_TUNNEL) {
   707				decaps = 1;
   708				break;
   709			}
   710	
   711			/*
   712			 * We need the inner address.  However, we only get here for
   713			 * transport mode so the outer address is identical.
   714			 */
   715			daddr = &x->id.daddr;
   716			family = x->outer_mode.family;
   717	
   718			err = xfrm_parse_spi(skb, nexthdr, &spi, &seq);
   719			if (err < 0) {
   720				XFRM_INC_STATS(net, LINUX_MIB_XFRMINHDRERROR);
   721				goto drop;
   722			}
   723			crypto_done = false;
   724		} while (!err);
   725	
   726		err = xfrm_rcv_cb(skb, family, x->type->proto, 0);
   727		if (err)
   728			goto drop;
   729	
   730		nf_reset_ct(skb);
   731	
   732		if (decaps) {
   733			sp = skb_sec_path(skb);
   734			if (sp)
   735				sp->olen = 0;
   736			skb_dst_drop(skb);
   737			gro_cells_receive(&gro_cells, skb);
   738			return 0;
   739		} else {
   740			xo = xfrm_offload(skb);
   741			if (xo)
   742				xfrm_gro = xo->flags & XFRM_GRO;
   743	
   744			err = -EAFNOSUPPORT;
   745			rcu_read_lock();
   746			afinfo = xfrm_state_afinfo_get_rcu(x->inner_mode.family);
   747			if (likely(afinfo))
   748				err = afinfo->transport_finish(skb, xfrm_gro || async);
   749			rcu_read_unlock();
   750			if (xfrm_gro) {
   751				sp = skb_sec_path(skb);
   752				if (sp)
   753					sp->olen = 0;
   754				skb_dst_drop(skb);
   755				gro_cells_receive(&gro_cells, skb);
   756				return err;
   757			}
   758	
   759			return err;
   760		}
   761	
   762	drop_unlock:
   763		spin_unlock(&x->lock);
   764	drop:
   765		xfrm_rcv_cb(skb, family, x && x->type ? x->type->proto : nexthdr, -1);
   766		kfree_skb(skb);
   767		return 0;
   768	}
   769	EXPORT_SYMBOL(xfrm_input);
   770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
