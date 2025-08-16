Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B7B2E8885
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Aug 2025 15:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755356785; cv=none; b=fd9JoTLjs9hDQY9DpUJDKoWa7d1pvEmv+NG3UmPt0q3GdNrDw40JIqUCuJyMKBDUPeAuvnSjmt0rCAayOQ+jrfoMENpSn8/jQrrFEW1Hr4QbRrgEYKELiRUwUkRN/hvsOe/l6gYiF6Qjfg+oTcbspKe0c8QH2whOzzBzMTTiQtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755356785; c=relaxed/simple;
	bh=LVIqfHpGAkZ3VJ3ksj8lX+KLUKB1XQlFCrxytoMXIzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1kOP8EWdqv7bte6Kd049y9Ci5FvfGGWO+MKVFfpJLinYrSSm7/UI7y7TOC1myejQp46iRdN6z5y+KkM8qOPInxns6oCXUpAITbpIGv6mElTDS1KWmOn3cRjQxtHD3hJuHWFG6CdBtNpWEHVvrJbXYYWNGvZ3iLDNyiAW58wWcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMqFj4vW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMqFj4vW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755356784; x=1786892784;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LVIqfHpGAkZ3VJ3ksj8lX+KLUKB1XQlFCrxytoMXIzc=;
  b=UMqFj4vWWVZip/lG0XgZ2M99M8Elmmqo8UOBB2DPfUa6SsLefAa1IX/R
   Va01XzA5sRgVUjFxYwsb+fFo3ELpqvdMPK30SSWjboexgTgZm8F/7oXQW
   p/B2DGtSFtjV/0lk2A6wK8FoFqyvKxdJX+9yEn8GkM0QyFubu+32tyd9x
   mmGr987nxHUGqYQq8cgE9b7FqJZ6J3n+NVN3QRY0rOX+4+ONpK/PDQZFO
   ONEn3QIAPBxplhms1H/+TdE67efKn3pj+YA66JPp2VZKbaPDP00zV08hn
   Hqhu89QyfN7oVuB7PFG+ZPTi8CNcXvkvzib7od8c3J0zwgizgASMyxEOg
   A==;
X-CSE-ConnectionGUID: 0tQgBf+oQlW6VwVTfOBeuw==
X-CSE-MsgGUID: AdQuioK6Sy6NZ5wHHRl4Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="68251059"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="68251059"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 08:06:23 -0700
X-CSE-ConnectionGUID: lTlUmUBFQjyfxUpa8Qdapg==
X-CSE-MsgGUID: amnT8i/cSR2XxvPFtoBhkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166714589"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Aug 2025 08:06:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unIU8-000Cx4-00;
	Sat, 16 Aug 2025 15:06:20 +0000
Date: Sat, 16 Aug 2025 23:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 2/14] include/net/sock.h:384:45:
 error: 'struct sock_common' has no member named 'skc_v6_daddr'; did you mean
 'skc_daddr'?
Message-ID: <202508162204.UWDTOsPn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   f184d74e19d18053ee92af900754bc5d86663ec8
commit: d22fdf2aab15d2daa8395b379ce8dc7781d4557f [2/14] ksmbd: extend the connection limiting mechanism to support IPv6
config: s390-randconfig-002-20250816 (https://download.01.org/0day-ci/archive/20250816/202508162204.UWDTOsPn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508162204.UWDTOsPn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508162204.UWDTOsPn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/smb/server/connection.h:11,
                    from fs/smb/server/transport_tcp.c:12:
   fs/smb/server/transport_tcp.c: In function 'alloc_transport':
>> include/net/sock.h:384:45: error: 'struct sock_common' has no member named 'skc_v6_daddr'; did you mean 'skc_daddr'?
     384 | #define sk_v6_daddr             __sk_common.skc_v6_daddr
         |                                             ^~~~~~~~~~~~
   fs/smb/server/transport_tcp.c:89:59: note: in expansion of macro 'sk_v6_daddr'
      89 |                 memcpy(&conn->inet6_addr, &client_sk->sk->sk_v6_daddr, 16);
         |                                                           ^~~~~~~~~~~
   fs/smb/server/transport_tcp.c: In function 'ksmbd_kthread_fn':
>> include/net/sock.h:384:45: error: 'struct sock_common' has no member named 'skc_v6_daddr'; did you mean 'skc_daddr'?
     384 | #define sk_v6_daddr             __sk_common.skc_v6_daddr
         |                                             ^~~~~~~~~~~~
   fs/smb/server/transport_tcp.c:260:60: note: in expansion of macro 'sk_v6_daddr'
     260 |                                 if (memcmp(&client_sk->sk->sk_v6_daddr,
         |                                                            ^~~~~~~~~~~


vim +384 include/net/sock.h

4dc6dc7162c08b Eric Dumazet             2009-07-15  364  
68835aba4d9b74 Eric Dumazet             2010-11-30  365  #define sk_dontcopy_begin	__sk_common.skc_dontcopy_begin
68835aba4d9b74 Eric Dumazet             2010-11-30  366  #define sk_dontcopy_end		__sk_common.skc_dontcopy_end
4dc6dc7162c08b Eric Dumazet             2009-07-15  367  #define sk_hash			__sk_common.skc_hash
5080546682bae3 Eric Dumazet             2013-10-02  368  #define sk_portpair		__sk_common.skc_portpair
05dbc7b59481ca Eric Dumazet             2013-10-03  369  #define sk_num			__sk_common.skc_num
05dbc7b59481ca Eric Dumazet             2013-10-03  370  #define sk_dport		__sk_common.skc_dport
5080546682bae3 Eric Dumazet             2013-10-02  371  #define sk_addrpair		__sk_common.skc_addrpair
5080546682bae3 Eric Dumazet             2013-10-02  372  #define sk_daddr		__sk_common.skc_daddr
5080546682bae3 Eric Dumazet             2013-10-02  373  #define sk_rcv_saddr		__sk_common.skc_rcv_saddr
^1da177e4c3f41 Linus Torvalds           2005-04-16  374  #define sk_family		__sk_common.skc_family
^1da177e4c3f41 Linus Torvalds           2005-04-16  375  #define sk_state		__sk_common.skc_state
^1da177e4c3f41 Linus Torvalds           2005-04-16  376  #define sk_reuse		__sk_common.skc_reuse
055dc21a1d1d21 Tom Herbert              2013-01-22  377  #define sk_reuseport		__sk_common.skc_reuseport
9fe516ba3fb29b Eric Dumazet             2014-06-27  378  #define sk_ipv6only		__sk_common.skc_ipv6only
26abe14379f8e2 Eric W. Biederman        2015-05-08  379  #define sk_net_refcnt		__sk_common.skc_net_refcnt
^1da177e4c3f41 Linus Torvalds           2005-04-16  380  #define sk_bound_dev_if		__sk_common.skc_bound_dev_if
^1da177e4c3f41 Linus Torvalds           2005-04-16  381  #define sk_bind_node		__sk_common.skc_bind_node
8feaf0c0a5488b Arnaldo Carvalho de Melo 2005-08-09  382  #define sk_prot			__sk_common.skc_prot
07feaebfcc10cd Eric W. Biederman        2007-09-12  383  #define sk_net			__sk_common.skc_net
efe4208f47f907 Eric Dumazet             2013-10-03 @384  #define sk_v6_daddr		__sk_common.skc_v6_daddr
efe4208f47f907 Eric Dumazet             2013-10-03  385  #define sk_v6_rcv_saddr	__sk_common.skc_v6_rcv_saddr
33cf7c90fe2f97 Eric Dumazet             2015-03-11  386  #define sk_cookie		__sk_common.skc_cookie
70da268b569d32 Eric Dumazet             2015-10-08  387  #define sk_incoming_cpu		__sk_common.skc_incoming_cpu
8e5eb54d303b7c Eric Dumazet             2015-10-08  388  #define sk_flags		__sk_common.skc_flags
ed53d0ab761f5c Eric Dumazet             2015-10-08  389  #define sk_rxhash		__sk_common.skc_rxhash
efe4208f47f907 Eric Dumazet             2013-10-03  390  
5d4cc87414c5d1 Eric Dumazet             2024-02-16  391  	__cacheline_group_begin(sock_write_rx);
43f51df4172955 Eric Dumazet             2021-11-15  392  
9115e8cd2a0c6e Eric Dumazet             2016-12-03  393  	atomic_t		sk_drops;
5d4cc87414c5d1 Eric Dumazet             2024-02-16  394  	__s32			sk_peek_off;
9115e8cd2a0c6e Eric Dumazet             2016-12-03  395  	struct sk_buff_head	sk_error_queue;
b178bb3dfc30d9 Eric Dumazet             2010-11-16  396  	struct sk_buff_head	sk_receive_queue;
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  397  	/*
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  398  	 * The backlog queue is special, it is always used with
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  399  	 * the per-socket spinlock held and requires low latency
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  400  	 * access. Therefore we special case it's implementation.
b178bb3dfc30d9 Eric Dumazet             2010-11-16  401  	 * Note : rmem_alloc is in this structure to fill a hole
b178bb3dfc30d9 Eric Dumazet             2010-11-16  402  	 * on 64bit arches, not because its logically part of
b178bb3dfc30d9 Eric Dumazet             2010-11-16  403  	 * backlog.
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  404  	 */
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  405  	struct {
b178bb3dfc30d9 Eric Dumazet             2010-11-16  406  		atomic_t	rmem_alloc;
b178bb3dfc30d9 Eric Dumazet             2010-11-16  407  		int		len;
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  408  		struct sk_buff	*head;
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  409  		struct sk_buff	*tail;
fa438ccfdfd3f6 Eric Dumazet             2007-03-04  410  	} sk_backlog;
b178bb3dfc30d9 Eric Dumazet             2010-11-16  411  #define sk_rmem_alloc sk_backlog.rmem_alloc
2c8c56e15df3d4 Eric Dumazet             2014-11-11  412  
5d4cc87414c5d1 Eric Dumazet             2024-02-16  413  	__cacheline_group_end(sock_write_rx);
5d4cc87414c5d1 Eric Dumazet             2024-02-16  414  
5d4cc87414c5d1 Eric Dumazet             2024-02-16  415  	__cacheline_group_begin(sock_read_rx);
5d4cc87414c5d1 Eric Dumazet             2024-02-16  416  	/* early demux fields */
5d4cc87414c5d1 Eric Dumazet             2024-02-16  417  	struct dst_entry __rcu	*sk_rx_dst;
5d4cc87414c5d1 Eric Dumazet             2024-02-16  418  	int			sk_rx_dst_ifindex;
5d4cc87414c5d1 Eric Dumazet             2024-02-16  419  	u32			sk_rx_dst_cookie;
5d4cc87414c5d1 Eric Dumazet             2024-02-16  420  

:::::: The code at line 384 was first introduced by commit
:::::: efe4208f47f907b86f528788da711e8ab9dea44d ipv6: make lookups simpler and faster

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
