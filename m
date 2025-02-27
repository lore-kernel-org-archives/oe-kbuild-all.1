Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6615914BF8F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677212; cv=none; b=QPoR7CZ4RvRMzcCvf4r2BOkToV8ZCg1daiIik2f94RekjW/+V+d9zfNtRCudkymceL8OZGLDyQ1TLbN012V8GHCSZ6qJAp9KPYFqC6XBfayTuLDEM7i4UaZGeDJxu3UeHaSudPdH1qZQewa/CIsLbZINwtpvLvHIWezlwlc/n1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677212; c=relaxed/simple;
	bh=LFe1K4+Tlwt+mKvF/BJVBxJluEBEdz2HKDS1gemV7e8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KLQ/n7fobTS81lWEpXfl5W+JUQXNNYkRHmFIlt+fKOa+GKyDMv05Iv5nhsu4inENnuf0ptMiy7XDuvPD6hZ2mQStYts+oDYHU9uT6dNOcyNOgtcZ10f6Adma4AguritfxRzFiDWl62alXvy12QLACVev0mwSaJ2wKoa8RDAzThA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uk1y2p4L; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uk1y2p4L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740677211; x=1772213211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LFe1K4+Tlwt+mKvF/BJVBxJluEBEdz2HKDS1gemV7e8=;
  b=Uk1y2p4L13FPVHojRxfoOiQEhm67Lo8+nRryb3y1WoC6PXDy2gbLFXAr
   rvJULpZpQqYa6jGWkfteayQRknJQbxN3vd1Erwii1x6oW8zIHLAZwrW7y
   pK717GzL8n3Hyd5QdIDpR2dEgT+989+Qx7M4TeW8cxZsYa2TWKa9JoB05
   MeNA9os0o93lbje80Vjps1fFJ7TtCGLnG3azGqj7Y6wYKYYdaM0hMoJHz
   rZTWowjK55ddW3Mg0BBen7eAMuQWsSd6VXld/aAuziKA6+MjoacVI4OG4
   4hZM5bOC6kkkrOlO8nzh3GGg9keLVtegiBEZH/66F2zDhCF5LL9RvwFD8
   g==;
X-CSE-ConnectionGUID: RfGc/FuIQM62j41YpWF56g==
X-CSE-MsgGUID: RAjaavmhTauO59hyldoJVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52992724"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52992724"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 09:26:48 -0800
X-CSE-ConnectionGUID: gT0Qrt3gSpONi4DSBwe9aA==
X-CSE-MsgGUID: kEjOo50nRcaFAgm7l6Q6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="116850155"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 Feb 2025 09:26:46 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnhel-000Dls-2O;
	Thu, 27 Feb 2025 17:26:43 +0000
Date: Fri, 28 Feb 2025 01:25:59 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Burri <markus.burri@mt.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Manuel Traut <manuel.traut@mt.com>
Subject: [linux-next:master 5891/6931] arch/powerpc/boot/dts/ac14xx.dtb:
 matrix_keypad@0: 'col-gpios-binary', 'col-switch-delay-ms', 'gpio-activelow'
 do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202502280105.REZ29MVg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
commit: e51cb50f0bc0724634369e42a826dd302aae787c [5891/6931] dt-bindings: input: matrix_keypad: convert to YAML
config: powerpc-randconfig-051-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280105.REZ29MVg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280105.REZ29MVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280105.REZ29MVg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11700: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11700: failed to match any schema with compatible: ['fsl,mpc5121-psc-uart', 'fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11800: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11900: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11a00: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/psc@11b00: failed to match any schema with compatible: ['fsl,mpc5121-psc']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/pscfifo@11f00: failed to match any schema with compatible: ['fsl,mpc5121-psc-fifo']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/dma@14000: failed to match any schema with compatible: ['fsl,mpc5121-dma']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/axe-base@2000: failed to match any schema with compatible: ['fsl,mpc5121-axe-base']
   arch/powerpc/boot/dts/ac14xx.dtb: /soc@80000000/axe-app: failed to match any schema with compatible: ['fsl,mpc5121-axe-app']
>> arch/powerpc/boot/dts/ac14xx.dtb: matrix_keypad@0: 'col-gpios-binary', 'col-switch-delay-ms', 'gpio-activelow' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
   arch/powerpc/boot/dts/ac14xx.dtb: /pci@80008500: failed to match any schema with compatible: ['fsl,mpc5121-pci']
   arch/powerpc/boot/dts/ac14xx.dtb: leds: 'backlight', 'green', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
