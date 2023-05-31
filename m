Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34F0EA4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 00:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685494432; x=1717030432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SBHVoKGOgyI5lCu+Ev7oGz4mUG2XZBBj1/qA5KcfvCM=;
  b=antRVD8mtNjke9jznNSL6RWx6KwVNoe/9j8vPml1yGFyyZqHvDUe9y1w
   2ZkDeVoFtvj7BG09HuZ2BqMlGig7CmFqKPIs6cBTsu+xvdfipkaEGfes/
   omxguDuoul09EMiXL/AH+uohQZi9bNjGBPDWPsoUlNZzTb1jlJJWWtGDl
   DgZEWcD06C+p1JYuiKvappFvPCjUA8O711b4JTWzJyIQro1wimZUR+ElO
   9kV5xxnL5AE5L+L3yBYVjN6Zpal5WBRUW3+rNcAUJIiN3Uo+YRIj6Mu88
   8FaIvtbSAX9drwM/kXTslXlomkH013YwTm0QPEHWrEuI7kN1fhlc4TQtu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="339682432"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="339682432"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 17:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="684192059"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="684192059"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 May 2023 17:53:51 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4A62-0000wT-28;
	Wed, 31 May 2023 00:53:50 +0000
Date: Wed, 31 May 2023 08:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/7] drm/i915/huc: differentiate the 2 steps of the
 MTL HuC auth flow
Message-ID: <202305310821.bZVw0PS0-lkp@intel.com>
References: <20230527005242.1346093-5-daniele.ceraolospurio@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230527005242.1346093-5-daniele.ceraolospurio@intel.com>

Hi Daniele,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniele-Ceraolo-Spurio/drm-i915-uc-perma-pin-firmwares/20230527-085429
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230527005242.1346093-5-daniele.ceraolospurio%40intel.com
patch subject: [PATCH v3 4/7] drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/5e7ad1c45a6cbb80d8b9f71212d410d19bbe96d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniele-Ceraolo-Spurio/drm-i915-uc-perma-pin-firmwares/20230527-085429
        git checkout 5e7ad1c45a6cbb80d8b9f71212d410d19bbe96d9
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310821.bZVw0PS0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:28: WARNING: Unexpected indentation.
>> Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:29: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/gpu/i915:546: ./drivers/gpu/drm/i915/gt/uc/intel_huc.c:34: WARNING: Bullet list ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
