Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26D1F4289
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 05:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739339826; cv=none; b=JDh6foDjJ0oT2V3kMD8BPu795RepiUo4njV46VfRa7WnytdjsXY8vvVnoWnOVd1ivJZxx2SsNiL3mALaw+b/PIEXD69dptZSelXjzqRQ11Uuu+rx6SlpbU+NTEnYsRpHYdngisgJcXLY6mEa0ixJwXFrUvcIRuU67MBjMSKhH1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739339826; c=relaxed/simple;
	bh=cDt1pKck2rHbaHRxyPDRtTMNr3IcLt1XUe9A6vOtKmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7WZvqYo34On/4aqSgf3ZEScMm1GJ1nzFvjOASQA7WzjPHGWtwur+hkjinY0XcMYb3EL8EUvofjGuP47PbtpVamzcvrk85fYSJOZoJZoelbDFZ6ZS40IDcXYJPlPw0rYIr0t4XZWu7eUmXa0WC/ZDtFf7yby0O85eifWOYDQPrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H49hUo9u; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H49hUo9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739339824; x=1770875824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDt1pKck2rHbaHRxyPDRtTMNr3IcLt1XUe9A6vOtKmE=;
  b=H49hUo9uIWAR5P4VlL588PciIlN12G+5SI+fQXa+CYia8rTo+qVBeyCT
   Y5LVsc7KGP2VOJ/7OL7ju5Ef+ls3Y034SAHJU6F6mWUu6DtVemv5GcvOP
   51DWhj6FbJAvu9TC+nwdN0f4TN3gB5bauWzqtOcQ5SA6XjnsMEgRgoPYN
   uefc/YHYPEsWvcV31SIPw7c6GNPymEVZgLqE8TlVrQHVQLwEcJhsBvO1J
   fqYi8IaqrFGDgBEwIZT0wvwLM9DAN/A/TqFb5cFyYiqFJ68gmPFwIyq6K
   a63qvoy/LHLQlI20/PRTf6tmNp+j9IAeGzb+n78vJoxbq0smCLLTP2/EU
   Q==;
X-CSE-ConnectionGUID: iT+H94R9QDqlYvnAcB0zsw==
X-CSE-MsgGUID: leKaszuoSa2iA14YT6xVCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50624405"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50624405"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 21:57:04 -0800
X-CSE-ConnectionGUID: tjo/ShCqQ4WsWjqmKQG/Cg==
X-CSE-MsgGUID: mUYWPczdRFW7RTfZ+PglZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="117804682"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Feb 2025 21:57:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti5k4-0015Bn-3D;
	Wed, 12 Feb 2025 05:57:00 +0000
Date: Wed, 12 Feb 2025 13:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/1] kernel/dma/swiotlb.o: warning:
 objtool: swiotlb_late_init_with_tbl()+0x2e8: unreachable instruction
Message-ID: <202502121305.Eb40IgMe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   37e047edf17927e9af7749ee5babff25a01b16bc
commit: 2f2f753c199491c64863b901a23e50b953c1aa3c [0/1] UPSTREAM: swiotlb: dynamically allocate io_tlb_default_mem
config: x86_64-buildonly-randconfig-004-20250212 (https://download.01.org/0day-ci/archive/20250212/202502121305.Eb40IgMe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502121305.Eb40IgMe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502121305.Eb40IgMe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/dma/swiotlb.o: warning: objtool: swiotlb_late_init_with_tbl()+0x2e8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
