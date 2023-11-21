Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D796A29A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 02:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ylc+f2lj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700533969; x=1732069969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+7wOPXcOVdfZSvFOZb6z9N0SnVOPLq3qHLNbj4lvzMc=;
  b=Ylc+f2ljuO6OkOS4Vl0XzUv9wrnBo5oJ2QWDXyppDMoPSpUF7i3NsBA+
   zI/nXcH4yPRG7CYlYd6PazfYNTPEgBT7znAhnnwPgSXQ6wiOD+w8aHn82
   W1XQom22sGn31b/6XapirtVjcJAJRLPbSIJAeLxy5mxYO2whtgTrB3elg
   QYPlckwMyIdh86RTE5e7RNtPhyhxTcRueLgYpKBsNgKkE7NGLGRf38EEp
   j/Mnb83Y4/DQbiBtlSUdpoLaoTs17KxBbVdZjzXMLZU450rzM2y2JqKsu
   uEl32EY82Q3bYRB1T6hEu/Dne1pm9Gftjj6kac6EQpK0AyL4JLzqr091n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="371090884"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="371090884"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 18:32:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939959224"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939959224"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 18:32:45 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5GZ9-0007CC-1j;
	Tue, 21 Nov 2023 02:32:43 +0000
Date: Tue, 21 Nov 2023 10:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:spdm-future 10/19] kismet: WARNING: unmet direct dependencies
 detected for ASYMMETRIC_KEY_TYPE when selected by SPDM_REQUESTER
Message-ID: <202311211022.8XOUThOs-lkp@intel.com>
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
config: alpha-kismet-CONFIG_ASYMMETRIC_KEY_TYPE-CONFIG_SPDM_REQUESTER-0-0 (https://download.01.org/0day-ci/archive/20231121/202311211022.8XOUThOs-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211022.8XOUThOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211022.8XOUThOs-lkp@intel.com/

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
