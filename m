Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6805A1B4223
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 13:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712093; cv=none; b=fzkk1TVRYhjuNGbbVxHjoX4H4UiI0gKiSQkkPFl/38qUAhNIBDIczwB0Y4wzND3hGlHpuNV1S/3fhn3eF2qnR9VpppJ8ha8eIyyezd3VwHK9NemuButybRr6A0FmWq3aO6j6uP7jWnYGCrHQjTdTpSlw5mvNulqs+VzoTTvC7sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712093; c=relaxed/simple;
	bh=5sQLg0yw79YY5uG2rWcvrLj4PN8H6cmyNSmMifbR/gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4ZEE84UhTPcZF4g2eSfYlMwp5FWRb35gWxXCA92FCURwqyN6iLezdnQDU7mUMN+anU29t6KHR1w1kqqGKGET96oWGxva/vdM2e3zPFAChu/I3jLbVwrkd/vnYGxMY56pV8cpwd4HtLfR2l0D8CbktH0utRNkRKKw6pZBnw7kEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlvZxYGd; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlvZxYGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746712091; x=1778248091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5sQLg0yw79YY5uG2rWcvrLj4PN8H6cmyNSmMifbR/gA=;
  b=QlvZxYGdhENMr1ZQqD0dJVNAfylleRrutwii5nAbV/sQIlqiOEt+NE22
   fAQb34IEVfmElU7wBgh/f3lGoMHtfcQdPfRwHS/MrLPaRIPdLmwc+rFhc
   i8lA6z0yKyW3FFUqJttNemyfgHNMtUhaC+ySdhnf/ubfy+fq4itT93/FF
   Y4DXPtY7+RroOVMFzK+pZnvoARjmkSnXUo6Z0JsrDr129buiPQvt22qtp
   FCCSXH7EJuIP30fXjom3JZj5hrU+dQfVKrhMqsGgqbgYGqYYmUKG0k/xn
   cfuJpoO+Lh+iDOARv8Es8uPtbQ6+oglPfzFYrMoZUHrpoMPmL7yMCZFCX
   w==;
X-CSE-ConnectionGUID: 6WIEJktmSVCv01IJxz/rtA==
X-CSE-MsgGUID: ODBnTkJjQbWgjpH81fkiDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="58702439"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="58702439"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 06:48:08 -0700
X-CSE-ConnectionGUID: uhrGmN0+RDu42gDKlFRNEw==
X-CSE-MsgGUID: ZVLU34/OR1mg5YBc+aGZ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="137229264"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 May 2025 06:48:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD1bU-000B0p-36;
	Thu, 08 May 2025 13:48:00 +0000
Date: Thu, 8 May 2025 21:47:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/3] arm64/boot: Disallow BSS exports to startup code
Message-ID: <202505082115.dGm5jsxN-lkp@intel.com>
References: <20250508114328.2460610-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508114328.2460610-8-ardb+git@google.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on 363cd2b81cfdf706bbfc9ec78db000c9b1ecc552]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/arm64-boot-Move-init_pgdir-and-init_idmap_pgdir-into-__pi_-namespace/20250508-194513
base:   363cd2b81cfdf706bbfc9ec78db000c9b1ecc552
patch link:    https://lore.kernel.org/r/20250508114328.2460610-8-ardb%2Bgit%40google.com
patch subject: [PATCH v2 3/3] arm64/boot: Disallow BSS exports to startup code
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250508/202505082115.dGm5jsxN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505082115.dGm5jsxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082115.dGm5jsxN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld:./arch/arm64/kernel/vmlinux.lds:163: undefined symbol `memstart_offset_seed' referenced in expression

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
