Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD501DF73A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 04:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756095302; cv=none; b=snthal8U/NDnWo6oOy4/5SdpJxbSfPe0Bw1FxuLBuQqdOUCpHb7tsjy7jkT2UWL3kGno4VOPa2h26c44xLGqYcL+wQoBlwqgeYp4cioTx4ReTu1fhkc8ufCfbJLrwnd8yLSyXIxr+dyttsQqE5RG6wPVB5C4AOjQtgVVUxsvWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756095302; c=relaxed/simple;
	bh=aBeckMMqd8LbWBa54Vl/2BEjwSp6LepJ71S3rhcdYkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NqEf6Rn1EInHyO8fpImrI1mJ4+R2EsbzwZv3yZXBHoxucOSYvsI5Y0dwVfhiTcocZVoB+kHjk60g6gT59aWxra5n7D3aQIVu0AxLcP4YTJRMZFw6jAG3wnt2Xdbl8Fg08yJm4uqAfDPRly48oSZjAQbm6oKTrWbN9ANOKqOf1yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bd9jKzzM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bd9jKzzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756095302; x=1787631302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aBeckMMqd8LbWBa54Vl/2BEjwSp6LepJ71S3rhcdYkU=;
  b=bd9jKzzMj/iIcuTB8/SZOT7bo3Af9x8OyWNOX95nQ5hM3YnMMHmyDPMu
   QyngBIWxBYZmetzDbF4I0PKxREpFVuBfuw/RStPh3ZuoPKHhEvnJqhRFC
   6pt7hSi5r3fq8dwzo91+NSTFyTWXfMbil5dqeY77rvNtld0+/mhqfGVIy
   IiQcFXwLvA9y32QdFg3LVcE0PJJacnCCvjs8SLF6wehVSS1/dHsOgP4Y4
   DmbHvMC+lWUmm6F8GCJAB5zapcT60w14BIUzasvv1z6CKc4OBc1EbJaas
   QgXW+0+h9yAc9XzvKHZuGP9266+qdALDdecdQ4dRDHyGh3h9blrZ8NgGU
   w==;
X-CSE-ConnectionGUID: HQ5rEN3aT9e2nSgIxfgFWA==
X-CSE-MsgGUID: 4i4M536PSbmtUR+R5vGaZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62130136"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62130136"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 21:15:01 -0700
X-CSE-ConnectionGUID: 1gxA51UKS5aao3PKy/g6UQ==
X-CSE-MsgGUID: wddVv0aRTjWZUVu7/X07NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169112188"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 24 Aug 2025 21:14:59 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqOb1-000NM3-30;
	Mon, 25 Aug 2025 04:14:35 +0000
Date: Mon, 25 Aug 2025 12:13:34 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 2/3]
 fs/smb/server/transport_tcp.c:262:47: error: no member named 'skc_v6_daddr'
 in 'struct sock_common'
Message-ID: <202508251245.Y24eUGc5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   0edf873d496a9fc1c4e0ca77e29a12231403ecf1
commit: 133b8c914b4ff05d088bd69977bc854a5757dc25 [2/3] ksmbd: replace connection list with hash table
config: sparc64-randconfig-002-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251245.Y24eUGc5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251245.Y24eUGc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508251245.Y24eUGc5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/server/transport_tcp.c:262:47: error: no member named 'skc_v6_daddr' in 'struct sock_common'
     262 |                         inet_hash = ipv6_addr_hash(&client_sk->sk->sk_v6_daddr);
         |                                                     ~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/net/sock.h:384:34: note: expanded from macro 'sk_v6_daddr'
     384 | #define sk_v6_daddr             __sk_common.skc_v6_daddr
         |                                             ^
   1 error generated.


vim +262 fs/smb/server/transport_tcp.c

   228	
   229	/**
   230	 * ksmbd_kthread_fn() - listen to new SMB connections and callback server
   231	 * @p:		arguments to forker thread
   232	 *
   233	 * Return:	0 on success, error number otherwise
   234	 */
   235	static int ksmbd_kthread_fn(void *p)
   236	{
   237		struct socket *client_sk = NULL;
   238		struct interface *iface = (struct interface *)p;
   239		struct ksmbd_conn *conn;
   240		int ret, inet_hash;
   241	
   242		while (!kthread_should_stop()) {
   243			mutex_lock(&iface->sock_release_lock);
   244			if (!iface->ksmbd_socket) {
   245				mutex_unlock(&iface->sock_release_lock);
   246				break;
   247			}
   248			ret = kernel_accept(iface->ksmbd_socket, &client_sk,
   249					    SOCK_NONBLOCK);
   250			mutex_unlock(&iface->sock_release_lock);
   251			if (ret) {
   252				if (ret == -EAGAIN)
   253					/* check for new connections every 100 msecs */
   254					schedule_timeout_interruptible(HZ / 10);
   255				continue;
   256			}
   257	
   258			/*
   259			 * Limits repeated connections from clients with the same IP.
   260			 */
   261			if (client_sk->sk->sk_family == AF_INET6)
 > 262				inet_hash = ipv6_addr_hash(&client_sk->sk->sk_v6_daddr);
   263			else
   264				inet_hash = ipv4_addr_hash(inet_sk(client_sk->sk)->inet_daddr);
   265			down_read(&conn_list_lock);
   266			hash_for_each_possible(conn_list, conn, hlist, inet_hash) {
   267	#if IS_ENABLED(CONFIG_IPV6)
   268				if (client_sk->sk->sk_family == AF_INET6) {
   269					if (memcmp(&client_sk->sk->sk_v6_daddr,
   270						   &conn->inet6_addr, 16) == 0) {
   271						ret = -EAGAIN;
   272						break;
   273					}
   274				} else if (inet_sk(client_sk->sk)->inet_daddr ==
   275					 conn->inet_addr) {
   276					ret = -EAGAIN;
   277					break;
   278				}
   279	#else
   280				if (inet_sk(client_sk->sk)->inet_daddr ==
   281				    conn->inet_addr) {
   282					ret = -EAGAIN;
   283					break;
   284				}
   285	#endif
   286			}
   287			up_read(&conn_list_lock);
   288			if (ret == -EAGAIN)
   289				continue;
   290	
   291			if (server_conf.max_connections &&
   292			    atomic_inc_return(&active_num_conn) >= server_conf.max_connections) {
   293				pr_info_ratelimited("Limit the maximum number of connections(%u)\n",
   294						    atomic_read(&active_num_conn));
   295				atomic_dec(&active_num_conn);
   296				sock_release(client_sk);
   297				continue;
   298			}
   299	
   300			ksmbd_debug(CONN, "connect success: accepted new connection\n");
   301			client_sk->sk->sk_rcvtimeo = KSMBD_TCP_RECV_TIMEOUT;
   302			client_sk->sk->sk_sndtimeo = KSMBD_TCP_SEND_TIMEOUT;
   303	
   304			ksmbd_tcp_new_connection(client_sk);
   305		}
   306	
   307		ksmbd_debug(CONN, "releasing socket\n");
   308		return 0;
   309	}
   310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
