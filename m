Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1574A347FCD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 04:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772166033; cv=none; b=aX79i20CwsLf7gCzY61K1XSijEKZvGIw1S7KVvKS5TMl4dW5F4/a6dKq+Mqc0leXUqlzT1NvYrJcNoZnNXTDhX0N708DBmTY5gWwrAvqDggGMyuAbCQy0v9F05ObijTNRSjNo3oy5rXric+dZGjNk94wrAUfuppWh3OyFJx8rdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772166033; c=relaxed/simple;
	bh=ZgUHN7jZ8n06KZo2RjZSmWU3tL/oi8NTglmDUcVlwvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EW39LK2iVzaKDX05XGXdqSu8ZBsUpyqyQ6pPxbc2LcTZLE5WpjtjH2gYgtW0gyMtaDd82gRUrKOUq/YrlJxoxM0mSGxEiaS89Fkr07NuNyupX4wM2CxJqL7pF36K0Nx8TvFm0Fh8jGZU5IVxRIh03kfolTe8uyox0+ah8ulzmLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RF2/IWbO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RF2/IWbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772166032; x=1803702032;
  h=date:from:to:cc:subject:message-id;
  bh=ZgUHN7jZ8n06KZo2RjZSmWU3tL/oi8NTglmDUcVlwvM=;
  b=RF2/IWbO429sAG5zC5XlUmFyKg3n3qXLsbuNEX2gFRxZXDrpiabNRnco
   HBvbMLu9k2bJj8w9TdW6QEfclBGlfTyGNbrCnWcy/ox17coWM7GlBjBte
   JaOsolxN/LUL0yyDwcT74v7Dq6A0WDzII7xmOyvoLhGjPM+Ziv216BdHk
   X+rBI6gUkRAHRYXYKT8BK8wkBLtHKy2klqUFVHaAj7ZuPOMCxlJPDhEl3
   9N96ArEmiSYA7JGVp1Z3FruI0vKwlkKMJ6HXDNRpJbP/VCKxJDjcjRUB/
   ZwpkhX5xC72XpN3R9u2++4D/dMR4X+I7U69x2Wyu5mjXL9ziBN4naARVI
   g==;
X-CSE-ConnectionGUID: y9FshIJNSW6dip8FdPRJeA==
X-CSE-MsgGUID: msY+RJpVQ26JToub0gG0ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73428633"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73428633"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 20:20:27 -0800
X-CSE-ConnectionGUID: ZNFDCOpqQdGRmNpOBNXDmg==
X-CSE-MsgGUID: hI7Jo0ltRFmI9r6RKI5hOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214980458"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 26 Feb 2026 20:20:25 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvpKx-000000000Sr-2gdt;
	Fri, 27 Feb 2026 04:20:23 +0000
Date: Fri, 27 Feb 2026 05:19:55 +0100
From: kernel test robot <lkp@intel.com>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>, linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:master 104/176] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
Message-ID: <202602270531.0HWcqRHL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: 16a2a853f1bd633c9a7c8c9721d9f31bf9aaf505 [104/176] i3c: master: Add AMD I3C bus controller driver
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602270531.0HWcqRHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270531.0HWcqRHL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
   Using alabaster theme
--
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
