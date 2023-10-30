Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7BEEA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Oct 2023 03:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k9CPFvaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698635996; x=1730171996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aly1bfIC32GTjVWiHeDH22S+beCiiA1uiV4iWLC+Wzc=;
  b=k9CPFvaQ7ujN/3Cxog5GDdiormPSR/B4fOjX0Irip9j4g2KKx6WEcYTt
   h0J4O/yRtYOyH5frfkhuBtO+yZxnio/5LcU69oI43rd8ZFQQ7dkcAlQGV
   On5NPCatmmNW7ZzWw5JpvGE/DWC9rxkRi9gW5xrNzY/LPdpUfotUaYeyi
   ksqzz4PstiSYBDXXzED9XRefAwJ2P1c0mfDZ71LegVM6C9sqxIO1YIuYH
   Pd5o6Nlp4ys74sQJ1/lgx6Mo9mXIpwpclyS8+eHTDmOLk75h/NZNiDaGJ
   LrJ+1MZB0d3xR/wklvbu+H5SgpbjR5Fek1wU5qg/BvoHS32XLygLpLfTp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="386898164"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="386898164"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 20:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="8198447"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Oct 2023 20:19:37 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxIoi-000D0w-0I;
	Mon, 30 Oct 2023 03:19:52 +0000
Date: Mon, 30 Oct 2023 11:19:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx-latest 12/21] io_uring/zc_rx.c:697:undefined
 reference to `tcp_read_sock'
Message-ID: <202310301135.17nGoQcC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   8b71540bf926b02cf19123b31b20daf76a314e33
commit: fe93615f71187bb84cca3d790d992cfc5e6062fb [12/21] io_uring: add io_recvzc request
config: arm-spear6xx_defconfig (https://download.01.org/0day-ci/archive/20231030/202310301135.17nGoQcC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301135.17nGoQcC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310301135.17nGoQcC-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: io_uring/zc_rx.o: in function `io_zc_rx_tcp_read':
>> io_uring/zc_rx.c:697:(.text+0x8f0): undefined reference to `tcp_read_sock'
   arm-linux-gnueabi-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
>> io_uring/zc_rx.c:787:(.text+0x1254): undefined reference to `tcp_recvmsg'


vim +697 io_uring/zc_rx.c

   690	
   691	static int io_zc_rx_tcp_read(struct sock *sk)
   692	{
   693		read_descriptor_t rd_desc = {
   694			.count = 1,
   695		};
   696	
 > 697		return tcp_read_sock(sk, &rd_desc, zc_rx_recv_skb);
   698	}
   699	
   700	static int io_zc_rx_tcp_recvmsg(struct sock *sk, unsigned int recv_limit,
   701					int flags, int *addr_len)
   702	{
   703		size_t used;
   704		long timeo;
   705		int ret;
   706	
   707		ret = used = 0;
   708	
   709		lock_sock(sk);
   710	
   711		timeo = sock_rcvtimeo(sk, flags & MSG_DONTWAIT);
   712		while (recv_limit) {
   713			ret = io_zc_rx_tcp_read(sk);
   714			if (ret < 0)
   715				break;
   716			if (!ret) {
   717				if (used)
   718					break;
   719				if (sock_flag(sk, SOCK_DONE))
   720					break;
   721				if (sk->sk_err) {
   722					ret = sock_error(sk);
   723					break;
   724				}
   725				if (sk->sk_shutdown & RCV_SHUTDOWN)
   726					break;
   727				if (sk->sk_state == TCP_CLOSE) {
   728					ret = -ENOTCONN;
   729					break;
   730				}
   731				if (!timeo) {
   732					ret = -EAGAIN;
   733					break;
   734				}
   735				if (!skb_queue_empty(&sk->sk_receive_queue))
   736					break;
   737				sk_wait_data(sk, &timeo, NULL);
   738				if (signal_pending(current)) {
   739					ret = sock_intr_errno(timeo);
   740					break;
   741				}
   742				continue;
   743			}
   744			recv_limit -= ret;
   745			used += ret;
   746	
   747			if (!timeo)
   748				break;
   749			release_sock(sk);
   750			lock_sock(sk);
   751	
   752			if (sk->sk_err || sk->sk_state == TCP_CLOSE ||
   753			    (sk->sk_shutdown & RCV_SHUTDOWN) ||
   754			    signal_pending(current))
   755				break;
   756		}
   757	
   758		release_sock(sk);
   759	
   760		/* TODO: handle timestamping */
   761	
   762		if (used)
   763			return used;
   764	
   765		return ret;
   766	}
   767	
   768	int io_zc_rx_recv(struct socket *sock, unsigned int limit, unsigned int flags)
   769	{
   770		struct sock *sk = sock->sk;
   771		const struct proto *prot;
   772		int addr_len = 0;
   773		int ret;
   774	
   775		if (flags & MSG_ERRQUEUE)
   776			return -EOPNOTSUPP;
   777	
   778		prot = READ_ONCE(sk->sk_prot);
   779		if (prot->recvmsg != tcp_recvmsg)
   780			return -EPROTONOSUPPORT;
   781	
   782		sock_rps_record_flow(sk);
   783	
   784		ret = io_zc_rx_tcp_recvmsg(sk, limit, flags, &addr_len);
   785	
   786		return ret;
 > 787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
