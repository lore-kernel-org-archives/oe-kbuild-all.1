Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11F4377003
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 22:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700253; cv=none; b=Ss9rDZJmIbh1tJbBXPdQegoD0o7hXR8VUby7xjd9cGtLR93bcjjYUy7eSniKTW7AW5VMt6KyF0Lh6II0eVKVv79zJV4HHEPu0gIOwYdYsN7u+8JtZro+lwj8RNOYQXkLFxrs5rrjQJE79mGGkLXJht4GIKerl2NdRn2Ar+gpE5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700253; c=relaxed/simple;
	bh=6wL5x7nG5SIcOoHwORsyT0XNTde4tfiIA7O9/UDbdsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i+eQJM31BoeaJEzVvtrn1aIZ1E1azeuHuFSX1mauun7qFl5Uk1HrOAW7QinuBiF3VRuKgnoZ021dyiZjicrQdWugEbYYt/OHlI4r9IXrP7qZL2qFUN2LusErXqyF/FVw1R7aGtfAN5YdFpw7ifrwlanGCYkXJXe7iTU8ozsqCkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiNnkSjL; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiNnkSjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773700251; x=1805236251;
  h=date:from:to:cc:subject:message-id;
  bh=6wL5x7nG5SIcOoHwORsyT0XNTde4tfiIA7O9/UDbdsY=;
  b=UiNnkSjLyh78wYhCdfoQAorFyTj/r6In9EMhshWvnAdYKLDGANuRlVSi
   BeAHbIPVHwnov9xFV18wKsagoo3Oh2FEp9MsaXAwo4sURd/KfcVYin8u9
   1N9l74bUxI7QlcXaES1DbytwUjXVtHoQ6g2VIkqDa52qUfQZ87+4PdsVm
   aO/LzZmQoigYBCh/v6JA5d/eUCpKFuDyV0TfRah3RMrgmsobKiueNdVBk
   O5UITa7F0fz2Q4PhHfHFpyv41Np0ZmI3LzjxYsCRxyt4C5TwgRCe7hNjG
   f/e2H+dhFQXMtBjS0E9ffE45Z8iYpKHZbtHrAe9ZnfPayG8xTVD06IK6V
   A==;
X-CSE-ConnectionGUID: qHp2zSdMQjGwb9b2QWS/jg==
X-CSE-MsgGUID: 7f+eIyXiTTmp47YL6G2jvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="73745608"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="73745608"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 15:30:50 -0700
X-CSE-ConnectionGUID: lgbHdx1hT2OiKH3oHSP6Qw==
X-CSE-MsgGUID: eLgXEMf3QcCDJANOSQ4YPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="218259873"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 16 Mar 2026 15:30:48 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2GSU-000000004IP-3N1i;
	Mon, 16 Mar 2026 22:30:46 +0000
Date: Mon, 16 Mar 2026 23:30:29 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 163/621] htmldocs: Warning:
 Documentation/devicetree/bindings/power/wakeup-source.txt references a file
 that doesn't exist:
 Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt
Message-ID: <202603162306.BT4oHcvR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: 6174150e3227cdfb64dc2e80b1e76f0bd5be9fd8 [163/621] dt-bindings: input: Convert nvidia,tegra20-kbc to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260316/202603162306.BT4oHcvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603162306.BT4oHcvR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/display/ti/ti,omap4-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
   Warning: Documentation/devicetree/bindings/display/ti/ti,omap5-dss.yaml references a file that doesn't exist: Documentation/devicetree/bindings/display/ti/ti,omap-dss.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
>> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/keystone-gate.txt
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
