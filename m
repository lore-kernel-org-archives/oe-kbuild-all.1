Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9308219309C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765611858; cv=none; b=AhnHQw1hWQlowZWs573r5Ddi4cYvARgKrCdEPutDl7w4MDJOgniqSYRwc9d+RDfdVRN7ckDy2OKYmoW8mGnJuKJOOTwRhrx8pj9JdhwKnJJRjGvYo1qd2B29ZaWp0rEjeLxBfDpPJf+7R64zj+Vkg87LN9pMwDnfAFGHI6+MhkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765611858; c=relaxed/simple;
	bh=hWSwgJxFEmf3XGGlZRaifPhPNA6BuWalPgCQtah7Hhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9HyxnK7QTixLSmFpJfeyCgC22eV43DxM159I78n+UBv6ktkHtAp9jsoy2omfVUmmPjfzLkjeIpftc8zeAc0ARflWB1UvBjpDB3QTvpSQ1pSZ255sBEeHHd04ShFG7b4l3pv1cD92aW3KsXv+dZZ7IUz3LGw5U5z1m0+VEz2F4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wf1+M25c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wf1+M25c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765611856; x=1797147856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hWSwgJxFEmf3XGGlZRaifPhPNA6BuWalPgCQtah7Hhs=;
  b=Wf1+M25cJZZlhjmA1kiDwuKjVMU4DvWpW6R/uotIN0qF8yTLUVeDbult
   /XrmqLUz5n+QnHdqiefHd/DDCkTpFuMCuWkX2otzSKTIyUYyeFwnueUsl
   ivBWSSJCzIJDcj6f1KpmH2vJowUSjAjyv33jaxDlRNKS3s0S/igCOBMYQ
   HQ30Nn7WM7+DlpAx59eLpvDnYrYrH5mqGU2gVKvkhZ/PhzhcDDr9HqUrj
   AOCWg3ejBTSjPJvvAO9OxyCgLPNy0IMhncudckCeNQiz0IV6SrYWnOOxp
   jG3eEJLpbKjXWgEa8Sn3S6c51lFsrnBMI6S0UMrigtE9Ip1ePSilYtPsH
   Q==;
X-CSE-ConnectionGUID: s/ZXyzRXTV28QQe9Qx3CBw==
X-CSE-MsgGUID: 8GJ2B8dGQ+arhOTIgFjB1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="55168284"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="55168284"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 23:44:16 -0800
X-CSE-ConnectionGUID: wi+sapWvQvuU/Z2d8NM/VA==
X-CSE-MsgGUID: Fi+Z+WXGQVGZR90MmiBAvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="234670210"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 23:44:13 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUKIV-000000007FF-18hi;
	Sat, 13 Dec 2025 07:44:11 +0000
Date: Sat, 13 Dec 2025 15:43:27 +0800
From: kernel test robot <lkp@intel.com>
To: Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>,
	greybus-dev@lists.linaro.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Silicon Labs Kernel Team <linux-devel@silabs.com>,
	Damien =?iso-8859-1?Q?Ri=E9gel?= <damien.riegel@silabs.com>
Subject: Re: [PATCH 11/14] greybus: cpc: honour remote's RX window
Message-ID: <202512131514.ZjRwRWAm-lkp@intel.com>
References: <20251212161308.25678-12-damien.riegel@silabs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212161308.25678-12-damien.riegel@silabs.com>

Hi Damien,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Damien-Ri-gel/greybus-cpc-add-minimal-CPC-Host-Device-infrastructure/20251213-010308
base:   linus/master
patch link:    https://lore.kernel.org/r/20251212161308.25678-12-damien.riegel%40silabs.com
patch subject: [PATCH 11/14] greybus: cpc: honour remote's RX window
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251213/202512131514.ZjRwRWAm-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131514.ZjRwRWAm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131514.ZjRwRWAm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/greybus/cpc/header.c:115 function parameter 'wnd' not described in 'cpc_header_number_in_window'
>> Warning: drivers/greybus/cpc/header.c:115 function parameter 'wnd' not described in 'cpc_header_number_in_window'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
