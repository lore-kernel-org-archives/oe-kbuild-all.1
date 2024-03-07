Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B32CA78
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 03:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709780930; cv=none; b=AUlzdt880B35AcdGx3Ckf+ellNtVl+2zgnqXTv/57ce/JBaF2V/bLkjnY5PkSb7+xPtpR9sk8xp6KirQULRohjFsLQDJ9csxo6HtcnH9M00s0QExGmvFOCzYjniXSfVgvGrJPF7A14I4BIMpcasJAaVoM1o+cwJ18WWp8xhltEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709780930; c=relaxed/simple;
	bh=S60hv22HWqnUnuAdR5Z1mG6xyOz7FCQZsrz/wo7CtOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mjKLDx571+SqsFGBe40qBG96r8nmI+eU0wxrqxGUN3TZvDRxSJVSK5NKlxtrXIeFuxRCDUB62CxWIWYLJIBUL5WdOyb7JzxijxiTytlkTfmRdjK7SFN3d8npn1WuGfIlo1+322oBDFFmNMT251LKYzXJCKyESZZoZOJVOMyIGvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSC67Yta; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSC67Yta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709780928; x=1741316928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S60hv22HWqnUnuAdR5Z1mG6xyOz7FCQZsrz/wo7CtOQ=;
  b=nSC67YtaQju5pcjdlRPgOnMeUUOQ696bPDOghLgwRr4QteDJ+GG2so86
   pevW8KyCj9cJruPT4ctZhesyLUdT4EOChR8GH4hGmQV/Z68KekLWnM/AT
   s1UkQSxkFh9totyVhyVceVsQgqhJwBD5yflDWB/McLqBpn5Ev9V12+/pd
   gLh8n1ARadC/oS6R9DHa2Y0t/+saz3kBGo+3++P6xXOHTkz5EPAr5WYBp
   YMmRBjZ8mXr6FxuHgavvIT6s2jvXM6MSJteQXgZW22jm56kMK5asm4jtr
   ZGLsswkxEWiYO/RxNXS0ypsg5GTA8B01Pu47sRMAP0ijdOds/SYt7U+B4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="5013223"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="5013223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 19:08:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="10039676"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Mar 2024 19:08:41 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ri47b-0004k5-0q;
	Thu, 07 Mar 2024 03:08:39 +0000
Date: Thu, 7 Mar 2024 11:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 24725/27434]
 kernel/bpf/syscall.c:1804:56: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202403071151.WTdycqi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   0e88d1c26496999d1b2e37f3393b602d28b03faf
commit: bf58b225f43352b3aba6b80dfb20ddbb4e906859 [24725/27434] Track which process loads a bpf prog
config: x86_64-randconfig-121-20240305 (https://download.01.org/0day-ci/archive/20240307/202403071151.WTdycqi2-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240307/202403071151.WTdycqi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403071151.WTdycqi2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/syscall.c:1804:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected char const * @@     got char [noderef] __rcu * @@
   kernel/bpf/syscall.c:1804:56: sparse:     expected char const *
   kernel/bpf/syscall.c:1804:56: sparse:     got char [noderef] __rcu *

vim +1804 kernel/bpf/syscall.c

  1712	
  1713	static int bpf_prog_load(union bpf_attr *attr, union bpf_attr __user *uattr)
  1714	{
  1715		enum bpf_prog_type type = attr->prog_type;
  1716		struct bpf_prog *prog;
  1717		int err;
  1718		char license[128];
  1719		bool is_gpl;
  1720	
  1721		if (CHECK_ATTR(BPF_PROG_LOAD))
  1722			return -EINVAL;
  1723	
  1724		if (attr->prog_flags & ~(BPF_F_STRICT_ALIGNMENT |
  1725					 BPF_F_ANY_ALIGNMENT |
  1726					 BPF_F_TEST_STATE_FREQ |
  1727					 BPF_F_TEST_RND_HI32))
  1728			return -EINVAL;
  1729	
  1730		if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS) &&
  1731		    (attr->prog_flags & BPF_F_ANY_ALIGNMENT) &&
  1732		    !capable(CAP_SYS_ADMIN))
  1733			return -EPERM;
  1734	
  1735		/* copy eBPF program license from user space */
  1736		if (strncpy_from_user(license, u64_to_user_ptr(attr->license),
  1737				      sizeof(license) - 1) < 0)
  1738			return -EFAULT;
  1739		license[sizeof(license) - 1] = 0;
  1740	
  1741		/* eBPF programs must be GPL compatible to use GPL-ed functions */
  1742		is_gpl = license_is_gpl_compatible(license);
  1743	
  1744		if (attr->insn_cnt == 0 ||
  1745		    attr->insn_cnt > (capable(CAP_SYS_ADMIN) ? BPF_COMPLEXITY_LIMIT_INSNS : BPF_MAXINSNS))
  1746			return -E2BIG;
  1747		if (type != BPF_PROG_TYPE_SOCKET_FILTER &&
  1748		    type != BPF_PROG_TYPE_CGROUP_SKB &&
  1749		    !capable(CAP_SYS_ADMIN))
  1750			return -EPERM;
  1751	
  1752		bpf_prog_load_fixup_attach_type(attr);
  1753		if (bpf_prog_load_check_attach_type(type, attr->expected_attach_type))
  1754			return -EINVAL;
  1755	
  1756		/* plain bpf_prog allocation */
  1757		prog = bpf_prog_alloc(bpf_prog_size(attr->insn_cnt), GFP_USER);
  1758		if (!prog)
  1759			return -ENOMEM;
  1760	
  1761		prog->expected_attach_type = attr->expected_attach_type;
  1762	
  1763		prog->aux->offload_requested = !!attr->prog_ifindex;
  1764	
  1765		err = security_bpf_prog_alloc(prog->aux);
  1766		if (err)
  1767			goto free_prog_nouncharge;
  1768	
  1769		err = bpf_prog_charge_memlock(prog);
  1770		if (err)
  1771			goto free_prog_sec;
  1772	
  1773		prog->len = attr->insn_cnt;
  1774	
  1775		err = -EFAULT;
  1776		if (copy_from_user(prog->insns, u64_to_user_ptr(attr->insns),
  1777				   bpf_prog_insn_size(prog)) != 0)
  1778			goto free_prog;
  1779	
  1780		prog->orig_prog = NULL;
  1781		prog->jited = 0;
  1782	
  1783		atomic64_set(&prog->aux->refcnt, 1);
  1784		prog->gpl_compatible = is_gpl ? 1 : 0;
  1785	
  1786		if (bpf_prog_is_dev_bound(prog->aux)) {
  1787			err = bpf_prog_offload_init(prog, attr);
  1788			if (err)
  1789				goto free_prog;
  1790		}
  1791	
  1792		/* find program type: socket_filter vs tracing_filter */
  1793		err = find_prog_type(type, prog);
  1794		if (err < 0)
  1795			goto free_prog;
  1796	
  1797		prog->aux->load_time = ktime_get_boottime_ns();
  1798		err = bpf_obj_name_cpy(prog->aux->name, attr->prog_name);
  1799		if (err)
  1800			goto free_prog;
  1801	
  1802		strncpy(prog->aux->comm, current->comm, sizeof(prog->aux->comm));
  1803		if (current->real_parent)
> 1804			strncpy(prog->aux->parent_comm, current->real_parent->comm,
  1805				sizeof(prog->aux->parent_comm));
  1806	
  1807		/* run eBPF verifier */
  1808		err = bpf_check(&prog, attr, uattr);
  1809		if (err < 0)
  1810			goto free_used_maps;
  1811	
  1812		prog = bpf_prog_select_runtime(prog, &err);
  1813		if (err < 0)
  1814			goto free_used_maps;
  1815	
  1816		err = bpf_prog_alloc_id(prog);
  1817		if (err)
  1818			goto free_used_maps;
  1819	
  1820		/* Upon success of bpf_prog_alloc_id(), the BPF prog is
  1821		 * effectively publicly exposed. However, retrieving via
  1822		 * bpf_prog_get_fd_by_id() will take another reference,
  1823		 * therefore it cannot be gone underneath us.
  1824		 *
  1825		 * Only for the time /after/ successful bpf_prog_new_fd()
  1826		 * and before returning to userspace, we might just hold
  1827		 * one reference and any parallel close on that fd could
  1828		 * rip everything out. Hence, below notifications must
  1829		 * happen before bpf_prog_new_fd().
  1830		 *
  1831		 * Also, any failure handling from this point onwards must
  1832		 * be using bpf_prog_put() given the program is exposed.
  1833		 */
  1834		bpf_prog_kallsyms_add(prog);
  1835		perf_event_bpf_event(prog, PERF_BPF_EVENT_PROG_LOAD, 0);
  1836	
  1837		err = bpf_prog_new_fd(prog);
  1838		if (err < 0)
  1839			bpf_prog_put(prog);
  1840		return err;
  1841	
  1842	free_used_maps:
  1843		/* In case we have subprogs, we need to wait for a grace
  1844		 * period before we can tear down JIT memory since symbols
  1845		 * are already exposed under kallsyms.
  1846		 */
  1847		__bpf_prog_put_noref(prog, prog->aux->func_cnt);
  1848		return err;
  1849	free_prog:
  1850		bpf_prog_uncharge_memlock(prog);
  1851	free_prog_sec:
  1852		security_bpf_prog_free(prog->aux);
  1853	free_prog_nouncharge:
  1854		bpf_prog_free(prog);
  1855		return err;
  1856	}
  1857	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
