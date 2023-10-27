Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EC1B66C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 07:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyFpBmgx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698391279; x=1729927279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rxlH5HwmCqZqMfavoFfoGzozPhjQGaJre4NyNPdtwOc=;
  b=NyFpBmgxOQWTwRB6JudPFjcof9k6kYut9IsSfJtw+Uf09KOrnR/cA2px
   CpZWSFgSGdbJSwH3mjHBA/U6bVqJRhvzMqeZQJCsJgy55F7ZPre9glkwa
   oF3Iwsp4XfeGwWLklknugTqtXfnR/L8XcpKp7BDEOjgpsbL5pg/nVRX3F
   dhAIAMDAPng+Te/8t/Y2c1V2kAZHfnRtt/IwG/L9i8mrnH+yE7nSBqkPL
   njjd1pTf1ibGm+fJAhTCdfyOW0tTzjsZbnNSKuyk08gEuOiKjepqTp1mu
   w7AoVZ2lSWxGEHzBUS3N37m7XHTSNYYbi6YFAjVbve/0bh6j/2Qmyo6e2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="378093014"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="378093014"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 00:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="829886894"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="829886894"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Oct 2023 00:21:14 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwH9c-000Aak-2D;
	Fri, 27 Oct 2023 07:21:12 +0000
Date: Fri, 27 Oct 2023 15:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, patrick@stwcx.xyz,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Message-ID: <202310271540.4uI1Fgxe-lkp@intel.com>
References: <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>

Hi Delphine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on linus/master v6.6-rc7 next-20231026]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Delphine-CC-Chiu/dt-bindings-hwmon-Add-lltc-ltc4286-driver-bindings/20231026-161739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20231026081514.3610343-2-Delphine_CC_Chiu%40Wiwynn.com
patch subject: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver bindings
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310271540.4uI1Fgxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271540.4uI1Fgxe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/ltc4286.rst
>> MAINTAINERS:27681: WARNING: unknown document: ../devicetree/bindings/hwmon/ltc4286

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
