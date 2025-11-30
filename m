Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720312F85B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 05:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764481548; cv=none; b=VVySrU4W0Itzc5sXQtQLpQli1h9lsef1I11dZNat4ij4FaIOkaK2CQD+NXhqcqRFCH5pOJBRZwGYDf6M4O5XxFB3Fif7M3afpIhDpEvz7dzLgaG2U3WHWzY56Cq6WZTIbLLIWUWwqMgxFCEk4a1q16g2njVMFlU6xYtx5DyQKxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764481548; c=relaxed/simple;
	bh=A/JPaO2nEBsqIB7KNCLyenMRiK9XRjozLhOLwOFwyFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmSJzVcWMdssI4mqtq79ZLw+KLnyvZIAIGAAJ3g28TZL/OL9yz8kn/qNBlNjEChsh84n9aW9EM8GhYcZl1f7WM8AXv4sdspSyq+mId6u5pAd7zP9Bvk76bEgOoevX5Ld5tbpD6Ks+ZfyLGJmpcZ6kRrRh7iuO22gLMYdzWTMGuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeS5PkWh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeS5PkWh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764481546; x=1796017546;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A/JPaO2nEBsqIB7KNCLyenMRiK9XRjozLhOLwOFwyFw=;
  b=QeS5PkWh4+PzxqRwPhLKN3C73bNWuSSu/sGVJjC31Fpu+xPmPSzsjOxD
   88uvlgeC+cN1rIC+hVnLxJjst5JlBs8HLHu/7rujFTVsny3pP2+ZbYhTB
   qQicvWlEB4wf/mpjKwbXy1mOW+U36NJGuc29fXOdf+hC8Bheeu1l2EkVP
   j7kq//P9psU1l4G88AShJBlcRDNYEAmo3WKIEcHMlQTDkzA4pM6sQmXj9
   FgA0voZrqXneFIqs61ZWaL0/DkUmtYdKdHdh36MCICmYzVtAphe9LC0b4
   s/C7JwQHN3PArqKMjwDGML+ndCxyl1AZM+m6QYWrhyepC7NiqQSoMsB0C
   g==;
X-CSE-ConnectionGUID: JsTBh7qvQRuKgAko9Nvozw==
X-CSE-MsgGUID: hgORHrjNRd6YLxiV3BfqRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="77130335"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="77130335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 21:45:46 -0800
X-CSE-ConnectionGUID: uKtxwnMQRTaa4VzGypAjwA==
X-CSE-MsgGUID: h7VhR1pIQomNm8MFojiO5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="193676202"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Nov 2025 21:45:45 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPaFi-000000007nx-2Z0N;
	Sun, 30 Nov 2025 05:45:42 +0000
Date: Sun, 30 Nov 2025 13:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jniethe@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/6] mm: Remove device private pages from the
 physical address space
Message-ID: <202511301318.tOHrIPGS-lkp@intel.com>
References: <20251128044146.80050-7-jniethe@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128044146.80050-7-jniethe@nvidia.com>

Hi Jordan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e1afacb68573c3cd0a3785c6b0508876cd3423bc]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Niethe/mm-hmm-Add-flag-to-track-device-private-PFNs/20251128-124406
base:   e1afacb68573c3cd0a3785c6b0508876cd3423bc
patch link:    https://lore.kernel.org/r/20251128044146.80050-7-jniethe%40nvidia.com
patch subject: [RFC PATCH 6/6] mm: Remove device private pages from the physical address space
config: powerpc64-randconfig-002-20251129 (https://download.01.org/0day-ci/archive/20251130/202511301318.tOHrIPGS-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301318.tOHrIPGS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301318.tOHrIPGS-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `device_private_offset_to_page'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: mm/vmscan.o: in function `lru_gen_look_around':
>> vmscan.c:(.text+0x11960): undefined reference to `device_private_offset_to_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
