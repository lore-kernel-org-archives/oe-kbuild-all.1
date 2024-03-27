Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EDE1D52B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 04:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711513337; cv=none; b=IgtfTf5qEaKz0axuq2M4/UF2LaVLnwwpVrX4EeJMdJjI2aQCb4YeO3ZjAM8QPerJ6u6STcRoa3laVdzjtDdv8WoLF3yoUnrM3t10pGhjt7ZVxKMLs6fLhfYM3Uf+2b9kxFSeQ4h0U/6t5HRM58QClkXmwLsCFXo75hn0keb4wGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711513337; c=relaxed/simple;
	bh=GETLPwjyL/jYNXHJRjDVSocU4uLyfbf5Z0Y4dzmQe/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifktgpDvmQ00Qpx8WwTi7b3KGy6JcmfhHi8zmIAfCPvuQObJQFtbUrOU6ux55/vwETIdWMxb2yVnaE5XrlqMQ2uqOD9pjOLPyy4lMr6e09tkti1MHyJEldBbLPf88srbL4s5qV+MXF5H/209Gura+nfHJC70no4QGNE/hjXolYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SD5tDFif; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SD5tDFif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711513335; x=1743049335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GETLPwjyL/jYNXHJRjDVSocU4uLyfbf5Z0Y4dzmQe/Y=;
  b=SD5tDFifC7SARacVgjGEmLrhACuUV04h/D1k6IA4B5yKheJDhyyuNrcT
   3Z3gjNNdsYGp6mLwQCDDkYElldGnMhSJ31MgUu+CKnpf7yOi4QUyZun0i
   DrWyjiwGWbtSyhHAQvoA6Y9sYkXjLR/PCASkbnY+v7WqugGRukKVx8byM
   zsNH1mIAg5W2ZdFqVe7KrAudzK8igJIdDTbeRUKoNMW4WW+YS+od+zSQg
   t4jRXS/YQInmngKG0jgEx5I8JyPJNUH+33sLnudpGcmW3Bjw4xZlGzDq3
   Ghaw+s/49QCA6fYDNp0MeSgbJzqcEN+WAYwYZ2Fp2MO5ekeh+Gn68tqF5
   g==;
X-CSE-ConnectionGUID: y6QPYbVWR0uN5N6jJT0VVg==
X-CSE-MsgGUID: Ijzj55QhTcWqu+q2m0w4nQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6458256"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6458256"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 21:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20892614"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Mar 2024 21:22:13 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpKnj-0000kU-0Z;
	Wed, 27 Mar 2024 04:22:11 +0000
Date: Wed, 27 Mar 2024 12:21:31 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/4] net: drop_monitor: use drop_reason_lookup()
Message-ID: <202403271245.NkUQBP1L-lkp@intel.com>
References: <20240326202131.3ca898497886.Idc122c3395bea9652f34ccaa678e918bfd4fae75@changeid>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326202131.3ca898497886.Idc122c3395bea9652f34ccaa678e918bfd4fae75@changeid>

Hi Johannes,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mcgrof/modules-next]
[also build test WARNING on arnd-asm-generic/master tip/timers/core net/main net-next/main linus/master v6.9-rc1 next-20240326]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/tracing-add-__print_sym-to-replace-__print_symbolic/20240327-032437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20240326202131.3ca898497886.Idc122c3395bea9652f34ccaa678e918bfd4fae75%40changeid
patch subject: [RFC PATCH v2 3/4] net: drop_monitor: use drop_reason_lookup()
config: openrisc-defconfig (https://download.01.org/0day-ci/archive/20240327/202403271245.NkUQBP1L-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271245.NkUQBP1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271245.NkUQBP1L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/skbuff.c:135:13: warning: no previous prototype for 'drop_reason_lookup' [-Wmissing-prototypes]
     135 | const char *drop_reason_lookup(unsigned long long value)
         |             ^~~~~~~~~~~~~~~~~~


vim +/drop_reason_lookup +135 net/core/skbuff.c

071c0fc6fb919d Johannes Berg 2023-04-19  134  
c983b2007bc00c Johannes Berg 2024-03-26 @135  const char *drop_reason_lookup(unsigned long long value)
c983b2007bc00c Johannes Berg 2024-03-26  136  {
c983b2007bc00c Johannes Berg 2024-03-26  137  	unsigned long long subsys_id = value >> SKB_DROP_REASON_SUBSYS_SHIFT;
c983b2007bc00c Johannes Berg 2024-03-26  138  	u32 reason = value & ~SKB_DROP_REASON_SUBSYS_MASK;
c983b2007bc00c Johannes Berg 2024-03-26  139  	const struct drop_reason_list *subsys;
c983b2007bc00c Johannes Berg 2024-03-26  140  
c983b2007bc00c Johannes Berg 2024-03-26  141  	if (subsys_id >= SKB_DROP_REASON_SUBSYS_NUM)
c983b2007bc00c Johannes Berg 2024-03-26  142  		return NULL;
c983b2007bc00c Johannes Berg 2024-03-26  143  
c983b2007bc00c Johannes Berg 2024-03-26  144  	subsys = rcu_dereference(drop_reasons_by_subsys[subsys_id]);
c983b2007bc00c Johannes Berg 2024-03-26  145  	if (!subsys)
c983b2007bc00c Johannes Berg 2024-03-26  146  		return NULL;
c983b2007bc00c Johannes Berg 2024-03-26  147  	if (reason >= subsys->n_reasons)
c983b2007bc00c Johannes Berg 2024-03-26  148  		return NULL;
c983b2007bc00c Johannes Berg 2024-03-26  149  	return subsys->reasons[reason];
c983b2007bc00c Johannes Berg 2024-03-26  150  }
076117b5a29931 Johannes Berg 2024-03-26  151  EXPORT_SYMBOL(drop_reason_lookup);
c983b2007bc00c Johannes Berg 2024-03-26  152  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
