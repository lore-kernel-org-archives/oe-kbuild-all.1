Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC91CDA12
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730498345; cv=none; b=mMq5Xlbc4z0q6fJ8TGaQ/lZQdU9e91g4xPC2lSfG80m+MNPmiOm7f/Zzk9nNSc1GleEoVYAm+1Nr3CMOf24+Pt3N6wbzCimd3Ocg7SE2vIvZs7Sn+F+bxX7POX73+3XhO15KfrOroMT94zMXmLVCEmwREpMdDce9kbPRIPzaJuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730498345; c=relaxed/simple;
	bh=sRgGT4bKa97AuqAPQt8fVuaf+fsaOTBFSOd/+FmmX9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8Z/SEZHy2oEc/96ZrKH80wRtA90Uu9LdwyRt4KUCL6f4J5tME/QyhYdh2Re+A5TdO/0xktJQcJU5Ap9nmQVRHNS0dovt+cLWQgkXcAXQUNN+WdomDblTn4Wegdi+hWIpr6AB6QicnkeMVXOkE6e00j5pWMdOT2Lt0oBIDiC0Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIQKNl2s; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIQKNl2s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730498344; x=1762034344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sRgGT4bKa97AuqAPQt8fVuaf+fsaOTBFSOd/+FmmX9U=;
  b=BIQKNl2s66k2cdBnpfNUTmuciXFeBMvWgOX/3DmWYKlZ3bX/wBRnsfxt
   Aj8bxqQz0E51btz7bKR2+8awFZTAYRBqbQEkeIHdNpggqkUZR7LD3CEuU
   kBOgNW5wOyivBsx3I9lEPh4XDB4btpb4Iikx+OmY4BdwsR6ybQNtVj/X2
   sr4f4ioEvEuv6h2lxgWgZ9Go/N1vctLiQJr0W7M54qwUeQQrEmaxHVPiL
   +NupLm7egUwiVIB9v7ySOJnWjlL/Rh4meeHzNjhppfbtS5Pi1tpFcoc3/
   Dq63PXqgttRQ7HwoVzUWMhKANa6juXv+MPcBy+vLdb4ZRNqDam6zzvUG1
   g==;
X-CSE-ConnectionGUID: gWE+Aw+KSuKHD+CERhcjrA==
X-CSE-MsgGUID: JK8e7n5vSNaevRE5bLQCiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="29702703"
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="29702703"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 14:59:03 -0700
X-CSE-ConnectionGUID: N2zPiAwcSAmSw0vOAk0QyQ==
X-CSE-MsgGUID: zAYSpqWGSeWK6MvC7EWUHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="88214801"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Nov 2024 14:59:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6zfX-000i5j-1P;
	Fri, 01 Nov 2024 21:58:59 +0000
Date: Sat, 2 Nov 2024 05:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/2] tsm: Add TVM Measurement Register Support
Message-ID: <202411020504.wcfn7HLP-lkp@intel.com>
References: <20241031-tsm-rtmr-v2-1-1a6762795911@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031-tsm-rtmr-v2-1-1a6762795911@intel.com>

Hi Cedric,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 81983758430957d9a5cb3333fe324fd70cf63e7e]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-Add-TVM-Measurement-Register-Support/20241101-005324
base:   81983758430957d9a5cb3333fe324fd70cf63e7e
patch link:    https://lore.kernel.org/r/20241031-tsm-rtmr-v2-1-1a6762795911%40intel.com
patch subject: [PATCH RFC v2 1/2] tsm: Add TVM Measurement Register Support
config: i386-kismet-CONFIG_CRYPTO_HASH_INFO-CONFIG_TSM_REPORTS-0-0 (https://download.01.org/0day-ci/archive/20241102/202411020504.wcfn7HLP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241102/202411020504.wcfn7HLP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020504.wcfn7HLP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_HASH_INFO when selected by TSM_REPORTS
   WARNING: unmet direct dependencies detected for CRYPTO_HASH_INFO
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - TSM_REPORTS [=y] && VIRT_DRIVERS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
