Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0668CAD5A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 00:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743208882; cv=none; b=cVRRNHZIg3kylmMYVrb+V5baUOMBa448LxbyLDLai/5BS9Ah1GufpJd/ifhA6S51x/9I1H5CEgYYzb74ojYR0HufSg2cAKSOY4E+UjPHw61vQgkoDRxZy+CQ5EGm615ka9GNU1Wr+PUvfa/ikL9Ri0zk/lEU4naj92m4aXPaDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743208882; c=relaxed/simple;
	bh=Y+xfBe+9AKM4NZP2yAvNIg2U1QeslTFnpP3GMXG9gFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AXiDgQa3D+mnrVYt2C53/N/akzMBduNJOV47dS4UH/Rn6rIVkgh8ZbQ9AI5QU5+hMcKhFA6l+OvcRwutEhSIT0Jsk6JHmc0MW4VVpZGW8Rnq27bI/NgqDNhoM+kS+3jQ5UtxI8nxSmTdxCiBP8P1i8D0k3PGeq18PG3J1n38z/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7Qvbq4M; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7Qvbq4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743208881; x=1774744881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+xfBe+9AKM4NZP2yAvNIg2U1QeslTFnpP3GMXG9gFU=;
  b=l7Qvbq4MtUrdegUZZr5D1RXiL+Bhhj7igMBtiZbhwPdH0hHW3kHgArOL
   hJrZvXFisudNI32GlqCorqdZFa4VwA2Vn2hkelXUgGULbGR9RpJmVHh/s
   xhF8dOAIhQlBNtzBWupi6BKw7cPOzKWGj5BCuLPHcz+4ZyQLFTH9QSJJ9
   k12J2ghPZ5j6h/UZg/RgayaHbJlFI6rcwwT3brJZ02i+n8gTxqOc6Ooil
   f6yOm/SoPxTvRU7Xu2DMqJ0mRNeWXeEXNC/55MIjTj5GbZ0UWbWDxFVZx
   XtZ/m2mZU4rFqtLZcRji3MyiBmea+8QLHycFWvKEzxkpj5IHWmoCUShno
   w==;
X-CSE-ConnectionGUID: ulCXGzMTQDyCLKXV3/v/Tg==
X-CSE-MsgGUID: kMExbtrITD+phxtVnFDhtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55950476"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="55950476"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 17:41:21 -0700
X-CSE-ConnectionGUID: dFN2nCaJRU+yXYJV4H9aIg==
X-CSE-MsgGUID: E3mDtlGYQw22l3QlFWfMTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="125475864"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2025 17:41:20 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyKG6-0007oq-2y;
	Sat, 29 Mar 2025 00:41:13 +0000
Date: Sat, 29 Mar 2025 08:40:18 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.14.y 65/71]
 drivers/usb/dwc3/dwc3-qcom.c:896: undefined reference to `dwc3_pm_complete'
Message-ID: <202503290832.SGggYffG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.14.y
head:   02aed781c87390cf176b68e20906e28b96e9d18a
commit: c6d1338299fe7fa2ce5af02188c6ad20f3fef81b [65/71] usb: dwc3: qcom: Transition to flattened model
config: i386-buildonly-randconfig-002-20250329 (https://download.01.org/0day-ci/archive/20250329/202503290832.SGggYffG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290832.SGggYffG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290832.SGggYffG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/usb/dwc3/dwc3-qcom.o: in function `dwc3_qcom_complete':
>> drivers/usb/dwc3/dwc3-qcom.c:896: undefined reference to `dwc3_pm_complete'


vim +896 drivers/usb/dwc3/dwc3-qcom.c

   891	
   892	static void __maybe_unused dwc3_qcom_complete(struct device *dev)
   893	{
   894		struct dwc3 *dwc = dev_get_drvdata(dev);
   895	
 > 896		dwc3_pm_complete(dwc);
   897	}
   898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
