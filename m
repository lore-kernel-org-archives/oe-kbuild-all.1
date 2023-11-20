Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D361D528
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 15:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCrRNTD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700493947; x=1732029947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CDIApgwDkcSGT+f05lLcnBfkNBtdeJA3c8yzRNanAdE=;
  b=PCrRNTD+vmHeLf+j2zUKLazBoFoTz0PVxReqHRp2bii1XAHC7b7rNpSl
   TEwyddWtYERR5S/GvG/BvLAA4Bi5hvyFA8QdzDLjuetqVgAYntRdyVOuZ
   t4vTfHbRZSrmHzbF1Jjnrt5s3AKG8LJnouc4na6z+f8yIsKya4NY5Rx7g
   0bjs/QgiJYRPyWEX6UtNRriMXMtHEfMCMWhgCbeDvk2gegqlWIzZyUJn2
   QitHI+HDLCvDUvzDnIgAik31hHWT3MlzUtlMCp1o9j8q/OJwTvtIOO+Fx
   h08UnpGgfHhpsQ1ZARfCbUtWsQM7YLmu2x9H2D7g5Y/CPJbiJh1RIBFu/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="458137554"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="458137554"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 07:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7750602"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 Nov 2023 07:25:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r569d-0006Zt-2c;
	Mon, 20 Nov 2023 15:25:42 +0000
Date: Mon, 20 Nov 2023 23:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 10/19] kismet: WARNING: unmet direct dependencies
 detected for ASYMMETRIC_KEY_TYPE when selected by SPDM_REQUESTER
Message-ID: <202311202312.VYkmudrG-lkp@intel.com>
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
config: alpha-kismet-CONFIG_ASYMMETRIC_KEY_TYPE-CONFIG_SPDM_REQUESTER-0-0 (https://download.01.org/0day-ci/archive/20231120/202311202312.VYkmudrG-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311202312.VYkmudrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311202312.VYkmudrG-lkp@intel.com/

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
