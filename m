Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E306220EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 16:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716222043; cv=none; b=N3W/hgkM6WIBSrT2BvNn/OOEUq6GsnDeCFd794GDPkUZGF8trOkfxzXlwveqGab2ht03Osw57Zdp9QpTxaovoiM7bexuEO+fYdKXUFH8SdUjkij3V3epTMu9DHYv055oP14EnRsfeScZvseUgYAlIiNtphaAsBOYcBd6VIagbxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716222043; c=relaxed/simple;
	bh=hpeOg6VUgN4RcS5WMngKM3bkIHckeZ7/Kx3AVkS+ep4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QnIBcpdGiPxDpT25Bsaja7iFyZX/7COwqC7o/TAR5KWe3GjQ5OFrmsqc7NVRRiqNR0otPq3mKdgn2zVjisu0Zx+adTqvb0dN+xJJxORDpiEKV9IrC1o+ocWVp5G2fW9fpOeb7bhWOyEhrrSnJGuHFV2+5v4eKA7wgE1AjthB17A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeAnbfpR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeAnbfpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716222042; x=1747758042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpeOg6VUgN4RcS5WMngKM3bkIHckeZ7/Kx3AVkS+ep4=;
  b=SeAnbfpRRJNoLUSG421dRw96XLcnLXmB10WKPvVrrwH2orYnyacSbhL4
   NwBZadqJFv4K8PT2C/6AsHmSgoozCduCwZhR4H9sJxNgLt8WAr3WhOj+v
   1GeFU11lsNCFlcMR+dqHrJaWWtwhHymTkGiNXCHbXfKGKGy3YK+qbhbRs
   0EK4Xt4QBicI18u+IeYi6qYxcp/bJmRFoA76s6ryZPDmxAwced1KIKqhS
   UET9rgIoNZ53h8IgEiTMFhT2Rt6AgcXZuY+vjTmavQZEt0SnAbBKdNWA0
   w3o5MjY49m0+sOHCTNGFuARpVzXS/A0FORUVBP5ttaHua3x/okcxtQhDa
   Q==;
X-CSE-ConnectionGUID: JgZHsvXyTIGnGhlluIAN1w==
X-CSE-MsgGUID: 43Z/2NbxTbKA4jNgSV5AEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="16191864"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="16191864"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 09:20:41 -0700
X-CSE-ConnectionGUID: avUET2SDTGOq4NovXc7gUw==
X-CSE-MsgGUID: 1MmYLBQTQfqAV3Yft61V3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="33185003"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 May 2024 09:20:40 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s95kc-0004xA-02;
	Mon, 20 May 2024 16:20:38 +0000
Date: Tue, 21 May 2024 00:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13207/13491] drivers/thermal/thermal_trip.o:
 warning: objtool: unexpected relocation symbol type in
 .rela.discard.reachable
Message-ID: <202405210004.5M02x213-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   632483ea8004edfadd035de36e1ab2c7c4f53158
commit: 8c69a777e480174b1fdd75dab5ad584454dd6555 [13207/13491] thermal: core: Fix the handling of invalid trip points
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240521/202405210004.5M02x213-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405210004.5M02x213-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405210004.5M02x213-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/thermal_trip.o: warning: objtool: unexpected relocation symbol type in .rela.discard.reachable

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
