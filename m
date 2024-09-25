Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877A414AD25
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 19:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727294084; cv=none; b=j2rq4OFJo8GZ3bfvrO+TiIuiK6kDcLc3L4cR3LPVMoBN5TUotooloBg9Z5JqozAm6We0+FlpI+QOcc5EvGwUuZZMEvQrndvdfnbtcRxq9Nroa9A4CaVHTFTqe1I9pmPQSdZXxx2QXjQMy1gz6SRlpZ5eoBRv2F68sd2ZZiRZ2P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727294084; c=relaxed/simple;
	bh=+yWDESAcM42cFih4nTXmH9bd57lJzPZILl9Zy9eZcvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5pzqn2c2iOs8SYYFHTC6kCYfA6BIy+PSoaMIao4mqqJYcn9BlMUBGBapFtjwyTMNLuktolFRjOZPuVXmk50ZabsqNC1iUKOy2nCA8NN55eReLuKyQyS5+IvAMRDCcMgTvijxaHecRYMg7PQu7SAJWkssTck9OuL2JtjKarEwdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dbHWMFqj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dbHWMFqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727294083; x=1758830083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+yWDESAcM42cFih4nTXmH9bd57lJzPZILl9Zy9eZcvw=;
  b=dbHWMFqj6TX3aUg2pUsbgL+M5pMsyHZdktR+qLKMME/SEfssZyY3nJ8h
   wmlOj+HELcNorw0RILnCPsSoXrfaJoFTsJLjR79uGpyl+C97SzOdXllQg
   RT+fV78InPrq4rqs95BtWakFuse2FNbLBOVJKOlYYjxfdY1VHzwiF0XlS
   zJJXg+/1cVibEPnt5BA8q6L9zBEzeP3O2cTLPhzF6QJMuFEQPtv7Do434
   b/TOzWVsogXK25t871auWKoCXJ5ZnigJC7rG6rceaUlkcPy0aHWAtiV6T
   fskQkwJCysNsO+4cfFJb1kI5IOi04DncrKHmOiIf+fW8kbae/QbfKN8c5
   A==;
X-CSE-ConnectionGUID: vIKc32IFTUSAX8vX/AVOLQ==
X-CSE-MsgGUID: DIWD3qRSQA2kB/muEFIAWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48898744"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="48898744"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 12:54:41 -0700
X-CSE-ConnectionGUID: 8j4sc2oqR/iQlLg4mP1Jgg==
X-CSE-MsgGUID: 2H5DTAtYTDus3jWIf9pRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="102715161"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Sep 2024 12:54:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stY5q-000JvV-2O;
	Wed, 25 Sep 2024 19:54:34 +0000
Date: Thu, 26 Sep 2024 03:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10462/11005] include/net/inet_hashtables.h:424:
 undefined reference to `tcp_hashinfo'
Message-ID: <202409260304.jRa3KCMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a0fc99df5429b7eacab84a2a88f1f482f61c717b
commit: 91d9b56ad074b5640505e5b0993c4ecfe04a0c17 [10462/11005] net: csig toa patch toa patch from csig luckyqiu@tencent.com
config: x86_64-buildonly-randconfig-001-20240925 (https://download.01.org/0day-ci/archive/20240926/202409260304.jRa3KCMz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260304.jRa3KCMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260304.jRa3KCMz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `__inet_lookup':
>> include/net/inet_hashtables.h:424: undefined reference to `tcp_hashinfo'
>> ld: include/net/inet_hashtables.h:424: undefined reference to `__inet_lookup_established'
>> ld: include/net/inet_hashtables.h:430: undefined reference to `tcp_hashinfo'
>> ld: include/net/inet_hashtables.h:430: undefined reference to `__inet_lookup_listener'
   ld: vmlinux.o: in function `vpc_inet_dump_one_sk':
>> net/toa/toa.c:787: undefined reference to `inet_twsk_put'
   ld: vmlinux.o: in function `unhook_toa_functions':
   net/toa/toa.c:688: undefined reference to `inet_stream_ops'
   ld: net/toa/toa.c:688: undefined reference to `inet_getname'
   ld: net/toa/toa.c:700: undefined reference to `ipv4_specific'
   ld: net/toa/toa.c:700: undefined reference to `tcp_v4_syn_recv_sock'


vim +424 include/net/inet_hashtables.h

8f491069b40be5 Herbert Xu               2006-08-09  412  
c67499c0e77206 Pavel Emelyanov          2008-01-31  413  static inline struct sock *__inet_lookup(struct net *net,
c67499c0e77206 Pavel Emelyanov          2008-01-31  414  					 struct inet_hashinfo *hashinfo,
a583636a83ea38 Craig Gallek             2016-02-10  415  					 struct sk_buff *skb, int doff,
fb99c848e5ae6b Al Viro                  2006-09-27  416  					 const __be32 saddr, const __be16 sport,
fb99c848e5ae6b Al Viro                  2006-09-27  417  					 const __be32 daddr, const __be16 dport,
3fa6f616a7a4d0 David Ahern              2017-08-07  418  					 const int dif, const int sdif,
3b24d854cb3538 Eric Dumazet             2016-04-01  419  					 bool *refcounted)
e48c414ee61f4a Arnaldo Carvalho de Melo 2005-08-09  420  {
8f491069b40be5 Herbert Xu               2006-08-09  421  	u16 hnum = ntohs(dport);
3b24d854cb3538 Eric Dumazet             2016-04-01  422  	struct sock *sk;
c67499c0e77206 Pavel Emelyanov          2008-01-31  423  
3b24d854cb3538 Eric Dumazet             2016-04-01 @424  	sk = __inet_lookup_established(net, hashinfo, saddr, sport,
3fa6f616a7a4d0 David Ahern              2017-08-07  425  				       daddr, hnum, dif, sdif);
3b24d854cb3538 Eric Dumazet             2016-04-01  426  	*refcounted = true;
3b24d854cb3538 Eric Dumazet             2016-04-01  427  	if (sk)
3b24d854cb3538 Eric Dumazet             2016-04-01  428  		return sk;
3b24d854cb3538 Eric Dumazet             2016-04-01  429  	*refcounted = false;
3b24d854cb3538 Eric Dumazet             2016-04-01 @430  	return __inet_lookup_listener(net, hashinfo, skb, doff, saddr,
3fa6f616a7a4d0 David Ahern              2017-08-07  431  				      sport, daddr, hnum, dif, sdif);
e48c414ee61f4a Arnaldo Carvalho de Melo 2005-08-09  432  }
e48c414ee61f4a Arnaldo Carvalho de Melo 2005-08-09  433  

:::::: The code at line 424 was first introduced by commit
:::::: 3b24d854cb35383c30642116e5992fd619bdc9bc tcp/dccp: do not touch listener sk_refcnt under synflood

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
