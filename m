Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFBC13AD05
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 04:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772686511; cv=none; b=VzowGW/BqB7oCVoAxw0eIZ/Jd8gEgBdKSnqHu245wpw4SmCVXCvTgW9uePyohTfFMY80vtqddnQ+/Th2IhxFUSJuHxkoAG3Ml1hSlnTbD7R7vu+qnJTMJ7XVMyLAP3kOuXJVUONt0NjdK3xY8V6pc5XPIk6fA/DnNkJuyq/QFAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772686511; c=relaxed/simple;
	bh=8z9Ydc1Kut+IL1zbryHobJeuTJTelvxmoGpeNrpa1oE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZvMtlWCexK9o/djZMb+EZaABQsOADgZoSBAcWGkmh0Gr7x5hWkMfafdNBpwsG6XT6xtm2N8Whr7kSIzAUPvcbvCglU9052+gATRHCwo1SMyUkfP+LUb6qm6hddUYTuCGEYjeuYSIMgT20aOhmq/vcmourEIZaAb7g/+qQix0+Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gfOqDAbr; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gfOqDAbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772686510; x=1804222510;
  h=date:from:to:cc:subject:message-id;
  bh=8z9Ydc1Kut+IL1zbryHobJeuTJTelvxmoGpeNrpa1oE=;
  b=gfOqDAbrkYSZMDzynuK3AcBIN6qDOLgEP6HnCuKCW1dCYy4mwMMazH8j
   X23b3DQp4xCJUSMdrxOw0TdCfDreLBTJA1pE0w0Tne/0uAJg1aMm62PZD
   U1CIDRk0BenvoCIvHqkJl72lDFcQ6C6dJMHGueZSloaYL9roXJLejYLD0
   BpQ0R7dMhaYo3qGGDSqm8IVen6+ErQUrF/aGdpb50fW817xr5g4MUSyTD
   iY7w+SwyeRrqzIOL0sjxd7OritRxAmvrD0/iVhuqSBBU97wvkeUYT3zWY
   Ozn8Qb41UEA1CJJhfaltPCcGYh/SGFCusugCVty995Ma0RNCOTmvbqmRU
   A==;
X-CSE-ConnectionGUID: /79f5CeQSAqhZj2mbAFCqQ==
X-CSE-MsgGUID: 4j1/KIx5RL6kzOxmVsq8cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96377668"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="96377668"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:55:08 -0800
X-CSE-ConnectionGUID: yTlV28p4R8mY4hAo7vvlQQ==
X-CSE-MsgGUID: MTWHibsaQDG5c6VyNL8Uqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="215840587"
Received: from lkp-server02.sh.intel.com (HELO 456988d8841c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 04 Mar 2026 20:55:05 -0800
Received: from kbuild by 456988d8841c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy0gF-00000000075-1uGA;
	Thu, 05 Mar 2026 04:51:56 +0000
Date: Thu, 05 Mar 2026 12:41:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-6.6.y 683/683]
 net/ipv4/tcp.c:4305:1: warning: the frame size of 1304 bytes is larger than
 1280 bytes
Message-ID: <202603051251.Nyrlgd0c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common upstream-linux-6.6.y
head:   682d8e2f892b73c2f574684c8dd6b625361b4c03
commit: 718c49f840ef4e451bf44a8a62aae89ebdd5a687 [683/683] tcp: new TCP_INFO stats for RTO events
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260305/202603051251.Nyrlgd0c-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051251.Nyrlgd0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051251.Nyrlgd0c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/tcp.c: In function 'do_tcp_getsockopt':
>> net/ipv4/tcp.c:4305:1: warning: the frame size of 1304 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    4305 | }
         | ^


vim +4305 net/ipv4/tcp.c

1c885808e45601b Francis Yan              2016-11-27  3976  
273b7f0fb44847c Martin KaFai Lau         2022-09-01  3977  int do_tcp_getsockopt(struct sock *sk, int level,
34704ef024ae616 Martin KaFai Lau         2022-09-01  3978  		      int optname, sockptr_t optval, sockptr_t optlen)
^1da177e4c3f415 Linus Torvalds           2005-04-16  3979  {
295f7324ff8d9ea Arnaldo Carvalho de Melo 2005-08-09  3980  	struct inet_connection_sock *icsk = inet_csk(sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  3981  	struct tcp_sock *tp = tcp_sk(sk);
6fa251663069e05 Nikolay Borisov          2016-02-03  3982  	struct net *net = sock_net(sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  3983  	int val, len;
^1da177e4c3f415 Linus Torvalds           2005-04-16  3984  
34704ef024ae616 Martin KaFai Lau         2022-09-01  3985  	if (copy_from_sockptr(&len, optlen, sizeof(int)))
^1da177e4c3f415 Linus Torvalds           2005-04-16  3986  		return -EFAULT;
^1da177e4c3f415 Linus Torvalds           2005-04-16  3987  
^1da177e4c3f415 Linus Torvalds           2005-04-16  3988  	if (len < 0)
^1da177e4c3f415 Linus Torvalds           2005-04-16  3989  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds           2005-04-16  3990  
0709f6fa131b445 Gavrilov Ilia            2024-03-07  3991  	len = min_t(unsigned int, len, sizeof(int));
0709f6fa131b445 Gavrilov Ilia            2024-03-07  3992  
^1da177e4c3f415 Linus Torvalds           2005-04-16  3993  	switch (optname) {
^1da177e4c3f415 Linus Torvalds           2005-04-16  3994  	case TCP_MAXSEG:
c1b4a7e69576d65 David S. Miller          2005-07-05  3995  		val = tp->mss_cache;
34dfde4ad87b84d Cambda Zhu               2023-05-27  3996  		if (tp->rx_opt.user_mss &&
34dfde4ad87b84d Cambda Zhu               2023-05-27  3997  		    ((1 << sk->sk_state) & (TCPF_CLOSE | TCPF_LISTEN)))
^1da177e4c3f415 Linus Torvalds           2005-04-16  3998  			val = tp->rx_opt.user_mss;
5e6a3ce6573f0c5 Pavel Emelyanov          2012-04-19  3999  		if (tp->repair)
5e6a3ce6573f0c5 Pavel Emelyanov          2012-04-19  4000  			val = tp->rx_opt.mss_clamp;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4001  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4002  	case TCP_NODELAY:
^1da177e4c3f415 Linus Torvalds           2005-04-16  4003  		val = !!(tp->nonagle&TCP_NAGLE_OFF);
^1da177e4c3f415 Linus Torvalds           2005-04-16  4004  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4005  	case TCP_CORK:
^1da177e4c3f415 Linus Torvalds           2005-04-16  4006  		val = !!(tp->nonagle&TCP_NAGLE_CORK);
^1da177e4c3f415 Linus Torvalds           2005-04-16  4007  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4008  	case TCP_KEEPIDLE:
df19a6267705456 Eric Dumazet             2009-08-28  4009  		val = keepalive_time_when(tp) / HZ;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4010  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4011  	case TCP_KEEPINTVL:
df19a6267705456 Eric Dumazet             2009-08-28  4012  		val = keepalive_intvl_when(tp) / HZ;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4013  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4014  	case TCP_KEEPCNT:
df19a6267705456 Eric Dumazet             2009-08-28  4015  		val = keepalive_probes(tp);
^1da177e4c3f415 Linus Torvalds           2005-04-16  4016  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4017  	case TCP_SYNCNT:
3a037f0f3c4bfe4 Eric Dumazet             2023-07-19  4018  		val = READ_ONCE(icsk->icsk_syn_retries) ? :
20a3b1c0f603e8c Kuniyuki Iwashima        2022-07-15  4019  			READ_ONCE(net->ipv4.sysctl_tcp_syn_retries);
^1da177e4c3f415 Linus Torvalds           2005-04-16  4020  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4021  	case TCP_LINGER2:
9df5335ca974e68 Eric Dumazet             2023-07-19  4022  		val = READ_ONCE(tp->linger2);
^1da177e4c3f415 Linus Torvalds           2005-04-16  4023  		if (val >= 0)
39e24435a776e9d Kuniyuki Iwashima        2022-07-15  4024  			val = (val ? : READ_ONCE(net->ipv4.sysctl_tcp_fin_timeout)) / HZ;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4025  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4026  	case TCP_DEFER_ACCEPT:
ae488c74422fb1d Eric Dumazet             2023-07-19  4027  		val = READ_ONCE(icsk->icsk_accept_queue.rskq_defer_accept);
ae488c74422fb1d Eric Dumazet             2023-07-19  4028  		val = retrans_to_secs(val, TCP_TIMEOUT_INIT / HZ,
ae488c74422fb1d Eric Dumazet             2023-07-19  4029  				      TCP_RTO_MAX / HZ);
^1da177e4c3f415 Linus Torvalds           2005-04-16  4030  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4031  	case TCP_WINDOW_CLAMP:
f9fef23a81db9ad Eric Dumazet             2024-04-04  4032  		val = READ_ONCE(tp->window_clamp);
^1da177e4c3f415 Linus Torvalds           2005-04-16  4033  		break;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4034  	case TCP_INFO: {
^1da177e4c3f415 Linus Torvalds           2005-04-16  4035  		struct tcp_info info;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4036  
34704ef024ae616 Martin KaFai Lau         2022-09-01  4037  		if (copy_from_sockptr(&len, optlen, sizeof(int)))
^1da177e4c3f415 Linus Torvalds           2005-04-16  4038  			return -EFAULT;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4039  
^1da177e4c3f415 Linus Torvalds           2005-04-16  4040  		tcp_get_info(sk, &info);
^1da177e4c3f415 Linus Torvalds           2005-04-16  4041  
^1da177e4c3f415 Linus Torvalds           2005-04-16  4042  		len = min_t(unsigned int, len, sizeof(info));
34704ef024ae616 Martin KaFai Lau         2022-09-01  4043  		if (copy_to_sockptr(optlen, &len, sizeof(int)))
^1da177e4c3f415 Linus Torvalds           2005-04-16  4044  			return -EFAULT;
34704ef024ae616 Martin KaFai Lau         2022-09-01  4045  		if (copy_to_sockptr(optval, &info, len))
^1da177e4c3f415 Linus Torvalds           2005-04-16  4046  			return -EFAULT;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4047  		return 0;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4048  	}
6e9250f59ef9efb Eric Dumazet             2015-04-28  4049  	case TCP_CC_INFO: {
6e9250f59ef9efb Eric Dumazet             2015-04-28  4050  		const struct tcp_congestion_ops *ca_ops;
6e9250f59ef9efb Eric Dumazet             2015-04-28  4051  		union tcp_cc_info info;
6e9250f59ef9efb Eric Dumazet             2015-04-28  4052  		size_t sz = 0;
6e9250f59ef9efb Eric Dumazet             2015-04-28  4053  		int attr;
6e9250f59ef9efb Eric Dumazet             2015-04-28  4054  
34704ef024ae616 Martin KaFai Lau         2022-09-01  4055  		if (copy_from_sockptr(&len, optlen, sizeof(int)))
6e9250f59ef9efb Eric Dumazet             2015-04-28  4056  			return -EFAULT;
6e9250f59ef9efb Eric Dumazet             2015-04-28  4057  
6e9250f59ef9efb Eric Dumazet             2015-04-28  4058  		ca_ops = icsk->icsk_ca_ops;
6e9250f59ef9efb Eric Dumazet             2015-04-28  4059  		if (ca_ops && ca_ops->get_info)
6e9250f59ef9efb Eric Dumazet             2015-04-28  4060  			sz = ca_ops->get_info(sk, ~0U, &attr, &info);
6e9250f59ef9efb Eric Dumazet             2015-04-28  4061  
6e9250f59ef9efb Eric Dumazet             2015-04-28  4062  		len = min_t(unsigned int, len, sz);
34704ef024ae616 Martin KaFai Lau         2022-09-01  4063  		if (copy_to_sockptr(optlen, &len, sizeof(int)))
6e9250f59ef9efb Eric Dumazet             2015-04-28  4064  			return -EFAULT;
34704ef024ae616 Martin KaFai Lau         2022-09-01  4065  		if (copy_to_sockptr(optval, &info, len))
6e9250f59ef9efb Eric Dumazet             2015-04-28  4066  			return -EFAULT;
6e9250f59ef9efb Eric Dumazet             2015-04-28  4067  		return 0;
6e9250f59ef9efb Eric Dumazet             2015-04-28  4068  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  4069  	case TCP_QUICKACK:
31954cd8bb66703 Wei Wang                 2019-01-25  4070  		val = !inet_csk_in_pingpong_mode(sk);
^1da177e4c3f415 Linus Torvalds           2005-04-16  4071  		break;
5f8ef48d2409630 Stephen Hemminger        2005-06-23  4072  
5f8ef48d2409630 Stephen Hemminger        2005-06-23  4073  	case TCP_CONGESTION:
34704ef024ae616 Martin KaFai Lau         2022-09-01  4074  		if (copy_from_sockptr(&len, optlen, sizeof(int)))
5f8ef48d2409630 Stephen Hemminger        2005-06-23  4075  			return -EFAULT;
5f8ef48d2409630 Stephen Hemminger        2005-06-23  4076  		len = min_t(unsigned int, len, TCP_CA_NAME_MAX);
34704ef024ae616 Martin KaFai Lau         2022-09-01  4077  		if (copy_to_sockptr(optlen, &len, sizeof(int)))
5f8ef48d2409630 Stephen Hemminger        2005-06-23  4078  			return -EFAULT;
34704ef024ae616 Martin KaFai Lau         2022-09-01  4079  		if (copy_to_sockptr(optval, icsk->icsk_ca_ops->name, len))
5f8ef48d2409630 Stephen Hemminger        2005-06-23  4080  			return -EFAULT;
5f8ef48d2409630 Stephen Hemminger        2005-06-23  4081  		return 0;
e56fb50f2b7958b William Allen Simpson    2009-12-02  4082  
734942cc4ea6478 Dave Watson              2017-06-14  4083  	case TCP_ULP:
34704ef024ae616 Martin KaFai Lau         2022-09-01  4084  		if (copy_from_sockptr(&len, optlen, sizeof(int)))
734942cc4ea6478 Dave Watson              2017-06-14  4085  			return -EFAULT;
734942cc4ea6478 Dave Watson              2017-06-14  4086  		len = min_t(unsigned int, len, TCP_ULP_NAME_MAX);
d97af30f615eea2 Dave Watson              2017-06-26  4087  		if (!icsk->icsk_ulp_ops) {
34704ef024ae616 Martin KaFai Lau         2022-09-01  4088  			len = 0;
34704ef024ae616 Martin KaFai Lau         2022-09-01  4089  			if (copy_to_sockptr(optlen, &len, sizeof(int)))
d97af30f615eea2 Dave Watson              2017-06-26  4090  				return -EFAULT;
d97af30f615eea2 Dave Watson              2017-06-26  4091  			return 0;
d97af30f615eea2 Dave Watson              2017-06-26  4092  		}
34704ef024ae616 Martin KaFai Lau         2022-09-01  4093  		if (copy_to_sockptr(optlen, &len, sizeof(int)))
734942cc4ea6478 Dave Watson              2017-06-14  4094  			return -EFAULT;
34704ef024ae616 Martin KaFai Lau         2022-09-01  4095  		if (copy_to_sockptr(optval, icsk->icsk_ulp_ops->name, len))
734942cc4ea6478 Dave Watson              2017-06-14  4096  			return -EFAULT;
734942cc4ea6478 Dave Watson              2017-06-14  4097  		return 0;
734942cc4ea6478 Dave Watson              2017-06-14  4098  
1fba70e5b6bed53 Yuchung Cheng            2017-10-18  4099  	case TCP_FASTOPEN_KEY: {
f19008e676366c4 Jason Baron              2020-08-10  4100  		u64 key[TCP_FASTOPEN_KEY_BUF_LENGTH / sizeof(u64)];
f19008e676366c4 Jason Baron              2020-08-10  4101  		unsigned int key_len;
1fba70e5b6bed53 Yuchung Cheng            2017-10-18  4102  
34704ef024ae616 Martin KaFai Lau         2022-09-01  4103  		if (copy_from_sockptr(&len, optlen, sizeof(int)))
1fba70e5b6bed53 Yuchung Cheng            2017-10-18  4104  			return -EFAULT;
1fba70e5b6bed53 Yuchung Cheng            2017-10-18  4105  
f19008e676366c4 Jason Baron              2020-08-10  4106  		key_len = tcp_fastopen_get_cipher(net, icsk, key) *
0f1ce0236865e89 Jason Baron              2019-05-29  4107  				TCP_FASTOPEN_KEY_LENGTH;
0f1ce0236865e89 Jason Baron              2019-05-29  4108  		len = min_t(unsigned int, len, key_len);
34704ef024ae616 Martin KaFai Lau         2022-09-01  4109  		if (copy_to_sockptr(optlen, &len, sizeof(int)))
1fba70e5b6bed53 Yuchung Cheng            2017-10-18  4110  			return -EFAULT;
34704ef024ae616 Martin KaFai Lau         2022-09-01  4111  		if (copy_to_sockptr(optval, key, len))
1fba70e5b6bed53 Yuchung Cheng            2017-10-18  4112  			return -EFAULT;
1fba70e5b6bed53 Yuchung Cheng            2017-10-18  4113  		return 0;
1fba70e5b6bed53 Yuchung Cheng            2017-10-18  4114  	}
3c0fef0b7d36e5f Josh Hunt                2010-07-30  4115  	case TCP_THIN_LINEAR_TIMEOUTS:
3c0fef0b7d36e5f Josh Hunt                2010-07-30  4116  		val = tp->thin_lto;
3c0fef0b7d36e5f Josh Hunt                2010-07-30  4117  		break;
4a7f60094411447 Yuchung Cheng            2017-01-12  4118  
3c0fef0b7d36e5f Josh Hunt                2010-07-30  4119  	case TCP_THIN_DUPACK:
4a7f60094411447 Yuchung Cheng            2017-01-12  4120  		val = 0;
3c0fef0b7d36e5f Josh Hunt                2010-07-30  4121  		break;
dca43c75e7e5456 Jerry Chu                2010-08-27  4122  
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4123  	case TCP_REPAIR:
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4124  		val = tp->repair;
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4125  		break;
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4126  
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4127  	case TCP_REPAIR_QUEUE:
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4128  		if (tp->repair)
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4129  			val = tp->repair_queue;
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4130  		else
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4131  			return -EINVAL;
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4132  		break;
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4133  
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4134  	case TCP_REPAIR_WINDOW: {
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4135  		struct tcp_repair_window opt;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4136  
34704ef024ae616 Martin KaFai Lau         2022-09-01  4137  		if (copy_from_sockptr(&len, optlen, sizeof(int)))
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4138  			return -EFAULT;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4139  
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4140  		if (len != sizeof(opt))
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4141  			return -EINVAL;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4142  
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4143  		if (!tp->repair)
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4144  			return -EPERM;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4145  
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4146  		opt.snd_wl1	= tp->snd_wl1;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4147  		opt.snd_wnd	= tp->snd_wnd;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4148  		opt.max_window	= tp->max_window;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4149  		opt.rcv_wnd	= tp->rcv_wnd;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4150  		opt.rcv_wup	= tp->rcv_wup;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4151  
34704ef024ae616 Martin KaFai Lau         2022-09-01  4152  		if (copy_to_sockptr(optval, &opt, len))
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4153  			return -EFAULT;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4154  		return 0;
b1ed4c4fa9a5ccf Andrey Vagin             2016-06-27  4155  	}
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4156  	case TCP_QUEUE_SEQ:
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4157  		if (tp->repair_queue == TCP_SEND_QUEUE)
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4158  			val = tp->write_seq;
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4159  		else if (tp->repair_queue == TCP_RECV_QUEUE)
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4160  			val = tp->rcv_nxt;
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4161  		else
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4162  			return -EINVAL;
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4163  		break;
ee9952831cfd0bb Pavel Emelyanov          2012-04-19  4164  
dca43c75e7e5456 Jerry Chu                2010-08-27  4165  	case TCP_USER_TIMEOUT:
26023e91e12c686 Eric Dumazet             2023-07-19  4166  		val = READ_ONCE(icsk->icsk_user_timeout);
dca43c75e7e5456 Jerry Chu                2010-08-27  4167  		break;
1536e2857bd38e3 Kenjiro Nakayama         2014-04-17  4168  
1536e2857bd38e3 Kenjiro Nakayama         2014-04-17  4169  	case TCP_FASTOPEN:
70f360dd7042cb8 Eric Dumazet             2023-07-19  4170  		val = READ_ONCE(icsk->icsk_accept_queue.fastopenq.max_qlen);
1536e2857bd38e3 Kenjiro Nakayama         2014-04-17  4171  		break;
1536e2857bd38e3 Kenjiro Nakayama         2014-04-17  4172  
19f6d3f3c8422d6 Wei Wang                 2017-01-23  4173  	case TCP_FASTOPEN_CONNECT:
19f6d3f3c8422d6 Wei Wang                 2017-01-23  4174  		val = tp->fastopen_connect;
19f6d3f3c8422d6 Wei Wang                 2017-01-23  4175  		break;
19f6d3f3c8422d6 Wei Wang                 2017-01-23  4176  
71c02379c762cb6 Christoph Paasch         2017-10-23  4177  	case TCP_FASTOPEN_NO_COOKIE:
71c02379c762cb6 Christoph Paasch         2017-10-23  4178  		val = tp->fastopen_no_cookie;
71c02379c762cb6 Christoph Paasch         2017-10-23  4179  		break;
71c02379c762cb6 Christoph Paasch         2017-10-23  4180  
a842fe1425cb20f Eric Dumazet             2019-06-12  4181  	case TCP_TX_DELAY:
348b81b68b13ebd Eric Dumazet             2023-07-19  4182  		val = READ_ONCE(tp->tcp_tx_delay);
a842fe1425cb20f Eric Dumazet             2019-06-12  4183  		break;
a842fe1425cb20f Eric Dumazet             2019-06-12  4184  
93be6ce0e91b6a9 Andrey Vagin             2013-02-11  4185  	case TCP_TIMESTAMP:
dd23c9f1e8d5c1d Eric Dumazet             2023-07-19  4186  		val = tcp_time_stamp_raw() + READ_ONCE(tp->tsoffset);
93be6ce0e91b6a9 Andrey Vagin             2013-02-11  4187  		break;
c9bee3b7fdecb0c Eric Dumazet             2013-07-22  4188  	case TCP_NOTSENT_LOWAT:
1aeb87bc1440c54 Eric Dumazet             2023-07-19  4189  		val = READ_ONCE(tp->notsent_lowat);
c9bee3b7fdecb0c Eric Dumazet             2013-07-22  4190  		break;
b75eba76d3d72e2 Soheil Hassas Yeganeh    2018-05-01  4191  	case TCP_INQ:
b75eba76d3d72e2 Soheil Hassas Yeganeh    2018-05-01  4192  		val = tp->recvmsg_inq;
b75eba76d3d72e2 Soheil Hassas Yeganeh    2018-05-01  4193  		break;
cd8ae85299d5415 Eric Dumazet             2015-05-03  4194  	case TCP_SAVE_SYN:
cd8ae85299d5415 Eric Dumazet             2015-05-03  4195  		val = tp->save_syn;
cd8ae85299d5415 Eric Dumazet             2015-05-03  4196  		break;
cd8ae85299d5415 Eric Dumazet             2015-05-03  4197  	case TCP_SAVED_SYN: {
34704ef024ae616 Martin KaFai Lau         2022-09-01  4198  		if (copy_from_sockptr(&len, optlen, sizeof(int)))
cd8ae85299d5415 Eric Dumazet             2015-05-03  4199  			return -EFAULT;
cd8ae85299d5415 Eric Dumazet             2015-05-03  4200  
d51bbff2aba7880 Martin KaFai Lau         2022-09-01  4201  		sockopt_lock_sock(sk);
cd8ae85299d5415 Eric Dumazet             2015-05-03  4202  		if (tp->saved_syn) {
70a217f1976f75a Martin KaFai Lau         2020-08-20  4203  			if (len < tcp_saved_syn_len(tp->saved_syn)) {
34704ef024ae616 Martin KaFai Lau         2022-09-01  4204  				len = tcp_saved_syn_len(tp->saved_syn);
34704ef024ae616 Martin KaFai Lau         2022-09-01  4205  				if (copy_to_sockptr(optlen, &len, sizeof(int))) {
d51bbff2aba7880 Martin KaFai Lau         2022-09-01  4206  					sockopt_release_sock(sk);
aea0929e516a1ff Eric B Munson            2015-05-18  4207  					return -EFAULT;
aea0929e516a1ff Eric B Munson            2015-05-18  4208  				}
d51bbff2aba7880 Martin KaFai Lau         2022-09-01  4209  				sockopt_release_sock(sk);
aea0929e516a1ff Eric B Munson            2015-05-18  4210  				return -EINVAL;
aea0929e516a1ff Eric B Munson            2015-05-18  4211  			}
70a217f1976f75a Martin KaFai Lau         2020-08-20  4212  			len = tcp_saved_syn_len(tp->saved_syn);
34704ef024ae616 Martin KaFai Lau         2022-09-01  4213  			if (copy_to_sockptr(optlen, &len, sizeof(int))) {
d51bbff2aba7880 Martin KaFai Lau         2022-09-01  4214  				sockopt_release_sock(sk);
cd8ae85299d5415 Eric Dumazet             2015-05-03  4215  				return -EFAULT;
cd8ae85299d5415 Eric Dumazet             2015-05-03  4216  			}
34704ef024ae616 Martin KaFai Lau         2022-09-01  4217  			if (copy_to_sockptr(optval, tp->saved_syn->data, len)) {
d51bbff2aba7880 Martin KaFai Lau         2022-09-01  4218  				sockopt_release_sock(sk);
cd8ae85299d5415 Eric Dumazet             2015-05-03  4219  				return -EFAULT;
cd8ae85299d5415 Eric Dumazet             2015-05-03  4220  			}
cd8ae85299d5415 Eric Dumazet             2015-05-03  4221  			tcp_saved_syn_free(tp);
d51bbff2aba7880 Martin KaFai Lau         2022-09-01  4222  			sockopt_release_sock(sk);
cd8ae85299d5415 Eric Dumazet             2015-05-03  4223  		} else {
d51bbff2aba7880 Martin KaFai Lau         2022-09-01  4224  			sockopt_release_sock(sk);
cd8ae85299d5415 Eric Dumazet             2015-05-03  4225  			len = 0;
34704ef024ae616 Martin KaFai Lau         2022-09-01  4226  			if (copy_to_sockptr(optlen, &len, sizeof(int)))
cd8ae85299d5415 Eric Dumazet             2015-05-03  4227  				return -EFAULT;
cd8ae85299d5415 Eric Dumazet             2015-05-03  4228  		}
cd8ae85299d5415 Eric Dumazet             2015-05-03  4229  		return 0;
cd8ae85299d5415 Eric Dumazet             2015-05-03  4230  	}
05255b823a61735 Eric Dumazet             2018-04-27  4231  #ifdef CONFIG_MMU
05255b823a61735 Eric Dumazet             2018-04-27  4232  	case TCP_ZEROCOPY_RECEIVE: {
7eeba1706eba6de Arjun Roy                2021-01-20  4233  		struct scm_timestamping_internal tss;
e0fecb289ad3fd2 Arjun Roy                2020-12-10  4234  		struct tcp_zerocopy_receive zc = {};
05255b823a61735 Eric Dumazet             2018-04-27  4235  		int err;
05255b823a61735 Eric Dumazet             2018-04-27  4236  
34704ef024ae616 Martin KaFai Lau         2022-09-01  4237  		if (copy_from_sockptr(&len, optlen, sizeof(int)))
05255b823a61735 Eric Dumazet             2018-04-27  4238  			return -EFAULT;
2107d45f17bedd7 Arjun Roy                2021-02-25  4239  		if (len < 0 ||
2107d45f17bedd7 Arjun Roy                2021-02-25  4240  		    len < offsetofend(struct tcp_zerocopy_receive, length))
05255b823a61735 Eric Dumazet             2018-04-27  4241  			return -EINVAL;
3c5a2fd042d0bfa Arjun Roy                2021-02-11  4242  		if (unlikely(len > sizeof(zc))) {
34704ef024ae616 Martin KaFai Lau         2022-09-01  4243  			err = check_zeroed_sockptr(optval, sizeof(zc),
3c5a2fd042d0bfa Arjun Roy                2021-02-11  4244  						   len - sizeof(zc));
3c5a2fd042d0bfa Arjun Roy                2021-02-11  4245  			if (err < 1)
3c5a2fd042d0bfa Arjun Roy                2021-02-11  4246  				return err == 0 ? -EINVAL : err;
c8856c051454909 Arjun Roy                2020-02-14  4247  			len = sizeof(zc);
34704ef024ae616 Martin KaFai Lau         2022-09-01  4248  			if (copy_to_sockptr(optlen, &len, sizeof(int)))
0b7f41f68710ccb Arjun Roy                2020-02-25  4249  				return -EFAULT;
0b7f41f68710ccb Arjun Roy                2020-02-25  4250  		}
34704ef024ae616 Martin KaFai Lau         2022-09-01  4251  		if (copy_from_sockptr(&zc, optval, len))
05255b823a61735 Eric Dumazet             2018-04-27  4252  			return -EFAULT;
3c5a2fd042d0bfa Arjun Roy                2021-02-11  4253  		if (zc.reserved)
3c5a2fd042d0bfa Arjun Roy                2021-02-11  4254  			return -EINVAL;
3c5a2fd042d0bfa Arjun Roy                2021-02-11  4255  		if (zc.msg_flags &  ~(TCP_VALID_ZC_MSG_FLAGS))
3c5a2fd042d0bfa Arjun Roy                2021-02-11  4256  			return -EINVAL;
d51bbff2aba7880 Martin KaFai Lau         2022-09-01  4257  		sockopt_lock_sock(sk);
7eeba1706eba6de Arjun Roy                2021-01-20  4258  		err = tcp_zerocopy_receive(sk, &zc, &tss);
9cacf81f8161111 Stanislav Fomichev       2021-01-15  4259  		err = BPF_CGROUP_RUN_PROG_GETSOCKOPT_KERN(sk, level, optname,
9cacf81f8161111 Stanislav Fomichev       2021-01-15  4260  							  &zc, &len, err);
d51bbff2aba7880 Martin KaFai Lau         2022-09-01  4261  		sockopt_release_sock(sk);
7eeba1706eba6de Arjun Roy                2021-01-20  4262  		if (len >= offsetofend(struct tcp_zerocopy_receive, msg_flags))
7eeba1706eba6de Arjun Roy                2021-01-20  4263  			goto zerocopy_rcv_cmsg;
c8856c051454909 Arjun Roy                2020-02-14  4264  		switch (len) {
7eeba1706eba6de Arjun Roy                2021-01-20  4265  		case offsetofend(struct tcp_zerocopy_receive, msg_flags):
7eeba1706eba6de Arjun Roy                2021-01-20  4266  			goto zerocopy_rcv_cmsg;
7eeba1706eba6de Arjun Roy                2021-01-20  4267  		case offsetofend(struct tcp_zerocopy_receive, msg_controllen):
7eeba1706eba6de Arjun Roy                2021-01-20  4268  		case offsetofend(struct tcp_zerocopy_receive, msg_control):
7eeba1706eba6de Arjun Roy                2021-01-20  4269  		case offsetofend(struct tcp_zerocopy_receive, flags):
7eeba1706eba6de Arjun Roy                2021-01-20  4270  		case offsetofend(struct tcp_zerocopy_receive, copybuf_len):
7eeba1706eba6de Arjun Roy                2021-01-20  4271  		case offsetofend(struct tcp_zerocopy_receive, copybuf_address):
33946518d493cdf Arjun Roy                2020-02-14  4272  		case offsetofend(struct tcp_zerocopy_receive, err):
33946518d493cdf Arjun Roy                2020-02-14  4273  			goto zerocopy_rcv_sk_err;
c8856c051454909 Arjun Roy                2020-02-14  4274  		case offsetofend(struct tcp_zerocopy_receive, inq):
c8856c051454909 Arjun Roy                2020-02-14  4275  			goto zerocopy_rcv_inq;
c8856c051454909 Arjun Roy                2020-02-14  4276  		case offsetofend(struct tcp_zerocopy_receive, length):
c8856c051454909 Arjun Roy                2020-02-14  4277  		default:
c8856c051454909 Arjun Roy                2020-02-14  4278  			goto zerocopy_rcv_out;
c8856c051454909 Arjun Roy                2020-02-14  4279  		}
7eeba1706eba6de Arjun Roy                2021-01-20  4280  zerocopy_rcv_cmsg:
7eeba1706eba6de Arjun Roy                2021-01-20  4281  		if (zc.msg_flags & TCP_CMSG_TS)
7eeba1706eba6de Arjun Roy                2021-01-20  4282  			tcp_zc_finalize_rx_tstamp(sk, &zc, &tss);
7eeba1706eba6de Arjun Roy                2021-01-20  4283  		else
7eeba1706eba6de Arjun Roy                2021-01-20  4284  			zc.msg_flags = 0;
33946518d493cdf Arjun Roy                2020-02-14  4285  zerocopy_rcv_sk_err:
33946518d493cdf Arjun Roy                2020-02-14  4286  		if (!err)
33946518d493cdf Arjun Roy                2020-02-14  4287  			zc.err = sock_error(sk);
c8856c051454909 Arjun Roy                2020-02-14  4288  zerocopy_rcv_inq:
c8856c051454909 Arjun Roy                2020-02-14  4289  		zc.inq = tcp_inq_hint(sk);
c8856c051454909 Arjun Roy                2020-02-14  4290  zerocopy_rcv_out:
34704ef024ae616 Martin KaFai Lau         2022-09-01  4291  		if (!err && copy_to_sockptr(optval, &zc, len))
05255b823a61735 Eric Dumazet             2018-04-27  4292  			err = -EFAULT;
05255b823a61735 Eric Dumazet             2018-04-27  4293  		return err;
05255b823a61735 Eric Dumazet             2018-04-27  4294  	}
05255b823a61735 Eric Dumazet             2018-04-27  4295  #endif
^1da177e4c3f415 Linus Torvalds           2005-04-16  4296  	default:
^1da177e4c3f415 Linus Torvalds           2005-04-16  4297  		return -ENOPROTOOPT;
3ff50b7997fe06c Stephen Hemminger        2007-04-20  4298  	}
^1da177e4c3f415 Linus Torvalds           2005-04-16  4299  
34704ef024ae616 Martin KaFai Lau         2022-09-01  4300  	if (copy_to_sockptr(optlen, &len, sizeof(int)))
^1da177e4c3f415 Linus Torvalds           2005-04-16  4301  		return -EFAULT;
34704ef024ae616 Martin KaFai Lau         2022-09-01  4302  	if (copy_to_sockptr(optval, &val, len))
^1da177e4c3f415 Linus Torvalds           2005-04-16  4303  		return -EFAULT;
^1da177e4c3f415 Linus Torvalds           2005-04-16  4304  	return 0;
^1da177e4c3f415 Linus Torvalds           2005-04-16 @4305  }
^1da177e4c3f415 Linus Torvalds           2005-04-16  4306  

:::::: The code at line 4305 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
