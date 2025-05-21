Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7195280010
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 13:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747834401; cv=none; b=VSUzxaPe8ZdU3tLF9W9KwWktzUCNnPRIansgJnnKU7SxqEpJ5n7cc+cr+fDiz3Yta1LkkxlyufxVzIgR25q2AQUWc2iXr9QQS6RBiKtQPJR9Xz/9IxuFCvN0xZijH1mDdj5oSqPhDCgJzvZjL3J2KVHRxsIx8nGECqKkshu718c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747834401; c=relaxed/simple;
	bh=PyST3PoyDLnS64XnqPZkiaVedbzKwS2edBQQ8ifwfrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kjvob6O2FDrkT4aX9jJku65Yn8YGsoy+kq1/1eVaLyjgfZ8ZlaPrOXYULMrJRhPAVWO3acaUQjiLKnK7WKWX2J6EL2lqrp5QwGLIb/urFITkZ2gE+RuYwEkyy6QvwW1y0NSTTx7rNBPQ/PnMS1b115k+9T1YqI6510S1WHQqBVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKo3sfzt; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKo3sfzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747834400; x=1779370400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PyST3PoyDLnS64XnqPZkiaVedbzKwS2edBQQ8ifwfrY=;
  b=iKo3sfzt1mEal6W1j2WQJXQS+hRYJ3h+5rfmDKp/hz4IuTohUX5iHeCJ
   3U8Hddmier1Rs5HamMSzES0lSKqrNDcSEZk12mMwOn1gp4SohN8+/THJx
   K7DrO0ZhzyBvEcxPmGetpxsk63pag3rF/pX9nz8OJzyAs83HH3VGQKOz/
   rYglQaOADmkegac5q8ye/XxW51Y/phyV/sWTiyokBeNtpVcttoGuGXiAB
   IRO2C1B7ugadu0AdoOh+lpP2PHCsXtYx8dkqAc1HR0t4MOD+cw7h1lfZ/
   cC/plBGdscHz86Cn/SyC5wFKJ4QHBxPEZ5+tQZTP2pSR/vtyoEg12vUNU
   A==;
X-CSE-ConnectionGUID: Oe4RxjkgREGSotDcVjeSBg==
X-CSE-MsgGUID: d4eu17boTNSkjGtyOdgDUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="48930588"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="48930588"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 06:33:19 -0700
X-CSE-ConnectionGUID: 0uZZKrJrQt2d4ydk1sdkxQ==
X-CSE-MsgGUID: BypBGiQ6QUikVPbIea3zxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="144810185"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2025 06:33:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHjZ7-000OJF-13;
	Wed, 21 May 2025 13:33:01 +0000
Date: Wed, 21 May 2025 21:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Chaignon <paul.chaignon@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next] bpf: Support L4 csum update for IPv6
 address changes
Message-ID: <202505212155.GD0kA7Jj-lkp@intel.com>
References: <aCz84JU60wd8etiT@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCz84JU60wd8etiT@mail.gmail.com>

Hi Paul,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Chaignon/bpf-Support-L4-csum-update-for-IPv6-address-changes/20250521-060705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/aCz84JU60wd8etiT%40mail.gmail.com
patch subject: [RFC PATCH bpf-next] bpf: Support L4 csum update for IPv6 address changes
config: arc-randconfig-001-20250521 (https://download.01.org/0day-ci/archive/20250521/202505212155.GD0kA7Jj-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505212155.GD0kA7Jj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505212155.GD0kA7Jj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/core/filter.c: In function '____bpf_l4_csum_replace':
>> net/core/filter.c:1990:40: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1990 |    inet_proto_csum_replace16(ptr, skb, (void *)from, (void *)to, is_pseudo);
         |                                        ^
   net/core/filter.c:1990:54: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1990 |    inet_proto_csum_replace16(ptr, skb, (void *)from, (void *)to, is_pseudo);
         |                                                      ^


vim +1990 net/core/filter.c

  1964	
  1965	BPF_CALL_5(bpf_l4_csum_replace, struct sk_buff *, skb, u32, offset,
  1966		   u64, from, u64, to, u64, flags)
  1967	{
  1968		bool is_pseudo    = flags & BPF_F_PSEUDO_HDR;
  1969		bool is_mmzero    = flags & BPF_F_MARK_MANGLED_0;
  1970		bool do_mforce    = flags & BPF_F_MARK_ENFORCE;
  1971		bool is_ipv6_addr = flags & BPF_F_IPV6_ADDR;
  1972		__sum16 *ptr;
  1973	
  1974		if (unlikely(flags & ~(BPF_F_MARK_MANGLED_0 | BPF_F_MARK_ENFORCE |
  1975				       BPF_F_PSEUDO_HDR | BPF_F_HDR_FIELD_MASK |
  1976				       BPF_F_IPV6_ADDR)))
  1977			return -EINVAL;
  1978		if (unlikely(offset > 0xffff || offset & 1))
  1979			return -EFAULT;
  1980		if (unlikely(bpf_try_make_writable(skb, offset + sizeof(*ptr))))
  1981			return -EFAULT;
  1982	
  1983		ptr = (__sum16 *)(skb->data + offset);
  1984		if (is_mmzero && !do_mforce && !*ptr)
  1985			return 0;
  1986	
  1987		switch (flags & BPF_F_HDR_FIELD_MASK) {
  1988		case 0:
  1989			if (is_ipv6_addr) {
> 1990				inet_proto_csum_replace16(ptr, skb, (void *)from, (void *)to, is_pseudo);
  1991			} else {
  1992				if (unlikely(from != 0))
  1993					return -EINVAL;
  1994				inet_proto_csum_replace_by_diff(ptr, skb, to, is_pseudo);
  1995			}
  1996			break;
  1997		case 2:
  1998			inet_proto_csum_replace2(ptr, skb, from, to, is_pseudo);
  1999			break;
  2000		case 4:
  2001			inet_proto_csum_replace4(ptr, skb, from, to, is_pseudo);
  2002			break;
  2003		default:
  2004			return -EINVAL;
  2005		}
  2006	
  2007		if (is_mmzero && !*ptr)
  2008			*ptr = CSUM_MANGLED_0;
  2009		return 0;
  2010	}
  2011	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
