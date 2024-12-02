Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65281D4326
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733114300; cv=none; b=Lv2WYw9v/g31OlseHRuEGNrJ6j5UlWyjiRhUWjrHQC3Qex2kAJ5vq59YK+X8WyRngzNK/Bc/4M2gMH5b0nArlgKs4zt3jsE4pXm8Y1aXnp9DmjnGuxjkTczVmn1O8iSg+QRD0dmOXuC/hTObmNKecFWsfJrgXpp0ol/WYhKBUxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733114300; c=relaxed/simple;
	bh=FzaK/1N/W7XzaB8EoD2fhRnlS/ad3g7ylb0EkcpEpLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iwhn+U1bBd68ilFnXOmsnn9YtELdgxcysGapdGyq4Tb0cpkJYRUhcrRQBGdovGczux60xs5urcNc0M9I3ozZbHYtwBiuHA+IlJwcfM2WBFn0YyFDocVBVq4QCaz/fkTv6rsfLQzXBfZjTv/o0Z046a37lt7FtHEQdsFymhopKkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQNcmATw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQNcmATw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733114298; x=1764650298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FzaK/1N/W7XzaB8EoD2fhRnlS/ad3g7ylb0EkcpEpLY=;
  b=jQNcmATw9WXZAREjW1bgKCwCTF1Q1qgFZ9Y6K+x1W/xhuyH3CidVJUvE
   QYd/T0/U1LJC7oPZ8cvb/a2NhZ5H35ZP/LNApBcVQfyUu4swCrPmCjvZk
   3RDV3pqNpOy9WSdnY7yxHtrZcOSwGkWu3jCG2wOp2mEtqDWgNNkkOTdZz
   ZFa93SUVD8Z4fo8GNzGtQBkIkRevfNvoEz78A5S6XQcHGAbHTBCb8Bxz5
   2iyyGNRGKew0V05C4j3TzZn9ze0gydICPqYBbSIA6hAIcYQW0xpc103nd
   V0rXj4ywC493581qTObmg5pGyp/5k8q70fV+38DJ3Z+A9EES7IEAhefhk
   w==;
X-CSE-ConnectionGUID: P0t18vOrQoiBPIs7ecfM0Q==
X-CSE-MsgGUID: LIxaj5f9SJGlse9uD2DC3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33197322"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="33197322"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 20:38:17 -0800
X-CSE-ConnectionGUID: qXSssfSyRJCdGXio9uRE4g==
X-CSE-MsgGUID: 1uFHGpV4SWynKqOav5tAAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93307569"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Dec 2024 20:38:16 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHyCL-000253-1z;
	Mon, 02 Dec 2024 04:38:13 +0000
Date: Mon, 2 Dec 2024 12:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Wei <luwei32@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1455/1455] net/ipv4/tcp_comp.c:740:6: warning: no
 previous prototype for 'comp_stream_read'
Message-ID: <202412021219.wZvdrkqX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: c31dcf6c5ab41f07da38d3f270987807735ec93e [1455/1455] tcp_comp: implement tcp compression
config: x86_64-randconfig-014-20241112 (https://download.01.org/0day-ci/archive/20241202/202412021219.wZvdrkqX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021219.wZvdrkqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021219.wZvdrkqX-lkp@intel.com/

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
