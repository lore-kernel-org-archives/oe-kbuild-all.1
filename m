Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB1D1F4737
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 15:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730303065; cv=none; b=KZQ0va3DeqlSKGP1yD4exh7FwDzoHqawSWxVNPgmS7maFHTvxm4NELK9Z3Bgn+kpaMal+kSqXEDA8UoOvbsGbnVK9FsM/wNq/mvqFp223VEHJkA4fZQdnLEu7msMH3LVvBxefHues5flFk/9PUfk7D5/l7Iis194MUIMaN1D06E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730303065; c=relaxed/simple;
	bh=TXpOI4ft9tJxiUsSquSOIdflo98HoXqetMHbcECat14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MfLMC41QpIhyId6nv14zzlGvjpntxutDvgM6PM95q59PDDdhRvOQAVZrKnVsizzxvLVLQIL7YED5dkeVUxnT98/yC7MURHNLTcB5F2qPd8AY9Cnihu8BqMf0vDvwURKFgUqrLwRSQcyWW5sHKM2llDL8ha9wLsXDxtQWwwsY1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXeacq7s; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXeacq7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730303062; x=1761839062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TXpOI4ft9tJxiUsSquSOIdflo98HoXqetMHbcECat14=;
  b=ZXeacq7snytkGKDgdXrlAPQh7Gi8poEKPCzN21TgDuC6PkZPMuxrzK6n
   HaNVCYMSzBuwsVzOU/5qhEMX451Yv8liUh+3hakrcnwZf7mRg4xmhg3pJ
   xhXyZgUi7vwhncWu1Eb+W1Evcmu8rXOV4/dr9D8tUPju9FydRVvld/2Xy
   uaJfM3vU7/1BP82amd+aw69RIB1lr0RhR16AUzkBjwuAATmpOuZZWqP2x
   wSYcJf85T9640yL3yztsVXCUyue4J3cX/CiS5OFGafef0nYh+5aBKA3cm
   jatcGARUqOaVH/xp2FYuxenmBVD6j9iYt7uRFNVnC0B2XKh0rNHZPxrjK
   w==;
X-CSE-ConnectionGUID: 3H8qoeBcSJ611Tkw9dN9Mg==
X-CSE-MsgGUID: OH2fg9R8Sc+MvMcHu39bXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47488128"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="47488128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 08:44:22 -0700
X-CSE-ConnectionGUID: FoZSwGcFQuy8tt6kY9dizQ==
X-CSE-MsgGUID: P1RUMfTxS1mrwzK1wuq9SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82772196"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Oct 2024 08:44:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Arn-000f1E-0q;
	Wed, 30 Oct 2024 15:44:15 +0000
Date: Wed, 30 Oct 2024 23:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 18/98] net/toa/toa.c:122:33: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202410302307.kyiYVfnp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 7384d821f268ce4c725e0f6649838794368ca071 [18/98] tkernel: net: add toa support
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241030/202410302307.kyiYVfnp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410302307.kyiYVfnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410302307.kyiYVfnp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/toa/toa.c:28:24: sparse: sparse: symbol 'toa_stats' was not declared. Should it be static?
>> net/toa/toa.c:122:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:122:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:122:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:126:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:126:47: sparse:     expected restricted __be16 [usertype] sin_port
   net/toa/toa.c:126:47: sparse:     got unsigned short [addressable] [usertype] port
   net/toa/toa.c:127:54: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] s_addr @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:127:54: sparse:     expected restricted __be32 [usertype] s_addr
   net/toa/toa.c:127:54: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:129:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:129:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:129:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:134:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:134:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:134:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:137:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:137:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:137:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:162:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:162:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:162:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:163:48: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] sin6_port @@     got unsigned short [addressable] [usertype] port @@
   net/toa/toa.c:163:48: sparse:     expected restricted __be16 [usertype] sin6_port
   net/toa/toa.c:163:48: sparse:     got unsigned short [addressable] [usertype] port
   net/toa/toa.c:164:94: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __be32 [usertype] w4 @@     got unsigned int [addressable] [usertype] ip @@
   net/toa/toa.c:164:94: sparse:     expected restricted __be32 [usertype] w4
   net/toa/toa.c:164:94: sparse:     got unsigned int [addressable] [usertype] ip
   net/toa/toa.c:166:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:166:33: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:166:33: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:169:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:169:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:169:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:172:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:172:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:172:17: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:206:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:206:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:206:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:208:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:208:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:208:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:234:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:234:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:234:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:236:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:236:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:236:25: sparse:     got struct toa_stat_mib *
   net/toa/toa.c:342:65: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct toa_stat_mib * @@
   net/toa/toa.c:342:65: sparse:     expected void const [noderef] __percpu *__vpp_verify
   net/toa/toa.c:342:65: sparse:     got struct toa_stat_mib *
>> net/toa/toa.c:374:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats @@     got struct toa_stat_mib [noderef] __percpu * @@
   net/toa/toa.c:374:19: sparse:     expected struct toa_stat_mib *[addressable] [toplevel] ext_stats
   net/toa/toa.c:374:19: sparse:     got struct toa_stat_mib [noderef] __percpu *
>> net/toa/toa.c:389:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct toa_stat_mib *[addressable] [toplevel] ext_stats @@
   net/toa/toa.c:389:29: sparse:     expected void [noderef] __percpu *__pdata
   net/toa/toa.c:389:29: sparse:     got struct toa_stat_mib *[addressable] [toplevel] ext_stats
>> net/toa/toa.c:404:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats @@
   net/toa/toa.c:404:29: sparse:     expected void [noderef] __percpu *__pdata
   net/toa/toa.c:404:29: sparse:     got struct toa_stat_mib *[addressable] [assigned] [toplevel] ext_stats

vim +122 net/toa/toa.c

    96	
    97	/* get client ip from socket
    98	 * @param sock [in] the socket to getpeername() or getsockname()
    99	 * @param uaddr [out] the place to put client ip, port
   100	 * @param uaddr_len [out] lenth of @uaddr
   101	 * @peer [in] if(peer), try to get remote address; if(!peer), try to get local address
   102	 * @return return what the original inet_getname() returns.
   103	 */
   104	static int
   105	inet_getname_toa(struct socket *sock, struct sockaddr *uaddr, int peer)
   106	{
   107		int retval = 0;
   108		struct sock *sk = sock->sk;
   109		struct sockaddr_in *sin = (struct sockaddr_in *)uaddr;
   110		struct toa_data tdata;
   111	
   112		//TOA_DBG("inet_getname_toa called, sk->sk_user_data is %p\n", sk->sk_user_data);
   113	
   114		/* call orginal one */
   115		retval = inet_getname(sock, uaddr, peer);
   116	
   117		/* set our value if need */
   118		if (retval == 0 && NULL != sk->sk_user_data && peer) {
   119			if (sock_def_readable == sk->sk_data_ready) {
   120				memcpy(&tdata, &sk->sk_user_data, sizeof (tdata));
   121				if (TCPOPT_TOA == tdata.opcode && TCPOLEN_TOA == tdata.opsize) {
 > 122					TOA_INC_STATS(ext_stats, GETNAME_TOA_OK_CNT);
   123					//TOA_DBG("inet_getname_toa: set new sockaddr, ip %u.%u.%u.%u -> %u.%u.%u.%u, port %u -> %u\n",
   124					//		NIPQUAD(sin->sin_addr.s_addr), NIPQUAD(tdata.ip), ntohs(sin->sin_port),
   125					//		ntohs(tdata.port));
   126					sin->sin_port = tdata.port;
   127					sin->sin_addr.s_addr = tdata.ip;
   128				} else { /* sk_user_data doesn't belong to us */
   129					TOA_INC_STATS(ext_stats, GETNAME_TOA_MISMATCH_CNT);
   130					//TOA_DBG("inet_getname_toa: invalid toa data, ip %u.%u.%u.%u port %u opcode %u opsize %u\n",
   131					//		NIPQUAD(tdata.ip), ntohs(tdata.port), tdata.opcode, tdata.opsize);
   132				}
   133			} else {
   134				TOA_INC_STATS(ext_stats, GETNAME_TOA_BYPASS_CNT);
   135			}
   136		} else { /* no need to get client ip */
   137			TOA_INC_STATS(ext_stats, GETNAME_TOA_EMPTY_CNT);
   138		}
   139	
   140		return retval;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
