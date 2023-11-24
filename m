Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7D22E846
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jA5L1cm3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839433; x=1732375433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gbt7Cns5bhaIfCib3tyKiX6EXzUD1luuycqs/bp6HhA=;
  b=jA5L1cm36v9mTCbsCNzzEd5FUZQiTeXlX7ltNWfFOKslIq/Iy2V54YYR
   tA6lwbWA2eRhlX3S83skKYXz24tZADs42lep9Je9d4LyFZOn1KuQlWl+N
   0C3SJv8OyqSQUn0UTLI5lDPHG420TK2j5rikgAxuBmq28Ze9RasbMMCB+
   xVNHIpDlnp5+p8D8jRkFdx8vEivcnfC+9hSAWmuWSd/I+RQ9Pk6EAREO0
   tv77WUCQtRwFd2lhoNkoDAJ/a3Xw2X2+6pYn+rMoyeB65+Y7ykq21yr3M
   o71SmsNk7CEA8XsZEtqxzLQoLI3KQn4yjRN6OKoiCqDFQJtQMwBnl0j8w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="5660660"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="5660660"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="16002337"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Nov 2023 07:23:52 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Y21-0002wW-2B;
	Fri, 24 Nov 2023 15:23:49 +0000
Date: Fri, 24 Nov 2023 23:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [krzk-github:n/dts-coding-style 3/3] htmldocs:
 Documentation/devicetree/bindings/dts-coding-style.rst:118: WARNING:
 Unexpected indentation.
Message-ID: <202311241657.nCWkQcA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/dts-coding-style
head:   21eb006c7a0e6004e6c2b0637c872a0d8e13068e
commit: 21eb006c7a0e6004e6c2b0637c872a0d8e13068e [3/3] sq
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241657.nCWkQcA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241657.nCWkQcA4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/devicetree/bindings/dts-coding-style.rst:118: WARNING: Unexpected indentation.
>> Documentation/devicetree/bindings/dts-coding-style.rst:119: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +118 Documentation/devicetree/bindings/dts-coding-style.rst

   115	
   116	Above order follows approach:
   117	1. Most important property at the top (compatible then bus addressing to match
 > 118	   unit address).
 > 119	2. Each node will have common properties in similar place.
   120	3. Status is the last information to annotate that device node is or is not
   121	   finished (board resources are needed).
   122	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
