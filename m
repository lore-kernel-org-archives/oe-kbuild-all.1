Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CE531B805
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 12:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072465; cv=none; b=QlOPCIHsrWgo7NjBM7MzAAWE2vfXkb5tQY5cHaTU+GZGfqg2MYYwxoLdROIfMLM0iSMg4t+CzNqYLTkNP6mk+OZJ2XDtdwaLxQ8/UIAgeMWnupVRUPKGP/AhCpKeyUuom0NigMLLRbHayfey3vIayn01TACXJ9XJGyE0kq3tK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072465; c=relaxed/simple;
	bh=hs2HqRZd9CKJ+mJ0wCwhI/P+IiG6MP94Om95Ix3hkeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYjIanNywoFUBUraOMHRfDl6cJblbrjkEkc4+A0fO73hOl/TVFB7yGZBEFiYzUf2/tL+O8XITYIWDg/BLFm2IYBY2CC2Ae5W0AATw+wLGaMGfRgR3VJab35wxGPZLeRxwT7bGmdnutes63DasG3CAj50WODPHVcJUIau7kdw0CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWrd+ggX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWrd+ggX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764072464; x=1795608464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hs2HqRZd9CKJ+mJ0wCwhI/P+IiG6MP94Om95Ix3hkeI=;
  b=TWrd+ggXshnxnRo4SY7dMi/z7hwrMQWqBb8BtwC1YIwoCNALhDhv8VH0
   a/KGs7WTBYJQyOUiQdudXwzjwHUddV7B11QuQK2DdsbttF+7uz1m2nOMa
   UrIULsKVe93O9YCE1KnANA1CYhTHktzjCorY08KmOxqa4A4i8GHCmgcMW
   SXJpIl7N1c3REr+HeNDk36s+vHTfBFFJJ2jPj28t9WmNLVk729sQGDGFP
   xBMOYpnKzkX3LmYxJPmAL0rp9V3fUnKt86XCVGhCDhqcT+o+iezPksiA1
   VxuepIuLMkpbdMQzPWKbJNsBj429pTGgIsMz4o+ae+FF0WZQArJ/+0mvW
   Q==;
X-CSE-ConnectionGUID: YqoR4woYRa62gKLZ1VcK5w==
X-CSE-MsgGUID: omwkS8ltQ6a9Abq/ETrQ8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65271998"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="65271998"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 04:07:40 -0800
X-CSE-ConnectionGUID: fNcbAgbKScS+EeOXAjaQbQ==
X-CSE-MsgGUID: owRAvrX9RCWgBlSvuMp5rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="223297138"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2025 04:07:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNrpX-000000001l9-3UTq;
	Tue, 25 Nov 2025 12:07:35 +0000
Date: Tue, 25 Nov 2025 20:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 456/456]
 net/ipv4/tcp_output.c:2028:21: sparse: sparse: incompatible types in
 comparison expression (different type sizes):
Message-ID: <202511251936.ot5scfb5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   f0f1719f2a6186edc2c4c8781e747872ef6e9794
commit: 8b7ac7af3a6664d707cb451c1cac5d9444977815 [456/456] tcp: fix tcp_tso_should_defer() vs large RTT
config: i386-randconfig-r121-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251936.ot5scfb5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251936.ot5scfb5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251936.ot5scfb5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_output.c:2028:21: sparse: sparse: incompatible types in comparison expression (different type sizes):
   net/ipv4/tcp_output.c:2028:21: sparse:    unsigned long long *
   net/ipv4/tcp_output.c:2028:21: sparse:    long *

vim +2028 net/ipv4/tcp_output.c

  1943	
  1944	/* Try to defer sending, if possible, in order to minimize the amount
  1945	 * of TSO splitting we do.  View it as a kind of TSO Nagle test.
  1946	 *
  1947	 * This algorithm is from John Heffner.
  1948	 */
  1949	static bool tcp_tso_should_defer(struct sock *sk, struct sk_buff *skb,
  1950					 bool *is_cwnd_limited,
  1951					 bool *is_rwnd_limited,
  1952					 u32 max_segs)
  1953	{
  1954		const struct inet_connection_sock *icsk = inet_csk(sk);
  1955		u32 send_win, cong_win, limit, in_flight, threshold;
  1956		u64 srtt_in_ns, expected_ack, how_far_is_the_ack;
  1957		struct tcp_sock *tp = tcp_sk(sk);
  1958		struct sk_buff *head;
  1959		int win_divisor;
  1960		s64 delta;
  1961	
  1962		if (icsk->icsk_ca_state >= TCP_CA_Recovery)
  1963			goto send_now;
  1964	
  1965		/* Avoid bursty behavior by allowing defer
  1966		 * only if the last write was recent (1 ms).
  1967		 * Note that tp->tcp_wstamp_ns can be in the future if we have
  1968		 * packets waiting in a qdisc or device for EDT delivery.
  1969		 */
  1970		delta = tp->tcp_clock_cache - tp->tcp_wstamp_ns - NSEC_PER_MSEC;
  1971		if (delta > 0)
  1972			goto send_now;
  1973	
  1974		in_flight = tcp_packets_in_flight(tp);
  1975	
  1976		BUG_ON(tcp_skb_pcount(skb) <= 1);
  1977		BUG_ON(tp->snd_cwnd <= in_flight);
  1978	
  1979		send_win = tcp_wnd_end(tp) - TCP_SKB_CB(skb)->seq;
  1980	
  1981		/* From in_flight test above, we know that cwnd > in_flight.  */
  1982		cong_win = (tp->snd_cwnd - in_flight) * tp->mss_cache;
  1983	
  1984		limit = min(send_win, cong_win);
  1985	
  1986		/* If a full-sized TSO skb can be sent, do it. */
  1987		if (limit >= max_segs * tp->mss_cache)
  1988			goto send_now;
  1989	
  1990		/* Middle in queue won't get any more data, full sendable already? */
  1991		if ((skb != tcp_write_queue_tail(sk)) && (limit >= skb->len))
  1992			goto send_now;
  1993	
  1994		win_divisor = READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_tso_win_divisor);
  1995		if (win_divisor) {
  1996			u32 chunk = min(tp->snd_wnd, tp->snd_cwnd * tp->mss_cache);
  1997	
  1998			/* If at least some fraction of a window is available,
  1999			 * just use it.
  2000			 */
  2001			chunk /= win_divisor;
  2002			if (limit >= chunk)
  2003				goto send_now;
  2004		} else {
  2005			/* Different approach, try not to defer past a single
  2006			 * ACK.  Receiver should ACK every other full sized
  2007			 * frame, so if we have space for more than 3 frames
  2008			 * then send now.
  2009			 */
  2010			if (limit > tcp_max_tso_deferred_mss(tp) * tp->mss_cache)
  2011				goto send_now;
  2012		}
  2013	
  2014		/* TODO : use tsorted_sent_queue ? */
  2015		head = tcp_rtx_queue_head(sk);
  2016		if (!head)
  2017			goto send_now;
  2018	
  2019		srtt_in_ns = (u64)(NSEC_PER_USEC >> 3) * tp->srtt_us;
  2020		/* When is the ACK expected ? */
  2021		expected_ack = head->tstamp + srtt_in_ns;
  2022		/* How far from now is the ACK expected ? */
  2023		how_far_is_the_ack = expected_ack - tp->tcp_clock_cache;
  2024	
  2025		/* If next ACK is likely to come too late,
  2026		 * ie in more than min(1ms, half srtt), do not defer.
  2027		 */
> 2028		threshold = min(srtt_in_ns >> 1, NSEC_PER_MSEC);
  2029	
  2030		if ((s64)(how_far_is_the_ack - threshold) > 0)
  2031			goto send_now;
  2032	
  2033		/* Ok, it looks like it is advisable to defer.
  2034		 * Three cases are tracked :
  2035		 * 1) We are cwnd-limited
  2036		 * 2) We are rwnd-limited
  2037		 * 3) We are application limited.
  2038		 */
  2039		if (cong_win < send_win) {
  2040			if (cong_win <= skb->len) {
  2041				*is_cwnd_limited = true;
  2042				return true;
  2043			}
  2044		} else {
  2045			if (send_win <= skb->len) {
  2046				*is_rwnd_limited = true;
  2047				return true;
  2048			}
  2049		}
  2050	
  2051		/* If this packet won't get more data, do not wait. */
  2052		if ((TCP_SKB_CB(skb)->tcp_flags & TCPHDR_FIN) ||
  2053		    TCP_SKB_CB(skb)->eor)
  2054			goto send_now;
  2055	
  2056		return true;
  2057	
  2058	send_now:
  2059		return false;
  2060	}
  2061	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
