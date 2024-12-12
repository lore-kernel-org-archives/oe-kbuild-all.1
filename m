Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955A314F136
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 04:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733976578; cv=none; b=qdLbt5uDVqq+bJ6mQdKFXAo5Q7MckkF0QAAYOQQppfHaXIbt/8PHqylkyo9yq2FyW179jjOer5sq4yK0uHsxzR9DN+4QGTYDMI3d7FqX+v1ejbDMhTU4/JEyaU05w4gK5Gi+vRL/oSzCGomzrgXxDSt21CIZfCF0hx5UO4+ELHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733976578; c=relaxed/simple;
	bh=S94zEF4v5WfdjAf/wekRkp4RAPDHX5LVO3K0oZQWCTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T09LDnI73uRfQxQw2goWbFptEmS8hW3iyRS9arTfUjfehlZi8EOlsRkibEbQEXdMv0/ioviKcWxlFXQHA4TiVnZwgR0qQPVS6QDJ1McwO7Kt0zUoh7/AGD3VmBHToB1OPadsodQK0LimLoUK/IUllLGNWb+60UFf7A1aKAJFq0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOIc8loE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOIc8loE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733976577; x=1765512577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S94zEF4v5WfdjAf/wekRkp4RAPDHX5LVO3K0oZQWCTs=;
  b=eOIc8loE2xBUtdWofFL7Ih2w6A8n0qY5Vd9s/0cMMItndXpr+fnDWNG4
   ELMNPw8BfMxFf5QaR2PdufuYgzUX0iaVGXG9kwKVQ0iEjl+Kxw+fH6wTI
   8XUevgb1Xc8dUwh+Ne4Kjs2RQ3JygC5U7N6J67okXxjd5PFesYrdp4sT8
   zmZuU/J4CcP5BPgonjedU+NjURiDUm7JIGAfLgL7X68zNd6g5yx3DYjVt
   zTDcFnszXW50btuNpxx8pUfLkIAlTnwK/et3n8zVVH0Q5H2K5KQ5fkH1u
   OOVCJGgEwFW6u8bmGdRfw33LzBdxlZG0ZpIqmI0ivE2qKOfS0rUuixHkL
   Q==;
X-CSE-ConnectionGUID: dwh4Zr/PRRynI5Ll82zZFg==
X-CSE-MsgGUID: cOFb6TSEQ3GTMl27VJaqdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34104667"
X-IronPort-AV: E=Sophos;i="6.12,227,1728975600"; 
   d="scan'208";a="34104667"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:09:34 -0800
X-CSE-ConnectionGUID: dNlsQ8kUQtuHkZajwtIhlg==
X-CSE-MsgGUID: EhLSh9YPTyeIVNpsv3291w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96892229"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Dec 2024 20:09:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLaW2-0007Q5-1R;
	Thu, 12 Dec 2024 04:09:30 +0000
Date: Thu, 12 Dec 2024 12:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 1/2] tsm: Add TVM Measurement Register Support
Message-ID: <202412121104.iMZhpjHW-lkp@intel.com>
References: <20241210-tsm-rtmr-v3-1-5997d4dbda73@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210-tsm-rtmr-v3-1-5997d4dbda73@intel.com>

Hi Cedric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-Add-TVM-Measurement-Register-Support/20241211-112420
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241210-tsm-rtmr-v3-1-5997d4dbda73%40intel.com
patch subject: [PATCH RFC v3 1/2] tsm: Add TVM Measurement Register Support
config: nios2-kismet-CONFIG_CRYPTO_HASH_INFO-CONFIG_TSM_REPORTS-0-0 (https://download.01.org/0day-ci/archive/20241212/202412121104.iMZhpjHW-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241212/202412121104.iMZhpjHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121104.iMZhpjHW-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_HASH_INFO when selected by TSM_REPORTS
   WARNING: unmet direct dependencies detected for CRYPTO_HASH_INFO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - TSM_REPORTS [=y] && VIRT_DRIVERS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
