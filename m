Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF51DDAC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 05:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1zn6fml"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700287127; x=1731823127;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=lETp/Jk+i+KkMU/hVVA0F4jxV/LptTSso1wDlfVLERE=;
  b=Y1zn6fml4uSw9KcOs13gn3X3mcdFEjefH4dL0ff9xH82g1iHENw3Us0P
   C/yGEKnMtffyLrnuNeGr9A56jyLsLCLmClvVXC7XQhOL0il9S2IGszReB
   kUD1eNLJg+kaTpqlHoD5PkVTtfPtQ2cWeJLWkUOFcyur7QTUY+kg6OGZS
   OVAIBHkktayBdQgkRElqTn9ZmDMU6P5FRwhpaqZrWG1oD+1x4zm5mnLkt
   24vZzO6uAKOdAunI/us0qTvsuPWkIp5xRMocNrXh9nwXePdlYKm4JzpVk
   e+/oEM+/VOfmV6IzaDZeAuIO9WEqzwKaqMCJ3AbMmYqovDrr4EGSkfNlh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="455705519"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="455705519"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 21:58:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="13679738"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2023 21:58:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4ELq-0003Zn-32;
	Sat, 18 Nov 2023 05:58:42 +0000
Date: Sat, 18 Nov 2023 13:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Prashanth K <quic_prashk@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Add
 'xhci-sg-trb-cache-size-quirk'
Message-ID: <ZVhSib_6PwRw4Bz1@6473735b5665>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231118055455.249088-3-quic_prashk@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Add 'xhci-sg-trb-cache-size-quirk'
Link: https://lore.kernel.org/stable/20231118055455.249088-3-quic_prashk%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



