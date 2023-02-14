Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A5B2F24
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 22:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676414666; x=1707950666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LdaxnPzV5Ozbsd0DWvayN9BNR0oxWZa/Q9Pi+fJjQ6o=;
  b=juQegIv1ea/7iMqcc2Gkn+gnBGgZz96526Pcb0Ih/S62SjMn2U/5cukK
   vVt0uW8IyNLNWvaUTRd2l67hHIiqGi1zz+ZO9hwWN5xx4Jr8r0fwfjMpE
   uflQ8evwnuHQelXqWD1VR6OFIO0ElZ4ybnvJFHyMSgMCWRdIUH1I6iWXW
   QDsWHq559091sSluvIkIVNyM7+jnIMqyORZyKh/laQRt0JoX/fmiEVnWN
   G7iMpDE/LvsfmCiQMkxa0P6JSe9CRU0R7WD8B3kt6R64hU95fGBmwaxW6
   87SZfrTaM6Hk8dyxCKgE5/c56CyGQ45RiyMI+TBXKXmSo0rnh61yjKy6K
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329917763"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="329917763"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 14:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="843339661"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; 
   d="scan'208";a="843339661"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Feb 2023 14:44:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pS42B-0008pp-20;
	Tue, 14 Feb 2023 22:44:23 +0000
Date: Wed, 15 Feb 2023 06:43:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lu <lujianhua000@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Lee Jones <lee@kernel.org>, linux-doc@vger.kernel.org
Subject: htmldocs: Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
Message-ID: <202302150624.hBap1fiY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/backlight-ktz8866-Convert-to-i2c-s-probe_new/20230128-142032
head:   dc37b5d324751a941e8c1241d6043bafef5b10cd
commit: 65759c2135f640ed6d9ef64b96666e2980b4d122 backlight: ktz8866: Add support for Kinetic KTZ8866 backlight
date:   3 weeks ago
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/65759c2135f640ed6d9ef64b96666e2980b4d122
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Uwe-Kleine-K-nig/backlight-ktz8866-Convert-to-i2c-s-probe_new/20230128-142032
        git checkout 65759c2135f640ed6d9ef64b96666e2980b4d122
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302150624.hBap1fiY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
