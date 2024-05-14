Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91617EBA4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 May 2024 15:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715699120; cv=none; b=eV7aEzS9lGkfKGYREAqaQx/TEOFPI348OgGOwqLwFUoFgKErwxscy0IlzrTJh0Kh/w26jN3H/uoV3BkLM7cfP5Ok8cYkixl0OLisF8vxl6yRS3iW6qr8YWCps9Sz9yktRtXGzC1ZHBt2pr/RzMk5vExstpPWUFFMzFsjO2ZypR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715699120; c=relaxed/simple;
	bh=WO2ZPyFdMDCuN4Vi1bNSiOyJZCjTrUmtLapdLRGv73c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tgl32QKpoHziLLunir+T8E2bC/tfzaT9AtiLWkHQQr4xx/Vv2fCOJpVXWOUfI7sEemq5zRfZqIEHJA+JY+UWBJK4TMywYQB5A913ief3C3A5YYKOlpeaBf4uUbx6ZRr10Q/J4WxQUse0eAivAh+tzOSG688a0N+q09HQrkjWvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H7clV5U/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H7clV5U/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715699118; x=1747235118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WO2ZPyFdMDCuN4Vi1bNSiOyJZCjTrUmtLapdLRGv73c=;
  b=H7clV5U/NJgunwr4rVCXc2PxBbygHe2pFPDJ8WvHHS5cOjpCpYcsMRX6
   P96qDLBz1YelgKpLsn54jOQkH9EPDgapkPxJcEip/ia6e/LpkUv0aEjx4
   +w6fHtkEZZX01e8SYwSsugZsb691QStaveYsfeaLT3Es+Li4vx8RPLikc
   Tx2ChS+oe/ZFSIsQpfjZc7Db/9LhMmiSYqf8u0G6esV1XbhH6FdKqxuYf
   C7x95vDA7QGRkWhBbH/jX2O16Kp1R0ATkL4txBaS2+Nu0g8pWVqt5oOVZ
   WskPVQwaU099q/Rh+IHbDCP6+OHsIyYC8SogjJP+Up2Vl3skXEbktR8zO
   w==;
X-CSE-ConnectionGUID: zOXca9XXTkqIZpiHP4DD6Q==
X-CSE-MsgGUID: WZLK3vpMRBiXZlfcpo5gKw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11855593"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="11855593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 08:05:18 -0700
X-CSE-ConnectionGUID: wnLNwo/LR+imyRjkihFGzA==
X-CSE-MsgGUID: 7DWXS78nTu2nqLuXWed4Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="31257341"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 May 2024 08:05:17 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6tiL-000BY1-2r;
	Tue, 14 May 2024 15:05:13 +0000
Date: Tue, 14 May 2024 23:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: [drm-tip:drm-tip 10/10] htmldocs: Warning: integration-manifest
 references a file that doesn't exist: Documentation/i915
Message-ID: <202405142346.OQO7OOGu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   723adadf19b6bd8a54881b0e7d04ba56c4e8f401
commit: 723adadf19b6bd8a54881b0e7d04ba56c4e8f401 [10/10] drm-tip: 2024y-05m-14d-12h-21m-31s UTC integration manifest
reproduce: (https://download.01.org/0day-ci/archive/20240514/202405142346.OQO7OOGu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405142346.OQO7OOGu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: integration-manifest references a file that doesn't exist: Documentation/i915
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
