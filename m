Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15797464
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 05:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730181353; cv=none; b=JFVdLanYqQiATbSYjwCHxHqh8JzqdRNHgganB4TWUWJtDZP/+F1m6qRCvoXfIi/gZD0H0NT/mil9myjBqgWblwY9RyIMWwftpHOl2x7vwsAYphY7/iG6DqeLaHTwN0FoOaN3IxjqD7mC2qDf00JknrzZzayebJqsWikwAmctWmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730181353; c=relaxed/simple;
	bh=CTBiz/5bHvE25O3OL3n0UULByc61PgTfyURI2EOUVR0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l7wKRQ2VGXfU3N7bwJ+cpKVPEkf/s118wQHISZGpAXH7dC8Pg7/ZMZ1J/rbGn8fyQDj0AQ/zctE//wCCCOIyuChxuZSPgJJGZ0VJSCD8BeXxzkVXhoVxIFY/hZPQGG7GuwPM/0e1c8pecwfXGtmHPNxSDDpiSeDEuQSOfM5ileM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnJ4Omuh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnJ4Omuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730181350; x=1761717350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTBiz/5bHvE25O3OL3n0UULByc61PgTfyURI2EOUVR0=;
  b=CnJ4OmuhG98z1JODfrgqgmhXFBL5lbdHtrEGCoFTBJLhHIPtrB/9vmQo
   /a6CVVcJic6uvJ/6bkXD1YJXlbO2EOlvGhQlPUwQINSBP9AdU0Y8JBJGG
   BlA5Cw/f5GByDI2tj+iBFqaDM/R4VPxI7o1Rc19KRF464wvYyajTVHTt5
   njYs7z8MTdUsNnzFDvfXLZPD0qNdHVt69D8euJ+P6h/gkpmNAKhiapLCN
   sVY+p7bQHXwJ8HoN4hTYTk0IRmRb48Z0iV4mxhZCUmD6AJ0KpinYUzuy6
   RUo3LAU7MbGfdnUGndTugDl9bzjRLPH7j5ZB7y4N7g4suxZakN/dj8p2H
   Q==;
X-CSE-ConnectionGUID: SksdLXeOQDSlXsEEqZPt3w==
X-CSE-MsgGUID: gkiqI+C3Q0aewQRuyHEKiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29259622"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="29259622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 22:55:47 -0700
X-CSE-ConnectionGUID: 6iqqCEb6SU+o+pkD2chrQw==
X-CSE-MsgGUID: 1Ku2Imi2QEeKqPIIHtWnzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="105191501"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2024 22:55:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5fCf-000dIu-1u;
	Tue, 29 Oct 2024 05:55:41 +0000
Date: Tue, 29 Oct 2024 13:55:09 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 18/98] net/toa/toa.c:122:33: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202410291349.cMZeZttd-lkp@intel.com>
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
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291349.cMZeZttd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291349.cMZeZttd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291349.cMZeZttd-lkp@intel.com/

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
