Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F74825A658
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Jan 2025 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737923969; cv=none; b=uMRlWjHIj+hLHIM5+8gHQHp/UzV1/9AVLOoJRdWlEf9r83ShD9BhlClaOJLr/a9F44VAbqCibdQNJKP8J1CYmNAL5PextflXSjzuU0CkoRlBf5i6IJ1Jo2pSfhVf5dIvQ0KRx06fiUY7Z2f/nGjwTtBg2iIRdzduL84WyNa2FLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737923969; c=relaxed/simple;
	bh=Gzt7REOYS3ByhbVlKUTGBgFdCEtDTn0VrRe2hHV1074=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YhmWW3xWLTRno1sHEUzPXCpJ8jP++M9W1FTMnXRr8/TRCvr8rTZVhM5qySiClZr8g/VibvXyQCcPlZ6MAxjKicuBdm50nc2K+I2DAawO91i6f0NZgXubtSxX2moFYVKQYpeCrwzBcLYRqcG5ohZFrHebv5t9bYhVUWTIg2LW34A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kc3kubC4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kc3kubC4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737923967; x=1769459967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Gzt7REOYS3ByhbVlKUTGBgFdCEtDTn0VrRe2hHV1074=;
  b=Kc3kubC4xynwzK315xBlAUDTny5VQ+QVFCLiOvcemKlSVAastICkJ3/N
   37v13esx9dEpXVZ/kCn+ATTasxqh03UKZ2rM4h/0D4qf0KFxtnCAojunK
   MA/vsPMqRvPDAZrjhmQd43fhLfjrMwjlFGwRQEghbFXNgE0Bo+QbUlZAn
   kUtuwWR8p9d56MAEPShvv2b16+wYjS1h4uL4DSQmyhdtJ6QRQXWfB7LkZ
   1jlfapzpVpXumpAoxPsSZAKWuWzw4HVAhlUrBotgrDdhK7LNLEz/G+QMb
   Op+bEgtDLBZvEtocW+y2F+P2dwTWJoLSQX4YSfwgdsSdXw+E/JdxGTT+w
   Q==;
X-CSE-ConnectionGUID: pdbVADmDSUKM6TivP3dOUg==
X-CSE-MsgGUID: ISgnHEgQR3GvX2pSp/Yjhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11327"; a="60855656"
X-IronPort-AV: E=Sophos;i="6.13,236,1732608000"; 
   d="scan'208";a="60855656"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2025 12:39:26 -0800
X-CSE-ConnectionGUID: 7NfPGi+OR4aMfbmwuPFz1A==
X-CSE-MsgGUID: 3C03zAjxTf64tz37vfDYvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109178673"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jan 2025 12:39:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tc9Pf-000fzb-1n;
	Sun, 26 Jan 2025 20:39:23 +0000
Date: Mon, 27 Jan 2025 04:38:47 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to
 YAML
Message-ID: <202501270447.AQvPXpyb-lkp@intel.com>
References: <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-ppcyaml-v1-9-50649f51c3dd@posteo.net>

Hi Neuschäfer,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/dt-bindings-powerpc-Add-binding-for-Freescale-NXP-MPC83xx-SoCs/20250127-030042
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250126-ppcyaml-v1-9-50649f51c3dd%40posteo.net
patch subject: [PATCH RFC 9/9] dt-bindings: nand: Convert fsl,elbc bindings to YAML
reproduce: (https://download.01.org/0day-ci/archive/20250127/202501270447.AQvPXpyb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501270447.AQvPXpyb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`rt_link<../../networking/netlink_spec/rt_link>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
   Documentation/userspace-api/netlink/netlink-raw.rst: :doc:`tc<../../networking/netlink_spec/tc>`
>> Warning: Documentation/devicetree/bindings/display/ssd1289fb.txt references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/lbc.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/hwmon/isl28022.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
