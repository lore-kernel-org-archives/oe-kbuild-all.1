Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5767F3B7A8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 06:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774159549; cv=none; b=qONC8SgKVpTaeYQQh2tKpSn9o6QIOPg2g4AZdW8n7QTVilHZDiYoGibnQ3s4pou2kNsD3Hq/KUWaQa4ZjYucQSGu6GXHzFt9M3P8UQUk3BhwtILGOOPVx8BgFBZSoWl5jtaJNWKjtthOGHkBgYja6+krrB9AlTnAiqoVHFyab3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774159549; c=relaxed/simple;
	bh=NI4MIPODlZOFZpB65iYyyUATtfVUU5Vf3TcblWio5TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fgb/dpz0dJqHrzoT4VDrpImeCBZ5lEjkhSCp9Isdq5Mri4m1l4GrCy0FYG9b+yBIqPIFmo5r5VjcB/UPQwIhxLgYfLJZLgHyMpFtjdp7+nEobVUavuUnWv/iybyPO2E5AE+boL0nCWSgcjbExVEiDNpI/Rk6X+H7ejNHtssDr9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=la7AfoY8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="la7AfoY8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774159548; x=1805695548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NI4MIPODlZOFZpB65iYyyUATtfVUU5Vf3TcblWio5TA=;
  b=la7AfoY8VRp9a7sBXwFUBrqDBFI2G8LmX/8PSdmjJ2MCaUdMzrePc7s2
   pgMi6YVHFPy92tDn4gO5pmpTQzCWp0WZNWEPnY6d8gCCH+bQp3XmZMwzC
   MQ6Wmeczx/U6vZKgButCB3+zsvh7e2KyeNaVYXkXU/pFvB6pqInzRhtc5
   ZLucUQJ0UKJwJSI44HwxZrMn1wHywRWVYuVOkgm4lVMeUs6lfnhowahzT
   Sk0azmgE9IfV9/qBEDebOvaANNu7Cmlf78St8QbRh8wdq9yi7fmzQUwo/
   77Xll5/rUMFWDc9lhnOBlw2IszymqWP4+HOgwzmkvokIPuhHEeO2a0z0l
   Q==;
X-CSE-ConnectionGUID: uUJ0hT78TOWuZhqIVFsOzA==
X-CSE-MsgGUID: WNB9nYaPSd+3AvTEV/viiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75163162"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75163162"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 23:05:47 -0700
X-CSE-ConnectionGUID: gRTOxsecTj289dcYzt8SGQ==
X-CSE-MsgGUID: 6fDKZ/r2R8qxYruaCQWf5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="222773709"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Mar 2026 23:05:44 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4BwU-000000006Ij-20Ja;
	Sun, 22 Mar 2026 06:05:42 +0000
Date: Sun, 22 Mar 2026 07:05:39 +0100
From: kernel test robot <lkp@intel.com>
To: Atharv Dubey <atharvd440@gmail.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Atharv Dubey <atharvd440@gmail.com>
Subject: Re: [PATCH] mailbox: dt-bindings: mailbox: Convert to DT-SCHEMA
Message-ID: <202603220726.FnGA4Rwp-lkp@intel.com>
References: <20260322-mailbox-v1-1-c6251f18187c@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-mailbox-v1-1-c6251f18187c@gmail.com>

Hi Atharv,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c612261bedd6bbab7109f798715e449c9d20ff2f]

url:    https://github.com/intel-lab-lkp/linux/commits/Atharv-Dubey/mailbox-dt-bindings-mailbox-Convert-to-DT-SCHEMA/20260322-075100
base:   c612261bedd6bbab7109f798715e449c9d20ff2f
patch link:    https://lore.kernel.org/r/20260322-mailbox-v1-1-c6251f18187c%40gmail.com
patch subject: [PATCH] mailbox: dt-bindings: mailbox: Convert to DT-SCHEMA
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260322/202603220726.FnGA4Rwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603220726.FnGA4Rwp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mailbox/altera-mailbox.txt references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/mailbox.txt
>> Warning: Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/mailbox.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
>> Warning: Documentation/devicetree/bindings/power/reset/xlnx,zynqmp-power.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mailbox/mailbox.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/rtc/motorola,cpcap-rtc.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
   Warning: Documentation/leds/leds-lp5812.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-led-multicolor.rst
   Warning: Documentation/translations/it_IT/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
