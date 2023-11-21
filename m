Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFFC3EA79
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 11:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2WbWtSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700564956; x=1732100956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99UhkcDaizWOzcFoH7fFwInBVEMxF2x8cD7pJ1BhoyA=;
  b=Q2WbWtSeUzdG15bYFvuqhgcNxT7UF5l9GzA9q4ae5d2qa0lI0vjQ0OBN
   /8afKl9/4cDmDwS2vMShN7cQFRyIZIcCZgB6TtKf2INjmVcmRfvWWNV+I
   EYZOOPZBuvatuO5ME9kwLgNnUdjs1v6U86Wt58PzzDgH5yPBYirxzt+b8
   XHucAUh1OAVx7gdYm+6TWpz/+72g/uQC+OiSYibv5/v/RgweH+AuV/m/b
   xkMctczW6rm7ernWbMWsS9VhfGd8yB72h7J28Vmob5F4xBrcEhxNB915w
   eZYCviEIxkLYwXgz5UsM3KO8BwfYlJ4BI3lIq8YleNx9KtmfoGJp7OFQj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="10480279"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="10480279"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 03:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="7869610"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2023 03:09:14 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Oco-0007ik-1U;
	Tue, 21 Nov 2023 11:09:09 +0000
Date: Tue, 21 Nov 2023 19:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 10/19] kismet: WARNING: unmet direct dependencies
 detected for ASYMMETRIC_KEY_TYPE when selected by SPDM_REQUESTER
Message-ID: <202311211937.ziM4F6AB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux spdm-future
head:   cbb2ced8afdead342cd231ec248f9ea65353ab1e
commit: c0c99a1cfb6a7a8fba75aa194c89d9a5f531af6c [10/19] PCI/CMA: Authenticate devices on enumeration
config: alpha-kismet-CONFIG_ASYMMETRIC_KEY_TYPE-CONFIG_SPDM_REQUESTER-0-0 (https://download.01.org/0day-ci/archive/20231121/202311211937.ziM4F6AB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211937.ziM4F6AB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211937.ziM4F6AB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE when selected by SPDM_REQUESTER
   
   WARNING: unmet direct dependencies detected for CRYPTO_ECDSA
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - PCI_CMA [=y] && PCI [=y]
   
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=n] && KEYS [=y]
     Selected by [y]:
     - SPDM_REQUESTER [=y]
   
   WARNING: unmet direct dependencies detected for ASYMMETRIC_PUBLIC_KEY_SUBTYPE
     Depends on [n]: CRYPTO [=n] && ASYMMETRIC_KEY_TYPE [=y]
     Selected by [y]:
     - SPDM_REQUESTER [=y]
   
   WARNING: unmet direct dependencies detected for X509_CERTIFICATE_PARSER
     Depends on [n]: CRYPTO [=n] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=y]
     Selected by [y]:
     - SPDM_REQUESTER [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_RSA
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - PCI_CMA [=y] && PCI [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA512
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - PCI_CMA [=y] && PCI [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - PCI_CMA [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
