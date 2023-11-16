Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D87C45958
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 06:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j65oGn9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700116559; x=1731652559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NhJFAkjBjxz5fsTOs2J5L3f/p7315LrIQIeFZVA13Qc=;
  b=j65oGn9prw8RhgragVsxn0XCka5JCXG7lw7k+2T7Xq4W+qtYxBG+dWBi
   vj3y3ctyJPidvyG1yh5AoAuUw9BGxl8TlHbpGg0HiDnrzj2JEoCg6sdsJ
   hAaEiUQH7lh4tr5kAQgyb84KsG8lT8+FNke0IBaFEf8RHw4YFcLqaxKAU
   RIxNnWiqRfIa25+hjvGZP9Nx+HEczfBQ+VIVX5qFRvbadGgADYOa7txlA
   lrVABMs/cVmvHnT5uCZ2yxMnAF4ZzcaHas11PAsJyDq56m4ZPHpBbpAO8
   /RyJA0qmZOagUeyOBOSVrk81RjFs+WLgtA6wZRGGG/dJWqQunO34u4fYo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457519148"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="457519148"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 22:35:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="909017849"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="909017849"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 22:35:55 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3Vyj-0001P9-0n;
	Thu, 16 Nov 2023 06:35:53 +0000
Date: Thu, 16 Nov 2023 14:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Davis <afd@ti.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: Convert keystone-gate.txt to
 YAML
Message-ID: <202311161400.qg1QNgEh-lkp@intel.com>
References: <20231114212911.429951-2-afd@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114212911.429951-2-afd@ti.com>

Hi Andrew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on vkoul-dmaengine/next broonie-spi/for-next clk/clk-next linus/master v6.7-rc1 next-20231116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrew-Davis/dt-bindings-clock-Convert-keystone-gate-txt-to-YAML/20231115-053346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231114212911.429951-2-afd%40ti.com
patch subject: [PATCH v2 2/4] dt-bindings: clock: Convert keystone-gate.txt to YAML
reproduce: (https://download.01.org/0day-ci/archive/20231116/202311161400.qg1QNgEh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161400.qg1QNgEh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
