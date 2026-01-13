Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD0123D294
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 02:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768270707; cv=none; b=Undpyj5qTyCwgUzV25F2VN6mAqETreHnrqkBHXStYnmXXhRxOwMwtoRTg9CZ1ghW9+Rif7OlryhLqVTViHfo73OqTIfG59w4bf00U5yQgpa7i56Blg+KT2pwegOazGvfei37s1aKt1Sh/pIgqSyrze/zJOwQWYUwRdgCL6DY16k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768270707; c=relaxed/simple;
	bh=Yec0sfDxBI6Ht33ZuzbnIrm9kfnOv8pNuShawqEPPNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6peBeWtJK0hzokUxtcY9peWDImR2RnjuuRIwtyJolJxDK0Ja813r7Xv5VEEm0mu5mjEqn5julyTkoql8taXyP2zVLLY1CRjoctV2n5E0p5C811J3TAEVoC5n6InjWFdy7P69TUwNOdEncGfbIRnacEAtu2cCGP1HpuMcskOhQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BRlYBS5z; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BRlYBS5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768270706; x=1799806706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Yec0sfDxBI6Ht33ZuzbnIrm9kfnOv8pNuShawqEPPNo=;
  b=BRlYBS5zFQC+I5CjMfOb3uZ5CLW1q/xpdTCKF1IgD3A01I8gt6i3afA8
   zEdW90aDpXmpUsJpCabeQ3BmpGXqYAFLg0JUNE6NvCCYvTJz9cliUrM6W
   v/wvMy77d31DSiIgwFsFK0U9hhSKC2aRCdw9bLZxrz4y7CJWVnTyDbM6t
   yGR98PrEPQg8fKT99V/2XhtBmwlSNghbD1kGc6dFYdFtQIffBaoMRu0+w
   De/khbqAqZlIdFedfpq8JtMO+954KZDK5fwQGfMBpof6NS2SpIdLiqT6/
   bQ+TU2yhZR7Ahp5fPLIt10vaZPVMlQg4IYtNblSpjs8Nl5KrXZCW/XcxJ
   w==;
X-CSE-ConnectionGUID: +sN/Bky6QQe2W/cE5EO6DA==
X-CSE-MsgGUID: 9cgLCoepQOSJGzi/emBB9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73184125"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73184125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 18:18:25 -0800
X-CSE-ConnectionGUID: wNJWnrmuQbep4LDKovdUiQ==
X-CSE-MsgGUID: sb3tkOFtS0Gig7MufspTXg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jan 2026 18:18:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfTz6-00000000E68-3fEh;
	Tue, 13 Jan 2026 02:18:16 +0000
Date: Tue, 13 Jan 2026 10:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ethan Graham <ethan.w.s.graham@gmail.com>, glider@google.com
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	andreyknvl@gmail.com, andy@kernel.org, andy.shevchenko@gmail.com,
	brauner@kernel.org, brendan.higgins@linux.dev, davem@davemloft.net,
	davidgow@google.com, dhowells@redhat.com, dvyukov@google.com,
	ebiggers@kernel.org, elver@google.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, ignat@cloudflare.com, jack@suse.cz,
	jannh@google.com, johannes@sipsolutions.net,
	kasan-dev@googlegroups.com, kees@kernel.org,
	kunit-dev@googlegroups.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lukas@wunner.de,
	mcgrof@kernel.org, rmoar@google.com, shuah@kernel.org
Subject: Re: [PATCH v4 4/6] kfuzztest: add KFuzzTest sample fuzz targets
Message-ID: <202601130828.lXrl0Ijb-lkp@intel.com>
References: <20260112192827.25989-5-ethan.w.s.graham@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112192827.25989-5-ethan.w.s.graham@gmail.com>

Hi Ethan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ethan-Graham/kfuzztest-add-user-facing-API-and-data-structures/20260113-033045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20260112192827.25989-5-ethan.w.s.graham%40gmail.com
patch subject: [PATCH v4 4/6] kfuzztest: add KFuzzTest sample fuzz targets
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601130828.lXrl0Ijb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130828.lXrl0Ijb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130828.lXrl0Ijb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: samples/kfuzztest/underflow_on_buffer.c:24 function parameter 'buf' not described in 'underflow_on_buffer'
>> Warning: samples/kfuzztest/underflow_on_buffer.c:24 function parameter 'buflen' not described in 'underflow_on_buffer'
>> Warning: samples/kfuzztest/underflow_on_buffer.c:24 expecting prototype for test_underflow_on_buffer(). Prototype was for underflow_on_buffer() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
