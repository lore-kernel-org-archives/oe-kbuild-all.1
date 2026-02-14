Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7322626299
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Feb 2026 03:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771039267; cv=none; b=u5iMj12HZmsvXWiF1aHwvr6FXTwSvbuvMMR7JMLzQhT1X7WQp988J7U39mwvNHy3BM7tTAu9GChoUfrS7rK6eTuY55JYiJ27PJtiuvr3OlVboa7qWD4NjuK9e+uXESndpyKIRzCnftAFmH5ynpvgLEDBWtbnpeb4Lov1w8cJurM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771039267; c=relaxed/simple;
	bh=iybpSKP2SDvCWY8+DbiMvJeWoYrJOWNWz8LxIs/DHj0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y1Qr8SpljUWEUiJGVgODpfanIoYptCNewf7FPB5wOR/yutHpafbcBDrGa9T3vcod4hzfNDLfF+4RAEbQi8MJxvqQLUhhI2haV0l+i2qXr+Q5d6wAYnWorgiBwA8DuGehHkLtugs40UmHS9Un1HJJMjF/ZrPwV1BKYC0DbXqf3+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blexzuHl; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blexzuHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771039265; x=1802575265;
  h=date:from:to:cc:subject:message-id;
  bh=iybpSKP2SDvCWY8+DbiMvJeWoYrJOWNWz8LxIs/DHj0=;
  b=blexzuHl5NvGVnnN/UNQxp/PRHcguj5/JsQMso33iZXiZk55tcPPd5nT
   hmnLNE8CQ13L1TxKKx2V8UXOVr247EMrN4CvymAj+nPDmlKXLnHJtccHA
   FOX+dS54VP8s/ZRLHV2c5Ie9wpeIhQ6XqeRb7DFsqGTc3d7+xBgp1zgzv
   qgdHnwURN/gnSyIJW0pML/MuUJ9BbJrb3k8BFa3Pvl50mW0SgDzDpFfjg
   McSBkJT8sPvJLXKs25ejDDIOuqR3aFn4Xt2rw4P9OWkG5P4/RKj3zrqEV
   adlu13c8usrmyUKaax+hgQ/B6FNhv09EHP11RxAFte0q+yYX+Sx76YbD1
   Q==;
X-CSE-ConnectionGUID: D2BGHncPTeSrTWRZn9saXA==
X-CSE-MsgGUID: L6ocEcVuQ2qBf0GPx02DUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72317800"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72317800"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 19:21:04 -0800
X-CSE-ConnectionGUID: 2PsH7z8uQ3+Tir6KKL8Bog==
X-CSE-MsgGUID: KLvHxlwCROKOYxft6uoS1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="217230251"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Feb 2026 19:21:03 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr6DN-00000000w7E-03qD;
	Sat, 14 Feb 2026 03:21:01 +0000
Date: Sat, 14 Feb 2026 11:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:svctcp-next 4/9] net/sunrpc/svcsock.c:1508:1: warning:
 the frame size of 1312 bytes is larger than 1024 bytes
Message-ID: <202602141135.Yk7l88Ui-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux svctcp-next
head:   a58d4445ba5bcc8dab0c345b29045a002f9c8cf4
commit: 6b7c713a24f7c7cb50d7ee9d90e731979b6fc2d6 [4/9] sunrpc: add dedicated TCP receiver thread
config: mips-lemote2f_defconfig (https://download.01.org/0day-ci/archive/20260214/202602141135.Yk7l88Ui-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141135.Yk7l88Ui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602141135.Yk7l88Ui-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/sunrpc/svcsock.c: In function 'svc_tcp_receiver_thread':
>> net/sunrpc/svcsock.c:1508:1: warning: the frame size of 1312 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1508 | }
         | ^


vim +1508 net/sunrpc/svcsock.c

  1455	
  1456	/*
  1457	 * Dedicated receiver kthread for a TCP socket. All sock_recvmsg()
  1458	 * calls for this connection occur in this context, eliminating
  1459	 * socket lock contention between nfsd threads. Complete RPC
  1460	 * messages are enqueued for nfsd threads to process.
  1461	 */
  1462	static int svc_tcp_receiver_thread(void *data)
  1463	{
  1464		struct svc_sock *svsk = data;
  1465		struct svc_rqst rqstp_storage;
  1466		struct svc_rqst *rqstp = &rqstp_storage;
  1467		bool progress;
  1468	
  1469		if (svc_tcp_receiver_rqst_init(rqstp, svsk) < 0) {
  1470			svc_xprt_deferred_close(&svsk->sk_xprt);
  1471			complete(&svsk->sk_receiver_exit);
  1472			return 0;
  1473		}
  1474	
  1475		while (!kthread_should_stop() &&
  1476		       !test_bit(XPT_CLOSE, &svsk->sk_xprt.xpt_flags)) {
  1477			/*
  1478			 * Wait until data arrives and the message queue has
  1479			 * room. Use a timeout when a partial RPC record
  1480			 * remains so connection health is checked periodically.
  1481			 */
  1482			if (svsk->sk_tcplen > 0)
  1483				wait_event_interruptible_timeout(svsk->sk_receiver_wq,
  1484					svc_tcp_receiver_can_work(svsk) ||
  1485					test_bit(XPT_CLOSE, &svsk->sk_xprt.xpt_flags) ||
  1486					kthread_should_stop(),
  1487					msecs_to_jiffies(5000));
  1488			else
  1489				wait_event_interruptible(svsk->sk_receiver_wq,
  1490					svc_tcp_receiver_can_work(svsk) ||
  1491					test_bit(XPT_CLOSE, &svsk->sk_xprt.xpt_flags) ||
  1492					kthread_should_stop());
  1493	
  1494			progress = svc_tcp_recv_and_queue(svsk, rqstp);
  1495	
  1496			if (!llist_empty(&svsk->sk_msg_queue)) {
  1497				set_bit(XPT_DATA, &svsk->sk_xprt.xpt_flags);
  1498				svc_xprt_enqueue(&svsk->sk_xprt);
  1499			}
  1500	
  1501			if (svc_tcp_check_partial_record(svsk, progress))
  1502				break;
  1503		}
  1504	
  1505		svc_tcp_receiver_rqst_free(rqstp);
  1506		complete(&svsk->sk_receiver_exit);
  1507		return 0;
> 1508	}
  1509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
