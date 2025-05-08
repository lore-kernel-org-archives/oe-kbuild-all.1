Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECEA1D7E41
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700309; cv=none; b=laS9lKe6RWkGokS3UJa32Yaxn4lps2gUBa2mFNEIuW2rVBWq8ch/sePVf8YdTU3VWoJ3ffFcnBVI8Knbl1EDbc6hIZEamjFOoUluK+spH5GFE9JVWVk9t1aAURvgYrmCjl7pIEb2/19pFDFLRghA0LYxiryJiWOcQyeXhD+89KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700309; c=relaxed/simple;
	bh=yWIOpz1kRq0wNZilRUXFlYZX/2SixY9Yda62WkiMHA4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XpY34qkOpZF5bwLkOpNs0bLmGi6P1ocu6dgCGfLMLIdOPOvM1MvuRJjbhkUQw7ZMlNaN/Dy6u+iU9ewBAYc5N1XAqnJop0aVMOEqm62HmdQseshT53B51RQxkIk6RfEgemmwkY/KiqT8YRY5OB0Wg73RtZY+X0Cys8+y721s7uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TBk+cu4v; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TBk+cu4v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746700308; x=1778236308;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yWIOpz1kRq0wNZilRUXFlYZX/2SixY9Yda62WkiMHA4=;
  b=TBk+cu4vRyqVOXSIsOQ19t6hOLW6tkG0gYbiKsN2ekxUhIeuM5BNv6M+
   IJ9uTqa8SudOlB+2EdkRJ0AcGTdxQaxvyZzq/JYhuCCuDX2xbdh/Mq67x
   SeXbJCAHc7taavjTE5b69EYCYL9ieCxudzgbZ25Hky1nAQwEA0FhrjswW
   4ORTB5LTTHsSC+fKJFJQomKlI8jgkSxcvNDBTtz90435j94ldOJaBkQzr
   x00EcDsi12yVwTcKgUQZjBnDslWrmMc53D1sky5239n/eu18zqEZtK2cB
   MOjEY1SVyYVIH7pXwqnmft2g7OEovbPR69YNHvefbJdqDSXEfAihO6zeU
   A==;
X-CSE-ConnectionGUID: NCCZKwA9TE+z+ZdGXx5pqA==
X-CSE-MsgGUID: peZ5I1eZRTyywCQEXMd+Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="66006722"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="66006722"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:31:47 -0700
X-CSE-ConnectionGUID: YdUfMw+eSr+p+XUein+zWQ==
X-CSE-MsgGUID: wSU9onziTp24/ZDMfk7E9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="136266244"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 May 2025 03:31:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCyXX-000AsE-0u;
	Thu, 08 May 2025 10:31:43 +0000
Date: Thu, 8 May 2025 18:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>
Subject: [linux-next:master 7941/9308]
 arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb:
 reset-controller@2000 (amlogic,a5-reset): compatible:0: 'amlogic,a5-reset'
 is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset',
 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'a...
Message-ID: <202505081824.AOdkk37J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   08710e696081d58163c8078e0e096be6d35c5fad
commit: f0911f29478992f37e91c208fe44c2ea5b378b61 [7941/9308] arm64: dts: amlogic: Add A5 Reset Controller
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250508/202505081824.AOdkk37J-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081824.AOdkk37J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081824.AOdkk37J-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: reset-controller@2000 (amlogic,a5-reset): compatible:0: 'amlogic,a5-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset', 'amlogic,meson-a1-reset', 'amlogic,meson-s4-reset', 'amlogic,c3-reset', 'amlogic,t7-reset']
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: reset-controller@2000 (amlogic,a5-reset): compatible: ['amlogic,a5-reset', 'amlogic,meson-s4-reset'] is too long
   	from schema $id: http://devicetree.org/schemas/reset/amlogic,meson-reset.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-a5-a113x2-av400.dtb: /soc/bus@fe000000/reset-controller@2000: failed to match any schema with compatible: ['amlogic,a5-reset', 'amlogic,meson-s4-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
