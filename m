Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B214D3BBE2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 17:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711645702; cv=none; b=ZhVZ7+OEq5qmQnLNEsCCXV7omXGqO3iXzbq6k7QZznxnFs7sDROvipN8CBi82gCPMArK3OrE4C35e7AVQJvHrDa5af7S/hG7RLNI2s8MkwuNG7NEAUiNSHJbAnJieSOBXXu8mjvqfjAJfsxkwRzAmzl5aJOxnQK1sJBQm/Tome8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711645702; c=relaxed/simple;
	bh=BaPDupCv6UqrYXZi2uehYVOVjOquLeGs4/mCVLtJ4N0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEFWLtDvcIGibzSR2ZLR3Dttn/n/ZFqf5zmYloRDCWJ511DHpU0znhIw53ctynkxhF0vyKyfnKPMy6XNdXWdPh9JP0Do0NOGfcdMB7yAhfDwJBVk+343sdk4JC8UkuHl4a6+/Cv3rwdv+wI3CGeH1oo+AwGhRLP+zZv35ZnlcGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TZqa7E4P; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TZqa7E4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711645698; x=1743181698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BaPDupCv6UqrYXZi2uehYVOVjOquLeGs4/mCVLtJ4N0=;
  b=TZqa7E4P/3N2FqNIK8r6kTdM/K8KX9YuIrGaaZIyWolzI4GEPcwfGhah
   YdHRgogDCN5FXNJDNYPLPXe61is19pPZmqYUGX7AoyM/4FwagYmVEll8x
   k20+3mXhDpJsIZ2/Yk+O428d0VmKqGLqq+V1T81RZQSACHjVZyayVxJT9
   dOvKQtB/N+kDM2QFLlzpg2pmIF936DpSiMIatHxkQzVb8UNO4aXKofAuH
   H5/+6Zf/DCcNJNukS3kmgoIAWtWYMleO0Sn3v2l65u0Hwiuo63HuBauUv
   x2JpWp/Hop9haeS5jcvlbmcLTcjjeg2y5jy/6s+kYbOjPgXyt/dY6HlRq
   g==;
X-CSE-ConnectionGUID: 6V2Z4azZTMqEOb7RrbmEnw==
X-CSE-MsgGUID: LpnpbA8eSAmTk2E/6B9K0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7417527"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7417527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 10:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="39865447"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Mar 2024 10:08:17 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rptEc-0002NE-2z;
	Thu, 28 Mar 2024 17:08:14 +0000
Date: Fri, 29 Mar 2024 01:07:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Lu Wei <luwei32@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2170/7000] net/ipv4/tcp_comp.c:740:6: sparse:
 sparse: symbol 'comp_stream_read' was not declared. Should it be static?
Message-ID: <202403290120.dpqjbxn2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   704605877ce9913071214d2515a4c2b9077f5078
commit: c31dcf6c5ab41f07da38d3f270987807735ec93e [2170/7000] tcp_comp: implement tcp compression
config: loongarch-randconfig-r113-20240328 (https://download.01.org/0day-ci/archive/20240329/202403290120.dpqjbxn2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240329/202403290120.dpqjbxn2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290120.dpqjbxn2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_comp.c:740:6: sparse: sparse: symbol 'comp_stream_read' was not declared. Should it be static?
>> net/ipv4/tcp_comp.c:779:6: sparse: sparse: symbol 'comp_setup_strp' was not declared. Should it be static?

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
