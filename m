Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F36D299AAB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 13:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666465; cv=none; b=K9hvTX4/AfIweByha+L/+nhCcBRTv6dRd4jpdP8YNGsuTBEzcjCHwWLEZSjeCOToiRkoHTOcJPWe8Rkgiv41zm+i5Uga44mvLLnFND9hefUv16Hb+yyhO8Ctn85yDTCJmwydDZZSTvdrRhOwTd9D5KIYeVvqgfwp1G8CatQG8ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666465; c=relaxed/simple;
	bh=Og/seXszl87QbMeo551EbK+7UX2mVkhiRiurkhW6vqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eK7SGrBHZSEZ+3qEzpQonOh7dLaIuRdaCAm2M+3yzuuo1Z0hujICNcY33ISPskYoZpR/797Xl+FP9t9n5xc7eT+vw+n300OHNzUlDmMTeeiZkBkKWG9t91HlrdqX2jZC2clmdfLpepBhYd7PJf6epo65A2znSQyqqQd/cPjSFfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwEOsJ+A; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwEOsJ+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780666457; x=1812202457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Og/seXszl87QbMeo551EbK+7UX2mVkhiRiurkhW6vqY=;
  b=hwEOsJ+AuPJlOq3kYu0MWh1vwhyOwwtW588Y256BZJG+t8NoKAe/wzfC
   NtUIfSN2SfEsfANdQzvu0TAX9IsWlZCLxJPHtLWzLlzx7ZLi1rpoVwE20
   vEdfjH7ivE1BIrXQuV3q6hqfs9KG3NB/WO4V8G9ZjzyYg/1o+ErMWcSLV
   QFkARKPAd8KVUzi34c3MuRtnpIKRczYbXHF/K5Ge59YRhiZ9vnFx2xSLm
   tFR4ffWDdgh9kQ2wTYIb3vCPfmr9EtB26+DmrNmebscGqfQn6OQdGdsA7
   y34b3YtSpF4Cu5HmvvOl2Mp9D9Ou6Et4Yt2NaEEW992X2ukWsI950MN+l
   A==;
X-CSE-ConnectionGUID: 59vYViXeQU+i3g93unxPMA==
X-CSE-MsgGUID: r3ff16R3TX+wj7L5w1fcdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85350241"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="85350241"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 06:34:17 -0700
X-CSE-ConnectionGUID: eOh1WgpCT1m41tOOqj2ZQQ==
X-CSE-MsgGUID: im/xxLM1ShiIAB57PLl3yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="240656530"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jun 2026 06:34:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVUgf-000000002Zx-2ukp;
	Fri, 05 Jun 2026 13:34:13 +0000
Date: Fri, 5 Jun 2026 15:33:45 +0200
From: kernel test robot <lkp@intel.com>
To: "muliang.shou" <muliang.shou@sjtu.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/3] KVM: x86: add DSM APIC forwarding ioctls
Message-ID: <202606051510.JoensA0W-lkp@intel.com>
References: <20260605100031.834938-4-muliang.shou@sjtu.edu.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605100031.834938-4-muliang.shou@sjtu.edu.cn>

Hi muliang.shou,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvm/queue]
[also build test ERROR on kvm/next mst-vhost/linux-next linus/master v7.1-rc6 next-20260604]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/muliang-shou/KVM-x86-add-DSM-IRQ-forwarding-ABI-and-state/20260605-180536
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20260605100031.834938-4-muliang.shou%40sjtu.edu.cn
patch subject: [RFC PATCH v2 3/3] KVM: x86: add DSM APIC forwarding ioctls
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce: (https://download.01.org/0day-ci/archive/20260605/202606051510.JoensA0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051510.JoensA0W-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARN /zdci/src/lkp/lib/log.sh:131:in `log_warn': /opt/cross/rustc-1.96.0-bindgen-0.72.1 doesn't exist
     from /zdci/src/kernel-tests/lib/debug.sh:164: kbuild_log_warn
     from /zdci/src/kernel-tests/lib/kbuild.sh:3334: export_rust_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3324: export_compiler_path
     from /zdci/src/kernel-tests/lib/kbuild.sh:3803: invoke_make
     from /zdci/src/kernel-tests/lib/kbuild.sh:3985: make
     from /zdci/src/kernel-tests/common.sh:202: redirect_error_to_screen
     from /zdci/src/kernel-tests/common.sh:210: redirect_command_errors
     from /zdci/src/kernel-tests/lib/builder/headers.sh:34: builder_compile
     from /zdci/src/kernel-tests/bisect-test-build-error.sh:102: main
>> error: /kbuild/src/include/uapi/linux/kvm.h: leak CONFIG_KVM_DSM_IRQ_FORWARD to user-space
   make[3]: *** [/kbuild/src/scripts/Makefile.headersinst:63: usr/include/linux/kvm.h] Error 1
   make[3]: Target '__headers' not remade because of errors.
   make[2]: *** [/kbuild/src/Makefile:1473: headers] Error 2
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'headers' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'headers' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
