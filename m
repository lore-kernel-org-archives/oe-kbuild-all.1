Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E670D3624AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 10:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560779; cv=none; b=uHFasKMqpwvxyEQ5DpMZBOFaa4Qi/CKvSnCxlNQyHh6AmUP+q3aaQ95B3cOA5bSN3Zff2dNtV08y52+ZcLa/sa0lKXXbeVDUIbCwdDFayyT8pD3uNkFh/R973BFsj+VB8Z/sMcfaQc8PLBVHMgx8roPmQv8m5Ad3xzSA9A6mShk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560779; c=relaxed/simple;
	bh=MC/ykmue0IcW8XhO83EtARdhecvsnSK5NlW0JjKyjj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enpCNytbS0Fx1ndlUKQHUcSvRJxn4SVbP8xvk+rQKtnC9lUHWRd48qXx8g9j+28sXUrr0bl0NtgMGANNULoNDX3xdU9i6wZ/xolr1W4DVUGJBev3t5CoD52f4zTwz+cu5ELUZ1Y5uE4u2sxudypuw2Lmrpa7eKto3zq9e5F7tEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyOqJ2V8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyOqJ2V8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768560777; x=1800096777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MC/ykmue0IcW8XhO83EtARdhecvsnSK5NlW0JjKyjj0=;
  b=GyOqJ2V8pRYa+jm+GUA9nC0wLMNJ3nq5gC18ntxIG6rpoYlw6skuKsh5
   sD+Q3qHaAQP9FZEMW2LJAtiOo2M1jPcuOetfzjxMRazEBPhh4DswFo6ws
   UjN9I0rm7cgAu9GIRqL1JvBA8PgDLkQ67hdD914xImK0aZDiMSTgm9iNJ
   ONVgm/NI4+1cnWum62s9FhOsuVdNzUtnpvXFF9hSAQY6X7cb+CXhbTf9l
   CJR2thURhhQON5cvMQ3Ajw09qZeZ2I4j9abaYbhZCMZL7/1hirGNPYsV7
   oCQ0/zKIMURIyPqXTCeHRSAAjcDKnLbvnHVhmK1K/n1OKjhYgyIwFmOy3
   g==;
X-CSE-ConnectionGUID: Vb57MnPETZ+j78S/KNDJag==
X-CSE-MsgGUID: Xm153lyxSNmOll6tEdyqzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69929108"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="69929108"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 02:52:56 -0800
X-CSE-ConnectionGUID: KdUWmkeAQg6/qyNbjKZO1w==
X-CSE-MsgGUID: sAw+k8I9SHOtlydYxsZpAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="228234251"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jan 2026 02:52:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vghRk-00000000Kjw-2EJn;
	Fri, 16 Jan 2026 10:52:52 +0000
Date: Fri, 16 Jan 2026 18:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: Pnina Feder <pnina.feder@mobileye.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7] panic: add panic_force_cpu= parameter to redirect
 panic to a specific CPU
Message-ID: <202601161825.pUmb6FsK-lkp@intel.com>
References: <20260115130552.3761679-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115130552.3761679-1-pnina.feder@mobileye.com>

Hi Pnina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc5 next-20260115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pnina-Feder/panic-add-panic_force_cpu-parameter-to-redirect-panic-to-a-specific-CPU/20260115-210634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260115130552.3761679-1-pnina.feder%40mobileye.com
patch subject: [PATCH v7] panic: add panic_force_cpu= parameter to redirect panic to a specific CPU
config: x86_64-randconfig-121-20260116 (https://download.01.org/0day-ci/archive/20260116/202601161825.pUmb6FsK-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161825.pUmb6FsK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161825.pUmb6FsK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/panic.c:305:10: sparse: sparse: symbol 'panic_redirect_cpu' was not declared. Should it be static?

vim +/panic_redirect_cpu +305 kernel/panic.c

   303	
   304	atomic_t panic_cpu = ATOMIC_INIT(PANIC_CPU_INVALID);
 > 305	atomic_t panic_redirect_cpu = ATOMIC_INIT(PANIC_CPU_INVALID);
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
