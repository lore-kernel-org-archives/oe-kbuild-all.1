Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB09C1171C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 01:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732586303; cv=none; b=UxoM2qHlWgrsiGEkCSsjDXYGfJkw5bZcTRq9qJ3jXygpxFbPz7aCX8ygRgooqMkT1nO79nUnyklPPmKRieeJcsT1y/5B4fxC+BUhapFk629lkDy0C3gPGdP1aGKn3VdPm8r13YKp9SnD9wDuQPg83qYcWjk2NKBDXL5Y6i/dP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732586303; c=relaxed/simple;
	bh=igfWRwLbkdpefyE9YdXXcWjgCVM6fbvneNfATrWj+iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VcKRryDVTx0A+BHRaEL4I1E4Q/f9G9wY+zowgsev4cg2AQWlvv3IrJS+XPRdf5+1w8bRiH5jQ00fCbpuPqUH7gV7CvzkaJYDFGXbHp1vSs/g5/7e3wmOZt0c9s2f5tfOiNKYg0oGIf7sZTHhPz66Soyi6lVr+kuMJOdbxwvfp3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bkoa5P4N; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bkoa5P4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732586302; x=1764122302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=igfWRwLbkdpefyE9YdXXcWjgCVM6fbvneNfATrWj+iQ=;
  b=bkoa5P4NorKZwLlaZldZJlNZqMAuy/dicuQis+mommaWCVECx781Fmlb
   S3i8j47WPQ7SPgX1CkL+FA0kxwz/kYFW63DLWz/TVimOQHg08HeHKeaEk
   WWwX7WXKxDrKOWxTwMCzXYsxyMI7nXZdNwWN0PCcdbSI6FyIbCeZH+6C8
   GAD4yF/V2p7oZdc8BChS+iuXEQ5cjcO6B/TafODoJt8Nyr/s7I6sGfjgQ
   tJqddAw6upvUhE+D/h6gv7TrZeeBMfzQ9Kpv/EETPRGfRc+0RxTIAb9QT
   H4QI3vCPBSMXIFFUx7EaLbfVZfBM+td559ydy8wiIljJSra04DSTK0vB3
   A==;
X-CSE-ConnectionGUID: lekQzAKXQpKwWJOqQsd6oA==
X-CSE-MsgGUID: 6+GMep91TVqYX1GAadv+3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32660882"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32660882"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 17:58:22 -0800
X-CSE-ConnectionGUID: EnwPlQLMQKCC8znScVnzWw==
X-CSE-MsgGUID: hsl4kW2nTMKhRNYcPf6k+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="122416168"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Nov 2024 17:58:20 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFkqI-0006xl-0V;
	Tue, 26 Nov 2024 01:58:18 +0000
Date: Tue, 26 Nov 2024 09:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/sm8750-dispcc 30/35]
 drivers/clk/qcom/dispcc-sm8750.c:17:10: fatal error:
 dt-bindings/clock/qcom,sm8750-dispcc.h: No such file or directory
Message-ID: <202411260904.0ERyHXZr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Krzysztof,

First bad commit (maybe != root cause):

tree:   https://github.com/krzk/linux b4/sm8750-dispcc
head:   5350ae4691e59d4aa71df7addb636caef6f730f6
commit: b97538c00c8e24fc168f3addbe7eba146b06396b [30/35] sq
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241126/202411260904.0ERyHXZr-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260904.0ERyHXZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260904.0ERyHXZr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/qcom/dispcc-sm8750.c:17:10: fatal error: dt-bindings/clock/qcom,sm8750-dispcc.h: No such file or directory
      17 | #include <dt-bindings/clock/qcom,sm8750-dispcc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +17 drivers/clk/qcom/dispcc-sm8750.c

9594918bb3708f Krzysztof Kozlowski 2024-11-25  16  
9594918bb3708f Krzysztof Kozlowski 2024-11-25 @17  #include <dt-bindings/clock/qcom,sm8750-dispcc.h>
9594918bb3708f Krzysztof Kozlowski 2024-11-25  18  

:::::: The code at line 17 was first introduced by commit
:::::: 9594918bb3708f775e232e4a0a9b543135dbc6fa WIP

:::::: TO: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
:::::: CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
