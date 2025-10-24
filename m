Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E702DC776
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Oct 2025 15:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761320125; cv=none; b=re6phtsNzMekPjYAHrC9rKCL+VXrLEXoVM+NnJkRRl0IDsvaWks+7aqMsyz0H+uiyg8oDp7P2ato1DPbhxR15LX9t2n1Ftt2AonrpWBuDtJfv3i+FAojZC6KbIFoRKfl+vV4Kz3ZcWJI7UaALfwUn624XbRqFexG8UwX6SE1IW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761320125; c=relaxed/simple;
	bh=8B1H8HUJr2gbikHIQ5XA9nd1UgR/qt3Iez/QrRNnWyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsz5k+f7ZfYetwro9KK8gtA+xDDLeIVDjtB1DXEUoL5x9C/kpUa1VLfzRw/0eqlbBgFYkBYen+ZadV/wFNq1IkRqhamz3rhsKee9fPx/VKc16/LHkJuqCfren0uLI9eznYSCiG1e9sgwpYEIO2zrXCoKToTkoMRiC30dmwhSzAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bhai4z7x; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bhai4z7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761320123; x=1792856123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8B1H8HUJr2gbikHIQ5XA9nd1UgR/qt3Iez/QrRNnWyw=;
  b=Bhai4z7xePhd33EEZVR4nQmff1tNtF0v1TImkP9qBMI5IUDKm8eeIx5A
   kXxPTXdX28FUZ0wn3nGfyOBOUy6geGIOB/+WJX8IjY4qXYfuvq76uN08B
   7tE5yJ3IHJ3QAb1+PhrCWZGIFBboOXpvc9bY5YVmsoAeDkSz1ZdPxx3R3
   EsL/3vQukhZuQ9DUWYgE8m6Ol+9C1BdFXcubT9weDqkipK6BdWRwaJ2MG
   iSfnGJajbuJ8zxqfr4Y/R7hlbddsb+BPpf9VkbmNh1Yo6nX4d4Hff30ZL
   7S+dkNQxAFb+MF/frfGxV79RVE0CPa+GsoK6x40uc03Qf5bZimeWW3J5O
   Q==;
X-CSE-ConnectionGUID: 5scolrFVQGm4GPrBDylo7Q==
X-CSE-MsgGUID: AYglzUfKQ121znjAuA5eSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63539270"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="63539270"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 08:35:23 -0700
X-CSE-ConnectionGUID: uvXKRIvaS/urk5yPBbJz1g==
X-CSE-MsgGUID: EUQBRBQzRkilXkux7jOfGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184936629"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2025 08:35:22 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vCJp2-00000000015-0ERE;
	Fri, 24 Oct 2025 15:35:20 +0000
Date: Fri, 24 Oct 2025 15:17:01 +0200
From: kernel test robot <lkp@intel.com>
To: Stuart Yoder <stuart.yoder@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: Warning: drivers/char/tpm/tpm_crb.c:193 function parameter 'loc' not
 described in '__crb_go_idle'
Message-ID: <202510241542.hFrped3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
commit: dbfdaeb381a49a7bc753d18e2876bc56a15e01cc tpm_crb: Add idle support for the Arm FF-A start method
date:   6 days ago
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20251024/202510241542.hFrped3X-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510241542.hFrped3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510241542.hFrped3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/char/tpm/tpm_crb.c:193 function parameter 'loc' not described in '__crb_go_idle'
>> Warning: drivers/char/tpm/tpm_crb.c:246 function parameter 'loc' not described in '__crb_cmd_ready'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
