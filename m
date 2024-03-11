Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877163E46D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 12:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710159706; cv=none; b=EiMfli3OaOWJ5kHMIEwwYyW6lxu8uJ9I7S6neoeD6JjUdKqN27qfrG7Wn5VecsMMNht1PAvRXllKhMI4/hnhVT6aqBO+b+RQYC7VDjb8ooTUNipqSlMZ4DKrJp3LN/Iqmipy5O5SPpfRr8KV1ZdgenYm6qs4B5SXYiyQl8UoGig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710159706; c=relaxed/simple;
	bh=H2gn2oCp41FrailBln/uHNAaPVkpygDjPqc70ELPPWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EeHn7KvlW9lYlhT7ry+HiWFmDIPk1F/f3mXFwfImcPhdFD18Rfcg4hHxaE3+D6C0WZH3gVB/BhlOrEYIGfX3/5vjKQL4sSUkvm7LmibkVhZGEBTTJC5iQa2ibYDhskHaMohN/mWEaVb5de4opy57hFP36rmRu/UrNwF63eSBmUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+3AZECT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+3AZECT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710159704; x=1741695704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H2gn2oCp41FrailBln/uHNAaPVkpygDjPqc70ELPPWw=;
  b=a+3AZECTdUbszpLAoKQAK0dwnL4zvS17dH2YhuGUvFJQZgDYYexqoMWD
   dpMtKYiQ1bid+fbwUQnPNrR7iWZmLzVthh8unBQhz+J/BePkHOCz4hoif
   AvyKaEGUxptA8DUYN4pVEJisqQmgEDWxS8ja3O+V+QDIKtTtrdhRSHZRg
   ZFpqd4dW4y+LvJe0+oRYbLml0UuXStjYKYQm/JnHnPVGv9+YCCsq2bosE
   msZvIsOXk2gkVaWzgV4gZUHxbkvDSP+qZTTlZ7NX7sSL4h9A0eTC1E57h
   aP1sFTYeq8i8xeNHi7HqdIVi+SWAe2uPAAy31nyXxIBgo0ak0B0MepYNn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4661576"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4661576"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 05:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="11570845"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2024 05:21:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjeey-000971-2Q;
	Mon, 11 Mar 2024 12:21:40 +0000
Date: Mon, 11 Mar 2024 20:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [geoffreybennett-scarlett-gen2:vocaster 14/14] xtensa-linux-ld:
 mixer_scarlett2.c:undefined reference to `__divdi3'
Message-ID: <202403112010.tM0wk6QW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/geoffreybennett/scarlett-gen2.git vocaster
head:   dcc04bb3fd937c0335bc2b7bb266339af7ae5ef2
commit: ce1668580ca3badaca4f8350f738ae5e91ee50c1 [14/14] ALSA: scarlett2: Add support for Focusrite Vocaster One and Two
config: xtensa-randconfig-002-20240311 (https://download.01.org/0day-ci/archive/20240311/202403112010.tM0wk6QW-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403112010.tM0wk6QW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403112010.tM0wk6QW-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: sound/usb/mixer_scarlett2.o: in function `scarlett2_hwdep_write':
   mixer_scarlett2.c:(.text+0x5f8c): undefined reference to `__divdi3'
>> xtensa-linux-ld: mixer_scarlett2.c:(.text+0x6037): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
