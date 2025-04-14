Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F6619048A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 20:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744661753; cv=none; b=JdIIimzBNupoiWUqgPHDF0N7X5pT06MtPidFiRw9A3O2EgNlL9CiRwU5HYKlD/H1QSVa5Es9nwBbMbN/fxbIaMvalcW6YfvxLSabC/NPAz/B5kK/CwTGfV574XDjQwHodqd9rhX8LWzX/hDwNO8VZHiwuJTvkHISmDqkkCZCPjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744661753; c=relaxed/simple;
	bh=pDrbN0m7DHbYkDHFQ8oRmDWOPfca7nAqJUarS0vtDiw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mvKWiaQY8LvjyOduhvnfXMqWy83v/4fqBho6dU5rpJsIFpJsJepWj/sFJV6c/5ekqvNM/YQKt4BrBF1tinPlorFG5S8Cd5X64B5QU9GAd2edRkLBsogmrSMBgc4YFO45I/Vd9/L+KJs04qPXXLVlh/QoovJYLDi2kudz55xobTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gxLVQeBZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gxLVQeBZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744661751; x=1776197751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pDrbN0m7DHbYkDHFQ8oRmDWOPfca7nAqJUarS0vtDiw=;
  b=gxLVQeBZOXsMX1iEzq1ciWioLznHbPxd4E4LY/uLIbOy8yq/HSkitDpc
   tIeJapao32GNdnBsL/NAWAa6lFe10+aIkgD4hVP+lWORLQAMLdD/akR8H
   q+AZK+cNNprLLTg2qj5I/6x2iN94U+khpMCxWMCpUs7e/Yhth+sF1nBob
   a27fGUXBYl7vG8T+G16a+QxywEXEEoP3cy6Dnb81ytL1ExWJhoh60+FJ5
   r5KOkRkDhmByB9YXqkXxmN5T6X/8BPH4xYYiM2Ou5+vlVvJOsRHqrIUnH
   kfdVFlWbUhxCO9xNME62RyLG9VFoF4MqYGz1K/UKdE1BYe0zFVnVlrtTm
   g==;
X-CSE-ConnectionGUID: ikA2k1ANRgGw8//p+aFNXw==
X-CSE-MsgGUID: KW99NXMiTOekdhTXL3qq3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="57532269"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="57532269"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 13:15:50 -0700
X-CSE-ConnectionGUID: /9XsJGqMT166j+yYd+B7GQ==
X-CSE-MsgGUID: r0W9/mtuQDuTJLGamc/EVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="134687099"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Apr 2025 13:15:49 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4QDb-000Eei-0H;
	Mon, 14 Apr 2025 20:15:47 +0000
Date: Tue, 15 Apr 2025 04:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:stream 6/13] kernel/bpf/helpers.c:2833: warning: Function
 parameter or struct member 'mem_slice' not described in
 'bpf_dynptr_from_mem_slice'
Message-ID: <202504150453.4kj3cnjC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux stream
head:   a1aa685f70a017d3492be37e89d45d5633fc0203
commit: ceef837b83c8aeb883fe336e6a605faaba2dde62 [6/13] bpf: Introduce bpf_dynptr_from_mem_slice
config: arc-randconfig-001-20250415 (https://download.01.org/0day-ci/archive/20250415/202504150453.4kj3cnjC-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150453.4kj3cnjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150453.4kj3cnjC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:2833: warning: Function parameter or struct member 'mem_slice' not described in 'bpf_dynptr_from_mem_slice'
>> kernel/bpf/helpers.c:2833: warning: Function parameter or struct member 'flags' not described in 'bpf_dynptr_from_mem_slice'
>> kernel/bpf/helpers.c:2833: warning: Function parameter or struct member 'dptr__uninit' not described in 'bpf_dynptr_from_mem_slice'
>> kernel/bpf/helpers.c:2833: warning: expecting prototype for XXX(). Prototype was for bpf_dynptr_from_mem_slice() instead


vim +2833 kernel/bpf/helpers.c

  2828	
  2829	/**
  2830	 * XXX
  2831	 */
  2832	__bpf_kfunc int bpf_dynptr_from_mem_slice(struct bpf_mem_slice *mem_slice, u64 flags, struct bpf_dynptr *dptr__uninit)
> 2833	{
  2834		struct bpf_dynptr_kern *dptr = (struct bpf_dynptr_kern *)dptr__uninit;
  2835		int err;
  2836	
  2837		if (!mem_slice)
  2838			return -EINVAL;
  2839	
  2840		err = bpf_dynptr_check_size(mem_slice->len);
  2841		if (err)
  2842			goto error;
  2843	
  2844		/* flags is currently unsupported */
  2845		if (flags) {
  2846			err = -EINVAL;
  2847			goto error;
  2848		}
  2849	
  2850		bpf_dynptr_init(dptr, mem_slice->ptr, BPF_DYNPTR_TYPE_LOCAL, 0, mem_slice->len);
  2851		bpf_dynptr_set_rdonly(dptr);
  2852	
  2853		return 0;
  2854	
  2855	error:
  2856		bpf_dynptr_set_null(dptr);
  2857		return err;
  2858	}
  2859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
