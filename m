Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581031CD0C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 02:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730772722; cv=none; b=XGXZvSRxWuvm4tS71FFOupkkSTDXPvwrEJxiRy2bzNiRegwu3XuW1OJoQY5Li4OpnK39Vvkz3tVp0ewyMawy29M7+UcA/4umXNIrbWBwfBjIVeioLgKVPmz2ARU4KCfYWPwLLVYc6G8sbGXM3Q7mdcaGhuSolItXwm1VOsimM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730772722; c=relaxed/simple;
	bh=PlJ2jIhPZvsZWXM0FNzdAganQ6rrwVJDarkZzwOSDjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fEl+bTfTt0cPdhBZIRNmKvtdbDvuFplDttLk2xTszzeadnvaYgPi9MfsbDBRIHa5Ur9BpCgazUnGbiDUpoxzPATAskbHS64SNOO/cmKkPn+nUSPeeBS3UF4lmzVf4dyTss4MQeNBgeH1GeBLa9Sc3VyASzeMOlkNfV8LqGHvUzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXyck48u; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXyck48u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730772720; x=1762308720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlJ2jIhPZvsZWXM0FNzdAganQ6rrwVJDarkZzwOSDjM=;
  b=YXyck48uuxQLoTY9X/O7oVYcIbamgV827OgchfvkQW2OzHycjGtDq7GB
   i42lxsoLz7OGQvUwCs1HKEtt0k77NgEf7KJpL+kDZIXqNiKmp8emT2DBy
   aauUEHC+iSVk4PfRfD2HhoLHhswTh4Hx+ThWpsmDEMn6t4KdjMqR1M0+g
   ylk+fnB1MpqDaPimMOnPLJsNOBAI3qS2E8obXqEpAhLtk3I9ALgqKIfMB
   8FghMNvOmpNYpG1MkcXghVx6pyaRvyV4jf6spYPCOrWpvteCAXEFjbNk+
   YqmdAtF8aZ9MYi62deBysqAb7HZNaCkHQod/q327QhUDPWfmPoXxVrgi1
   w==;
X-CSE-ConnectionGUID: yEMkX1EPRb2EP7FWT1RiAA==
X-CSE-MsgGUID: TewrBsX8QuyyAoEY7xMjvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34283890"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="34283890"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 18:12:00 -0800
X-CSE-ConnectionGUID: 8Oz1BFskTE2Ub3NvDTsfqQ==
X-CSE-MsgGUID: FBB8h+ERSnqZWHNNrVOhTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="88350792"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2024 18:11:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t892y-000lUr-1o;
	Tue, 05 Nov 2024 02:11:56 +0000
Date: Tue, 5 Nov 2024 10:11:53 +0800
From: kernel test robot <lkp@intel.com>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [pcmoore-lsm:dev-staging 15/20] net/netfilter/nfnetlink_queue.c:646
 nfqnl_build_packet_message() warn: always true condition '(seclen >= 0) =>
 (0-u32max >= 0)'
Message-ID: <202411051056.B6hzHDOW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.git dev-staging
head:   ec89c38d55df9c18700e25ad53d9970e7a0119e4
commit: 95a3c11eb6709db6a0e06ef17bfbcc32c7cc7b27 [15/20] lsm: replace context+len with lsm_context
config: x86_64-randconfig-161-20241104 (https://download.01.org/0day-ci/archive/20241105/202411051056.B6hzHDOW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051056.B6hzHDOW-lkp@intel.com/

New smatch warnings:
net/netfilter/nfnetlink_queue.c:646 nfqnl_build_packet_message() warn: always true condition '(seclen >= 0) => (0-u32max >= 0)'

Old smatch warnings:
net/netfilter/nfnetlink_queue.c:813 nfqnl_build_packet_message() warn: always true condition '(seclen >= 0) => (0-u32max >= 0)'
net/netfilter/nfnetlink_queue.c:822 nfqnl_build_packet_message() warn: always true condition '(seclen >= 0) => (0-u32max >= 0)'

vim +646 net/netfilter/nfnetlink_queue.c

   638	
   639		if (queue->flags & NFQA_CFG_F_UID_GID) {
   640			size += (nla_total_size(sizeof(u_int32_t))	/* uid */
   641				+ nla_total_size(sizeof(u_int32_t)));	/* gid */
   642		}
   643	
   644		if ((queue->flags & NFQA_CFG_F_SECCTX) && entskb->sk) {
   645			seclen = nfqnl_get_sk_secctx(entskb, &ctx);
 > 646			if (seclen >= 0)
   647				size += nla_total_size(seclen);
   648		}
   649	
   650		skb = alloc_skb(size, GFP_ATOMIC);
   651		if (!skb) {
   652			skb_tx_error(entskb);
   653			goto nlmsg_failure;
   654		}
   655	
   656		nlh = nfnl_msg_put(skb, 0, 0,
   657				   nfnl_msg_type(NFNL_SUBSYS_QUEUE, NFQNL_MSG_PACKET),
   658				   0, entry->state.pf, NFNETLINK_V0,
   659				   htons(queue->queue_num));
   660		if (!nlh) {
   661			skb_tx_error(entskb);
   662			kfree_skb(skb);
   663			goto nlmsg_failure;
   664		}
   665	
   666		nla = __nla_reserve(skb, NFQA_PACKET_HDR, sizeof(*pmsg));
   667		pmsg = nla_data(nla);
   668		pmsg->hw_protocol	= entskb->protocol;
   669		pmsg->hook		= entry->state.hook;
   670		*packet_id_ptr		= &pmsg->packet_id;
   671	
   672		indev = entry->state.in;
   673		if (indev) {
   674	#if !IS_ENABLED(CONFIG_BRIDGE_NETFILTER)
   675			if (nla_put_be32(skb, NFQA_IFINDEX_INDEV, htonl(indev->ifindex)))
   676				goto nla_put_failure;
   677	#else
   678			if (entry->state.pf == PF_BRIDGE) {
   679				/* Case 1: indev is physical input device, we need to
   680				 * look for bridge group (when called from
   681				 * netfilter_bridge) */
   682				if (nla_put_be32(skb, NFQA_IFINDEX_PHYSINDEV,
   683						 htonl(indev->ifindex)) ||
   684				/* this is the bridge group "brX" */
   685				/* rcu_read_lock()ed by __nf_queue */
   686				    nla_put_be32(skb, NFQA_IFINDEX_INDEV,
   687						 htonl(br_port_get_rcu(indev)->br->dev->ifindex)))
   688					goto nla_put_failure;
   689			} else {
   690				int physinif;
   691	
   692				/* Case 2: indev is bridge group, we need to look for
   693				 * physical device (when called from ipv4) */
   694				if (nla_put_be32(skb, NFQA_IFINDEX_INDEV,
   695						 htonl(indev->ifindex)))
   696					goto nla_put_failure;
   697	
   698				physinif = nf_bridge_get_physinif(entskb);
   699				if (physinif &&
   700				    nla_put_be32(skb, NFQA_IFINDEX_PHYSINDEV,
   701						 htonl(physinif)))
   702					goto nla_put_failure;
   703			}
   704	#endif
   705		}
   706	
   707		if (outdev) {
   708	#if !IS_ENABLED(CONFIG_BRIDGE_NETFILTER)
   709			if (nla_put_be32(skb, NFQA_IFINDEX_OUTDEV, htonl(outdev->ifindex)))
   710				goto nla_put_failure;
   711	#else
   712			if (entry->state.pf == PF_BRIDGE) {
   713				/* Case 1: outdev is physical output device, we need to
   714				 * look for bridge group (when called from
   715				 * netfilter_bridge) */
   716				if (nla_put_be32(skb, NFQA_IFINDEX_PHYSOUTDEV,
   717						 htonl(outdev->ifindex)) ||
   718				/* this is the bridge group "brX" */
   719				/* rcu_read_lock()ed by __nf_queue */
   720				    nla_put_be32(skb, NFQA_IFINDEX_OUTDEV,
   721						 htonl(br_port_get_rcu(outdev)->br->dev->ifindex)))
   722					goto nla_put_failure;
   723			} else {
   724				int physoutif;
   725	
   726				/* Case 2: outdev is bridge group, we need to look for
   727				 * physical output device (when called from ipv4) */
   728				if (nla_put_be32(skb, NFQA_IFINDEX_OUTDEV,
   729						 htonl(outdev->ifindex)))
   730					goto nla_put_failure;
   731	
   732				physoutif = nf_bridge_get_physoutif(entskb);
   733				if (physoutif &&
   734				    nla_put_be32(skb, NFQA_IFINDEX_PHYSOUTDEV,
   735						 htonl(physoutif)))
   736					goto nla_put_failure;
   737			}
   738	#endif
   739		}
   740	
   741		if (entskb->mark &&
   742		    nla_put_be32(skb, NFQA_MARK, htonl(entskb->mark)))
   743			goto nla_put_failure;
   744	
   745		if (entskb->priority &&
   746		    nla_put_be32(skb, NFQA_PRIORITY, htonl(entskb->priority)))
   747			goto nla_put_failure;
   748	
   749		if (indev && entskb->dev &&
   750		    skb_mac_header_was_set(entskb) &&
   751		    skb_mac_header_len(entskb) != 0) {
   752			struct nfqnl_msg_packet_hw phw;
   753			int len;
   754	
   755			memset(&phw, 0, sizeof(phw));
   756			len = dev_parse_header(entskb, phw.hw_addr);
   757			if (len) {
   758				phw.hw_addrlen = htons(len);
   759				if (nla_put(skb, NFQA_HWADDR, sizeof(phw), &phw))
   760					goto nla_put_failure;
   761			}
   762		}
   763	
   764		if (nfqnl_put_bridge(entry, skb) < 0)
   765			goto nla_put_failure;
   766	
   767		if (entry->state.hook <= NF_INET_FORWARD && tstamp) {
   768			struct nfqnl_msg_packet_timestamp ts;
   769			struct timespec64 kts = ktime_to_timespec64(tstamp);
   770	
   771			ts.sec = cpu_to_be64(kts.tv_sec);
   772			ts.usec = cpu_to_be64(kts.tv_nsec / NSEC_PER_USEC);
   773	
   774			if (nla_put(skb, NFQA_TIMESTAMP, sizeof(ts), &ts))
   775				goto nla_put_failure;
   776		}
   777	
   778		if ((queue->flags & NFQA_CFG_F_UID_GID) && entskb->sk &&
   779		    nfqnl_put_sk_uidgid(skb, entskb->sk) < 0)
   780			goto nla_put_failure;
   781	
   782		if (nfqnl_put_sk_classid(skb, entskb->sk) < 0)
   783			goto nla_put_failure;
   784	
   785		if (seclen && nla_put(skb, NFQA_SECCTX, ctx.len, ctx.context))
   786			goto nla_put_failure;
   787	
   788		if (ct && nfnl_ct->build(skb, ct, ctinfo, NFQA_CT, NFQA_CT_INFO) < 0)
   789			goto nla_put_failure;
   790	
   791		if (cap_len > data_len &&
   792		    nla_put_be32(skb, NFQA_CAP_LEN, htonl(cap_len)))
   793			goto nla_put_failure;
   794	
   795		if (nfqnl_put_packet_info(skb, entskb, csum_verify))
   796			goto nla_put_failure;
   797	
   798		if (data_len) {
   799			struct nlattr *nla;
   800	
   801			if (skb_tailroom(skb) < sizeof(*nla) + hlen)
   802				goto nla_put_failure;
   803	
   804			nla = skb_put(skb, sizeof(*nla));
   805			nla->nla_type = NFQA_PAYLOAD;
   806			nla->nla_len = nla_attr_size(data_len);
   807	
   808			if (skb_zerocopy(skb, entskb, data_len, hlen))
   809				goto nla_put_failure;
   810		}
   811	
   812		nlh->nlmsg_len = skb->len;
   813		if (seclen >= 0)
   814			security_release_secctx(&ctx);
   815		return skb;
   816	
   817	nla_put_failure:
   818		skb_tx_error(entskb);
   819		kfree_skb(skb);
   820		net_err_ratelimited("nf_queue: error creating packet message\n");
   821	nlmsg_failure:
   822		if (seclen >= 0)
   823			security_release_secctx(&ctx);
   824		return NULL;
   825	}
   826	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
