Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9DE79C0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 00:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739232944; cv=none; b=m3ztgo7eR9XS6H0I492Xsyjph5MAOSo3/T6zPkULTQleBakm3l5XVsgVU7PbpLpoOwXvpxs2EAh5fjPm45BsG1A28EexLCsXH0kXSvjnCUOerKTBad0H37rP5YcUsnYqktWb5Ny7xLDB0AWM/LIpG6I8yjlcwKxgUMLBMsQ+QO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739232944; c=relaxed/simple;
	bh=1U+6ZpkVVa1qpCcIXo2TiiNkC6TrbAEeDzZcFWgyuhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+jrz/ZziVW4Cgnb0kSe1zUzPDbHRuvGqVtkDoW0cMAuQ8es6Cgv0zzrt2UjuGxfoQEF/PLkRzS73V60sTgRWVk8LqUJBVZNBY8sGICQbHmn7ENTtzf7X4w/UjHfppL1+PWhvl5xbQ6U3cZXwGxFGOppM3HSVzUXzfOhcZQ7ZSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WK+aQuS2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WK+aQuS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739232942; x=1770768942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1U+6ZpkVVa1qpCcIXo2TiiNkC6TrbAEeDzZcFWgyuhY=;
  b=WK+aQuS2sz7zj2Ky6J+X9WkwZVsfKHRVIT5AnqHsxGXaBtnN+a2pZMaD
   hRE9h5hyQOgQMfGhEie/Pgo7N06whO6ECUhQsso7FhJzX2EolbwPbboHO
   UcziiLmLvFKY0dbzveFlZy0SbmbDtPehICihhQGtmEZlydM430IscBIGE
   astOyj2ai17CDW9pbp5se55YI/Cto2pRM5Er4fGipsyCyMh/4D92FiRqM
   GoNPJJUBMpLwxvHuV9wLBlwUavj3IBxaUn5GEudXT7tcz5hTKTAiqXCw3
   9kBxY9GP6gb6IVxarT80vwNf6murJ3MTpNNa4dl7eqHBnoBtqAzXkP81h
   w==;
X-CSE-ConnectionGUID: NdCrYVJ4QKu5FlDMhHrBAQ==
X-CSE-MsgGUID: wiPAv4jlRCah0ddoQqoyGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39856766"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="39856766"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 16:15:42 -0800
X-CSE-ConnectionGUID: U7+gsFHhTtGtYfopclL8DQ==
X-CSE-MsgGUID: yB1wksYgQqSmB9QVKQtbNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112203551"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Feb 2025 16:15:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thdwA-0013Yb-2v;
	Tue, 11 Feb 2025 00:15:38 +0000
Date: Tue, 11 Feb 2025 08:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:cap-analysis 26/26] ERROR: modpost: "_raw_spin_trylock"
 [fs/pstore/pstore.ko] undefined!
Message-ID: <202502110826.XP7DDgzC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis
head:   0030818ee37e806a78ceb9e303142eafe34a2a80
commit: 0030818ee37e806a78ceb9e303142eafe34a2a80 [26/26] compiler-capability-analysis: Remove __cond_acquire() function-like helper
config: s390-randconfig-002-20250211 (https://download.01.org/0day-ci/archive/20250211/202502110826.XP7DDgzC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110826.XP7DDgzC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110826.XP7DDgzC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "_raw_spin_trylock" [fs/pstore/pstore.ko] undefined!
>> ERROR: modpost: "_raw_spin_trylock" [drivers/tty/serial/fsl_lpuart.ko] undefined!
>> ERROR: modpost: "_raw_spin_trylock" [drivers/usb/dwc2/dwc2.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
