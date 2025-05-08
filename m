Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D427CCDC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 16:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720621; cv=none; b=VJ5iIfiTNBMIghPQ2xxPEfQOKcGp6xD3oKv1+WtY0+ZSpd1X1M3m6UeC4+H+e020hvqspTntuY0+nQO+LIqy3eouP0o27o3grvglq01TemharJaypOpCnlxtJdLnveezOvPbbx4oGhxjiea+SM1m3AtzSqSmuWMsaWbBjmR7r1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720621; c=relaxed/simple;
	bh=bX7dthRlVRF5aPDpHU+5ir/CgDB8KBQAoi5yhKJ7va4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JSQ6XpUCppgU7zvk7vW3bWYYj8xpPE1oxqirTD96jQLi38G2lg8Vjf9DqJNckngfp1VyREyMD7XCLB71uLz/+GQ8M/T9rUz+EcPPPytLv8EnEO+ky9fzTdVFAqp0yMDmki2ldc2b2ZJNMIdT4vqG8UKZVzxaQ1oo01cOFISZHYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNrBP68i; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNrBP68i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746720619; x=1778256619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bX7dthRlVRF5aPDpHU+5ir/CgDB8KBQAoi5yhKJ7va4=;
  b=HNrBP68i2isHsSglSUCp/tmVs6pilw5KtXEvYia5TXG3xRYBGJzyR+V8
   dbNd97Swog/VD1P3LnbGrT3sG2WGE4Cv85567UGcsxQwbBp8yprAMO11H
   ZrH9Wi0l4TMs1QVTbMk8rXwaYh+bzCXbUprVORoGB+igrSAFy7Md4hO64
   dT6Ps+rZWjOr2B7VoJSG43TQSCTjLcmVgrFc8WuuK9uZTlmBnJL0LQMS/
   JCV3NwhYpEBQJv16k1A9pZUo8UUxfOCzD3QZjG2fLfqgomqbPzDvYzBXH
   nlLV1SYH+UdB+IUJAEfYuygBnuEXy1GNZsCy8//pEibnxBHngCQJsfgV7
   A==;
X-CSE-ConnectionGUID: 6TgOqbaST+Kil1uEueV5Ww==
X-CSE-MsgGUID: vhZQDI4xSTOXmUAiEGZZkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48629338"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48629338"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 09:10:19 -0700
X-CSE-ConnectionGUID: L3vS0/ZpSh+9xOMDepVgAg==
X-CSE-MsgGUID: p/I3oh4qSY6zZcz47j4bHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="136298318"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2025 09:10:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD3p9-000B91-1E;
	Thu, 08 May 2025 16:10:15 +0000
Date: Fri, 9 May 2025 00:09:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.coredump.socket 15/18]
 net/unix/af_unix.c:1707:35: error: implicit declaration of function
 'sock_gen_cookie'
Message-ID: <202505090020.zuvJGBVf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.coredump.socket
head:   bc6c0c24d12262711c2c7f04f2f7fb37af6ee342
commit: ae8b1b777f72cfc07a9c294f2fd7d365c9b27881 [15/18] pidfs, coredump: allow to verify coredump connection
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250509/202505090020.zuvJGBVf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090020.zuvJGBVf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090020.zuvJGBVf-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/unix/af_unix.c: In function 'unix_stream_connect':
>> net/unix/af_unix.c:1707:35: error: implicit declaration of function 'sock_gen_cookie' [-Wimplicit-function-declaration]
    1707 |                 peercred.cookie = sock_gen_cookie(newsk);
         |                                   ^~~~~~~~~~~~~~~


vim +/sock_gen_cookie +1707 net/unix/af_unix.c

  1582	
  1583	static int unix_stream_connect(struct socket *sock, struct sockaddr *uaddr,
  1584				       int addr_len, int flags)
  1585	{
  1586		struct sockaddr_un *sunaddr = (struct sockaddr_un *)uaddr;
  1587		struct sock *sk = sock->sk, *newsk = NULL, *other = NULL;
  1588		struct unix_sock *u = unix_sk(sk), *newu, *otheru;
  1589		struct unix_peercred peercred = {};
  1590		struct net *net = sock_net(sk);
  1591		struct sk_buff *skb = NULL;
  1592		unsigned char state;
  1593		long timeo;
  1594		int err;
  1595	
  1596		err = unix_validate_addr(sunaddr, addr_len);
  1597		if (err)
  1598			goto out;
  1599	
  1600		err = BPF_CGROUP_RUN_PROG_UNIX_CONNECT_LOCK(sk, uaddr, &addr_len);
  1601		if (err)
  1602			goto out;
  1603	
  1604		if ((test_bit(SOCK_PASSCRED, &sock->flags) ||
  1605		     test_bit(SOCK_PASSPIDFD, &sock->flags)) &&
  1606		    !READ_ONCE(u->addr)) {
  1607			err = unix_autobind(sk);
  1608			if (err)
  1609				goto out;
  1610		}
  1611	
  1612		timeo = sock_sndtimeo(sk, flags & O_NONBLOCK);
  1613	
  1614		/* First of all allocate resources.
  1615		 * If we will make it after state is locked,
  1616		 * we will have to recheck all again in any case.
  1617		 */
  1618	
  1619		/* create new sock for complete connection */
  1620		newsk = unix_create1(net, NULL, 0, sock->type);
  1621		if (IS_ERR(newsk)) {
  1622			err = PTR_ERR(newsk);
  1623			goto out;
  1624		}
  1625	
  1626		err = prepare_peercred(&peercred);
  1627		if (err)
  1628			goto out;
  1629	
  1630		/* Allocate skb for sending to listening sock */
  1631		skb = sock_wmalloc(newsk, 1, 0, GFP_KERNEL);
  1632		if (!skb) {
  1633			err = -ENOMEM;
  1634			goto out_free_sk;
  1635		}
  1636	
  1637	restart:
  1638		/*  Find listening sock. */
  1639		other = unix_find_other(net, sunaddr, addr_len, sk->sk_type);
  1640		if (IS_ERR(other)) {
  1641			err = PTR_ERR(other);
  1642			goto out_free_skb;
  1643		}
  1644	
  1645		unix_state_lock(other);
  1646	
  1647		/* Apparently VFS overslept socket death. Retry. */
  1648		if (sock_flag(other, SOCK_DEAD)) {
  1649			unix_state_unlock(other);
  1650			sock_put(other);
  1651			goto restart;
  1652		}
  1653	
  1654		if (other->sk_state != TCP_LISTEN ||
  1655		    other->sk_shutdown & RCV_SHUTDOWN) {
  1656			err = -ECONNREFUSED;
  1657			goto out_unlock;
  1658		}
  1659	
  1660		if (unix_recvq_full_lockless(other)) {
  1661			if (!timeo) {
  1662				err = -EAGAIN;
  1663				goto out_unlock;
  1664			}
  1665	
  1666			timeo = unix_wait_for_peer(other, timeo);
  1667			sock_put(other);
  1668	
  1669			err = sock_intr_errno(timeo);
  1670			if (signal_pending(current))
  1671				goto out_free_skb;
  1672	
  1673			goto restart;
  1674		}
  1675	
  1676		/* self connect and simultaneous connect are eliminated
  1677		 * by rejecting TCP_LISTEN socket to avoid deadlock.
  1678		 */
  1679		state = READ_ONCE(sk->sk_state);
  1680		if (unlikely(state != TCP_CLOSE)) {
  1681			err = state == TCP_ESTABLISHED ? -EISCONN : -EINVAL;
  1682			goto out_unlock;
  1683		}
  1684	
  1685		unix_state_lock(sk);
  1686	
  1687		if (unlikely(sk->sk_state != TCP_CLOSE)) {
  1688			err = sk->sk_state == TCP_ESTABLISHED ? -EISCONN : -EINVAL;
  1689			unix_state_unlock(sk);
  1690			goto out_unlock;
  1691		}
  1692	
  1693		err = security_unix_stream_connect(sk, other, newsk);
  1694		if (err) {
  1695			unix_state_unlock(sk);
  1696			goto out_unlock;
  1697		}
  1698	
  1699		/* The way is open! Fastly set all the necessary fields... */
  1700	
  1701		sock_hold(sk);
  1702		unix_peer(newsk)	= sk;
  1703		newsk->sk_state		= TCP_ESTABLISHED;
  1704		newsk->sk_type		= sk->sk_type;
  1705		/* Prepare a new socket cookie for the receiver. */
  1706		if (flags & SOCK_COREDUMP)
> 1707			peercred.cookie = sock_gen_cookie(newsk);
  1708		init_peercred(newsk, &peercred);
  1709		newu = unix_sk(newsk);
  1710		newu->listener = other;
  1711		RCU_INIT_POINTER(newsk->sk_wq, &newu->peer_wq);
  1712		otheru = unix_sk(other);
  1713	
  1714		/* copy address information from listening to new sock
  1715		 *
  1716		 * The contents of *(otheru->addr) and otheru->path
  1717		 * are seen fully set up here, since we have found
  1718		 * otheru in hash under its lock.  Insertion into the
  1719		 * hash chain we'd found it in had been done in an
  1720		 * earlier critical area protected by the chain's lock,
  1721		 * the same one where we'd set *(otheru->addr) contents,
  1722		 * as well as otheru->path and otheru->addr itself.
  1723		 *
  1724		 * Using smp_store_release() here to set newu->addr
  1725		 * is enough to make those stores, as well as stores
  1726		 * to newu->path visible to anyone who gets newu->addr
  1727		 * by smp_load_acquire().  IOW, the same warranties
  1728		 * as for unix_sock instances bound in unix_bind() or
  1729		 * in unix_autobind().
  1730		 */
  1731		if (otheru->path.dentry) {
  1732			path_get(&otheru->path);
  1733			newu->path = otheru->path;
  1734		}
  1735		refcount_inc(&otheru->addr->refcnt);
  1736		smp_store_release(&newu->addr, otheru->addr);
  1737	
  1738		/* Set credentials */
  1739		copy_peercred(sk, other);
  1740	
  1741		sock->state	= SS_CONNECTED;
  1742		WRITE_ONCE(sk->sk_state, TCP_ESTABLISHED);
  1743		sock_hold(newsk);
  1744	
  1745		smp_mb__after_atomic();	/* sock_hold() does an atomic_inc() */
  1746		unix_peer(sk)	= newsk;
  1747	
  1748		unix_state_unlock(sk);
  1749	
  1750		/* take ten and send info to listening sock */
  1751		spin_lock(&other->sk_receive_queue.lock);
  1752		__skb_queue_tail(&other->sk_receive_queue, skb);
  1753		spin_unlock(&other->sk_receive_queue.lock);
  1754		unix_state_unlock(other);
  1755		other->sk_data_ready(other);
  1756		sock_put(other);
  1757		return 0;
  1758	
  1759	out_unlock:
  1760		unix_state_unlock(other);
  1761		sock_put(other);
  1762	out_free_skb:
  1763		consume_skb(skb);
  1764	out_free_sk:
  1765		unix_release_sock(newsk, 0);
  1766	out:
  1767		drop_peercred(&peercred);
  1768		return err;
  1769	}
  1770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
