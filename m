Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F1C14012
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 01:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731030223; cv=none; b=qyCOw1uxzmkWN2LhkI5RBgodU7HtIqN1nyYbC77jkZgjbEcns1XI9RcPMdORlLhI3/Vuj2Hh2NqD5CTncG8A+Qnj6tMmstKtrgcrTLJ/MkgLtJ8mHQmI6gvSkz1KB1t71Is+P2mYuMqBcKCkmGB8LpPL4vh6ig+dxpNsQJgjb5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731030223; c=relaxed/simple;
	bh=KNlrjQcUN3qc2KAHf08/BfjlLow3oJ+TaeoVcmO+wuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1wbknsjDfhzUFllxYpiZyQkuJT89JKEU8H1AeUT9IVxDtnPK8hrSX4T9Bxzt3MHQYYfGDfAFQJ4ahb5kEtmu7Dx8zXqfJ53bvcD8kkgAQpaRNo/skbHWlsjFrvLALy2PvugeZcaXsaNn7PbnBUxkSjqQRT2D92daegVByNaqkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k70cgERd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k70cgERd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731030223; x=1762566223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KNlrjQcUN3qc2KAHf08/BfjlLow3oJ+TaeoVcmO+wuI=;
  b=k70cgERdd7gvEEdPVf7DKx1lZzxjM/fVqHQV9Dl5fDRShTlYc9VIUcZb
   nj3PWZcPTuLiCiWSjza+CO4lPoAJjwS3YKE7xqx4sOJ6oQ9cYsqu3Zd35
   OC8RZLW3IeBO0PDzPxsqGtB0aJgaqJ/zJo0jZeD1WR92XmEEnfCA+fZd1
   3d+smMA30hf/DY/IdU/E+XMo79HmiaV43KBYI5vY9WPiqB4+r9ga1mehC
   e2Fko1SHbC3ZJcP77qjv185LLJ5Qd3EMwG/BL0vUN13C2028tRyb7TJ/5
   YcpqUnt3A6zwbTeFxw2NrYmbL3l0c1cESAyjFtbupsZGC9qurGZPTWxw5
   w==;
X-CSE-ConnectionGUID: RPWm/D+gSWSpjs1YYmjdww==
X-CSE-MsgGUID: y0uLLR4FRSCm9i/PrQxfUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42007146"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42007146"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 17:43:43 -0800
X-CSE-ConnectionGUID: sEwgVBN/SS2tjxDM9PmTLQ==
X-CSE-MsgGUID: JBIyxKNvR2uB+rtTqshuoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; 
   d="scan'208";a="85469152"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Nov 2024 17:43:41 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9E2E-000qsg-2K;
	Fri, 08 Nov 2024 01:43:38 +0000
Date: Fri, 8 Nov 2024 09:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 03/11] bpf: shared BPF/native kfuncs
Message-ID: <202411080908.XHv8PmQG-lkp@intel.com>
References: <20241107175040.1659341-4-eddyz87@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107175040.1659341-4-eddyz87@gmail.com>

Hi Eduard,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/bpf-use-branch-predictions-in-opt_hard_wire_dead_code_branches/20241108-015243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20241107175040.1659341-4-eddyz87%40gmail.com
patch subject: [RFC bpf-next 03/11] bpf: shared BPF/native kfuncs
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241108/202411080908.XHv8PmQG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411080908.XHv8PmQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411080908.XHv8PmQG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'inlinable_kfuncs_init':
>> kernel/bpf/verifier.c:20910:46: warning: taking address of expression of type 'void'
   20910 |         return bpf_register_inlinable_kfuncs(&inlinable_kfuncs_data,
         |                                              ^
   kernel/bpf/verifier.c:20911:44: warning: taking address of expression of type 'void'
   20911 |                                            &inlinable_kfuncs_data_end - &inlinable_kfuncs_data);
         |                                            ^
   kernel/bpf/verifier.c:20911:73: warning: taking address of expression of type 'void'
   20911 |                                            &inlinable_kfuncs_data_end - &inlinable_kfuncs_data);
         |                                                                         ^
   /tmp/cccS126M.s: Assembler messages:
>> /tmp/cccS126M.s:12: Warning: ignoring changed section attributes for .data
   /tmp/cccS126M.s:15: Error: file not found: kernel/bpf/inlinable_kfuncs.bpf.linked.o


vim +/void +20910 kernel/bpf/verifier.c

 20907	
 20908	static int __init inlinable_kfuncs_init(void)
 20909	{
 20910		return bpf_register_inlinable_kfuncs(&inlinable_kfuncs_data,
 20911						   &inlinable_kfuncs_data_end - &inlinable_kfuncs_data);
 20912	}
 20913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
