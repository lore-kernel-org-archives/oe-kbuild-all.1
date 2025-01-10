Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB8A205512
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 10:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506127; cv=none; b=R0OVfrT4UtwYfHhuK7PEaH8hZWmVmi4Vrf+TER5v4pbXwg3L/sNDuJU9in6P44JzW8hBJsaHS7jnxVu+GDaHS99URJNPZS/bu7wX3bH4G3fGW4frPUa0aNI6HG87LkSyzwJwm9e4DYbLg0lurhvvbOpSRpMpO1XBD61stdzmCsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506127; c=relaxed/simple;
	bh=8UbyxEGzxGrKmnEXKWU5X0EhBYyltwhOR+qZ7CYftFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfu07JP5WRWsreqUIY8syJZEqNt3JPLEwlkwRLio6slGndgZiBy3DiQc55t3NaM0xKwJifxrHZbYSAwyJHhK+TPV1V2CRLHUWQ6UXVgFoFNke4p43kMeXM7VEJYigvl76yZN4H03QYFJVRmAzETLRWLO89R+p89544+IjHIw/4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZiM0FBOo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZiM0FBOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736506126; x=1768042126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8UbyxEGzxGrKmnEXKWU5X0EhBYyltwhOR+qZ7CYftFg=;
  b=ZiM0FBOoW7F6YUgvYWtracUNMDX2vNGmoY5Kvpqyu7+qou4AKLgSH4La
   vw317I7sAj1TwDrkRFd5NSc53H5eJ2Oi8J5HNBh2nRYRaY4CMIJnr7XeU
   qoZ1I3PY1PhFj2ikxJyJ1HsUthPI3JfEXXNJtqkS7bPDQ99+JiDWAXb7d
   x7SZ2AAn6JejBrabWGLmVkfayq0BhFlaK/v75M0TX3UypEuf+EwRUm1dp
   uSIEu/3zXJ7q0DXml82lp8QOHbLt85Sx+kA45U75C2PZWaP+kNHwcVopG
   Z/hvPC2BnRd9m7kJPtmgbHqlsTFDKnKQwFtZVFW1oWyiQOMHXvVc5ZbTx
   A==;
X-CSE-ConnectionGUID: 7j9fHDRUQd2o/JpWyuqQfQ==
X-CSE-MsgGUID: h1R7IbqHR/iSkjXUdwcGCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36822294"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36822294"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 02:48:45 -0800
X-CSE-ConnectionGUID: spHEIs6AQlyHZL7vcpKk+w==
X-CSE-MsgGUID: oJ2dw3KXR16Bt05Kl5GySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103587558"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jan 2025 02:48:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWCZE-000J4Z-2Z;
	Fri, 10 Jan 2025 10:48:40 +0000
Date: Fri, 10 Jan 2025 18:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dhanunjanrao Katta <katta.dhanunjanrao@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:lkp_test 117/504] htmldocs: Warning:
 Documentation/devicetree/bindings/sound/xlnx,v-uhdsdi-audio.txt references a
 file that doesn't exist:
 Documentation/devicetree/bindings/sound/xlnx,audio-formatter.txt
Message-ID: <202501101859.GVxw5yM2-lkp@intel.com>
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
commit: f719101fc152b7713d99c9ef08f619032856d71a [117/504] ASoC: dt-bindings: xlnx,audio-formatter: Update binding to yaml
reproduce: (https://download.01.org/0day-ci/archive/20250110/202501101859.GVxw5yM2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101859.GVxw5yM2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/sound/xlnx,v-uhdsdi-audio.txt references a file that doesn't exist: Documentation/devicetree/bindings/display/xlnx/xlnx,sdi-tx.txt
>> Warning: Documentation/devicetree/bindings/sound/xlnx,v-uhdsdi-audio.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/xlnx,audio-formatter.txt
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
