Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9518C399
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 00:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709513564; cv=none; b=Cq8sfxnA3xhY08F44hkXs0gUpkzfrSyNsIzMjgwJErxdu219TZpbm924nWhE+/w5HWFtW/1B+5Ol8sp2r1pMMZQIqOc6Y1K1O2Uh08D4Cpiz8xql61hc/5SL2O0E0+Cfb9xKJXvfaM9zeNsTKyw9tsUiaFUpUr/WYg4bqeBn5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709513564; c=relaxed/simple;
	bh=IvXcR5L8jlEB76EfBFjC1eMsJYr2n8ch4aK9VwOj3cY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dpN2gN+2fW3F9FDYIc6ItIgrqnaPyMwDrkCeWGKcB95kx8mQL39wqjwPaQVwfBg11TJjELEgwvOwixfGgBqitZiqFxKSA/AJjz3YmtDfzpbt091qdfI+sAIKzwLOyabXrgcDSwOR1NSiE7VQUwJWWgajw8y5o25+kf+ZDkYGO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMZRjXwr; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMZRjXwr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709513562; x=1741049562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IvXcR5L8jlEB76EfBFjC1eMsJYr2n8ch4aK9VwOj3cY=;
  b=iMZRjXwrbkJ4RQuEUigUnLxl3yuYeZZC6gsJKxStbWEobVbEK+uUlt43
   3lJZP4HgVThFC1eL3pzPLFIffkbuBynxYlJVkxjrJIzg3n9VqUQaBEP9w
   tR9E1Hglm5zPZgKt1ZajnbUZyIkTFtuUgE08Gfn5YLv6xz1jQWY7k9mWW
   tXrGpXRmCrIlGl4axuGNA4RRsTE47nTJHpmED4X2Erti8fPvl2E0VoPce
   aSAdqw/0RKp3MuLRIFQv8McbLiv4Cd1ZOE7JdLviLCkgcLQAqUjiV6HSK
   8QxpGe4+xtaLygUNP9dsyCbJhu1CqQOnJ4A73ki4Lz1iVT1BYJANCkbYy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="14700778"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="14700778"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 16:52:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8763341"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2024 16:52:36 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgwZF-0002EU-3D;
	Mon, 04 Mar 2024 00:52:34 +0000
Date: Mon, 4 Mar 2024 08:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 18/98] net/toa/toa.c:122:33: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202403040820.5nQXnHyS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: 7384d821f268ce4c725e0f6649838794368ca071 [18/98] tkernel: net: add toa support
config: x86_64-randconfig-122-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040820.5nQXnHyS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040820.5nQXnHyS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040820.5nQXnHyS-lkp@intel.com/

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
