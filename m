Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBEE211466
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Oct 2026 00:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791680322; cv=none; b=AGAnh87J1tHzYBNe67bJIK7oRuXsyBPk/ZWrGxh7IM4IviQals7wvi9M2RDy4FlPHl1MVzfZil/wF24X5eSnokAP/2wz7r3OdrgZTD6CyhiWoDebl1/JWk6f2ldQCqsNZkU2vDE20p6isvOmfshf17JPFApEy00Iotb2ywpEtUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791680322; c=relaxed/simple;
	bh=3PxCl60tAAOtpKm88bAD6vc3o/U+9+WTJjM332lZT1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pE0UdXpzqMMjVd3TbleqFCZfRgb49dGaUGQOGSQxgiK28N8AxrXRdMOQsNresWarpOMjKQH7xiI/UUk+HRcLWmajLurtrKZicJGocR+w2WQUz2r8B6kj0jlU2x4eFQo7XNjbZG19d0p7NXzFl0Fa5Q0FjMUwYlKnWN6uz4er3/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwkHcBfJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwkHcBfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791680320; x=1823216320;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3PxCl60tAAOtpKm88bAD6vc3o/U+9+WTJjM332lZT1s=;
  b=bwkHcBfJUuIKg11CZm9q6iAOkgqymcIL2j6hZBlUtOnFg9FBw9Gou0r/
   FVoJ/e04AQHS8VySrsBVVRG/dTxc4HnU980otN39Yd/qf1mK65iPbfe0u
   THdEOUsKoafWkKeySOBb5aFY/Webe/4HjAO4KncyPHiP5eclUnn+6Z4kX
   fkYbjOjfBRUBe1QtPWOwOtXvvAVRhaDhzXVMy8rd/gcQEr7jdq0wWcg8P
   LbWERbj5PSwIJJfb8KQlGhaS3db/I4LpGcdhKQ7cR9x7iASjtZlI26wdd
   we41PdQL05F6WFvJYrnVD3vBbHyOcN3tCruwkq5Q8mWfrySibEaP/Z/oR
   A==;
X-CSE-ConnectionGUID: a/s0RWAdT0CwBJLT8VtKog==
X-CSE-MsgGUID: zcZLCYkRRbG5Je3i2ixyQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="320079"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="320079"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 17:58:39 -0700
X-CSE-ConnectionGUID: wzK0NPKISyW4p2PQ1OvulQ==
X-CSE-MsgGUID: v6+/pFAgQrG90q1DVJZw9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="689863"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 10 Oct 2026 17:58:37 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFhtb-000000009Kt-0F6g;
	Sun, 11 Oct 2026 00:58:35 +0000
Date: Sun, 11 Oct 2026 02:58:28 +0200
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 Amery Hung <ameryhung@gmail.com>
Subject: [bpf-next:master 61/67] net/ipv4/tcp_output.c:4203:46:
 sparse: sparse: unsigned value that used to be signed checked against zero?
Message-ID: <202610110257.BBWbpf7X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
head:   5ce194eeb35a4d0fa4a59122e85f7862d44a4883
commit: c071408db308a8f91d7be71b45bbf2da8c5e15f4 [61/67] bpf: tcp: Check BP=
F_SOCK_OPS_TEST_FLAG() after cgroup_bpf_enabled(CGROUP_SOCK_OPS).
config: i386-randconfig-2301-20261010 (https://download.01.org/0day-ci/arch=
ive/20261011/202610110257.BBWbpf7X-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261011/202610110257.BBWbpf7X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610110257.BBWbpf7X-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_output.c:4203:46: sparse: sparse: unsigned value that used =
to be signed checked against zero?
   net/ipv4/tcp_output.c:4203:18: sparse: signed value source
--
>> net/ipv4/tcp_minisocks.c:456:46: sparse: sparse: unsigned value that use=
d to be signed checked against zero?
   net/ipv4/tcp_minisocks.c:456:18: sparse: signed value source

vim +4203 net/ipv4/tcp_output.c

81164413ad096b Daniel Borkmann    2015-01-05  4158 =20
67edfef7863957 Andi Kleen         2009-07-21  4159  /* Do all connect socke=
t setups that can be done AF independent. */
f7e56a76acf642 stephen hemminger  2013-12-29  4160  static void tcp_connect=
_init(struct sock *sk)
^1da177e4c3f41 Linus Torvalds     2005-04-16  4161  {
cf533ea53ebfae Eric Dumazet       2011-10-21  4162  	const struct dst_entry=
 *dst =3D __sk_dst_get(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4163  	struct tcp_sock *tp =
=3D tcp_sk(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4164  	__u8 rcv_wscale;
ca10634ebcca85 Tejas Birajdar     2026-07-30  4165  	int full_space;
d5ffba0f254d29 Eric Dumazet       2025-08-21  4166  	u16 user_mss;
13d3b1ebe28762 Lawrence Brakmo    2017-06-30  4167  	u32 rcv_wnd;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4168 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  4169  	/* We'll fix this up w=
hen we get a response from the other end.
^1da177e4c3f41 Linus Torvalds     2005-04-16  4170  	 * See tcp_input.c:tcp=
_rcv_state_process case TCP_SYN_SENT.
^1da177e4c3f41 Linus Torvalds     2005-04-16  4171  	 */
5d2ed0521ac98f Eric Dumazet       2017-06-07  4172  	tp->tcp_header_len =3D =
sizeof(struct tcphdr);
3666f666e99600 Kuniyuki Iwashima  2022-07-18  4173  	if (READ_ONCE(sock_net=
(sk)->ipv4.sysctl_tcp_timestamps))
5d2ed0521ac98f Eric Dumazet       2017-06-07  4174  		tp->tcp_header_len +=
=3D TCPOLEN_TSTAMP_ALIGNED;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4175 =20
7c2ffaf21bd67f Dmitry Safonov     2023-10-23  4176  	tcp_ao_connect_init(sk=
);
7c2ffaf21bd67f Dmitry Safonov     2023-10-23  4177 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  4178  	/* If user gave his TC=
P_MAXSEG, record it to clamp */
d5ffba0f254d29 Eric Dumazet       2025-08-21  4179  	user_mss =3D READ_ONCE=
(tp->rx_opt.user_mss);
d5ffba0f254d29 Eric Dumazet       2025-08-21  4180  	if (user_mss)
d5ffba0f254d29 Eric Dumazet       2025-08-21  4181  		tp->rx_opt.mss_clamp =
=3D user_mss;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4182  	tp->max_window =3D 0;
5d424d5a674f78 John Heffner       2006-03-20  4183  	tcp_mtup_init(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4184  	tcp_sync_mss(sk, dst_m=
tu(dst));
^1da177e4c3f41 Linus Torvalds     2005-04-16  4185 =20
81164413ad096b Daniel Borkmann    2015-01-05  4186  	tcp_ca_dst_init(sk, ds=
t);
81164413ad096b Daniel Borkmann    2015-01-05  4187 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  4188  	if (!tp->window_clamp)
f410cbea9f3d26 Eric Dumazet       2024-04-04  4189  		WRITE_ONCE(tp->window=
_clamp, dst_metric(dst, RTAX_WINDOW));
870a9e42ecc6fe Yong Wang          2026-08-19  4190  	tp->advmss =3D tcp_mss=
_clamp(tp, tcp_dst_advmss(dst));
f5fff5dc8a7a3f Tom Quetchenbach   2008-09-21  4191 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  4192  	tcp_initialize_rcv_mss=
(sk);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4193 =20
e88c64f0a42575 Hagen Paul Pfeifer 2010-08-19  4194  	/* limit the window se=
lection if the user enforce a smaller rx buffer */
e88c64f0a42575 Hagen Paul Pfeifer 2010-08-19  4195  	if (sk->sk_userlocks &=
 SOCK_RCVBUF_LOCK &&
e88c64f0a42575 Hagen Paul Pfeifer 2010-08-19  4196  	    (tp->window_clamp =
> tcp_full_space(sk) || tp->window_clamp =3D=3D 0))
f410cbea9f3d26 Eric Dumazet       2024-04-04  4197  		WRITE_ONCE(tp->window=
_clamp, tcp_full_space(sk));
e88c64f0a42575 Hagen Paul Pfeifer 2010-08-19  4198 =20
13d3b1ebe28762 Lawrence Brakmo    2017-06-30  4199  	rcv_wnd =3D tcp_rwnd_i=
nit_bpf(sk);
ca10634ebcca85 Tejas Birajdar     2026-07-30  4200  	full_space =3D tcp_ful=
l_space(sk);
13d3b1ebe28762 Lawrence Brakmo    2017-06-30  4201  	if (rcv_wnd =3D=3D 0)
13d3b1ebe28762 Lawrence Brakmo    2017-06-30  4202  		rcv_wnd =3D dst_metri=
c(dst, RTAX_INITRWND);
ca10634ebcca85 Tejas Birajdar     2026-07-30 @4203  	else if (full_space < =
(u64)rcv_wnd * tp->advmss)
ca10634ebcca85 Tejas Birajdar     2026-07-30  4204  		full_space =3D min_t(=
u64, (u64)rcv_wnd * tp->advmss, INT_MAX);
13d3b1ebe28762 Lawrence Brakmo    2017-06-30  4205 =20
ca10634ebcca85 Tejas Birajdar     2026-07-30  4206  	tcp_select_initial_win=
dow(sk, full_space,
^1da177e4c3f41 Linus Torvalds     2005-04-16  4207  				  tp->advmss - (tp-=
>rx_opt.ts_recent_stamp ? tp->tcp_header_len - sizeof(struct tcphdr) : 0),
^1da177e4c3f41 Linus Torvalds     2005-04-16  4208  				  &tp->rcv_wnd,
^1da177e4c3f41 Linus Torvalds     2005-04-16  4209  				  &tp->window_clamp,
3666f666e99600 Kuniyuki Iwashima  2022-07-18  4210  				  READ_ONCE(sock_ne=
t(sk)->ipv4.sysctl_tcp_window_scaling),
31d12926e37291 laurent chavey     2009-12-15  4211  				  &rcv_wscale,
13d3b1ebe28762 Lawrence Brakmo    2017-06-30  4212  				  rcv_wnd);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4213 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  4214  	tp->rx_opt.rcv_wscale =
=3D rcv_wscale;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4215  	tp->rcv_ssthresh =3D t=
p->rcv_wnd;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4216 =20
e13ec3da05d130 Eric Dumazet       2023-03-15  4217  	WRITE_ONCE(sk->sk_err,=
 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4218  	sock_reset_flag(sk, SO=
CK_DONE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4219  	tp->snd_wnd =3D 0;
ee7537b63a28b4 Hantzis Fotis      2009-03-02  4220  	tcp_init_wl(tp, 0);
7f582b248d0a86 Eric Dumazet       2018-05-14  4221  	tcp_write_queue_purge(=
sk);
124199444de467 Eric Dumazet       2026-04-16  4222  	WRITE_ONCE(tp->snd_una=
, tp->write_seq);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4223  	tp->snd_sml =3D tp->wr=
ite_seq;
33f5f57eeb0c63 Ilpo J=C3=A4rvinen      2008-10-07  4224  	tp->snd_up =3D tp=
->write_seq;
e0d694d638dba7 Eric Dumazet       2019-10-10  4225  	WRITE_ONCE(tp->snd_nxt=
, tp->write_seq);
ee9952831cfd0b Pavel Emelyanov    2012-04-19  4226 =20
ee9952831cfd0b Pavel Emelyanov    2012-04-19  4227  	if (likely(!tp->repair=
))
^1da177e4c3f41 Linus Torvalds     2005-04-16  4228  		tp->rcv_nxt =3D 0;
c7781a6e3c4a9a Andrew Vagin       2013-08-27  4229  	else
70eabf0e1b8fe1 Eric Dumazet       2017-05-16  4230  		tp->rcv_tstamp =3D tc=
p_jiffies32;
ee9952831cfd0b Pavel Emelyanov    2012-04-19  4231  	tp->rcv_wup =3D tp->rc=
v_nxt;
0e24d17bd9668f Simon Baatz        2026-03-09  4232  	tp->rcv_mwnd_seq =3D t=
p->rcv_nxt + tp->rcv_wnd;
7db48e98393028 Eric Dumazet       2019-10-10  4233  	WRITE_ONCE(tp->copied_=
seq, tp->rcv_nxt);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4234 =20
8550f328f45db6 Lawrence Brakmo    2017-06-30  4235  	inet_csk(sk)->icsk_rto=
 =3D tcp_timeout_init(sk);
e6f178be3c12cd Eric Dumazet       2025-08-22  4236  	WRITE_ONCE(inet_csk(sk=
)->icsk_retransmits, 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4237  	tcp_clear_retrans(tp);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4238  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  4239 =20

:::::: The code at line 4203 was first introduced by commit
:::::: ca10634ebcca850dec2f1507ad5bfe70b82a9c00 tcp: honor BPF_SOCK_OPS_RWN=
D_INIT on the active connect path

:::::: TO: Tejas Birajdar <tejasbirajdar@meta.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
