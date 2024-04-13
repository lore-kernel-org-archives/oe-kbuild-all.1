Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127741E49F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Apr 2024 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713006742; cv=none; b=cXv3Dhqnix8a/NDYRxyqgxK8Yy3zolsr21B6PrCoMToos424iLcw8bDekbviNfo3mVZGPdkDXOwUxESNvvjnJMTQ6/Y74XxTgbG+2rZZygQvhsCLORRT3y+XPD7BVaBlMGrqXw/00Sx34o38hKgkUglKJFb8RFAxNA1W6cE61EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713006742; c=relaxed/simple;
	bh=yBq1ya6K7Dg+ehtCxUqJKa7LIHczXo+KNbXCUhlOj4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XX/V7kyh5+I30CZmjOxPtANyu6qnh1d0K983kw02NswPFRg+lleyLHsPwgRUmfBKk+p0hMFKW1fmsbpkCbveDg4a+7gZlYjuwPlqyAmBiqqL/F7KU1+6OyuE4lW43MXkpB+anlzSBsa549wkOX9yjAM09cKtWZMorkntkEzuP0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=giKQEqoi; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="giKQEqoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713006740; x=1744542740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yBq1ya6K7Dg+ehtCxUqJKa7LIHczXo+KNbXCUhlOj4Q=;
  b=giKQEqoizirXEaqyU8uyVBxPxjEKtVr/ilLBRF90csJoGCnHqwqhi/C4
   B/T57o5SccRgXT00BfyJKGyF8l1zDaNbH1fgd6+GcWp68gMR2UNEi8eox
   82VOfH+CgIafUQYj0s0h5Lxa3TAMW5GPF1PRV457nXz1Z1ARFTww8K5jD
   B0qlX5ttnGQSYGbuvNyl7WlRSXdh8AQ/NqY+rAzfIAXFjgm6DuluN/fSx
   UVezRjQantitlRh6hiZit47R/zPlu4fSjY6hV8Q/pNtQcCu45GnOaErq6
   Vcab/gcfS+BEeEEzFZgiVYBjShyIclHym+yvFPdIYzDlPr1GaasPChgpq
   Q==;
X-CSE-ConnectionGUID: nPfhJq4PTdu+VmQWD3Yc8g==
X-CSE-MsgGUID: j7lTWCzhTtSpPRIP0PelBw==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8633230"
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="8633230"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2024 04:12:19 -0700
X-CSE-ConnectionGUID: HZiZVheISlSDk+AfYxHzuw==
X-CSE-MsgGUID: Jleei5H0QGOD3ODxhVUbqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,199,1708416000"; 
   d="scan'208";a="21889809"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Apr 2024 04:12:18 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvbIq-0002P4-2I;
	Sat, 13 Apr 2024 11:12:13 +0000
Date: Sat, 13 Apr 2024 19:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 5/6] PCI/TSM: Authenticate devices via platform TSM
Message-ID: <202404131848.OsWbufUR-lkp@intel.com>
References: <171291193308.3532867.129739584130889725.stgit@dwillia2-xfh.jf.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171291193308.3532867.129739584130889725.stgit@dwillia2-xfh.jf.intel.com>

Hi Dan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 4cece764965020c22cff7665b18a012006359095]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/configfs-tsm-Namespace-TSM-report-symbols/20240412-171254
base:   4cece764965020c22cff7665b18a012006359095
patch link:    https://lore.kernel.org/r/171291193308.3532867.129739584130889725.stgit%40dwillia2-xfh.jf.intel.com
patch subject: [RFC PATCH v2 5/6] PCI/TSM: Authenticate devices via platform TSM
config: powerpc-randconfig-r133-20240413 (https://download.01.org/0day-ci/archive/20240413/202404131848.OsWbufUR-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240413/202404131848.OsWbufUR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404131848.OsWbufUR-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/pci/tsm.o: in function `pci_tsm_doe_transfer':
>> tsm.c:(.text+0x68c): undefined reference to `pci_doe'
   powerpc-linux-ld: drivers/pci/tsm.o: in function `pci_tsm_init':
>> tsm.c:(.text+0x1250): undefined reference to `pci_find_doe_mailbox'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
