Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3708511CAF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 14:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760193365; cv=none; b=l8CiU5a9m62TCGLEFOPdASTRfR+QrRrtsTnDifEd32roCB/oLuOnkf/ocFBFqdV078HIILyU49pjBcHiz/hfWG0XJntXunEIICY5YSkW58+3MqToxWJxNwXOYjkZpC7W9f01mkBOEHKHMujO5SmO5fJsrI0KxDDfafmKw4dhOdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760193365; c=relaxed/simple;
	bh=J/csdSZVvguBBUYsK2fyJ9ss/1iYJfY+/SqGFgDcdt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P8CL27z8ZJ2GLckINyF7hXO2pseig0T9HRzp+tWX7SXWTR96XGvV62GFXUYwnMM4smf+U+NzM3VZq8BercPWQU19I/ede8DS+IvbSBgte0ZGdjmcEuTSiekXMiax3tkQ+Md2jiksYkqdbCC2qPLa6JW9bZusfbCkL0cUOWiWlac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSUp8SJ1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSUp8SJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760193364; x=1791729364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J/csdSZVvguBBUYsK2fyJ9ss/1iYJfY+/SqGFgDcdt8=;
  b=aSUp8SJ1IgpI+nKdiSXTg5KhASdvAuogtgcoXRcMlE9dny9UKnc9ZU5l
   v8PwXE9HXZTpLdoV0Y9F4SmhzNkCsiCS95mVuRCwQYNclIGqsXwXWKY0c
   cpZOYWRScHKtOEN7FzMhM2HvqCKAGa5TbqXGx7x3CXNhUBPgeoHKyv3b/
   rlTcqVKGzFzkfXwg7o5rseHUYvzFUGik+ZsPJiczPMuGybmfHCJD/kEzU
   jgJ/EM9FGweAfI9r9xn2JYqrzMeZPebWk7syoWFYgVxW/XklTAxKfQm/F
   ACihO7btTFbTyhD+G0W2/QlROt+uXzNgS+I22P2Hur1sdGgqRkx68cAzn
   Q==;
X-CSE-ConnectionGUID: nI9jD3JNR9WVud4AEvTQ2g==
X-CSE-MsgGUID: 6tsCNQsTQ3CtiS+loUFpKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="72643560"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="72643560"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 07:36:03 -0700
X-CSE-ConnectionGUID: b6pTwkdVSueGRIOciM2nVw==
X-CSE-MsgGUID: dxn1qSZHSUaupRX09GNf/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="180783934"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Oct 2025 07:36:02 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7ahT-0003od-27;
	Sat, 11 Oct 2025 14:35:59 +0000
Date: Sat, 11 Oct 2025 22:35:14 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bjackman:asi/next 12/50] WARNING: modpost: vmlinux: phys_p4d_init:
 EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
Message-ID: <202510112214.iFG37ttn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   a6190e0f5b9d575cc97ef8289a7a6c5b0106fc4b
commit: 2cc804bf952e0feac37034ec79885be15dc675ed [12/50] KUnit test to run phys_p4d_init()
config: x86_64-buildonly-randconfig-005-20251011 (https://download.01.org/0day-ci/archive/20251011/202510112214.iFG37ttn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112214.iFG37ttn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112214.iFG37ttn-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: phys_p4d_init: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
