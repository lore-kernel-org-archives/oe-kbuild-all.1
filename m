Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B64178F44
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 06:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771755; cv=none; b=ZXK/sGe0emV3lUvFdU8HrzE9V1Lho+TTcV0af4MbknNSgb05Pva22rYCZ0ZtdikqiumiYAaD9pYVkIoTBJh9QtwkHl3d4KqcOhKzoHmPqxMABuslSUKTsN3hZRWSWCNDFgJc6Th9KO3dVMDvWUq0D6mb33Xk5pEqe6GoqpT/RkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771755; c=relaxed/simple;
	bh=nEucYV6KYpMc0yW8hhH6t+tAEr6vsQYUNMvuJT1CS4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=luW+LO6gAUTwU6uGdsOWtO6iSgXKOVyPkRcAbZewvXGrAzAabW/U8oHAn3cVDHuqcRJG4GIwdeDn0jlpOH/cIvptpWU9pDuPON00xQ2jXvsjMonVTr1GkpoDBxpkxtTuGa4oqDRG0KSF06C4Li3po//QR/5oHHdyNuQ89qG/DtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F6DkPC4X; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F6DkPC4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746771753; x=1778307753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEucYV6KYpMc0yW8hhH6t+tAEr6vsQYUNMvuJT1CS4U=;
  b=F6DkPC4XULQHy5i8J49tZ9TphkOdYFYjgWyS0hD/uU11/zefb6Nrk/Mz
   Fd5eBsMuiI6AHgiW0qPtT06pnTPgEM34RhabnaKiQ1TpwFpcuEZ+uh/ll
   VEa9EA/RvSEm2XnIjcJDqaF/JpKr4/A9AFzUEiHzzHL3f0Q9/BI2axRVL
   E7TGPxbDLcb/YV92x0Fdd5WOwIWknU8cD2oM+yqMX8M1S5z3olRhxfbMu
   Vg/QJdvUQf4El1XcSLRF/XsYiBCNTrJch3RREkOBdTk+gCH/QF8A/Gzs8
   HSogtaApcF3HnMaOTYHi3D+mFUoA/t1NIYcR+g/b3DqKIoMIZnasc/WX/
   g==;
X-CSE-ConnectionGUID: oYuHMfnGRECZS2Itjn1fAg==
X-CSE-MsgGUID: tfc3T9S8SOuSQmmzQUUhmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52391217"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="52391217"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:22:33 -0700
X-CSE-ConnectionGUID: Hc3JtThDQ2CWXsRxg3sI5A==
X-CSE-MsgGUID: s4GfKnAzQO6ABPCjX9r+mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="167598055"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 May 2025 23:22:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDH7t-000Bi7-2T;
	Fri, 09 May 2025 06:22:29 +0000
Date: Fri, 9 May 2025 14:21:33 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] net/core/skbuff.c:2915:24: sparse:
 sparse: incorrect type in return expression (different base types)
Message-ID: <202505091401.1IgjWyqz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: d0cebe7c173d01a45ec13f2ba2b552051a010e06 [0/1] net: keep track and avoid access of skb containing dma-buf pages.
config: x86_64-randconfig-123-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091401.1IgjWyqz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091401.1IgjWyqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091401.1IgjWyqz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/core/skbuff.c:2915:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __wsum @@     got int @@
   net/core/skbuff.c:2915:24: sparse:     expected restricted __wsum
   net/core/skbuff.c:2915:24: sparse:     got int
   net/core/skbuff.c:3018:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __wsum @@     got int @@
   net/core/skbuff.c:3018:24: sparse:     expected restricted __wsum
   net/core/skbuff.c:3018:24: sparse:     got int

vim +2915 net/core/skbuff.c

  2892	
  2893	/* Checksum skb data. */
  2894	__wsum __skb_checksum(const struct sk_buff *skb, int offset, int len,
  2895			      __wsum csum, const struct skb_checksum_ops *ops)
  2896	{
  2897		int start = skb_headlen(skb);
  2898		int i, copy = start - offset;
  2899		struct sk_buff *frag_iter;
  2900		int pos = 0;
  2901	
  2902		/* Checksum header. */
  2903		if (copy > 0) {
  2904			if (copy > len)
  2905				copy = len;
  2906			csum = INDIRECT_CALL_1(ops->update, csum_partial_ext,
  2907					       skb->data + offset, copy, csum);
  2908			if ((len -= copy) == 0)
  2909				return csum;
  2910			offset += copy;
  2911			pos	= copy;
  2912		}
  2913	
  2914		if (WARN_ON_ONCE(skb_frags_not_readable(skb)))
> 2915			return -EFAULT;
  2916	
  2917		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
  2918			int end;
  2919			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
  2920	
  2921			WARN_ON(start > offset + len);
  2922	
  2923			end = start + skb_frag_size(frag);
  2924			if ((copy = end - offset) > 0) {
  2925				u32 p_off, p_len, copied;
  2926				struct page *p;
  2927				__wsum csum2;
  2928				u8 *vaddr;
  2929	
  2930				if (copy > len)
  2931					copy = len;
  2932	
  2933				skb_frag_foreach_page(frag,
  2934						      skb_frag_off(frag) + offset - start,
  2935						      copy, p, p_off, p_len, copied) {
  2936					vaddr = kmap_atomic(p);
  2937					csum2 = INDIRECT_CALL_1(ops->update,
  2938								csum_partial_ext,
  2939								vaddr + p_off, p_len, 0);
  2940					kunmap_atomic(vaddr);
  2941					csum = INDIRECT_CALL_1(ops->combine,
  2942							       csum_block_add_ext, csum,
  2943							       csum2, pos, p_len);
  2944					pos += p_len;
  2945				}
  2946	
  2947				if (!(len -= copy))
  2948					return csum;
  2949				offset += copy;
  2950			}
  2951			start = end;
  2952		}
  2953	
  2954		skb_walk_frags(skb, frag_iter) {
  2955			int end;
  2956	
  2957			WARN_ON(start > offset + len);
  2958	
  2959			end = start + frag_iter->len;
  2960			if ((copy = end - offset) > 0) {
  2961				__wsum csum2;
  2962				if (copy > len)
  2963					copy = len;
  2964				csum2 = __skb_checksum(frag_iter, offset - start,
  2965						       copy, 0, ops);
  2966				csum = INDIRECT_CALL_1(ops->combine, csum_block_add_ext,
  2967						       csum, csum2, pos, copy);
  2968				if ((len -= copy) == 0)
  2969					return csum;
  2970				offset += copy;
  2971				pos    += copy;
  2972			}
  2973			start = end;
  2974		}
  2975		BUG_ON(len);
  2976	
  2977		return csum;
  2978	}
  2979	EXPORT_SYMBOL(__skb_checksum);
  2980	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
