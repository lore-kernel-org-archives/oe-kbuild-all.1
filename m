Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CDD22CBC9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840268; cv=none; b=KpnIUR4jc7iok+4h+BEjpsfZHssgYzSHIEqcd1Y4UMxNZ+pazuESJwRe2GhmtM5xkP1mf/Ag1LRI8Ej8Nxd/Dc3IxfjZvS6zWkWNAcnX5M0Ou2WejOYnDPZhUco7EaW7U64A9lGoD9qPJ++J1lF07gdYxVCGNaCniqV6JeUBakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840268; c=relaxed/simple;
	bh=r+OGepa90skBiTGbO4Zk6MzCmgLBsa/kwV9jMh6f+4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iUyCmMy4hom8w3ioveiDO4vvQe+Oyu9K7E4W99K0DF7tjJW3H/vNN2tVwG+z5Z9oCRY5MlromZCHfR37r3X0Q3vBQLsZiiZQIa8zyCZXTeLFAj8SesKMsWTIEAMt6RJwg2vobtUrOFcGBnEsW35A5wwAuSOS5n8Tb7RSB2y/T7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X9IAfc7C; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X9IAfc7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738840267; x=1770376267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r+OGepa90skBiTGbO4Zk6MzCmgLBsa/kwV9jMh6f+4I=;
  b=X9IAfc7Cr/1hfdP76jvReRVFhHPK77So0I7kRfFTeGEprWDLslhHHLtA
   xNxrSjkOZCx3gA5bSQKb80PxUMj27/uE24s/QJhKrW2Bl4REMgSxxigOU
   IUFn7JuwoUZqXRGoYsWCW6njPFj53RZplEYhoy0Tx7jCF1KrhxnRNTBVx
   Wu70KGYdt25q7xNdlHvG7cz8IBAIoOvLjgza+RR08yUm7QCugcSCZnsEF
   q6/oJaLG5ZrJI3gz6ocO9XjlQSqeblT3Jen/banOy5S6h3vv8H1BHp1ER
   TssRqZIS1ZePhBoxe5jM/rKHC1f726PAxY7B74mv0rSUFphzBAgfGRZdo
   Q==;
X-CSE-ConnectionGUID: UWnu0VOfQ22zYC6GB7yoiQ==
X-CSE-MsgGUID: v8otgTrZSLu7j21XG0ioDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42272789"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="42272789"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 03:11:06 -0800
X-CSE-ConnectionGUID: 0hU3N0YBRxqn1MnqSj2/Rw==
X-CSE-MsgGUID: BeaBgLdrScanYLOs2HWlsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116372641"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2025 03:11:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfzmg-000wmB-2Q;
	Thu, 06 Feb 2025 11:11:02 +0000
Date: Thu, 6 Feb 2025 19:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: T Pratham <t-pratham@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 1/3] dt-bindings: crypto: Add binding for TI DTHE V2
 driver
Message-ID: <202502061805.0hKPOnnK-lkp@intel.com>
References: <20250206-dthe-v2-aes-v1-1-1e86cf683928@ti.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-dthe-v2-aes-v1-1-1e86cf683928@ti.com>

Hi Pratham,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d4f8e54cef2c42e23ef258833dbd06a1eaff89b]

url:    https://github.com/intel-lab-lkp/linux/commits/T-Pratham/dt-bindings-crypto-Add-binding-for-TI-DTHE-V2-driver/20250206-172514
base:   9d4f8e54cef2c42e23ef258833dbd06a1eaff89b
patch link:    https://lore.kernel.org/r/20250206-dthe-v2-aes-v1-1-1e86cf683928%40ti.com
patch subject: [PATCH RFC 1/3] dt-bindings: crypto: Add binding for TI DTHE V2 driver
reproduce: (https://download.01.org/0day-ci/archive/20250206/202502061805.0hKPOnnK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061805.0hKPOnnK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/crypto/ti,dthe-v2.yaml
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
