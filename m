Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C610EE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 02:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+JTCA3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698805375; x=1730341375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cHZMDjD7poW1QsLZE6OBAd/dykViqrd3e3klgpkPZjc=;
  b=a+JTCA3YfyyCIcsSMMN2X9YiyE7x6g5R5VJKku7qUxvdUWzaEodTHy7f
   MyWTNSBE4Udpg+HzkwpfT/tQiVDXBOc7v508gkCa5brkPWzz2hniHDLEd
   qPSGX0+2ej/Avqbx1Kf/g+qf2XH3N5DFeTgMgJTYR8FpRXinz5Qybj94B
   4fdmcTnFTsssHDPutUB9zs2hUZcv6f1RPwSZJ/BQNuu/35OxnNtxm0Uwu
   6H569VhsVdj/9mB+1/45cU9fQIEIkVy7Gzct87epshURI2KYkEtxA5MkW
   eFBsIHjdWObqJog8jLlmphTGa/pgYdp8qvQjGfLxY2oS9+82n3bMCyWEd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="388239985"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="388239985"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 19:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="2040459"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Oct 2023 19:22:53 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy0sc-0000XE-3A;
	Wed, 01 Nov 2023 02:22:51 +0000
Date: Wed, 1 Nov 2023 10:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 15738/15964] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
Message-ID: <202311011040.L1ncxDT3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9c2d379d63450ae464eeab45462e0cb573cd97d0
commit: 53ed3233e6b5fbfb63abc945d1fc156222f4eb62 [15738/15964] dt-bindings: input: qcom,pm8921-keypad: convert to YAML format
reproduce: (https://download.01.org/0day-ci/archive/20231101/202311011040.L1ncxDT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011040.L1ncxDT3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
