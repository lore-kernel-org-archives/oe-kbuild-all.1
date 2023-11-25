Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E77E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 00:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRr77V5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700871584; x=1732407584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MoyCE97kHC5JzJNxMyN3/Za3UJUSfbzDpbpa82aB6Qw=;
  b=PRr77V5tkZQw4O3CvsfPinOKv7q3rkyA2SRAN0YMPcH99KvOffDcWuDT
   CzrZhYIAGu5B6ixBATWsdVv9kjvFugqUvAd1ElzwZ2sYlgTcaUvLDLg28
   X5mSTMrx9azkkgGOmRu0MUxKQksCOY03ERABDQphc3q77YBqaHtGo92RO
   wwfs6uMC0/3zhvDQRUWau82x9xmJf3KOdj41Z+pqrFAytl7i58zVYqj69
   tnFCTYesPuIWcsWUd8uGn8kYAdCH5OIueifLaSPPuTNTipbamozpMAjFT
   ZF8xGG1oUNK47jVEbm9GuOe34+R1e+LQ+pvWMItJlHgmj4GSjaqo4zKEK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="391350879"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="391350879"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 16:19:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911558725"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="911558725"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 16:19:38 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6gOW-0003Qe-1D;
	Sat, 25 Nov 2023 00:19:36 +0000
Date: Sat, 25 Nov 2023 08:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:tpm-dt3 1/5] dtbs_check:
 Documentation/devicetree/bindings/tpm/tcg,tpm_tis-spi.yaml:
 properties:compatible:oneOf:1:items: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202311250635.qlMsGVng-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux tpm-dt3
head:   e9193992257d60f39eb760f644f5dbaa20dff6a5
commit: 79f679f3f17cfce53d18f7e0c6ea858ecc83c2c8 [1/5] dt-bindings: tpm: Consolidate TCG TIS bindings
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311250635.qlMsGVng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311250635.qlMsGVng-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/tpm/tcg,tpm_tis-spi.yaml: properties:compatible:oneOf:1:items: 'oneOf' conditional failed, one must be fixed:
   	[{'const': ['google,cr50']}] is not of type 'object'
   	['google,cr50'] is not of type 'integer', 'string'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm_tis-spi.yaml: properties:compatible:oneOf:1:items: 'oneOf' conditional failed, one must be fixed:
   	[{'const': ['google,cr50']}] is not of type 'object'
   	['google,cr50'] is not of type 'string'
   	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml: properties:compatible:oneOf:0:items: 'oneOf' conditional failed, one must be fixed:
   	[{'enum': ['infineon,slb9673', 'nuvoton,npct75x']}, {'const': ['tcg,tpm-tis-i2c']}] is not of type 'object'
   	['tcg,tpm-tis-i2c'] is not of type 'integer', 'string'
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
>> Documentation/devicetree/bindings/tpm/tcg,tpm-tis-i2c.yaml: properties:compatible:oneOf:0:items: 'oneOf' conditional failed, one must be fixed:
   	[{'enum': ['infineon,slb9673', 'nuvoton,npct75x']}, {'const': ['tcg,tpm-tis-i2c']}] is not of type 'object'
   	['tcg,tpm-tis-i2c'] is not of type 'string'
   	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
