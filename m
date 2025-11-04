Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690873376A1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275326; cv=none; b=Vny2Z0k3FVQmfMiCcPqTZN/DEYdZj5ZRytJm1fnw5g1eNfcrJnYHkJem6X5HUgnqfyTWleTVPmKbqEbVCWC3eu39jD4HAab/ftR3RkC2AWJLJ6WYI/eulzQFeeKYLpM0S/TsJXd3KgwamOXombN9joyw8lMjL4AjvE945tsotoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275326; c=relaxed/simple;
	bh=h4qMwhmCjyBgjzkiOJpSKNN3Urkhg1wWPrlzoBGlBvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMyFZk3bK3jyFAywSdyBoE9SDqfgb5Jf34G6j9A4pOiw4UERxR880a8Gbj89kaehPDb2Yj+LjPKpFWmdEcbtPQNjghCdAQYvwCGHgp9HpkMpDvZsHP/M8F2ZFCBO0ysk79cOeISMK+V2ipZ3uxC3kjFAq2SggngysOK1ot8Dyz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h0cRA4DW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h0cRA4DW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762275324; x=1793811324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h4qMwhmCjyBgjzkiOJpSKNN3Urkhg1wWPrlzoBGlBvk=;
  b=h0cRA4DW36xhG0lMyodPXZQluETbVbG5O/gkwBhCvEw3j2b5Ps999mQJ
   56gk+YtPeaNf+O4YWE5cSh1f7mzbflWeUYRkYvmSkK2yKL+LdPtE86sUf
   5xuoFSF30aGvCWVJ8qTN/ObuPMCaj6fLeIc3d3nz8bqfskczBnShAF2m6
   uvIZy0NJIIoCwp+lI+BWEsx/sLK/il4ZZAVoVs9R4skvS5IG0kBc/BZ0n
   TvbvTY9CjWcrIC6voCMKqzdYdaZedTQtPl+LEXVp1UbwmjHV6qRaMefqW
   +xwAyKLFBtdmQi5jTbyy5CIuoMu2Rbx7w66UIZZXILc04fZnw9O7w8yTP
   A==;
X-CSE-ConnectionGUID: phff3KVTRTip2/WgX6d7Cg==
X-CSE-MsgGUID: Aln9v03BSqe9GPE1nBpD6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="81782724"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="81782724"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 08:55:09 -0800
X-CSE-ConnectionGUID: 9Apf83RRTYyLYZB+cRbBZA==
X-CSE-MsgGUID: fCYQ4I1KRdukYfSUq2F9vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="217860585"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2025 08:55:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGKI4-000Rd8-2i;
	Tue, 04 Nov 2025 16:54:13 +0000
Date: Wed, 5 Nov 2025 00:52:35 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Richter <rrichter@amd.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gregory Price <gourry@gourry.net>,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Robert Richter <rrichter@amd.com>
Subject: Re: [PATCH v4 04/14] cxl/region: Add @hpa_range argument to function
 cxl_calc_interleave_pos()
Message-ID: <202511050027.jKrGgaFu-lkp@intel.com>
References: <20251103184804.509762-5-rrichter@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103184804.509762-5-rrichter@amd.com>

Hi Robert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 211ddde0823f1442e4ad052a2f30f050145ccada]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Richter/cxl-region-Store-root-decoder-in-struct-cxl_region/20251104-025351
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251103184804.509762-5-rrichter%40amd.com
patch subject: [PATCH v4 04/14] cxl/region: Add @hpa_range argument to function cxl_calc_interleave_pos()
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20251105/202511050027.jKrGgaFu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050027.jKrGgaFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050027.jKrGgaFu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/cxl/core/region.c:1849 function parameter 'hpa_range' not described in 'cxl_calc_interleave_pos'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
