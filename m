Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607491DA5F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694595788; x=1726131788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXk20T0ncw7PxlJrGzRdBIrBIQOHy9mH1oMqQRqELSc=;
  b=H0BbjGWruzoOdFXKUYELXQ/E1Zm+1AwxUqDlUahV+hGUAl6vvibqSulp
   e+WBarmWRFizSVzLEIb2NM7u/dpLAomXZ4hJrdMwlnA5nNkfgi5cINIh1
   GenC+kjG218FjEjM1RsZ7SJL8R7R1pinMoYi+GmPPjWdHQ9q6MXfCk63d
   RWbEKpAEofijiWpwKLrn5702Rf0UEEPJhNzRL7HZ4pFfVxKpJFdNffKJz
   lBqyZcisL+tJd4znBAD7J3Lq0Ghvw5hZHy46D4pyKLfgWWVHAVcGh/ejd
   RmLEGgqX3x1jducP55bkOvNvRJf+HE1TR1qZB2tWwiupbNjbYZ7BSBZ8S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="442637157"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="442637157"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 02:03:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="887253871"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="887253871"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2023 02:02:36 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgLm3-0000Iw-1j;
	Wed, 13 Sep 2023 09:03:03 +0000
Date: Wed, 13 Sep 2023 17:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 1229/25020] htmldocs: Warning:
 Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a
 file that doesn't exist:
 Documentation/devicetree/bindings/clock/imx8qxp-clock.txt
Message-ID: <202309131631.1M3y8Ur1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 02cfe4ee4c9eb948bb4889e282d311f49cf0fba2 [1229/25020] LF-1189-4 dt-bindings: display: fsl-imx-drm: Add LCDIF mux display doc
reproduce: (https://download.01.org/0day-ci/archive/20230913/202309131631.1M3y8Ur1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131631.1M3y8Ur1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/imx8qxp-clock.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
