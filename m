Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC63F31B805
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 12:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764072461; cv=none; b=Y3/+qPWTdrhp7muVBJCw/twWgh/5XAvvWImN6lTFy/SYPklZYCbXYTAX0wxKHwr0BUI1w1zMm7czUoiViBPo/RpVXCR5lCol9ZG/uI10LkCFC/jnhUGRFPGlnOgDfYwPJFHngf7YgkUGXICwqwBbwHG4jquiM1i+u70uORlDT1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764072461; c=relaxed/simple;
	bh=HUS/hr9rsdoWkE1iQlqgvgKg8CJAzkBfucNFF0L6nxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gIRp+xErqmpaCtBcpEASWjHpePEi9DcBxrDW8+98tLg0txG5m/dhbkh8IcS6iB37GSc6eh+/Jr40I8rRDwomsm+rsGLwP4uqspDz33x1E+md+qzkEhNkmJCNuA6vMnSifEWQdlv40su/e9O6mo8Al9ZCic2Mg75AmDISpPD0880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFsbLPaV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFsbLPaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764072460; x=1795608460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HUS/hr9rsdoWkE1iQlqgvgKg8CJAzkBfucNFF0L6nxQ=;
  b=HFsbLPaVEYU4eJjfK6CrkMD/KYUYbocz89x0nwOXyBt8rfJjdHQHU3dj
   Rkp0HGDHRBrYKKss/h7YZ80UDjt5cMt+De/GpZyTUKik0t2NYzuYTmnlZ
   bh1FLR0vOl/pOKPc8KvXZcBNxwgaY/6ygvSCwYohKte4zqIklcb145jtY
   +aj4TDgurGRu77B5ezlHg0TzNfYWag/owR1yJoUWHHhYX5UuNJ4rYOkjj
   8uACz/KnZTS2UMQlmMh227icpoIhSkpt2FQ3GwassBfp9Vn8KdKSTWlPp
   mfatwqhtr9OxsA6WvvpNpTr/Er4ICf/4dkN/e1/reFGEIjmFs10u2poFw
   w==;
X-CSE-ConnectionGUID: FJn1TPvRT/KKoZM0k0Ysmw==
X-CSE-MsgGUID: bnvaDTXtTyOYE/41izoi6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="76711206"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="76711206"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 04:07:39 -0800
X-CSE-ConnectionGUID: wexZ6oseTpmjaSmPZZY6qQ==
X-CSE-MsgGUID: W8gUzuhESsusJd2JbHwFhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="192617431"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2025 04:07:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNrpX-000000001lE-3hTa;
	Tue, 25 Nov 2025 12:07:35 +0000
Date: Tue, 25 Nov 2025 20:06:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:stack_magic 31/31] include/linux/tracing.h:168:8: error:
 extra tokens at end of #endif directive
Message-ID: <202511251955.fqALPBb8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux stack_magic
head:   4ebcb9cdc941dc900a8ea9e08e8ad58799a8c5aa
commit: 4ebcb9cdc941dc900a8ea9e08e8ad58799a8c5aa [31/31] add tracing.h
config: powerpc-randconfig-001-20251125 (https://download.01.org/0day-ci/archive/20251125/202511251955.fqALPBb8-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251955.fqALPBb8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511251955.fqALPBb8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:18:
   In file included from include/linux/kmod.h:9:
   In file included from include/linux/umh.h:4:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from arch/powerpc/include/asm/preempt.h:5:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/powerpc/include/asm/thread_info.h:13:
   In file included from arch/powerpc/include/asm/page.h:11:
   In file included from include/linux/kernel.h:34:
>> include/linux/tracing.h:168:8: error: extra tokens at end of #endif directive [-Werror,-Wextra-tokens]
     168 | #endif _/* _LINUX_TRACING_H */
         |        ^
         |        //
   1 error generated.


vim +168 include/linux/tracing.h

   167	
 > 168	#endif _/* _LINUX_TRACING_H */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
