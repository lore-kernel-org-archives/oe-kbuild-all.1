Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4AA2367BA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486942; cv=none; b=KgAAPu276mM/yBmZaeIfKxKm55na06DLAsRDmqIeup91mqdtumx4iY9Iz4wCUkqu8Z5q+s2qsNOfxyXmPYKaH39E4rrjbEU7v9pIaMF06tVcvcnxYYJEG8pblTdhTNz8sJtrVORbH9u+K7u7DhpqMIFznSlxf3z8oVidVFUEKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486942; c=relaxed/simple;
	bh=DjoTKPypUbKAhaCLYCvGsjBqSJWYzFZyfsFdQ5U51GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKB2kvB/eZ7LW51Ws/Z8PeJZEsfgrAxberRN2UD0wjueFKwXWwe9tOYka1WUDH8lmCAuzUJg3Hu9z/WRN39s6iQciurVEjznVNaQ00il2BRE8OWiKwhAsZnGL4q18PKtatOympRTUMITigs76FDSJVXMu9MggzPXH1JN99PUJkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOrGAkS/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOrGAkS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763486941; x=1795022941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DjoTKPypUbKAhaCLYCvGsjBqSJWYzFZyfsFdQ5U51GE=;
  b=QOrGAkS/ZMhJsqzDlARS34vCC15W94GLMxO8bjqC3eEmC16quYuXA3eh
   e0lcs4NyCruHMkVvuQ2niJgvf+686L+LmjE5g+79QMC1Z1TFXoPlUTW9E
   MHsFWSf4vInmgjsbjYYsvHYp1a78gnem5iIsK8Mu1eQwpLiRqz3juDjFa
   oCGz4l5dcnPqjC8+LmUEZECcs8jxZcN8JCyM1BNvZi4giaG/15MNbax4I
   997rqUbkh9OVggaHydKzKHDgnw71KwltqevOQwG7ea054flxGYRJDT6iZ
   +IMT2Y22nNaYN1P5PfwhNDgH5uwUuWKOelmUbUYJRsF8Cc3YzWm1k0whU
   w==;
X-CSE-ConnectionGUID: v1oLdvypSQCGhXWHYKiPFw==
X-CSE-MsgGUID: M86XcFSVSHOFEzt3wPTATQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76122599"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76122599"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 09:29:00 -0800
X-CSE-ConnectionGUID: mgUjNBR4Q3W+bYGk+HGHvg==
X-CSE-MsgGUID: sLRcAegrRdumjyP5GK6nAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="214207806"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Nov 2025 09:28:57 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLPVd-0001zv-0P;
	Tue, 18 Nov 2025 17:28:53 +0000
Date: Wed, 19 Nov 2025 01:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Daniel Hodges <git@danielhodges.dev>
Subject: Re: [PATCH bpf-next 3/4] bpf: Add ECDSA signature verification kfuncs
Message-ID: <202511190147.y9V59VgY-lkp@intel.com>
References: <20251117211413.1394-4-git@danielhodges.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117211413.1394-4-git@danielhodges.dev>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Hodges/bpf-Add-SHA-hash-kfuncs-for-cryptographic-hashing/20251118-051958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251117211413.1394-4-git%40danielhodges.dev
patch subject: [PATCH bpf-next 3/4] bpf: Add ECDSA signature verification kfuncs
config: openrisc-randconfig-r133-20251118 (https://download.01.org/0day-ci/archive/20251119/202511190147.y9V59VgY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190147.y9V59VgY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190147.y9V59VgY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/crypto.c:607:34: sparse: sparse: symbol 'bpf_ecdsa_ctx_acquire' was not declared. Should it be static?

vim +/bpf_ecdsa_ctx_acquire +607 kernel/bpf/crypto.c

   606	
 > 607	__bpf_kfunc struct bpf_ecdsa_ctx *
   608	bpf_ecdsa_ctx_acquire(struct bpf_ecdsa_ctx *ctx)
   609	{
   610		if (!refcount_inc_not_zero(&ctx->usage))
   611			return NULL;
   612		return ctx;
   613	}
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
