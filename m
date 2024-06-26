Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DB813C3F9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 04:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719377104; cv=none; b=FYWFmz9Wf+ksZjTsoX4hO4SlH1lRkSNIfqunphwHE6m8WOtJPKzvRp6UlQZsNgjOMQKoSJpc8Am+nldMoNbdLgmUobbJnzerKtVZVQ2sdI8Jv0qrQyoujjjCeCD1gfA9XSH/bc/HqMgCyfeGLL9tA+FmlBynXWJpqCp4qGkM+Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719377104; c=relaxed/simple;
	bh=X3DTxI15mGOhGCpFR+aFj5qE+xYLEDwzXitUAhbTjdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HyhkZI8sjlCBYY0yO5n8o0vIGdwK0PkDl4njDbkJqQE8ppAxc9wtD+my+SdfLS/HrJD5HRXndWFGuoHYk5kRfgJDkujkVeY7v8vtIHhy4iOIFs3HovIYmrnAmmWsi/wmCsVnk+VYATd0kdtKhta29uxclaSs8dZHJx2Sc6PdJVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRrfZViv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRrfZViv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719377103; x=1750913103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X3DTxI15mGOhGCpFR+aFj5qE+xYLEDwzXitUAhbTjdI=;
  b=YRrfZVivCpMgI8aXD8nowijdMQCsLV3s5PdsSqJIlhwm4NejIIu2wcE+
   jUm0uQXo2vjjU2QgEjbFXykfL1xE0Q5AkqA4RcPkk89NaagvERj03B+3t
   cVNPi4VBeBRmu1sRomcccYobHox4xPIeNsLwlO0QgvB+hx8cNjazyZO9G
   7X1kCDom9nyHXjMl6HQ4iHe2Zm0ng/bHBAraVL3shzyaz6/DGV8lXdABi
   csX7S2SXH4qsWtgSACwecON7SyybiID3zC6ueNfThRFliu5snzZPE/DLX
   xETaK8ztvRqZfcPmlVZJV3RCBBTKCBAOLbRbfcxgHX3Dw0q0ZqUeGVV8l
   w==;
X-CSE-ConnectionGUID: 92uph9NvQrqSzofXJQ8T/w==
X-CSE-MsgGUID: r79R+RjsQl+HanHFj8gbcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16554584"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="16554584"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 21:45:02 -0700
X-CSE-ConnectionGUID: N7vIzrroSQi0GLEbH5R7mA==
X-CSE-MsgGUID: lq7ysFh3Q3adB0ZIbHonrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="43946240"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Jun 2024 21:45:00 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMKWf-000Ezw-2t;
	Wed, 26 Jun 2024 04:44:57 +0000
Date: Wed, 26 Jun 2024 12:44:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 7566/8232] net/core/filter.c:2049:16: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202406261217.A4hdCnYa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: 78f520b7bbe579438dfc202226b3dac5607d8c7f [7566/8232] net: Use nested-BH locking for bpf_scratchpad.
config: x86_64-randconfig-r112-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261217.A4hdCnYa-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261217.A4hdCnYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261217.A4hdCnYa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/filter.c:1422:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1422:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1422:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:1500:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sock_filter const *filter @@     got struct sock_filter [noderef] __user *filter @@
   net/core/filter.c:1500:39: sparse:     expected struct sock_filter const *filter
   net/core/filter.c:1500:39: sparse:     got struct sock_filter [noderef] __user *filter
   net/core/filter.c:2339:45: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] daddr @@     got unsigned int [usertype] ipv4_nh @@
   net/core/filter.c:2339:45: sparse:     expected restricted __be32 [usertype] daddr
   net/core/filter.c:2339:45: sparse:     got unsigned int [usertype] ipv4_nh
   net/core/filter.c:10975:31: sparse: sparse: symbol 'sk_filter_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10982:27: sparse: sparse: symbol 'sk_filter_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10986:31: sparse: sparse: symbol 'tc_cls_act_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:10995:27: sparse: sparse: symbol 'tc_cls_act_prog_ops' was not declared. Should it be static?
   net/core/filter.c:10999:31: sparse: sparse: symbol 'xdp_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11011:31: sparse: sparse: symbol 'cg_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11017:27: sparse: sparse: symbol 'cg_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11021:31: sparse: sparse: symbol 'lwt_in_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11027:27: sparse: sparse: symbol 'lwt_in_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11031:31: sparse: sparse: symbol 'lwt_out_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11037:27: sparse: sparse: symbol 'lwt_out_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11041:31: sparse: sparse: symbol 'lwt_xmit_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11048:27: sparse: sparse: symbol 'lwt_xmit_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11052:31: sparse: sparse: symbol 'lwt_seg6local_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11058:27: sparse: sparse: symbol 'lwt_seg6local_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11062:31: sparse: sparse: symbol 'cg_sock_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11068:27: sparse: sparse: symbol 'cg_sock_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11071:31: sparse: sparse: symbol 'cg_sock_addr_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11077:27: sparse: sparse: symbol 'cg_sock_addr_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11080:31: sparse: sparse: symbol 'sock_ops_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11086:27: sparse: sparse: symbol 'sock_ops_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11089:31: sparse: sparse: symbol 'sk_skb_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11096:27: sparse: sparse: symbol 'sk_skb_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11099:31: sparse: sparse: symbol 'sk_msg_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11106:27: sparse: sparse: symbol 'sk_msg_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11109:31: sparse: sparse: symbol 'flow_dissector_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11115:27: sparse: sparse: symbol 'flow_dissector_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11443:31: sparse: sparse: symbol 'sk_reuseport_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:11449:27: sparse: sparse: symbol 'sk_reuseport_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11651:27: sparse: sparse: symbol 'sk_lookup_prog_ops' was not declared. Should it be static?
   net/core/filter.c:11655:31: sparse: sparse: symbol 'sk_lookup_verifier_ops' was not declared. Should it be static?
   net/core/filter.c:1942:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1942:43: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1942:43: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1945:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be16 [usertype] old @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1945:36: sparse:     expected restricted __be16 [usertype] old
   net/core/filter.c:1945:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1945:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] new @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1945:42: sparse:     expected restricted __be16 [usertype] new
   net/core/filter.c:1945:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1948:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1948:36: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1948:36: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1948:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1948:42: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1948:42: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1993:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __wsum [usertype] diff @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1993:59: sparse:     expected restricted __wsum [usertype] diff
   net/core/filter.c:1993:59: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1996:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be16 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1996:52: sparse:     expected restricted __be16 [usertype] from
   net/core/filter.c:1996:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1996:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be16 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1996:58: sparse:     expected restricted __be16 [usertype] to
   net/core/filter.c:1996:58: sparse:     got unsigned long long [usertype] to
   net/core/filter.c:1999:52: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted __be32 [usertype] from @@     got unsigned long long [usertype] from @@
   net/core/filter.c:1999:52: sparse:     expected restricted __be32 [usertype] from
   net/core/filter.c:1999:52: sparse:     got unsigned long long [usertype] from
   net/core/filter.c:1999:58: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted __be32 [usertype] to @@     got unsigned long long [usertype] to @@
   net/core/filter.c:1999:58: sparse:     expected restricted __be32 [usertype] to
   net/core/filter.c:1999:58: sparse:     got unsigned long long [usertype] to
>> net/core/filter.c:2049:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum [assigned] [usertype] ret @@
   net/core/filter.c:2049:16: sparse:     expected unsigned long long
   net/core/filter.c:2049:16: sparse:     got restricted __wsum [assigned] [usertype] ret
   net/core/filter.c:2071:35: sparse: sparse: incorrect type in return expression (different base types) @@     expected unsigned long long @@     got restricted __wsum [usertype] csum @@
   net/core/filter.c:2071:35: sparse:     expected unsigned long long
   net/core/filter.c:2071:35: sparse:     got restricted __wsum [usertype] csum
   net/core/filter.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +2049 net/core/filter.c

  1967	
  1968	BPF_CALL_5(bpf_l4_csum_replace, struct sk_buff *, skb, u32, offset,
  1969		   u64, from, u64, to, u64, flags)
  1970	{
  1971		bool is_pseudo = flags & BPF_F_PSEUDO_HDR;
  1972		bool is_mmzero = flags & BPF_F_MARK_MANGLED_0;
  1973		bool do_mforce = flags & BPF_F_MARK_ENFORCE;
  1974		__sum16 *ptr;
  1975	
  1976		if (unlikely(flags & ~(BPF_F_MARK_MANGLED_0 | BPF_F_MARK_ENFORCE |
  1977				       BPF_F_PSEUDO_HDR | BPF_F_HDR_FIELD_MASK)))
  1978			return -EINVAL;
  1979		if (unlikely(offset > 0xffff || offset & 1))
  1980			return -EFAULT;
  1981		if (unlikely(bpf_try_make_writable(skb, offset + sizeof(*ptr))))
  1982			return -EFAULT;
  1983	
  1984		ptr = (__sum16 *)(skb->data + offset);
  1985		if (is_mmzero && !do_mforce && !*ptr)
  1986			return 0;
  1987	
  1988		switch (flags & BPF_F_HDR_FIELD_MASK) {
  1989		case 0:
  1990			if (unlikely(from != 0))
  1991				return -EINVAL;
  1992	
  1993			inet_proto_csum_replace_by_diff(ptr, skb, to, is_pseudo);
  1994			break;
  1995		case 2:
> 1996			inet_proto_csum_replace2(ptr, skb, from, to, is_pseudo);
  1997			break;
  1998		case 4:
  1999			inet_proto_csum_replace4(ptr, skb, from, to, is_pseudo);
  2000			break;
  2001		default:
  2002			return -EINVAL;
  2003		}
  2004	
  2005		if (is_mmzero && !*ptr)
  2006			*ptr = CSUM_MANGLED_0;
  2007		return 0;
  2008	}
  2009	
  2010	static const struct bpf_func_proto bpf_l4_csum_replace_proto = {
  2011		.func		= bpf_l4_csum_replace,
  2012		.gpl_only	= false,
  2013		.ret_type	= RET_INTEGER,
  2014		.arg1_type	= ARG_PTR_TO_CTX,
  2015		.arg2_type	= ARG_ANYTHING,
  2016		.arg3_type	= ARG_ANYTHING,
  2017		.arg4_type	= ARG_ANYTHING,
  2018		.arg5_type	= ARG_ANYTHING,
  2019	};
  2020	
  2021	BPF_CALL_5(bpf_csum_diff, __be32 *, from, u32, from_size,
  2022		   __be32 *, to, u32, to_size, __wsum, seed)
  2023	{
  2024		struct bpf_scratchpad *sp = this_cpu_ptr(&bpf_sp);
  2025		u32 diff_size = from_size + to_size;
  2026		int i, j = 0;
  2027		__wsum ret;
  2028	
  2029		/* This is quite flexible, some examples:
  2030		 *
  2031		 * from_size == 0, to_size > 0,  seed := csum --> pushing data
  2032		 * from_size > 0,  to_size == 0, seed := csum --> pulling data
  2033		 * from_size > 0,  to_size > 0,  seed := 0    --> diffing data
  2034		 *
  2035		 * Even for diffing, from_size and to_size don't need to be equal.
  2036		 */
  2037		if (unlikely(((from_size | to_size) & (sizeof(__be32) - 1)) ||
  2038			     diff_size > sizeof(sp->diff)))
  2039			return -EINVAL;
  2040	
  2041		local_lock_nested_bh(&bpf_sp.bh_lock);
  2042		for (i = 0; i < from_size / sizeof(__be32); i++, j++)
  2043			sp->diff[j] = ~from[i];
  2044		for (i = 0; i <   to_size / sizeof(__be32); i++, j++)
  2045			sp->diff[j] = to[i];
  2046	
  2047		ret = csum_partial(sp->diff, diff_size, seed);
  2048		local_unlock_nested_bh(&bpf_sp.bh_lock);
> 2049		return ret;
  2050	}
  2051	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
