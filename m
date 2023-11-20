Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE837134B1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 10:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0uiWDTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700476223; x=1732012223;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=QEpkLRHWnsCnveDh6HwOpmt2fvh85bdL1197FHqfyn8=;
  b=X0uiWDTa1Mw0wpZPOpA1++AYURhIhQQgRbdKLEUZs0xaF4u/IzJ8uY9d
   ExPJCRmG8sbIIUwMD6IIAfDbH+Sq9ppGID/rJr7ITBo1jFvXckrZBzJmX
   +Ud06zobIw8Rz9NO4tWMvUxp4/qV1lyA0jZGtT2Rr4tO3zsnzLqvX9Iyh
   mcaVPzC5M4hUPXc345PwpLgQpFyX7JksCWyLrQmsvZg9Ug5dA9QSk9evJ
   NLWtMOE93JnTeP0NDOZTZNjSv24LVh0Hh5lBZWGSL8ZSvfkbcXVsOOiET
   qNYk27CStd9JDPTo77/Y86RSAiylQXw+s6TO2SGyYeWDn6/p1NiqsAK3d
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="390451604"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="390451604"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 02:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="856948170"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="856948170"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2023 02:30:21 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r51Xn-0006Mb-1E;
	Mon, 20 Nov 2023 10:30:19 +0000
Date: Mon, 20 Nov 2023 18:29:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sumanth Korikkar <sumanthk@linux.ibm.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/3] mm/memory_hotplug: fix error handling in
 add_memory_resource()
Message-ID: <ZVs0_ynk1NqtKm3n@c8a6e835e09c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120102734.2001576-3-sumanthk@linux.ibm.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2 2/3] mm/memory_hotplug: fix error handling in add_memory_resource()
Link: https://lore.kernel.org/stable/20231120102734.2001576-3-sumanthk%40linux.ibm.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



