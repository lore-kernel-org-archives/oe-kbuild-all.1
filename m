Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD4DA35
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 03:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686279671; x=1717815671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=46/DXtgTn5NK4cDoKfO/h2MGoc056EvBq8SW7kYdZIQ=;
  b=GPPISbPM4iKGCuaniWfB8bA/zi7O5Ro1cqgHVAQ/Sp4RkmU2fYaMakFG
   KP/45wKoW48D4c0W7RWFU39cHP9d1alOpDXwjKS+DWodAaxSdUBpxQrW7
   GVey8mU2BNgHuA8ucKb1bPd6fnHZM6Jr3cNVwbCect++2PU/djpDs8I+l
   tIUBvBfFOATMbBRI3mzr+fM/MnSR+OBmsgFbiZIQ4Wx1fVofwL4JOVoQq
   yFhI/p4CBFQH0rozM8V2uxRUvU/MQ9x20Pqx2GLKcr6UxpeMGdc/xBCIQ
   DlkBs2KFsG/4BoaA2XuK2SvNnq12JHtseuIcAB0AIashmudZucgzWjcmX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="357501055"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="357501055"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 20:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="713346314"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="713346314"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Jun 2023 20:01:09 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7SNA-0008Yr-38;
	Fri, 09 Jun 2023 03:01:08 +0000
Date: Fri, 9 Jun 2023 11:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/input/input.c:1749:5-8: Unneeded variable: "ret". Return "
  0" on line 1772
Message-ID: <202306091029.wQ9evbxs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: 91f0054b3fd8be1d6f7ee9d6da93fa82cfba8fb8 FROMGIT: Input: Add "inhibited" property
date:   2 years, 6 months ago
config: sparc-randconfig-c003-20230608 (https://download.01.org/0day-ci/archive/20230609/202306091029.wQ9evbxs-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306091029.wQ9evbxs-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/input/input.c:1749:5-8: Unneeded variable: "ret". Return "  0" on line 1772

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
