Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1A65226AD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867778; cv=none; b=CNcW5ujQixotYdPOh+2ruoQlgB1TtZZeOxUw/WwJ6Oci70DWQKYFaEBP5AODR2qACZ5c2t826rAfN+NYeug0gB2W1pB2S0Zjo+0k494yZCSSqT44HWmB2Q8rxtS6MkcBDd6j91X3rts1hwTst5NM1xcIOgHfvPEwmIdAhGkTnnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867778; c=relaxed/simple;
	bh=udnzV+/wfYMhb4MczPUo5e/zi963v0U5GWSvKpvOt58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lCBrwvqvY4DIyID4Fj+pdW5TtHNAvQ80fi5lQkmDpwdfrsCZLxsUEeo1zO0HUA4rOvKtAGo2B5sgquB2M73jF/kb7v9jRkX33IoRN1z89g093UzvD3IfCXsMF0oUO8BZlSdlZT+bQ6zQgFVl1LVcjyAQJTrCe2zADCcUuuMNjF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HN0OIqMe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HN0OIqMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790867777; x=1822403777;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=udnzV+/wfYMhb4MczPUo5e/zi963v0U5GWSvKpvOt58=;
  b=HN0OIqMe3YsWSjdaT3ZuHkomdmbNzX7XOWAn8XTHbwfCyyv3O5lh5MDP
   1I0fLju6TJRkzB6pVvdekd49fR7J4tjuO1viHbDRskkA5p7JoDRgA4y4a
   RDjrFq7RY3L4kLng8rQwVE9tob9GvWQeXsNDgfk9UiLNPHYFCGxq5kPYA
   KDychs70blUODe1TRzZNaW39aF6obXhRws4yDNIEPdLH4UnBH0AZw9YVU
   hShxd56u9DaZP5TeyKcUt7YW77u5Fmnb3WidypqTktpM32oVOKN/7gLMw
   NXLHPda6dC/ivrhHHQx7satbgNpshcR3dlXfS7xs9VSKPSmgvWywFh4+G
   Q==;
X-CSE-ConnectionGUID: GyoV2LjRQCuA26usY1tDOA==
X-CSE-MsgGUID: 9Y9L5rUZRx6SB0spt/mcWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="101789364"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101789364"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 08:16:16 -0700
X-CSE-ConnectionGUID: 8PJwRn6DSRKLVKUPiR/kNw==
X-CSE-MsgGUID: yB5YP5xUR8K8N0ZvUve4Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="279324066"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2026 08:16:15 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCIW4-0000000007x-1dfG;
	Thu, 01 Oct 2026 15:16:12 +0000
Date: Thu, 01 Oct 2026 17:15:52 +0200
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: kernel/bpf/scev.c:1736:undefined reference to `__udivmoddi4'
Message-ID: <202610011731.DcYbvUbx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf=
-track-may_write-flags-in-liveness/20260926-071959
head:   588faaac20422c91861700e863668674da9cc06f
commit: 280ac823486cf3ef2a002b680a99c1e162a16204 bpf: use SCEV to widen bou=
nded loops
date:   5 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261=
001/202610011731.DcYbvUbx-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261001/202610011731.DcYbvUbx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011731.DcYbvUbx-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   ld: kernel/bpf/verifier.o: in function `scalar_step_lsh':
   kernel/bpf/verifier.c:15665:(.text+0x149c2): undefined reference to `__u=
moddi3'
   ld: kernel/bpf/verifier.o: in function `scalar_step_mul':
   kernel/bpf/verifier.c:15654:(.text+0x15c36): undefined reference to `__u=
moddi3'
   ld: kernel/bpf/scev.o: in function `compute_max_iters':
>> kernel/bpf/scev.c:1736:(.text+0xf7b): undefined reference to `__udivmodd=
i4'


vim +1736 kernel/bpf/scev.c

  1681=09
  1682	/*
  1683	 * Loop with post-condition:
  1684	 *
  1685	 *    r0 =3D 0
  1686	 * l: ...                r0 =E2=88=88 [0,1,2] header executed 3 times
  1687	 *    r0 +=3D 1            r0 =E2=88=88 [0,1,2]
  1688	 *    ...                r0 =E2=88=88 [1,2,3]
  1689	 *    if r0 !=3D 3 goto l  r0 =E2=88=88 [1,2,3] backedge taken 2 tim=
es
  1690	 *    ...                r0 =E2=88=88 [3]
  1691	 *
  1692	 * SCEV at header: r0 =3D k
  1693	 * SCEV at latch:  r0 =3D 1 + k
  1694	 *
  1695	 * Loop with pre-condition:
  1696	 *
  1697	 *    r0 =3D 0
  1698	 * l: ...                r0 =E2=88=88 [0,1,2,3] header executed 4 ti=
mes
  1699	 *    if r0 =3D=3D 3 goto e  r0 =E2=88=88 [0,1,2,3] backedge taken 3=
 times
  1700	 *    r0 +=3D 1            r0 =E2=88=88 [0,1,2]
  1701	 *    ...                r0 =E2=88=88 [1,2,3]
  1702	 *    goto l             r0 =E2=88=88 [1,2,3]
  1703	 * e: ...                r0 =E2=88=88 [3]
  1704	 *
  1705	 * SCEV at header: r0 =3D k
  1706	 * SCEV at latch:  r0 =3D k
  1707	 */
  1708	static bool compute_max_iters(struct bpf_verifier_env *env,
  1709				      struct bpf_func_state *st,
  1710				      struct linear_latch *latch,
  1711				      struct bpf_loop_iters *iters)
  1712	{
  1713		u64 base, step, diff, bound, initial, max_iters;
  1714		struct bpf_insn_aux_data *aux =3D env->insn_aux_data;
  1715		struct bpf_loop *loop =3D aux[bpf_loop_at_index(env, latch->insn_id=
x)].loop;
  1716		struct scev *scev =3D env->scev;
  1717		u8 op =3D latch->op;
  1718=09
  1719		if (!eval_expr(env, scev, st, latch->base_expr, &base) ||
  1720		    !eval_expr(env, scev, st, latch->step_expr, &step) ||
  1721		    !eval_expr(env, scev, st, latch->bound_expr, &bound) ||
  1722		    !eval_expr(env, scev, st, latch->reg_expr, &initial))
  1723			return false;
  1724=09
  1725		if (step =3D=3D 0)
  1726			return false;
  1727		if ((s64)step =3D=3D S64_MIN)
  1728			return false;
  1729		if ((s64)step < 0) {
  1730			/* Multiply both sides of the equation by -1, e.g. -2*i > -3 becom=
es 2*i < 3 */
  1731			op =3D bpf_flip_opcode(op);
  1732			step =3D -step;
  1733			swap(bound, initial);
  1734		}
  1735		diff =3D bound - initial;
> 1736		if (diff / step =3D=3D U64_MAX)
  1737			return false;
  1738		switch (op) {
  1739		case BPF_JLT:
  1740			max_iters =3D (u64)initial >=3D (u64)bound ? 0 : div_round_up(diff=
, step);
  1741			break;
  1742		case BPF_JLE:
  1743			max_iters =3D (u64)initial >  (u64)bound ? 0 : diff / step + 1;
  1744			break;
  1745		case BPF_JSLT:
  1746			max_iters =3D (s64)initial >=3D (s64)bound ? 0 : div_round_up(diff=
, step);
  1747			break;
  1748		case BPF_JSLE:
  1749			max_iters =3D (s64)initial >  (s64)bound ? 0 : diff / step + 1;
  1750			break;
  1751		case BPF_JNE:
  1752			max_iters =3D diff % step ? U32_MAX : div_round_up(diff, step);
  1753			break;
  1754		default:
  1755			return false;
  1756		}
  1757=09
  1758		if (max_iters > U32_MAX)
  1759			return false;
  1760=09
  1761		/*
  1762		 * The latch is a conditional jump with one jump target exiting the=
 loop.
  1763		 * Linear latch is matched only if the loop has a single backedge.
  1764		 * The loop still, however can have multiple exits.
  1765		 * In such case, conservatively assume that non-latch exit can happ=
en
  1766		 * at any iteration, thus setting minimal number of iterations as 0.
  1767		 */
  1768		iters->max_header_count =3D max_iters + (base =3D=3D 0 ? 1 : 0);
  1769		iters->min_header_count =3D loop->exits_cnt =3D=3D 1 ? iters->max_h=
eader_count : 0;
  1770		iters->pre_cond =3D base =3D=3D 0;
  1771		return true;
  1772	}
  1773=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
