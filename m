Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1964747B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 03:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjlGZIFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700709135; x=1732245135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jE4hWWB5mmsiVGqXeuSdeQ2erKoTK1fEJIdlQnbT8Ac=;
  b=XjlGZIFMVNlZ98SKJnVtlRHpRixbJJXOEH9DCIciN4U9YM6WdByElqJ/
   LHYWKpw46Ffaf+BCza2fDJP1T942eJDMRTs+fSoLwcKSXOoMHk5dpbw+9
   MFV7963WSAEhLDXloBOvpRhanGYEMRK7WUUkTUY6vP70OzajHPrDbAiZG
   jNKfd141Qo1+PUdJM/ItZEesUVuOFbGO7DKnNdyEtVmwL0fRGY6vWxl6b
   Oux8GzY8miPUb0EZllITkr20yF1r3ZbDGUZZNwvoQ9Rvt1qj26a5ZTdHB
   WIdZR2ozkfB2/50wXeUGRsFtgVj6DybZfAnPk05Uj11cIW4eI05gcZYL4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="13744881"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="13744881"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 19:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="8712752"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2023 19:12:12 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r608Q-0001A6-0Z;
	Thu, 23 Nov 2023 03:12:10 +0000
Date: Thu, 23 Nov 2023 11:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.6 26/58] htmldocs: Warning:
 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt references a file
 that doesn't exist: Documentation/devicetree/bindings/thermal/thermal.txt
Message-ID: <202311230905.jju0TKdJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.6
head:   9fd3fe525544779d6bc28fa948759535ff7232db
commit: 45a09b8fe7f0106250a1660d27bdf58652e9bea1 [26/58] dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
reproduce: (https://download.01.org/0day-ci/archive/20231123/202311230905.jju0TKdJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230905.jju0TKdJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt references a file that doesn't exist: Documentation/devicetree/bindings/thermal/thermal.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
