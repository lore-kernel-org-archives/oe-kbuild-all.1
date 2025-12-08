Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F772D5926
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765185069; cv=none; b=RotwUEn+Jo6IKhWi+C63XfbXqiaRSw606SHxthTAcv4BQh4YhEQlde/xq8LHc8mwAor3LiJiFDGDkqcvKxAiuPGXJj+JfRoD0LlhuOIt3i03BtxW7O1qfwKH61OFj602gY6rOWxdelSnYcreaS3oYpsZF3lFEsHCjQP1ZW24QU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765185069; c=relaxed/simple;
	bh=eZojN0vkMjW4Juj3RaGsDhGUJqQz4dLXgxvQGKXPR3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/jVatieII0SJX/RyZtOj7zHLcEJRudv+6HHUfCGmxNtZ6LV504SvA7yzWLEqn6ahHZ40DdDZrKQPg9rAldkgs4jsbJ1Ad2PRllhsw+O7jjtOqmIbi0czJEKp4ngHbrzRzMRQeXlzcVWLhFCP2PNOaJ/9t31AqPfTlmUmNoe8IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XleXx+fa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XleXx+fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765185064; x=1796721064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eZojN0vkMjW4Juj3RaGsDhGUJqQz4dLXgxvQGKXPR3k=;
  b=XleXx+fax2DUyho0xAct/DgW0vADFK+gcUje2ga02VstVgJS7Kbhrwkg
   Op+kZ/KiAQ3v4Xzyy5GlrwtU2zgKTcXq8R/+qioP9a/Kmgm8sXfvAk0qM
   SXobVYtVdTJG1kRPEBPBDNYu/gB/a7mSM8Z6qVy+anxYj+9OJ5sxT+zof
   yQCCMlW2VYcLhnk+v0ICMz36R4XPhvtL8a0elixhsp5u13G7ksPJJ1Mga
   sik+BggKc38CEi+hsrYIrZEuYrZvDD/DTi6l+LUAA52idnC0x6m7ftMMv
   GxQMh1e69UZp9H1ltYM9cljg1u60v85cz1eIk0EiZWmIBXYxu2obeuDJH
   Q==;
X-CSE-ConnectionGUID: T7JQCKwkScWtRJ3DKt3UCQ==
X-CSE-MsgGUID: 5MP/Q4FVRySD7HEms6ze3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="84530513"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="84530513"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:11:03 -0800
X-CSE-ConnectionGUID: DmACHM3qTyiNpf6wMgPT2w==
X-CSE-MsgGUID: 8ZhtVbnWSFuQbvNEuNASjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="200326952"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 01:11:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSXGl-0000000003N-2zJZ;
	Mon, 08 Dec 2025 09:10:59 +0000
Date: Mon, 8 Dec 2025 17:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 2/3] huge_memory: skip warning if min order and folio
 order are same in split
Message-ID: <202512081608.jhYBOeBM-lkp@intel.com>
References: <20251206030858.1418814-3-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206030858.1418814-3-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on e4c4d9892021888be6d874ec1be307e80382f431]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/filemap-set-max-order-to-be-min-order-if-THP-is-disabled/20251206-111142
base:   e4c4d9892021888be6d874ec1be307e80382f431
patch link:    https://lore.kernel.org/r/20251206030858.1418814-3-p.raghav%40samsung.com
patch subject: [RFC v2 2/3] huge_memory: skip warning if min order and folio order are same in split
config: sh-randconfig-r071-20251208 (https://download.01.org/0day-ci/archive/20251208/202512081608.jhYBOeBM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251208/202512081608.jhYBOeBM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512081608.jhYBOeBM-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: mm/truncate.o: in function `truncate_inode_partial_folio':
>> truncate.c:(.text+0xf84): undefined reference to `try_folio_split_to_order'
>> sh4-linux-ld: truncate.c:(.text+0x11f0): undefined reference to `try_folio_split_to_order'
   sh4-linux-ld: mm/vmscan.o: in function `shrink_folio_list.constprop.0':
>> vmscan.c:(.text+0x4fe0): undefined reference to `split_folio_to_list'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
