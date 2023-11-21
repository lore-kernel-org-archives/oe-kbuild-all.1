Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC418650
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 02:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvWhl0Gs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700533968; x=1732069968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EziJU5NdyKrwt1SV82E0QRQ7zzeIUy1gtS8QqKrBOFs=;
  b=mvWhl0GsZGn+qEHXtC1iHTlpIsS7qmChJvYGBe4aNeVHtDCYqEdmJ0GB
   0jfT6UDH9zRoCAivpYtcvw9Ma568mAmPg0Q2fXc1FSUWrW8+Req1YD/Z1
   pX9+1nGN6r2a3uYNTY4YBTn+38c0mNxh1EqDbvmbtPNCwokAuuk4rZ5zA
   LCuzbkbRsOlMaOonMvRNcQz3rIvLwz9tXx3RhflDcMRS0oVSV9BkV8v2e
   yUC5gDbPE5t4Uk5ElJhbQNAJnxV3Cqoh0f+dme1UDpdVl6PNhsm36d0dp
   /UX/9OkI+FF/atlGXgnGGWB2iDhcGG+qAEB+uJkJjacPcahBXlXIWl/qq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371090882"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371090882"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 18:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939959220"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939959220"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 18:32:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5GZ9-0007C8-1a;
	Tue, 21 Nov 2023 02:32:43 +0000
Date: Tue, 21 Nov 2023 10:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:sdw/start-BRA-support 45/51]
 drivers/soundwire/cadence_master.c:1947:14: warning: no previous prototype
 for function 'sdw_write_pdi1_buffer_size'
Message-ID: <202311211056.ntg6EYFM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   19d606a708d272594ed12ea8c4addd3392d0fe99
commit: 266c5b9196958d795f1a201e95222eec2a7bd6f6 [45/51] soundwire: cadence: add BTP/BRA helpers to format data
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311211056.ntg6EYFM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211056.ntg6EYFM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211056.ntg6EYFM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soundwire/cadence_master.c:1947:14: warning: no previous prototype for function 'sdw_write_pdi1_buffer_size' [-Wmissing-prototypes]
    1947 | unsigned int sdw_write_pdi1_buffer_size(unsigned int actual_data_size)
         |              ^
   drivers/soundwire/cadence_master.c:1947:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1947 | unsigned int sdw_write_pdi1_buffer_size(unsigned int actual_data_size)
         | ^
         | static 
   1 warning generated.


vim +/sdw_write_pdi1_buffer_size +1947 drivers/soundwire/cadence_master.c

  1946	
> 1947	unsigned int sdw_write_pdi1_buffer_size(unsigned int actual_data_size)
  1948	{
  1949		unsigned int total;
  1950	
  1951		total = SDW_CDNS_BRA_HDR_RESP +
  1952			SDW_CDNS_BRA_HDR_RESP_PAD;
  1953	
  1954		total += SDW_CDNS_BRA_FOOTER_RESP +
  1955			SDW_CDNS_BRA_FOOTER_RESP_PAD;
  1956	
  1957		return total * 2;
  1958	}
  1959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
