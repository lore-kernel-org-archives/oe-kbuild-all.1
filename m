Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61E11DB36B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 22:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731884148; cv=none; b=gcpRD4f9fLDJaeOgi1TmshX7s4xxO6+W/mMm9y07+w1wq7VChA0aWV25F2A0HgFuRDWGrONry+CsqdWnLmTcudFQFDNtlC/wDPClwYMYnP/Wjz4E2Tnm7jdxBx8uZUs0q9BE1Od3lgAzJljBlYfrIN2ijFRacTjvUbHRc2Dw5qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731884148; c=relaxed/simple;
	bh=iUpX4muj1dNAi8gnD4ZLB9jbFf8YvuyMn7iphmow6Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VU+BShC6Szkzr9SAAN+SR0AlOY4D5V9ltPYwigIphjY7QFtSQQei1u0v/u+wzRGKC8WkXZPwN49QIISkpfCho3fFBsuI9wQ+DerZEcdDXAQivU6W09CYqCczynv/ZKOCdhOhNhYjtzBxzbFskHUHEzId10+GJAOwAtJKIAbiVaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESx3pC2D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESx3pC2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731884147; x=1763420147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iUpX4muj1dNAi8gnD4ZLB9jbFf8YvuyMn7iphmow6Ew=;
  b=ESx3pC2D+wxO2dDoq1NXjHpOqIty5pIqrZpkVTsdfHIondpMDCtg9T4Y
   oJi2UCi6UXUxVspFKx5aOl73mdY5h4d9UthD1qYn5LoLxTC26Ryx7gCoE
   fwz+jx9ak+TKEzjLwcNmalraT0eHA2GOqvASUyvnuD7SGNsb56o8YODcZ
   IzsFbpKQkuv6XXKRyjobNXnII0DSQGbQ97cIE9tkz60neqa8AJxC0tycx
   y37MzbD2UCp/Q8yBS6s7o0g4xsawCx8+cdPMVPbHgxVssBnYEMF8MbUsL
   dd7viLCdxmmQf4qHqQbbDE7/ijBA6M0lDP/U9rT+eQlZqi6wfkajvTJL+
   A==;
X-CSE-ConnectionGUID: 69cRy/wGSgCE3A1muC/LZQ==
X-CSE-MsgGUID: gDdJIFgiRN2oFnZeIn0iYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31580755"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31580755"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 14:55:46 -0800
X-CSE-ConnectionGUID: UBuaYLqPTg2CHeK1f/SuIg==
X-CSE-MsgGUID: mRRS6TV2SoWy8NllqEZJYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="119999086"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2024 14:55:45 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCoBC-00024Z-27;
	Sun, 17 Nov 2024 22:55:42 +0000
Date: Mon, 18 Nov 2024 06:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>,
	linux-doc@vger.kernel.org
Subject: [asahilinux:bits/005-maintainers 2/2] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/spi/apple,spi.yaml
Message-ID: <202411180639.WhJZUuaV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/005-maintainers
head:   b9472ab57f36e3a0b6c154e4d1374e840676cbdc
commit: b9472ab57f36e3a0b6c154e4d1374e840676cbdc [2/2] MAINTAINERS: Add apple-spi driver & binding files
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411180639.WhJZUuaV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180639.WhJZUuaV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/spi/apple,spi.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/usb/apple,dwc3.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
