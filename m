Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB2C2018C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692739339; x=1724275339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y/PX+iIZHu/Jekn+z+/zm+Vb0q6ZXF8TRNOr3t2FcOw=;
  b=FoNWPuRpm+IsW748/5gx5twj705FNfSTicR67bZhWHrOAvOVRjCP7tTg
   pbkChsjrb+ZaAtd+KUuuqlIectWGaYkff/cOTX/VZxrb2lwMSU79yHTW9
   RnUB5xRrWfh3gLvKARW4E6cAukaXagH44eIkQWfvRcCju2h6AxL0wWep1
   I2ygKPKKxccAlWGO+6NeWM3Zto/sowGrGrirHVE3Bi//iL0U0ztiwXEer
   wbKTWkanxbQnZEv2R3dw8FPbZ7Gali8plY9/ufz1vjjFJd2FoR4i61ACr
   cCpAcsTxi3FYtGSiyA0HnNBd1F6x7nxiZ/owCrDLmQvwzH9IJh9BqLjlZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377755790"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="377755790"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 14:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806432741"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="806432741"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2023 14:22:06 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYYpC-0000XA-0D;
	Tue, 22 Aug 2023 21:22:06 +0000
Date: Wed, 23 Aug 2023 05:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Fabio Estevam <festevam@denx.de>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [robh:for-next 22/34] htmldocs: Warning: MAINTAINERS references a
 file that doesn't exist: Documentation/devicetree/bindings/pps/pps-gpio.txt
Message-ID: <202308230517.n0rrszYH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   ef04d2801c5d239b83932f8ce97af1d4a1ec1cf7
commit: 7ceb60ece8567e58b7e04965b3a434a0ed606053 [22/34] dt-bindings: pps: pps-gpio: Convert to yaml
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230517.n0rrszYH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230517.n0rrszYH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pps/pps-gpio.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
