Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281F7BA39
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 May 2024 04:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715920014; cv=none; b=Ik/RG7TAjebAtsBtU19SpK8gfSY2apIDviR0uELosh4C9H1lEisJ/ZIyERdXV1tTqcHAVkTlD6D5MHC7/Wbyo0j4NgTiaDf39R/STiIoUseYTem7lvCxOzTOhR+XO+MtCF4eqzRyTzR+CiXiws/gkYTNy6vBDecsghUTvtFQNXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715920014; c=relaxed/simple;
	bh=GWyXOoyKk2RnwYCSHy+P9Ba1M58+I9n6Er/ZRA9duHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hODGiPSF+G4ravJFYapMci9OGzj+Uyh+dfBW5pamnnBYE7pJ+r/fD1xV6f5GoGgDgwUqOa7fwFHV6J6o9H8Lp1op/Y5nsalQGNuWdumERiHTeHXWwQZbiMkcSIv0CkQ3eopeL+GSo3j9Y9mucEh3sDwHlBA2xkzmfS6VHORB+W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrQGiRAJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrQGiRAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715920013; x=1747456013;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GWyXOoyKk2RnwYCSHy+P9Ba1M58+I9n6Er/ZRA9duHQ=;
  b=lrQGiRAJAmK08MX1AsZOif/AxLngmJureScdL2Poi+8n4e86De8A4ASy
   gT0pLulzT9sTHk022t4LtD8ITTS9LNJCA+jxb7eWb0UOiu7RQoRqNrgWE
   8nYxXTUvSo6goJwH3zHeEX6pSXqCf/HNIN4pXr1n3QzGW4uAM0lIHvTEj
   C/I0oZQy9YSr4WQrWY0s2vhmmsmpK6gudWsSRp+TYC9yGG6WZnBBn4D0O
   BvTPK65BN0SFbT4B16r0Xx1cMCW9r3LYFqtFNapNLY8YbRV5m1kLgZRWt
   x9v/Q2feAEUmIjr5GUeN5Vh1LYSuWQnTFBtaUneSqpAe6VnaUt4+jZ4N2
   A==;
X-CSE-ConnectionGUID: xpAw3UpYRFCTUj2eIx4Pzw==
X-CSE-MsgGUID: KpfnrAj5QKurzOgwzBqZMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29593932"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="29593932"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2024 21:26:53 -0700
X-CSE-ConnectionGUID: ToWroi0yQuSi5r5w3KhFTA==
X-CSE-MsgGUID: v/KLNac5SYWSyeJHoSME5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; 
   d="scan'208";a="31485769"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2024 21:26:51 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7pAy-0000CZ-2g;
	Fri, 17 May 2024 04:26:39 +0000
Date: Fri, 17 May 2024 12:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Dubey <adubey@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, naveen.n.rao@linux.vnet.ibm.com,
	mhiramat@kernel.org, npiggin@gmail.com,
	Abhishek Dubey <adubey@linux.ibm.com>
Subject: Re: [PATCH] PowerPC: Replace kretprobe with rethook
Message-ID: <202405171247.spWNTdJg-lkp@intel.com>
References: <20240516134646.1059114-1-adubey@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516134646.1059114-1-adubey@linux.ibm.com>

Hi Abhishek,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.9 next-20240516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Dubey/PowerPC-Replace-kretprobe-with-rethook/20240516-214818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20240516134646.1059114-1-adubey%40linux.ibm.com
patch subject: [PATCH] PowerPC: Replace kretprobe with rethook
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240517/202405171247.spWNTdJg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405171247.spWNTdJg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405171247.spWNTdJg-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/kernel/stacktrace.o: in function `arch_stack_walk_reliable':
>> stacktrace.c:(.text+0x172): undefined reference to `arch_rethook_trampoline'
>> powerpc-linux-ld: stacktrace.c:(.text+0x17e): undefined reference to `arch_rethook_trampoline'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
