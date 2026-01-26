Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2461684B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 02:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769395335; cv=none; b=tiAezka0JWZcl9cH4rCoRDgJVXiGMmY+N2g2mIuWBugox48dtNPwjpdO8JBOL4ZtMqCLCBWQU3PNe3uBxL9eHSXgHmOQQqMDRzZcAgKWf8udUxwR0SUEUZ6Pqb9xZNFub4Z7z7IcIA/vw2Sp8NmZog3wcpsrYKMnIFKXiuFQW38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769395335; c=relaxed/simple;
	bh=K1k+Z0PKNOKnCumwCz1pTJw6rd2RUQMh7WznBJKDYyY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=czkCvFVnrB1UbxRg5YkNUxrcIcqdThDDL2+yHK22wYY1rEHOMcD4RUgzw10n31KHJqRuxPMAuckdSTBw02Jvil5wdzNn+io3ORAIBudbUy2AOAnz+cOKeCtt0y0ZLVvyu/3TwQbMfMerIg2Iv42Ed0IpbDSK4cUC1nzzNaTuoKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nanve4EX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nanve4EX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769395334; x=1800931334;
  h=date:from:to:cc:subject:message-id;
  bh=K1k+Z0PKNOKnCumwCz1pTJw6rd2RUQMh7WznBJKDYyY=;
  b=nanve4EXxJX3yEXGyETW449YgsSLreWDLEyDiIOpwvjvQU9e7ssTMpHa
   xtnJBkuJjK7WAUcePBxAZ9goL14lcG1yk3uCXzjZCgTzcwQJWgriFRMF9
   1vP7NQLkSRP3BsZ0ihTRHdASl1l7yXWYIyS0laIwY2dQHzOVI3fQugr47
   M5qVc2oGdriRlL1XedYFSIggBFz12fsgLzkVihLtTlhw7U+yqe8x+dt5r
   wM6OWS+F272eVylYWZYF+iqDigLRSdvVzq/Uyh0DQh3wFvT/RHK1Ix7SK
   jGnEntNC2JwxT5u92Ahw3HWFgtrPIoEIM6bLOxQsqUGRNuWTktTUeJzIM
   g==;
X-CSE-ConnectionGUID: mh1Vi5RCRCCFZYIt5n1xYg==
X-CSE-MsgGUID: zs+qUcawS0uDBXQZxyk0Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70543120"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="70543120"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 18:42:13 -0800
X-CSE-ConnectionGUID: Ck/7q/vGQYCtuxUlVK/aOA==
X-CSE-MsgGUID: p0W5Qlq6TR+rhDB01Ppqzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207162641"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jan 2026 18:42:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkCYL-00000000Wpa-0Hhb;
	Mon, 26 Jan 2026 02:42:09 +0000
Date: Mon, 26 Jan 2026 10:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:queue 11/15] Warning:
 security/keys/trusted-keys/trusted_tpm2.c:356 function parameter
 'parent_name_size' not described in 'tpm2_load_cmd'
Message-ID: <202601261043.NU2SvQfr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   fbd9af022416579062d59e206c7f71890d27fc31
commit: 7895041508233a23dcafae8f37403cb9456b1756 [11/15] KEYS: trusted: Re-orchestrate tpm2_read_public() calls
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260126/202601261043.NU2SvQfr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601261043.NU2SvQfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601261043.NU2SvQfr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/keys/trusted-keys/trusted_tpm2.c:356 function parameter 'parent_name_size' not described in 'tpm2_load_cmd'
>> Warning: security/keys/trusted-keys/trusted_tpm2.c:455 function parameter 'parent_name_size' not described in 'tpm2_unseal_cmd'
>> Warning: security/keys/trusted-keys/trusted_tpm2.c:356 function parameter 'parent_name_size' not described in 'tpm2_load_cmd'
>> Warning: security/keys/trusted-keys/trusted_tpm2.c:455 function parameter 'parent_name_size' not described in 'tpm2_unseal_cmd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
