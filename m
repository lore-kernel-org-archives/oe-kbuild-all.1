Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5852BB13
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 03:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791169438; cv=none; b=tCx3/Ga+eV3djfWwtR3dbwYP8WI5REWtsEMSedLL1FHhvuHcu+YZe26z5OMSSeSs9GaS8a5EaTVM4P6pdyu9r+wiagShQ1KZjrptV+TzkirVXdZ4ntL9llegGDcUXzk8VUjCdpzba+hZ7o6Cw5Ij1arBwtQP8N7p28zWZOOMgrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791169438; c=relaxed/simple;
	bh=1PBFiHARryda2mkSd1WR5ic8ijCe5i1AmRfDP6eBb3M=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNIj0//TBGa+VOt3cg4N3DIwwXlHLf5t+oqVSROZ4xzK1rq+V8ME3OJhnDb7kXAWppspSO436hLEGz/ATrsDzIXePStEv/6qddb8osY+gEHinKaiYcavcZL7trrLU0rl8LVj+1VhcW5/wKspkskzWXFfFmT5h2gqtVjpyvzhZwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kihrwa+g; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kihrwa+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791169437; x=1822705437;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=1PBFiHARryda2mkSd1WR5ic8ijCe5i1AmRfDP6eBb3M=;
  b=kihrwa+gzHg6UpGmknMGIWxJ4+PWSdl/TRLvpV/I8Am2EolSoW1GaNW2
   AKC6G9TW1zeZvx18bHp2VffgJa4oB5YZbWcwvH+xDrVFug0oEcvwDxuP5
   +AboV6GFnZTXM3CJGYhNh0G3Uh6JTbOj0nvAIQnSZIXCkubYJXH204CN6
   GiWqvK65ygh+0PWFn2o1HbcbI4kAE4UQa4ZJ7zWi0E6fxB+t5W9Mit43w
   y5tJj73X/0jcxi4WFTqnwBFrXMZn6Cd2HT5hXfLP+kBAEDeU3faNdVFGt
   C5bxGBF8sifRBdT3myltbMNpmqHB8J1TbbKn/6a3OFetfzSVKXFij5RYG
   g==;
X-CSE-ConnectionGUID: puH2W3YaQGmRa2g6cRc3ug==
X-CSE-MsgGUID: /Hm9i8eSSBuLaApCbDixAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109322833"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="109322833"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 20:03:56 -0700
X-CSE-ConnectionGUID: rfBG9UoeSP6LdXkPHrM/BQ==
X-CSE-MsgGUID: l3UaNtz1Q+y/r0b4atrtxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="304659052"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Oct 2026 20:03:53 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDYzX-00000000VGv-10G5
	for oe-kbuild-all@lists.linux.dev;
	Mon, 05 Oct 2026 03:03:51 +0000
Date: Mon, 5 Oct 2026 11:02:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: mm: Add KUNIT test for ptval_bytes_to_hex_str()
Message-ID: <202610051023.Q5uEqVVF-lkp@intel.com>
References: <202610051023.Q5uEqVVF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610051023.Q5uEqVVF-lkp@intel.com>

Hi Anshuman,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-Add-KUNIT-test-for-ptval_bytes_to_hex_str/20260929-173530
base:   
patch link:    https://lore.kernel.org/r/202610051023.Q5uEqVVF-lkp%40intel.com
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20261005/202610051023.Q5uEqVVF-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051023.Q5uEqVVF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051023.Q5uEqVVF-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: mm/tests/ptval_hex_string_kunit.o: in function `ptval_hex_str_u64':
>> ptval_hex_string_kunit.c:(.text.ptval_hex_str_u64+0x64): undefined reference to `kunit_binary_str_assert_format'
>> mips-linux-ld: ptval_hex_string_kunit.c:(.text.ptval_hex_str_u64+0x7c): undefined reference to `kunit_binary_str_assert_format'
>> mips-linux-ld: ptval_hex_string_kunit.c:(.text.ptval_hex_str_u64+0x1a4): undefined reference to `__kunit_do_failed_assertion'
   mips-linux-ld: mm/tests/ptval_hex_string_kunit.o: in function `ptval_hex_str_u32':
>> ptval_hex_string_kunit.c:(.text.ptval_hex_str_u32+0x64): undefined reference to `kunit_binary_str_assert_format'
>> mips-linux-ld: ptval_hex_string_kunit.c:(.text.ptval_hex_str_u32+0x7c): undefined reference to `kunit_binary_str_assert_format'
>> mips-linux-ld: ptval_hex_string_kunit.c:(.text.ptval_hex_str_u32+0x19c): undefined reference to `__kunit_do_failed_assertion'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
