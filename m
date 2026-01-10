Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9654A02;
	Sat, 10 Jan 2026 22:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768083232; cv=none; b=mwe4m1ntnGG+t8NKf1/IHtPtbtb1Qs73nOwiJlMnjmU+J3QfHz9Z3Kt2Gi90flv9pFOflaOb4Rwx/zAtyW+S0GVxi9+d5F+II9R0G9T9t4SRfTBV2rK28+dsPhwzkJFLKZcx0nmedhqlyapLkXpvpGtZtstE/QJ87W7xWz7cND8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768083232; c=relaxed/simple;
	bh=uhriMDtbN43uSGcJGQ5z74OD4ZX9oWTnaZCVOU8Apsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niBSCeaYlI4ljCiiyeSNKz4PbzrurlsO3Wz2X7AQwMa0/z/V+xFj2rkYFs6K535lh01UxOoeCQ2R6KeiZf90uPHz5q356hHrMMJRTzp2v+TMAqV59QP0cPV+Z6i9gasdTNNxYORwOhFKJMSUvS4CF5ZqNe+1BFVKArjkDs80/9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=IDUzL3Qa; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="IDUzL3Qa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5bj+PEtZRqWHN2mRUYOgeb/ak/w6f1dfyoy7sMJ8xoM=; b=IDUzL3QafdXxRBosGvghhEpKnc
	FhgIlByA3mQa49I4EbH55xyQ8+xZGgybzgUe76feCcHevZhgouKZEz3Oh5bnLqMRYnQzi8IEZu/6H
	9yXIp7G3ckc34IphBWvkpXJ+q1bxt1KI3/UDWmSEgzK94zj8nEJyVtR7NqLaclEWrqN4eRX0dF6tj
	MEoD2TZ0krWDM9C14QoWGY3ztYNHO/xKEn5YVoYIc9bkxtg/06/l6HK0C6F7yrAiq5WAzJleefulL
	wbr0BSGRM128zVduB82J6eT/yq9IsXLEtYlQIjrMJnTZK/Eu+0OuokVRZ+TMn4KL0xKieFmoC/1Id
	qBoGPRbA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99 #2 (Red Hat Linux))
	id 1vehEj-0000000GvPS-04WF;
	Sat, 10 Jan 2026 22:15:09 +0000
Date: Sat, 10 Jan 2026 22:15:08 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Subject: Re: include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
Message-ID: <20260110221508.GF3634291@ZenIV>
References: <202601110443.5ENBRFej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601110443.5ENBRFej-lkp@intel.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Sun, Jan 11, 2026 at 05:06:31AM +0800, kernel test robot wrote:

Folks, could your bot be taught to recognize that kind of situation?
It's very clear what's going on - an inline function that gets the
same warning with this config every time it is called.  Commit in
question has added several calls of that thing; the origin of warning
has nothing whatsoever to do with it, and that can be guessed without
even looking at the source - the quoted diff between the logs is quite
enough for that.

Looking at the function in question,

> sparse warnings: (new ones prefixed by >>)
>    net/ipv4/datagram.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> --
>    net/ipv4/raw.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> --
>    net/ipv4/inet_connection_sock.c:328:36: sparse: sparse: context imbalance in 'inet_csk_find_open_port' - wrong count at exit
>    net/ipv4/inet_connection_sock.c:605:23: sparse: sparse: context imbalance in 'inet_csk_get_port' - unexpected unlock
>    net/ipv4/inet_connection_sock.c: note: in included file (through include/net/inet_sock.h, include/net/inet_connection_sock.h):
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>    net/ipv4/inet_connection_sock.c:1467:9: sparse: sparse: context imbalance in 'inet_csk_complete_hashdance' - unexpected unlock
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> --
>    net/ipv4/route.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> --
>    net/ipv4/ip_output.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> --
>    net/ipv4/af_inet.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> --
>    net/ipv4/tcp_ipv4.c:3415:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@
>    net/ipv4/tcp_ipv4.c:3415:41: sparse:     expected void const *data
>    net/ipv4/tcp_ipv4.c:3415:41: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
>    net/ipv4/tcp_ipv4.c:3537:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *data @@     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control @@
>    net/ipv4/tcp_ipv4.c:3537:45: sparse:     expected void const *data
>    net/ipv4/tcp_ipv4.c:3537:45: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *extern [addressable] [toplevel] tcp_congestion_control
>    net/ipv4/tcp_ipv4.c:3541:50: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control @@     got struct tcp_congestion_ops * @@
>    net/ipv4/tcp_ipv4.c:3541:50: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *tcp_congestion_control
>    net/ipv4/tcp_ipv4.c:3541:50: sparse:     got struct tcp_congestion_ops *
>    net/ipv4/tcp_ipv4.c: note: in included file (through include/net/inet_sock.h, include/net/icmp.h):
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>    net/ipv4/tcp_ipv4.c:1846:25: sparse: sparse: context imbalance in 'tcp_v4_syn_recv_sock' - unexpected unlock
>    net/ipv4/tcp_ipv4.c:2139:17: sparse: sparse: context imbalance in 'tcp_add_backlog' - unexpected unlock
>    net/ipv4/tcp_ipv4.c:2401:21: sparse: sparse: context imbalance in 'tcp_v4_rcv' - different lock contexts for basic block
>    net/ipv4/tcp_ipv4.c:2612:13: sparse: sparse: context imbalance in 'listening_get_first' - wrong count at exit
>    net/ipv4/tcp_ipv4.c:2660:29: sparse: sparse: context imbalance in 'listening_get_next' - unexpected unlock
>    net/ipv4/tcp_ipv4.c:2693:13: sparse: sparse: context imbalance in 'established_get_first' - wrong count at exit
>    net/ipv4/tcp_ipv4.c:2738:40: sparse: sparse: context imbalance in 'established_get_next' - unexpected unlock
>    net/ipv4/tcp_ipv4.c:2870:36: sparse: sparse: context imbalance in 'tcp_seq_stop' - unexpected unlock
>    net/ipv4/tcp_ipv4.c:3091:20: sparse: sparse: context imbalance in 'bpf_iter_tcp_listening_batch' - unexpected unlock
>    net/ipv4/tcp_ipv4.c:3119:40: sparse: sparse: context imbalance in 'bpf_iter_tcp_established_batch' - unexpected unlock
>    net/ipv4/tcp_ipv4.c:3416:41: sparse: sparse: dereference of noderef expression
>    net/ipv4/tcp_ipv4.c:3416:41: sparse: sparse: dereference of noderef expression
>    net/ipv4/tcp_ipv4.c:3538:45: sparse: sparse: dereference of noderef expression
>    net/ipv4/tcp_ipv4.c:3538:45: sparse: sparse: dereference of noderef expression
> --
>    net/ipv4/ping.c: note: in included file (through include/net/inet_sock.h, include/net/ip.h):
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
> --
>    net/ipv4/udp.c: note: in included file (through include/linux/bpf-cgroup.h):
> >> include/net/sock.h:2100:16: sparse: sparse: cast to non-scalar
>    include/net/sock.h:2100:16: sparse: sparse: cast from non-scalar
>    net/ipv4/udp.c:1668:28: sparse: sparse: context imbalance in 'udp_rmem_release' - unexpected unlock
>    net/ipv4/udp.c:1700:19: sparse: sparse: context imbalance in 'busylock_acquire' - wrong count at exit
>    net/ipv4/udp.c:1712:28: sparse: sparse: context imbalance in 'busylock_release' - unexpected unlock
>    net/ipv4/udp.c:3305:9: sparse: sparse: context imbalance in 'udp_get_first' - wrong count at exit
>    net/ipv4/udp.c:3322:39: sparse: sparse: context imbalance in 'udp_get_next' - unexpected unlock
>    net/ipv4/udp.c:3370:31: sparse: sparse: context imbalance in 'udp_seq_stop' - unexpected unlock
> 
> vim +2100 include/net/sock.h
> 
>   2096	
>   2097	static inline kuid_t sk_uid(const struct sock *sk)
>   2098	{
>   2099		/* Paired with WRITE_ONCE() in sockfs_setattr() */
> > 2100		return READ_ONCE(sk->sk_uid);
>   2101	}
>   2102	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
