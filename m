Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404833382CD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 20:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775074512; cv=none; b=BHWlaIiiMyFVJSH+EFN7zCdAm553rhP9nEhM0vw3CtofBwEHeApKM0jcVDUbuptjpnEDZ2zy+P2ycxUD6uDmeJ+DSKwg09a2Yyrrj4GJ9lMGHv1JxbNEu3pluggWLT/tWn0oFQjFeucTqRkVIOmf1eJnHNSD8J/gVyakjBIvU0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775074512; c=relaxed/simple;
	bh=7J2fHD4IDzBB/gyefNGNqUmzJAS8tkIOKlzKxCGk8ZY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ox819qPe/jJGNQhgEqTESbTFI0bRxXwbda4xlA+8WlbGq06I8HRgfNXbHQqovwPX6gxAvoWQ08M8/ZyY5osueLLoQKsOG2H8TW0CFDj7aRsLktorPwYFINHt2UmFRWY+BGfVvWfDAr5BbHvsV5mb9siNorMJrsB+dajfCkHUxfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1cnzhmJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1cnzhmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775074511; x=1806610511;
  h=date:from:to:cc:subject:message-id;
  bh=7J2fHD4IDzBB/gyefNGNqUmzJAS8tkIOKlzKxCGk8ZY=;
  b=U1cnzhmJteD2+k8gZ10Zu6frt3Fw7cszv147kwolRJPE0rpGUmRdsl1t
   Pgkdv8mggR32tXjkfshDHcZ/sViJGej5rLVBpfOuEO9e4aBx4e+rkM3hg
   Lz7mzafEXrfWD9ceqz1xbDW8c7RN40Lz+lwaLkJeMoGi5w91Yn3Lkn9fv
   D+1YB/0JcZUTgEg1IbP5WMe9UMRvFFTfhuKJ0YjDJb4h04JRxuCCQch9R
   qDJnvekBJV48mGfS56uPxHoT415+h3DQrotiETS/YbwuLKaXytQHq6Qe8
   CfJAYU4/lOjWf1wHPzeNj/+grZdzuIqGYMYdeAjBm9y4W7PDGvqY74Ewd
   A==;
X-CSE-ConnectionGUID: 8VqMx/6jTmiF/l95GUjo6w==
X-CSE-MsgGUID: NUZtDZn3SYia5OxR4eq3aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="79982607"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="79982607"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 13:15:11 -0700
X-CSE-ConnectionGUID: MC3hq+UwQBuAE3vusJwHXA==
X-CSE-MsgGUID: 58Ay2vbZS8SLO2rp52YHbw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 01 Apr 2026 13:15:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w81xz-000000008px-0Tgi;
	Wed, 01 Apr 2026 20:15:07 +0000
Date: Wed, 01 Apr 2026 22:14:51 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>, linux-doc@vger.kernel.org
Subject: [linux-next:master 1471/11049] htmldocs: Warning:
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
Message-ID: <202604012234.rkuyW7h8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Svyatoslav,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd0f139e5fc11182777b81cefc3893ea508544ec
commit: 5a8ffc5dca9c096fe9c8879fa3a2faff723fbb8a [1471/11049] regulator: dt-bindings: cpcap-regulator: convert to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260401/202604012234.rkuyW7h8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604012234.rkuyW7h8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
>> Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
