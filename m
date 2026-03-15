Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237AB355819
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Mar 2026 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773578500; cv=none; b=HgshIVXcR+PXu20e7DB5CtSoPXF3giMoY20Q0vrV1fSK8KXbZ1ldZrZPg2TMl8Gk8hiXiNgoWbVOCjqlTJAg6fAZJ0cB9eZogpMWe/rRcKlN7sj85lo8tJ9ckdFhDuCMcZCsIoBKYl8uLSL6wRsWXbMIPd74IV8Qc+/2TCDH7G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773578500; c=relaxed/simple;
	bh=dNKJVkV5cBxzsLlUJ/1x6HQiH85iFFHHdzUsaneLqDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lQ6ywdrW8FC/p+5BHyx8uujHw7dT0JAhoZWljK3M3jiTNqLIrQQz0U/lLaBxjYyq7bxAnhfk1/wMZkYIXqI3QMa0N9W6vUxdUhZV+DwFumyV0e8IZ34k7/MYR7yJUTG0ZI/WAyfeewKo7LwC3kcF/0cJNfyfYzC65OqTzYL/hdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFxSJtJI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFxSJtJI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773578497; x=1805114497;
  h=date:from:to:cc:subject:message-id;
  bh=dNKJVkV5cBxzsLlUJ/1x6HQiH85iFFHHdzUsaneLqDk=;
  b=EFxSJtJIZPim9sI6gFb+em/rQ/lCyGDpY8Wzvjav+QoZG0dZaxleAwI4
   An1i7/YtIgxIvWtkce2fTmQS9iP0g1EIEvNoIiD/1k4AmPaRDG79gWDaC
   gkk3AqEGeM/AfoI9vstIpDBv5cHiTGYm0BRL0+MExVSrsYlkIWfL2loAW
   fLxkH1OnCqRvnGPqXAHYBMDRW66ml7BZSFaiUh+RkhOeEjmqCvhshs0sM
   JM/iDSJ9NBJMvUShsHh/W2jWG8SnQgiZeKEcKBeaOXXFCGoIoyvZ7bihK
   hUr8yLueWd0K7M8mj5xK4ZW3Nt4cldbYleN8WVwAbTGZ4znoE6eCOXHTB
   A==;
X-CSE-ConnectionGUID: lYetF0B6TWOqhbKQJe0kng==
X-CSE-MsgGUID: Mo3yVsCbRNu96Pg/VA+kOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="78507887"
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="78507887"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 05:41:37 -0700
X-CSE-ConnectionGUID: qDrwA+ymSGeFz/c0sQyQ0g==
X-CSE-MsgGUID: UrQvGRmJTPuIUwZLH56bTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,122,1770624000"; 
   d="scan'208";a="221728798"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 15 Mar 2026 05:41:34 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1kmi-00000000433-2bfy;
	Sun, 15 Mar 2026 12:41:32 +0000
Date: Sun, 15 Mar 2026 13:41:00 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 139/621] htmldocs: Warning:
 Documentation/hwmon/vexpress.rst references a file that doesn't exist:
 Documentation/devicetree/bindings/hwmon/vexpress.txt
Message-ID: <202603151333.TLinHG1w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 5bf93d9b44bb8d20e14a07847bc278c231085500 [139/621] dt-bindings: hwmon: Convert vexpress to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260315/202603151333.TLinHG1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603151333.TLinHG1w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
>> Warning: Documentation/hwmon/vexpress.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/vexpress.txt
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
