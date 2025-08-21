Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EC32F5321
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 12:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755781015; cv=none; b=cqNYCcdDAE437d7/P8hT3rRQeGsrpKfvZffMBcRCZ647lUyVxkRYBQy/++4c0bSEUaSwr5eULLHOBoEwTPBuAaO41Be0nqSVwrsvTyb9kIw86cOxDYrvsF/ZuoJbwSVEkPDG3ZWlihio0KTV9it5Q5vBYZBpCrZAHP+skEUb1XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755781015; c=relaxed/simple;
	bh=ETieBahTNhd8aLNz6pIo61AItBy5VM3YbETXSozk/3g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VIuRu9FGAObDfG55nKiSKDgI19UEgWRrxWccyREccaDDfMahOQQ8cCCK4ta/6BDGctlrGGDhdopBdZ+FkBjLquwIuEPvWn1wjfNpLyKX0ZogQgXS2WtYMr0wsjLRGGmZ0XpFIcUP9JIRKWMyG19ItkynoEEyYEEbk3BZN5Mbm8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2VAEk+H; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2VAEk+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755781014; x=1787317014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ETieBahTNhd8aLNz6pIo61AItBy5VM3YbETXSozk/3g=;
  b=A2VAEk+Hpr5Z7R1SSx59454F8XmNuGWLgy6C/l5nYJ6ZiJ+BcboqKaf5
   GzgSqJ/VziOnGUN/3iUn3X3IYu0zO0oT2Sn3Zd6PU0imK10xGYvTqwGYN
   OZI4uh/4b1L9S1rIMD7FnuNlCaOfWf+lXtnY9AcevxtJdQMLdW5tFEvsh
   EReJOKqKEayBuLLQT/rrheMDfqZXmoe0+qxKPKrelXkp1+hwE8oQxZRWy
   Z/Bqyat1Nf2Lfa0avl+o1QYjZa2454XMWFA2LvdhWa2n1+Soj8vMhGeiH
   HkKkkXZh7qvKqb7uGRBiefoGndFZmGIg/drHJDqkdancF4WMujkqgIyLs
   A==;
X-CSE-ConnectionGUID: oQTG+lz/Sg6SUkQOyI0QwA==
X-CSE-MsgGUID: 2TE5guYCTM65fnNJGWQ4ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="61896976"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61896976"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 05:56:53 -0700
X-CSE-ConnectionGUID: FrvpLOFyQQKjLnq4+WiwcQ==
X-CSE-MsgGUID: sYGOZFORRkqX3tQP2smiOg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Aug 2025 05:56:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up4qI-000KHV-1x;
	Thu, 21 Aug 2025 12:56:39 +0000
Date: Thu, 21 Aug 2025 20:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Sitnicki <jakub@cloudflare.com>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@kernel.org>
Subject: [linux-next:master 2782/3950] kernel/bpf/helpers.c:1784:17: warning:
 argument 2 null where non-null expected because argument 3 is nonzero
Message-ID: <202508212031.ir9b3B6Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa4d8dc380fbd81a9d702a855c50690c9c6442c
commit: 6877cd392baecf816c2ba896a9d42874628004a5 [2782/3950] bpf: Enable read/write access to skb metadata through a dynptr
config: sparc-randconfig-r063-20250821 (https://download.01.org/0day-ci/archive/20250821/202508212031.ir9b3B6Q-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508212031.ir9b3B6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508212031.ir9b3B6Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/helpers.c: In function '____bpf_snprintf':
   kernel/bpf/helpers.c:1069:9: warning: function '____bpf_snprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1069 |         err = bstr_printf(str, str_size, fmt, data.bin_args);
         |         ^~~
   In function '__bpf_dynptr_read',
       inlined from 'bpf_dynptr_copy' at kernel/bpf/helpers.c:2910:9:
>> kernel/bpf/helpers.c:1784:17: warning: argument 2 null where non-null expected because argument 3 is nonzero [-Wnonnull]
    1784 |                 memmove(dst, bpf_skb_meta_pointer(src->data, src->offset + offset), len);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:65,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:12,
                    from arch/sparc/include/asm/smp_32.h:15,
                    from arch/sparc/include/asm/smp.h:7,
                    from arch/sparc/include/asm/switch_to_32.h:5,
                    from arch/sparc/include/asm/switch_to.h:7,
                    from arch/sparc/include/asm/ptrace.h:120,
                    from arch/sparc/include/asm/thread_info_32.h:19,
                    from arch/sparc/include/asm/thread_info.h:7,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from kernel/bpf/helpers.c:4:
   arch/sparc/include/asm/string.h: In function 'bpf_dynptr_copy':
   arch/sparc/include/asm/string.h:12:7: note: in a call to function 'memmove' declared 'nonnull_if_nonzero'
      12 | void *memmove(void *, const void *, __kernel_size_t);
         |       ^~~~~~~
   In function '__bpf_dynptr_write',
       inlined from 'bpf_dynptr_copy' at kernel/bpf/helpers.c:2913:9:
   kernel/bpf/helpers.c:1845:17: warning: argument 1 null where non-null expected because argument 3 is nonzero [-Wnonnull]
    1845 |                 memmove(bpf_skb_meta_pointer(dst->data, dst->offset + offset), src, len);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/sparc/include/asm/string.h: In function 'bpf_dynptr_copy':
   arch/sparc/include/asm/string.h:12:7: note: in a call to function 'memmove' declared 'nonnull_if_nonzero'
      12 | void *memmove(void *, const void *, __kernel_size_t);
         |       ^~~~~~~


vim +1784 kernel/bpf/helpers.c

  1754	
  1755	static int __bpf_dynptr_read(void *dst, u32 len, const struct bpf_dynptr_kern *src,
  1756				     u32 offset, u64 flags)
  1757	{
  1758		enum bpf_dynptr_type type;
  1759		int err;
  1760	
  1761		if (!src->data || flags)
  1762			return -EINVAL;
  1763	
  1764		err = bpf_dynptr_check_off_len(src, offset, len);
  1765		if (err)
  1766			return err;
  1767	
  1768		type = bpf_dynptr_get_type(src);
  1769	
  1770		switch (type) {
  1771		case BPF_DYNPTR_TYPE_LOCAL:
  1772		case BPF_DYNPTR_TYPE_RINGBUF:
  1773			/* Source and destination may possibly overlap, hence use memmove to
  1774			 * copy the data. E.g. bpf_dynptr_from_mem may create two dynptr
  1775			 * pointing to overlapping PTR_TO_MAP_VALUE regions.
  1776			 */
  1777			memmove(dst, src->data + src->offset + offset, len);
  1778			return 0;
  1779		case BPF_DYNPTR_TYPE_SKB:
  1780			return __bpf_skb_load_bytes(src->data, src->offset + offset, dst, len);
  1781		case BPF_DYNPTR_TYPE_XDP:
  1782			return __bpf_xdp_load_bytes(src->data, src->offset + offset, dst, len);
  1783		case BPF_DYNPTR_TYPE_SKB_META:
> 1784			memmove(dst, bpf_skb_meta_pointer(src->data, src->offset + offset), len);
  1785			return 0;
  1786		default:
  1787			WARN_ONCE(true, "bpf_dynptr_read: unknown dynptr type %d\n", type);
  1788			return -EFAULT;
  1789		}
  1790	}
  1791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
