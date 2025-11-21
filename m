Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B67033121B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 10:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763720144; cv=none; b=q9u86KKsK1eAiMT6ee3IuKqONFBVcz+Enj6YSKMIVw7EkBQUNbJvkOWWFeA68WY691VgFgJ9N22JyqfALlfMim6lvUBhRd2ukQNqxAiz11lNKhWm75dALW2NxcPGNh3bn/C6Qw9aqzcEklZ5E9K2aZfFl/ZyMzvl6LtvccbNcqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763720144; c=relaxed/simple;
	bh=7JS1433ekpv2DOPGPh9HQehSJQgDzWfjxaI2HE/7nF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FFrc1Wjic7ifjpIxB5NdLLv0Z/l9ifpg08I+obu29tSC3n+Bq3JmMHQ4710Lmpq8OiGOMvi6y4YeT48eJ1zb0fSqLA1NQ+YyjcWYmlQgBrft/uptwILqu7r0OMkYQiBFEU2kkgv26VnmeI+6h9Ir2uhsCb86LZvxdBhKgtmjkII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d3A/Is7J; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3A/Is7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763720143; x=1795256143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7JS1433ekpv2DOPGPh9HQehSJQgDzWfjxaI2HE/7nF4=;
  b=d3A/Is7Jn7BIcU48IwA5DWdXYMmz9jqf+W+SdHPWxGN4+8ryG6YuChy3
   vJnxnUOq0BDH44tMgM78vLalz4c8EOWPx2jaye6BkGocoWnVgTZr/K4tH
   IP5Z6IgNj+xss+57oCtFDbGrMce8dQ2IqgGg/iEGr9SexptKOib6DNrtT
   6Od3xEVqzLTHcJiFhQMZY4+cEmxVFUayuT4CAaMX8d1bduQbHH9+AWgJ5
   5RnJTT7jR65E/PNu41LEoo1EVE6rX5Y0p8t/4rZF6qm/suKuC/ZcQoEEb
   cDGw5xDXgnmfErALteijf1GPy/8+fffxMfhWejVbqDtlorGdjjeeRk+NQ
   g==;
X-CSE-ConnectionGUID: eN3RkrzqRw+3mI810UgSWA==
X-CSE-MsgGUID: ZukJQyY1QaCoHJse4BqBVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65688812"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65688812"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 02:15:43 -0800
X-CSE-ConnectionGUID: rOylg03dSLmTCNxNOguwQw==
X-CSE-MsgGUID: d1UaceqmQ8SE0vpkCvyu7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="192104648"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Nov 2025 02:15:42 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMOB2-0005D3-0E;
	Fri, 21 Nov 2025 10:15:40 +0000
Date: Fri, 21 Nov 2025 18:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/8] make[4]: *** No rule to make target
 'crypto/mldsa.o', needed by 'crypto/'.
Message-ID: <202511211850.JllIAy7x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   0baca2aa9ee7559c68e1631bb8a9be65fc4a99dc
commit: b674f2e232b8e3e6016ad724ab94c4f03a54ae0b [5/8] crypto: Add ML-DSA crypto_sig support
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20251121/202511211850.JllIAy7x-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211850.JllIAy7x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211850.JllIAy7x-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'crypto/mldsa.o', needed by 'crypto/'.
   make[4]: Target 'crypto/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
