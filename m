Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C1AECF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Mar 2024 01:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709689029; cv=none; b=LWAWxWNingVx+HNGmCXp7MVFCYcq3VmlpspL2fjNZ84j+iBf45LWRq3JP2akabmFtBCtUDHhOPDpzrrPRACUNgvgpPXyowmxEC9IBbxmkDsSRdSwb3c5CNJgwSb4wJTlkxbseS7jIh1E36qgCwEDSLz4y8yJjPXPCjrfVNbUy1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709689029; c=relaxed/simple;
	bh=DvWSANZV5uDpKTQq3XFSXnF7fZuEEQoTZL7/1KcGP40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uhqlrGH6AYBeX+sS9my47RHWHQy54hiURSCNNtU2Nrvxn7Ziw0U4UY5dy2SSzbPZY1ZKc9V3yR6hbG9bur073nEBUvf28FvIiIlJp+yLPEjag5HfKs2tZmZeI1gUdAJ0V6GjN2w8Qiw1kJHZVL4b6vf5uS3CvUL91eumixf6lF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYMHetG3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYMHetG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709689028; x=1741225028;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DvWSANZV5uDpKTQq3XFSXnF7fZuEEQoTZL7/1KcGP40=;
  b=nYMHetG3HZPjjMYisUXImdZr8dhdaEwVTUkJKD6X23ptD8NLvrLABFi3
   SSOZ9loDjw7fcrIozvEhfxiJRyKWrakHaEIRUmoLEY3ekLmw5vK9Sq49E
   oSfIIr+s1nijoZMnX897ZjwLDwtVK4Y4JsG02GGbmVkBFU3cT0cDqj8ZO
   MbjRyak9qhyjRu2wok1AOMnOk00m3CXxYl7ozNxCcIdMsTD0zdI1v16i8
   B0KGR4t3FdrYCb1zeCsozGTx3WCb9wF+26r/OmsUoPSoZaVfKxkCDj60t
   STZkXlm01WWH0MWYUdlGIYjN1cwHInyXigDlVecV8H0I3wcWNhFshAX3H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4393378"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4393378"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 17:37:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="9478227"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2024 17:37:06 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhgDP-0003pR-2v;
	Wed, 06 Mar 2024 01:37:03 +0000
Date: Wed, 6 Mar 2024 09:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6175/27938] s390-linux-gcc: error:
 unrecognized argument in option '-march=armv7-a'
Message-ID: <202403060940.trSVbpey-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: b83a99edcb3eb46360f4b4470a51e0f0749bd73e [6175/27938] Merge branch 'mxc/next' into next
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240306/202403060940.trSVbpey-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060940.trSVbpey-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060940.trSVbpey-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-gcc: error: unrecognized argument in option '-march=armv7-a'
   s390-linux-gcc: note: valid arguments to '-march=' are: arch10 arch11 arch12 arch13 arch14 arch5 arch6 arch7 arch8 arch9 native z10 z13 z14 z15 z16 z196 z9-109 z9-ec z900 z990 zEC12
>> s390-linux-gcc: error: unrecognized argument in option '-mtune=cortex-a9'
   s390-linux-gcc: note: valid arguments to '-mtune=' are: arch10 arch11 arch12 arch13 arch14 arch5 arch6 arch7 arch8 arch9 native z10 z13 z14 z15 z16 z196 z9-109 z9-ec z900 z990 zEC12
>> s390-linux-gcc: error: unrecognized command-line option '-mfpu=neon'
>> s390-linux-gcc: error: unrecognized command-line option '-mfloat-abi=softfp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
