Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B086F1537D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167572; cv=none; b=DQh+F27s53C8g8G3MBP6XU0iB3eUNuBd7l9Qs3aX7pSWfIcRyDaGhfA21qVdOD75jCxjDdzEXJ7bnraZ8n6vGHFqhrkO2gjGLuUIvJRIQZDcQDkGgNU6co1T1dr1oS4YuwRQ7DW/Ofbhr2EhjrSCsQbeKAUMDt/2E9T7QTaEHsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167572; c=relaxed/simple;
	bh=Ce69RvO5h0xWZhvC2+Rg6PshsL5YrP6R63bLK1StmlY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CgPdRwJc6l5iL09/we0xCC0OYn/VJ/GH3R/shBTljvGmMVkCIUVzxnTy80g/F0qYnv0FPbyr8M0fBJfLbk67PrSNkGNB7O/Lbgs/4RHRmIW9gVQbVeqr8m47vC/S9cAcBdxTFOYkLbk5Nigy6JwQ1UNapQDO9RkqKGsevu9mUxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkTe3WzG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkTe3WzG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727167571; x=1758703571;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Ce69RvO5h0xWZhvC2+Rg6PshsL5YrP6R63bLK1StmlY=;
  b=WkTe3WzGN0zvtMoRMX3CiC5DUjFcV3p3PcoehVh/7rRUTqDn0TwVPnZ/
   /yMS/ehDaSA46jlVQ6xIr2ItO8oAOEZRF++C3m52syOwdSlqX+2bIa4um
   ebnBWGacWdxUsZDHkKABxQXTL+yoURObScJPiwWstpHFOX8r9DrjBlh2C
   HVAYIqgzDRbIZLHLA5oNHd1PtXfbXlXcHVxjWTf9X3mbtCvmuyXkXklmh
   IpjgwOjmj87W0jd3st6rwjuTSUrMuEJ02LhaW57fn9HvJAZLM40OOvKgO
   6M6WAOR9xsN5yx2ufDutFGZjkDfPdF54+Hm+EJ3i+Iho46ZYNorP6ozQ5
   w==;
X-CSE-ConnectionGUID: 2XsgFr4RSZa/OAn17toOqQ==
X-CSE-MsgGUID: RpR/ONmHTlKyXW0+BKWL3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26242903"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="26242903"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 01:46:10 -0700
X-CSE-ConnectionGUID: N0Azc3ZLRKWQoTzs/Bfavw==
X-CSE-MsgGUID: /8cJdfqpTN2nkk5bJ6BK9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="75869777"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Sep 2024 01:46:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st1BO-000I7x-2V;
	Tue, 24 Sep 2024 08:46:06 +0000
Date: Tue, 24 Sep 2024 16:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCHv2] usb: yurex: make waiting on yurex_write interruptible
Message-ID: <ZvJ8I9B3nIMpWGnY@5849f93d069a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924084415.300557-1-oneukum@suse.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCHv2] usb: yurex: make waiting on yurex_write interruptible
Link: https://lore.kernel.org/stable/20240924084415.300557-1-oneukum%40suse.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



