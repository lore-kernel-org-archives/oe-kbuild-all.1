Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE1410781
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZ3PbQP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702022923; x=1733558923;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=0CN5gRWHhaC+evLCrYmmGd/4Lkxf276NShkMbM3Ox/c=;
  b=JZ3PbQP8vioRCz8A4Y5+/x1XufAM0rs/irhErxNlWhhxAa5hcgqH/9K/
   qzyv6ujbp+2jVzbh/+zlDlfyCl7BgBD11roe/dkJXTAH1DJXbKaRqXCYr
   XspakxJEBy2njYTMUDrBcFc5eWFxtFNp5713YKMAGIe2GhzS+3kWEH27O
   /GDSk19KpnO5fvucx3CIjwVPO48s7w1Rr8Qyh8RiRAIEkhTxgncPbYdQv
   aENsK7x+sSeOjYZlaJT1JrELpwXl+oNtDje/rReseVQzbiRTn4QpdwHkT
   pZhyI6e//2iVDALDoQBcicuNzX4jjZVFB9eOl8InpM0juxLYgOLPqJigo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="374538082"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="374538082"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 00:08:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="772054968"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="772054968"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Dec 2023 00:08:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBVuY-000DTR-1g;
	Fri, 08 Dec 2023 08:08:38 +0000
Date: Fri, 8 Dec 2023 16:07:47 +0800
From: kernel test robot <lkp@intel.com>
To: duanqiangwen <duanqiangwen@net-swift.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net v2] net: libwx: fix memory leak on free page
Message-ID: <ZXLO04oVIASKLiuG@be2c62907a9b>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208080216.20176-1-duanqiangwen@net-swift.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net v2] net: libwx: fix memory leak on free page
Link: https://lore.kernel.org/stable/20231208080216.20176-1-duanqiangwen%40net-swift.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



