Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC2E18EFCE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 22:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722293530; cv=none; b=iowM9U8Q4dxlLjm8Ypbps1vGypzTeENvSqycqFRZC4zMlL1zGjmTM2ZBm1whR+rc1izYidqw0rUlvnoS7PK1vZMsLDRUBaIOt7FiKAxh+77aP0ujBPKjID+4MtDp2D5dhKDS26TXyzDaoaRgPjKBNc2P7lUQ0DB4F2pig/ocf7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722293530; c=relaxed/simple;
	bh=EJSwlSm8eCcJpGYlpOEzmLrTY0E/UPfdfjMSIGHuCRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R+6tvSS6Y+I7l6wdU20H3jookP0Os6p3MZpVCMDpVEupq/5SQ0svJdGJiyOrq/PvS9wvp92Wg87nxMJs8AnMKd2H9spxDYDbXtVGqKFaera6sB+XniWntvtgnH2ZscUQiyR4XYPw3eOWW8FQIacuKMnakMcWJm0Z4LiTshKEyVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ciXFmOYd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ciXFmOYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722293529; x=1753829529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EJSwlSm8eCcJpGYlpOEzmLrTY0E/UPfdfjMSIGHuCRk=;
  b=ciXFmOYdI156/mGkAxNATbl8rINVyRPjNfjnUTwtyQ8/l7NVHEAeliaZ
   /awtA+iSpzI4HkrJ+dQ+NeI6RSudu4hKmk2qi0sOdpwTXBnpIeYIpC9zO
   1dZBiPG5FvThYgs0+OR4A2T0g8I00d1s87OhAVNRSFqtnTZrMC1l+modl
   gd2oQimsr9xSoDbCr4tBYCd46p5fU/tYHSdIHI8DZkSv0HO04X28S1tMf
   cdFvHU7ozYt1VgXyctkjGQy5WmxzVtkgFQTcaRz4dd3rG5T0gTa8XuCSb
   er21VotvCnAsbn5SrU7W/Dk6dFQl48tTfEHOVet5kwIimLUaI4RQeIJg4
   g==;
X-CSE-ConnectionGUID: V/WXTzJySy67SXWzYwwV8Q==
X-CSE-MsgGUID: kGIK/VstQc2QYgiovrEigw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20228990"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20228990"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 15:52:08 -0700
X-CSE-ConnectionGUID: mC6hFsI+QOeLtgPTT8n+hg==
X-CSE-MsgGUID: MyGaBhRESsunygTjrtmUKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54925187"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2024 15:52:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYZDn-000s9g-22;
	Mon, 29 Jul 2024 22:52:03 +0000
Date: Tue, 30 Jul 2024 06:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 1/2] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/usb/apple,dwc3.yaml
Message-ID: <202407300611.ba2No4ej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   e58fcf1783e145ebf6a5e11dd9e7a4f26d2fb88b
commit: e67eef26afff00da3e58d4d53ec8dfff8aacb8b2 [1/2] MAINTAINERS: Add Apple dwc3 bindings to ARM/APPLE
reproduce: (https://download.01.org/0day-ci/archive/20240730/202407300611.ba2No4ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300611.ba2No4ej-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/reserved-memory/qcom
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/exynos/
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
