Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7758933FD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 03:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNd8YPUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701140529; x=1732676529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OwH86OkYkjpo/cptI1beuHOn0oDpFfPg6BUC9HV3xVQ=;
  b=UNd8YPUMNCFnCIWKLkyMvfPFU+9qsDm33mK0sNzQ/Zq/n2hYKhxYMlrm
   Ne+XZjps1tTc5nPI1YCcOYe2FYLYMLGrl22kq71/MvE24wTRzuD2zgtpy
   ihUdtAuVblEgQ6AtXuvLynM9bc+UlxIL0OS36WuxdMl+oWrK/ZotoOJgz
   3bzBJcTMUgsMC1M5K8sZPl8Z6v58lgq6T095tJDXh8OlDbwnwb50ZExJI
   T5Y4cJ77kgZPynD85daOd6FnmtFl+QFEWyGKwtr6O8/QxQQDPYcLH34cU
   8Tz/y4OD/2iOoY6nxEKNiHsgQCoKSZq92VEsuwfRzNGVOEkqMM1QunwAT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="457170188"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="457170188"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 19:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="16482928"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2023 19:02:06 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7oMO-0006v2-0J;
	Tue, 28 Nov 2023 03:02:04 +0000
Date: Tue, 28 Nov 2023 11:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	edumazet@google.com, pabeni@redhat.com,
	Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net, leitao@debian.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: netlink: link to family documentations
 from spec info
Message-ID: <202311280834.lYzXIFc4-lkp@intel.com>
References: <20231127205642.2293153-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127205642.2293153-1-kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/docs-netlink-link-to-family-documentations-from-spec-info/20231128-050136
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231127205642.2293153-1-kuba%40kernel.org
patch subject: [PATCH net-next] docs: netlink: link to family documentations from spec info
reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280834.lYzXIFc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311280834.lYzXIFc4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
