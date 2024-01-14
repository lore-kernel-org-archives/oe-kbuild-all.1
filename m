Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833781E506
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jan 2024 22:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6nloy7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705273089; x=1736809089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3dqo1siYFX8TAVTaKtQTHsQnsE74QTx+cnfvcidHipI=;
  b=f6nloy7trQ0ol9lm4QQRdkWDfIEAJh0VOmg/ALUwTRM69cZzNmNSGIue
   67octTJRmBVtQrKtwhwPThgjIr/2fdcijDveujUIlD49ECswhLRxE8g6u
   Tunif2WJ3HJp4qJiijKo4x3HQoSPUE+nCICG3jAG1fCDRWfoirzbqyI6g
   CE0tBzGPALsAQhxqgPEQeNZFAF8PAd1jP4IHLf6fmXD5YndIJgSEkpiRn
   L0G007sgEKTsaO056BhoHXFhPQvWXOpAnEKpdsTnNMSdv4GMiZdXqwoEt
   +55+4wZUEZk5AqvNhOwgNpuv9Z8TeT1dxG51btE23oXikfCIZGYnFs1zL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="398358918"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="398358918"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 14:58:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="956661134"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="956661134"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Jan 2024 14:58:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP9QZ-000Bu1-17;
	Sun, 14 Jan 2024 22:58:03 +0000
Date: Mon, 15 Jan 2024 06:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2143/2356] net/ipv4/tcp_comp.c:740:6: warning: no
 previous prototype for function 'comp_stream_read'
Message-ID: <202401150646.ycz09XSM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: c31dcf6c5ab41f07da38d3f270987807735ec93e [2143/2356] tcp_comp: implement tcp compression
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240115/202401150646.ycz09XSM-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150646.ycz09XSM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150646.ycz09XSM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/tcp_comp.c:740:6: warning: no previous prototype for function 'comp_stream_read' [-Wmissing-prototypes]
     740 | bool comp_stream_read(struct sock *sk)
         |      ^
   net/ipv4/tcp_comp.c:740:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     740 | bool comp_stream_read(struct sock *sk)
         | ^
         | static 
>> net/ipv4/tcp_comp.c:779:6: warning: no previous prototype for function 'comp_setup_strp' [-Wmissing-prototypes]
     779 | void comp_setup_strp(struct sock *sk, struct tcp_comp_context *ctx)
         |      ^
   net/ipv4/tcp_comp.c:779:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     779 | void comp_setup_strp(struct sock *sk, struct tcp_comp_context *ctx)
         | ^
         | static 
   2 warnings generated.


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
