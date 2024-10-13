Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1741DFFC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728833095; cv=none; b=czJV4eSPa6Euzg6DXR/EpUqcS51EuEjC1m/J1nBtHPc7AuKOhglKdwB33wELKenNzkK2sgnHRdrYnBsulJ8R1hBG/1/g0BL857yUhlL47NqKYXxsYRfSzF+X07uRnO2loGY4ss4y/xfTOJyXntzpRmkXBkE9jBADpE3ITN2KGR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728833095; c=relaxed/simple;
	bh=BuBr4ybDOGCH0T9AeeOutDs6IreI5r3sKfq7tMPtLKY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FRivyW4Bh91AJxqjvHWgxmDtKu92HKnak7Q0WZvr/wxJUS2UW4u/bJIz1p1+zM1h/0R838rGnGZeejVJUcXxDhO3DB7TEy58YHw9Ae9IPCETjfPPa5VVANBiDWLzv66jzmhxlu0ja1uKUhPBoA6hbvCcPUQJYJJcXTDTpmyDVt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QV+PRaqX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QV+PRaqX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728833093; x=1760369093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BuBr4ybDOGCH0T9AeeOutDs6IreI5r3sKfq7tMPtLKY=;
  b=QV+PRaqXcTMzkTgEi+eKO5pgy8S/6jhs0zfEBblJ4AiRaOSqPvOIDFIL
   cOGqGNpn1pJRhdJ3nmvxq5Ig2XadSVzrFn2YRiW7TC9MdracjSq9MGiHB
   R4ayebygszdKf8L4qwOrshZWfi62jD8tAW8J2+Z6kCne4uC0hZgWR5IkO
   qzbdtD+OY41W1NRluQCWNUq79OsC99x8Inas4BMGL8J+ZEGH0nMhZb9rN
   h9A/h+mT+XSISLmUDsWSwrUa08TQgeTV2B7ioGQ945p5aqv6UfH/YvUii
   fvNuNfhZmMEF0JYtq5nZOP91KSONaDDWUE2H/FFUsLxcS4KFtMOEPz17g
   Q==;
X-CSE-ConnectionGUID: zSKlc6+7TvmMi9HLn2++Rg==
X-CSE-MsgGUID: Wq0OEqFJRYOEWnDNoGJCyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="38754499"
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="38754499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 08:24:53 -0700
X-CSE-ConnectionGUID: X4e04s/lSTGKnW9quRqBKQ==
X-CSE-MsgGUID: NBUk8kDATX2DFZObGssF9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="100679478"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2024 08:24:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t00Sf-000ESX-2d;
	Sun, 13 Oct 2024 15:24:49 +0000
Date: Sun, 13 Oct 2024 23:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Wei <luwei32@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2170/14354] net/ipv4/tcp_comp.c:740:6: warning:
 no previous prototype for 'comp_stream_read'
Message-ID: <202410132346.qPkj7PMR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b52135712fc8eae0751505713e1caf086a1437d4
commit: c31dcf6c5ab41f07da38d3f270987807735ec93e [2170/14354] tcp_comp: implement tcp compression
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20241013/202410132346.qPkj7PMR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410132346.qPkj7PMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410132346.qPkj7PMR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_comp.c:740:6: warning: no previous prototype for 'comp_stream_read' [-Wmissing-prototypes]
     740 | bool comp_stream_read(struct sock *sk)
         |      ^~~~~~~~~~~~~~~~
>> net/ipv4/tcp_comp.c:779:6: warning: no previous prototype for 'comp_setup_strp' [-Wmissing-prototypes]
     779 | void comp_setup_strp(struct sock *sk, struct tcp_comp_context *ctx)
         |      ^~~~~~~~~~~~~~~


vim +/comp_stream_read +740 net/ipv4/tcp_comp.c

   739	
 > 740	bool comp_stream_read(struct sock *sk)
   741	{
   742		struct tcp_comp_context *ctx = comp_get_ctx(sk);
   743	
   744		if (!ctx)
   745			return false;
   746	
   747		if (ctx->rx.pkt || ctx->rx.dpkt)
   748			return true;
   749	
   750		return false;
   751	}
   752	
   753	static void comp_data_ready(struct sock *sk)
   754	{
   755		struct tcp_comp_context *ctx = comp_get_ctx(sk);
   756	
   757		strp_data_ready(&ctx->rx.strp);
   758	}
   759	
   760	static void comp_queue(struct strparser *strp, struct sk_buff *skb)
   761	{
   762		struct tcp_comp_context *ctx = comp_get_ctx(strp->sk);
   763	
   764		ctx->rx.pkt = skb;
   765		strp_pause(strp);
   766		ctx->rx.saved_data_ready(strp->sk);
   767	}
   768	
   769	static int comp_read_size(struct strparser *strp, struct sk_buff *skb)
   770	{
   771		struct strp_msg *rxm = strp_msg(skb);
   772	
   773		if (rxm->offset > skb->len)
   774			return 0;
   775	
   776		return skb->len - rxm->offset;
   777	}
   778	
 > 779	void comp_setup_strp(struct sock *sk, struct tcp_comp_context *ctx)
   780	{
   781		struct strp_callbacks cb;
   782	
   783		memset(&cb, 0, sizeof(cb));
   784		cb.rcv_msg = comp_queue;
   785		cb.parse_msg = comp_read_size;
   786		strp_init(&ctx->rx.strp, sk, &cb);
   787	
   788		write_lock_bh(&sk->sk_callback_lock);
   789		ctx->rx.saved_data_ready = sk->sk_data_ready;
   790		sk->sk_data_ready = comp_data_ready;
   791		write_unlock_bh(&sk->sk_callback_lock);
   792	
   793		strp_check_rcv(&ctx->rx.strp);
   794	}
   795	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
