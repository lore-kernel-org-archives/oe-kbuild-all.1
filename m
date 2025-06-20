Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8962D5434
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 15:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434458; cv=none; b=nEf/ZBrvOKZOZDvNoZSZ3ag/2kINj7g06WKCkEHY5w6elrk5WJxi6kyf7J0o5S1/DK0YAc5deKUtXuFIr5VWiyjNhKWlhf55H4A2epd25mJXso2XNUi66sUx9teUU4OYvN611JtVZBOPqlw9/yU7o5WLRdW6upgJnxj8euZoDqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434458; c=relaxed/simple;
	bh=xxcS8mlJvPyhp5lqvA7y/f3VLyblcGsBsfv7hrvfn10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5cWT1DB7J20dff4wLcvKkPsam5+QFlj2/sQm1O0E6/1fxuBP/mtRwChUi/sWTkmBuyLsKRhyAuwon0MPl7jaP01YM84AOfk1rZDuf/oPuRv/XNRHlflw8h4+AQofc76HO4iUowz2mf8qilbXkMAYergmbqZxgjqOco4JFVNLVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fh/mfIk5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fh/mfIk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750434457; x=1781970457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xxcS8mlJvPyhp5lqvA7y/f3VLyblcGsBsfv7hrvfn10=;
  b=Fh/mfIk54NPP8NGDbmRiDihrvnsJG9Vhw5d9iqPWbD/CAiSD3apiNgkB
   sqwumQQbHtmt68ffMeBGKciTK2WRebl7SCLJegVjH1gFSS0Hc1AJ7AFoq
   a+NRn8zOhhcfRW9YB/y67TLgxho+kDa5ZSejRF0TI3LxM1aV4rcDEWhkp
   v+xeVDrsd8aQiwziR/TVJNzTEuJiJQTQd3I6fwKXMEzPnXgIWgXjT2T/T
   +hKuuz71iHQb9r6EZPM1N75GRs2nGtqwfrloyJqXo9Y9DWyqKuQckV4Zq
   69aiQm5kudUDd4Y/O2o4r6mji5TVbUxTKK+WyEVrx9NlkbuGYLkWFOC5Z
   Q==;
X-CSE-ConnectionGUID: qCaqsdUQQWCUAbr4/pjEcA==
X-CSE-MsgGUID: Quvrr48iSYqbXxO2kGrUqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="70137126"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="70137126"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 08:47:35 -0700
X-CSE-ConnectionGUID: 6RBNOZKCRpCf0n5gPGoTyA==
X-CSE-MsgGUID: fllt0kqJT9mSV/Fm1l15Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="188154648"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2025 08:47:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSdxj-000LuG-1H;
	Fri, 20 Jun 2025 15:47:31 +0000
Date: Fri, 20 Jun 2025 23:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: Haixu Cui <quic_haixcui@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 2/3] virtio-spi: Add virtio-spi.h
Message-ID: <202506202351.NzbGuGgI-lkp@intel.com>
References: <20250620041230.731504-3-quic_haixcui@quicinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620041230.731504-3-quic_haixcui@quicinc.com>

Hi Haixu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc2]
[cannot apply to broonie-spi/for-next next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haixu-Cui/virtio-Add-ID-for-virtio-SPI/20250620-122225
base:   linus/master
patch link:    https://lore.kernel.org/r/20250620041230.731504-3-quic_haixcui%40quicinc.com
patch subject: [RFC PATCH v5 2/3] virtio-spi: Add virtio-spi.h
config: x86_64-buildonly-randconfig-004-20250620 (https://download.01.org/0day-ci/archive/20250620/202506202351.NzbGuGgI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506202351.NzbGuGgI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202351.NzbGuGgI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/virtio_spi.h:182:9: error: unknown type name 'u8'
     182 |         u8 result;
         |         ^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
