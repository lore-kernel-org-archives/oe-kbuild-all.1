Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6F1364028
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 04:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791606883; cv=none; b=tL1CTdMOJr3u5ggEiUpenCRzHnzcmxqQVX6m6sjduatPUQd1JT8HLYMauadTPkVSaojWB4/v67tawrT9WIL3xGPJFNrZMa8SgPcjg7NWrXkHGWKC8kDedTDPnae3skk5aqF7dUmo51EXbxqO9YS10lF0IpSHOdpszUYW8k2T6Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791606883; c=relaxed/simple;
	bh=lcvATNSg1kCRxtzSkH+cCHxmTGgOVDFOb6dSbWO9DfM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P9cH+1jXApkNzEFO3x/4MMwNbD+p5fDDpwuvs6Vau848ql0yvp6hgJPD3ItIbo9zgtgL09/ROXtyiODPciEnsfxjUKsW/qcjKytqK2Mca9GwLp0ywN05VCZeJACsCya7HdqwFozQnFV65CFoL8xZR7BJtdclFl4vw6armjIO8+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kPoiJYqS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kPoiJYqS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791606881; x=1823142881;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lcvATNSg1kCRxtzSkH+cCHxmTGgOVDFOb6dSbWO9DfM=;
  b=kPoiJYqSLaIJoupNEKVKWB8sLHdhOOyVgif27ufayUEmepcerUoUDNfr
   7vKRnVkFTAKxmdwnmA0eeHO63lf64/R9xzyyVjPjNez3nczJfXE+t6V3q
   korqxGuLWC50tot62hF1kGJR3h0IAfcmXzsgWErEf76h68I7vcVcc/ZbS
   WH00do7xaVhzW3nFMTAoRxorujhQ0GYOcaQKBm9wv9QbnCJqf9OK7s6pn
   PcRmZHaft3QpFWCZprl34E/Z1ZzxgcYeTc4pkjonfCxpMipMkqnCrlNks
   cGVsAo3kl4uhEv9eaNjJWhH6uVLL+4r2P6QAYE3juHYi4IidWQM801Fft
   w==;
X-CSE-ConnectionGUID: tSpB5q81Ti6Cc+70u0HMaQ==
X-CSE-MsgGUID: 1ifZOFuiTXu8oUD853/VEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="410476"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="410476"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 21:34:39 -0700
X-CSE-ConnectionGUID: 4L4Vu5E7ScSoPVvMIZCvUA==
X-CSE-MsgGUID: wM07qeoYTACsti145C9RTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="823499"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Oct 2026 21:34:38 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFOn5-000000007Yx-1lbu;
	Sat, 10 Oct 2026 04:34:35 +0000
Date: Sat, 10 Oct 2026 06:33:52 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 34/52] kernel/bpf/scev.c:2095:undefined
 reference to `__udivdi3'
Message-ID: <202610100657.DOIT44Ep-lkp@intel.com>
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
head:   15b578b1715d9a318c804350d98af87c203672bc
commit: 6ccf49f7932781f441e1e52459a4053bbfd19ddb [34/52] bpf: Use SCEV to w=
iden bounded loops
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261=
010/202610100657.DOIT44Ep-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261010/202610100657.DOIT44Ep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610100657.DOIT44Ep-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/scev.o: in function `compute_max_iters':
>> kernel/bpf/scev.c:2095:(.text+0x4426): undefined reference to `__udivdi3'
>> ld: kernel/bpf/scev.c:2131:(.text+0x445e): undefined reference to `__udi=
vdi3'
   ld: kernel/bpf/scev.c:2074:(.text+0x4512): undefined reference to `__udi=
vdi3'
   ld: kernel/bpf/scev.c:2111:(.text+0x45cf): undefined reference to `__udi=
vdi3'
   ld: kernel/bpf/scev.c:2130:(.text+0x4656): undefined reference to `__udi=
vdi3'
>> ld: kernel/bpf/scev.c:2141:(.text+0x475b): undefined reference to `__udi=
vmoddi4'


vim +2095 kernel/bpf/scev.c

  1980=09
  1981	/*
  1982	 * Loop with post-condition:
  1983	 *
  1984	 *    r0 =3D 0
  1985	 * l: ...                r0 =E2=88=88 [0,1,2] header executed 3 times
  1986	 *    r0 +=3D 1            r0 =E2=88=88 [0,1,2]
  1987	 *    ...                r0 =E2=88=88 [1,2,3]
  1988	 *    if r0 !=3D 3 goto l  r0 =E2=88=88 [1,2,3] backedge taken 2 tim=
es
  1989	 *    ...                r0 =E2=88=88 [3]
  1990	 *
  1991	 * SCEV at header: r0 =3D k
  1992	 * SCEV at latch:  r0 =3D 1 + k
  1993	 *
  1994	 * Loop with pre-condition:
  1995	 *
  1996	 *    r0 =3D 0
  1997	 * l: ...                r0 =E2=88=88 [0,1,2,3] header executed 4 ti=
mes
  1998	 *    if r0 =3D=3D 3 goto e  r0 =E2=88=88 [0,1,2,3] backedge taken 3=
 times
  1999	 *    r0 +=3D 1            r0 =E2=88=88 [0,1,2]
  2000	 *    ...                r0 =E2=88=88 [1,2,3]
  2001	 *    goto l             r0 =E2=88=88 [1,2,3]
  2002	 * e: ...                r0 =E2=88=88 [3]
  2003	 *
  2004	 * SCEV at header: r0 =3D k
  2005	 * SCEV at latch:  r0 =3D k
  2006	 */
  2007	static bool compute_max_iters(struct bpf_verifier_env *env,
  2008				      struct bpf_func_state *st,
  2009				      struct linear_latch *latch,
  2010				      struct bpf_loop_iters *iters)
  2011	{
  2012		struct bpf_insn_aux_data *aux =3D env->insn_aux_data;
  2013		struct bpf_loop *loop =3D aux[bpf_loop_at_index(env, latch->insn_id=
x)].loop;
  2014		struct scev *scev =3D env->scev;
  2015		struct scev_value initial_val, step_val, bound_val;
  2016		u64 step, diff, bound, initial, backedge_taken_count;
  2017		u8 op =3D latch->op;
  2018		bool up, down;
  2019=09
  2020		if (!eval_expr(env, scev, st, latch->base_expr, &initial_val) ||
  2021		    !eval_expr(env, scev, st, latch->step_expr, &step_val) ||
  2022		    !eval_expr(env, scev, st, latch->bound_expr, &bound_val))
  2023			return false;
  2024=09
  2025		if (step_val.ptr_reg >=3D 0) {
  2026			if (env->log.level & BPF_LOG_LEVEL2) {
  2027				bpf_log(&env->log, "scev: latch step is a pointer ");
  2028				log_scev_value(env, st, &step_val);
  2029				bpf_log(&env->log, "\n");
  2030			}
  2031			return false;
  2032		}
  2033		if (!scev_value_compatible(env, st, &initial_val, &bound_val))
  2034			return false;
  2035=09
  2036		initial =3D initial_val.value;
  2037		step =3D step_val.value;
  2038		bound =3D bound_val.value;
  2039=09
  2040		if (step =3D=3D 0)
  2041			return false;
  2042		down =3D (s64)step < 0;
  2043		up =3D (s64)step > 0;
  2044		diff =3D bound - initial;
  2045		switch (op) {
  2046		case BPF_JLT:
  2047			/*
  2048			 * E.g.: 3 + 2*i < 7 =E2=87=94 2*i < 4 =E2=87=94 i =E2=88=88 [0,1].
  2049			 * Here the inequality describes a set of values `i` might take
  2050			 * while the latch condition remains true (the backedge is taken).
  2051			 * The backedge_taken_count is the size of this set.
  2052			 */
  2053			if (/*
  2054			     * If the condition is initially true, decreasing values won't
  2055			     * change that without underflow. If the condition is initiall=
y false,
  2056			     * the main pass would do a single iteration anyway.
  2057			     */
  2058			    down ||
  2059			    /* Is the latch condition false on the first iteration? */
  2060			    initial >=3D bound ||
  2061			    /* Count iterations satisfying the strict inequality, includin=
g i=3D0. */
  2062			    check_add_overflow((diff - 1) / step, 1, &backedge_taken_count=
) ||
  2063			    /*
  2064			     * Check if the last iteration overflows the counter:
  2065			     *   initial + backedge_taken_count * step > U64_MAX
  2066			     */
  2067			    backedge_taken_count > (U64_MAX - initial) / step)
  2068				return false;
  2069			break;
  2070		case BPF_JLE:
  2071			/* E.g.: 3 + 2*i =E2=89=A4 7 =E2=87=94 2*i =E2=89=A4 4 =E2=87=94 i=
 =E2=88=88 [0,1,2]. */
  2072			if (down || initial > bound ||
  2073			    /* Count iterations satisfying the non-strict inequality. */
  2074			    check_add_overflow(diff / step, 1, &backedge_taken_count) ||
  2075			    backedge_taken_count > (U64_MAX - initial) / step)
  2076				return false;
  2077			break;
  2078		case BPF_JGT:
  2079			/* E.g.: 7 - 2*i > 3 =E2=87=94 2*i < 4 =E2=87=94 i =E2=88=88 [0,1]=
. */
  2080			if (up || initial <=3D bound ||
  2081			    check_add_overflow((-diff - 1) / -step, 1, &backedge_taken_cou=
nt) ||
  2082			    /*
  2083			     * The last iteration underflows the counter if:
  2084			     *   initial + backedge_taken_count * step < 0 =E2=87=94
  2085			     *             backedge_taken_count * step < -initial =E2=87=
=94
  2086			     *                    backedge_taken_count > initial / -step
  2087			     * (direction flips because step < 0)
  2088			     */
  2089			    backedge_taken_count > initial / -step)
  2090				return false;
  2091			break;
  2092		case BPF_JGE:
  2093			/* E.g.: 7 - 2*i =E2=89=A5 3 =E2=87=94 2*i =E2=89=A4 4 =E2=87=94 i=
 =E2=88=88 [0,1,2]. */
  2094			if (up || initial < bound ||
> 2095			    check_add_overflow(-diff / -step, 1, &backedge_taken_count) ||
  2096			    backedge_taken_count > initial / -step)
  2097				return false;
  2098			break;
  2099		case BPF_JSLT:
  2100			if (down || (s64)initial >=3D (s64)bound ||
  2101			    check_add_overflow((diff - 1) / step, 1, &backedge_taken_count=
) ||
  2102			    /*
  2103			     * Check if the last iteration overflows the signed counter:
  2104			     *   (s64)initial + backedge_taken_count * step > S64_MAX
  2105			     */
  2106			    backedge_taken_count > ((u64)S64_MAX - initial) / step)
  2107				return false;
  2108			break;
  2109		case BPF_JSLE:
  2110			if (down || (s64)initial > (s64)bound ||
  2111			    check_add_overflow(diff / step, 1, &backedge_taken_count) ||
  2112			    backedge_taken_count > ((u64)S64_MAX - initial) / step)
  2113				return false;
  2114			break;
  2115		case BPF_JSGT:
  2116			if (up || (s64)initial <=3D (s64)bound ||
  2117			    check_add_overflow((-diff - 1) / -step, 1, &backedge_taken_cou=
nt) ||
  2118			    /*
  2119			     * The last iteration underflows the signed counter if:
  2120			     *   (s64)initial + backedge_taken_count * step < S64_MIN =E2=
=87=94
  2121			     *                  backedge_taken_count * step < S64_MIN - (s=
64)initial =E2=87=94
  2122			     *                         backedge_taken_count > initial - (u=
64)S64_MIN / -step
  2123			     *	 (direction flips because step < 0)
  2124			     */
  2125			    backedge_taken_count > (initial - (u64)S64_MIN) / -step)
  2126				return false;
  2127			break;
  2128		case BPF_JSGE:
  2129			if (up || (s64)initial < (s64)bound ||
  2130			    check_add_overflow(-diff / -step, 1, &backedge_taken_count) ||
> 2131			    backedge_taken_count > (initial - (u64)S64_MIN) / -step)
  2132				return false;
  2133			break;
  2134		case BPF_JNE:
  2135			/*
  2136			 * For a decreasing counter flip the diff and step:
  2137			 *   7 - 2*i =E2=89=A0 3 =E2=87=94 2*i =E2=89=A0 7 - 3.
  2138			 */
  2139			diff =3D down ? -diff : diff;
  2140			step =3D down ? -step : step;
> 2141			if (diff =3D=3D 0 || diff % step)
  2142				return false;
  2143			backedge_taken_count =3D diff / step;
  2144			break;
  2145		default:
  2146			return false;
  2147		}
  2148=09
  2149		/*
  2150		 * max_header_count is u32 and U32_MAX means "infinite",
  2151		 * check to avoid overflow below.
  2152		 */
  2153		if (backedge_taken_count >=3D U32_MAX - 1)
  2154			return false;
  2155=09
  2156		/* The header executes once on entry and once for each taken backed=
ge, hence +1. */
  2157		iters->max_header_count =3D backedge_taken_count + 1;
  2158		/*
  2159		 * The latch is a conditional jump with one jump target exiting the=
 loop.
  2160		 * Linear latch is matched only if the loop has a single backedge.
  2161		 * The loop still, however can have multiple exits.
  2162		 * In such case, conservatively assume that non-latch exit can happ=
en
  2163		 * at any iteration, thus setting minimal number of iterations as 0.
  2164		 */
  2165		iters->min_header_count =3D loop->exits_cnt =3D=3D 1 ? iters->max_h=
eader_count : 0;
  2166		return true;
  2167	}
  2168=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
