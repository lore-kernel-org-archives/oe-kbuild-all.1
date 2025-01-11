Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987FCA55
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 21:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736632030; cv=none; b=FF4EjcQqXzjHM6NSisbprK2DLa0HADHtF6MlMJgv5pJUalY6+W5izFj8gbqpYx3jR/5blhnXEwoF4Fte1Xg/5gUx6eLEt3sj94JXLz2+SiKbLKm+fbWJ6LmA0rZOPvLChOawK68A4fG1pGYS5aOK+StDrqCbEm0IbSK3XO9hLSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736632030; c=relaxed/simple;
	bh=HSYjfLpTLrHYMmrvAxkJNCEx6wp3w97j0OC0n6lOISE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hy040qGx/QkiWfcfER+j7nKwszAFWOeKPHAiV4g6tZID/ZkVST3mEdCXxIZuYvwUKf0nVj+G/GtIRNTalCzo685Cr7UdMFxMn/OF10rOcC5S7V7kNl79p/V4fvC+4OQxLRgNJqXlDLUf7r6QwBG9usBK2PkE+/WdLpT+FViy2YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThWBrN7x; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThWBrN7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736632029; x=1768168029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HSYjfLpTLrHYMmrvAxkJNCEx6wp3w97j0OC0n6lOISE=;
  b=ThWBrN7xNBiwbODp4DSXkKC+4nTg9vOtMYabFAhHvREKk7uOCH6E7arq
   T225GOsMdau8al9bkvXESwKIyaTFlMybsZy9SwLPAM3+DJ1BP8kZcpvn7
   OJucNlc4f5wIAlSIGV/X0UFInLlZmqzWHhlcmDQqIEtAQh+jiXEFuquoV
   03fWXTQRn+fBf7We2s7CwAg55pDWZZ5FxBbWi4al0qDfyqwGmWdfcXpZg
   Wb7Jqj6M5HujbQTgPXRrPU898vfFMsDr1gq3/BmEXzUa5dNE5cDoJkmx4
   tG3CsDHU78ykc8e6+teDlL30ilRKOQ3+Fns23Aw1maVNviSIcqvQYsIuI
   w==;
X-CSE-ConnectionGUID: EW4rJuaSSkG82k1X9/jxCQ==
X-CSE-MsgGUID: 88iWEtZOSvykLs+88AyzOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="39714394"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="39714394"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 13:47:08 -0800
X-CSE-ConnectionGUID: WG4U2/3iRpq6o+6bHgWcJw==
X-CSE-MsgGUID: Hm08VnTUSrmrvjw2rQ+bmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="108956531"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Jan 2025 13:47:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWjJw-000LFv-1X;
	Sat, 11 Jan 2025 21:47:04 +0000
Date: Sun, 12 Jan 2025 05:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Raviteja Narayanam <raviteja.narayanam@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [xilinx-xlnx:lkp_test 62/504] Warning: Duplicate compatible
 "ti,ina260" found in schemas matching "$id":
Message-ID: <202501120521.Pz9MMIEW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 8f4027a9b85ef86eb30043704a6c71d6624d768d [62/504] dt-bindings: iio: adc: Add ti,ina260.yaml
config: arm-randconfig-052-20250111 (https://download.01.org/0day-ci/archive/20250112/202501120521.Pz9MMIEW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501120521.Pz9MMIEW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501120521.Pz9MMIEW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Duplicate compatible "ti,ina260" found in schemas matching "$id":
   	http://devicetree.org/schemas/iio/adc/ti,ina260.yaml#
   	http://devicetree.org/schemas/hwmon/ti,ina2xx.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
