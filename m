Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3686D7EF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 08:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681547486; x=1713083486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bt+KZdRCXHcYjBL+CJ4plANJoXCVg/BAm9vKQVmi004=;
  b=QIG0JjEuN3t0FB0SPVBLHCm3XFJUjLfjQWZHyV4P/P6wK6wPKYgNKvXz
   10TIq2z4WbY2AUwAw3d1C+2I44Vf82X8rkOQux4BNK/ivY2gQPfWIU5AS
   8xLtGNi9dl3VFrxPzXpOEuYuvfMNHkYJ6dQGSrLiaxFwgHXrex50yPK7L
   dMIj/SLY2VmmUzlsIBj+3V0ExHsyOlNDoVdiRSyFVUgwKXLN/vVevkZuq
   V2+s2xLxkAHYPRK6bu6BSoR+oBx2YTEV1L2ZKEiyuRzeqIbxkWNNY1UlO
   lVkebqPQpMHiUXA0oNSYU7pzQroU2Qf53bWKnXNY24DUBFj8Zune6FXjo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="346470703"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="346470703"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 01:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="692720900"
X-IronPort-AV: E=Sophos;i="5.99,199,1677571200"; 
   d="scan'208";a="692720900"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2023 01:31:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnbJa-000ajf-0s;
	Sat, 15 Apr 2023 08:31:22 +0000
Date: Sat, 15 Apr 2023 16:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kim Seer Paller <kimseer.paller@analog.com>, lars@metafoo.de,
	jic23@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, kimseer.paller@analog.com
Subject: Re: [PATCH 1/2] dt-bindings:iio:adc: add max14001 bindings
Message-ID: <202304151615.k0j79iDf-lkp@intel.com>
References: <20230414102844.21579-1-kimseer.paller@analog.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414102844.21579-1-kimseer.paller@analog.com>

Hi Kim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kim-Seer-Paller/iio-adc-add-max14001-support/20230414-183416
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20230414102844.21579-1-kimseer.paller%40analog.com
patch subject: [PATCH 1/2] dt-bindings:iio:adc: add max14001 bindings
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/8e4267ba9a592dc820ad029c5e602098ec981159
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kim-Seer-Paller/iio-adc-add-max14001-support/20230414-183416
        git checkout 8e4267ba9a592dc820ad029c5e602098ec981159
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151615.k0j79iDf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/iio/dac/adi,max14001.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
