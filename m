Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B382206A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Apr 2025 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999981; cv=none; b=q8+CUywwT7MKTcdwVldySc7mCeOBsdKYk1fWENkpZFqMuFOVY9RsW9mgYWAyKJ9kkx930jeh1lyTt9980+dKdjggXFWfxN8rpmQkzJ0PdIZcMV4A9jfDibNVDXVt5I7fAYRkYiovWMlOaOebymKz8JD1bcuniL4yI9t5uK4fkEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999981; c=relaxed/simple;
	bh=7Ra8lKZhaDW4QU8PsuHvtHyXf9ZNCJfvO+zb0X3h1sE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P15potEP3MSDGsiTVNGTve2k6RZPCdXo8cckbySUy6Cl99vbv/zNixbN+CmFqHJ28kx8aLzbLk9SiHGX7I1UmoHE34dMm3IEYVHsDrjKBpBzV7Qgauv+3OT1V2Pwelwpm7pQyTBYLgop5+R3J/Of7IugeNcd3QzQ0CnxdNmrkaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=REyZtgye; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="REyZtgye"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744999979; x=1776535979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7Ra8lKZhaDW4QU8PsuHvtHyXf9ZNCJfvO+zb0X3h1sE=;
  b=REyZtgyeWeOD4l31oDTq1Fd2m7phT0o+UmEpI3FsnXkZL948tZAhhzdp
   T8IFHtKkIu68fe+DkyAqBiwXgPM/gbTxWhDgZU/NcQkz4koMnX4gDTmmt
   34Z+Q8U2dyTKyEGXVlHRzQAZ1M5lqIvYnEWKRNIVxY3/ojuOOG+NV232+
   VwlftfYUIuZrmDvNR03ZaqSu7QicMQhkI4U2+Pale8DFT6uIZ7gtmPlGy
   XCQ0XrlyFjprtF7E+BQjtgZ8qUNXam04VbgSKZoRpPd5O4He/mrPBeW+H
   lLDtfMxxpC6htmzJ7yp/I6s99mAPTjnkw/a6zkxGCE+aIXc7VzG+n5kVf
   w==;
X-CSE-ConnectionGUID: 5JckPn+yRju6Yz66uvy9Og==
X-CSE-MsgGUID: EdgcIP2gSWC030lwGC0w2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="58007940"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="58007940"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 11:12:58 -0700
X-CSE-ConnectionGUID: wzYjkVAyTHK5O90TaXDoEQ==
X-CSE-MsgGUID: tnEyiHazRD6nsiF5x5Jn7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="135999705"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Apr 2025 11:12:57 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5qCt-0003B1-19;
	Fri, 18 Apr 2025 18:12:55 +0000
Date: Sat, 19 Apr 2025 02:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9]
 samples/ftrace/ftrace-direct-multi-modify.o: warning: objtool:
 my_tramp1()+0x10: 'naked' return found in RETHUNK build
Message-ID: <202504190209.ttw1Q5rt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e93dbf3bd481cf9c55d08073d8b0865cf274707c
commit: bf0bfeb41ae90558ee463b1aaaec76f43916dd0b [9/9] ftrace/samples: Add module to test multi direct modify interface
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250419/202504190209.ttw1Q5rt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190209.ttw1Q5rt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190209.ttw1Q5rt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/ftrace/ftrace-direct-multi-modify.o: warning: objtool: my_tramp1()+0x10: 'naked' return found in RETHUNK build
>> samples/ftrace/ftrace-direct-multi-modify.o: warning: objtool: my_tramp2()+0x10: 'naked' return found in RETHUNK build
>> samples/ftrace/ftrace-direct-multi-modify.o: warning: objtool: my_tramp1()+0x10: missing int3 after ret
>> samples/ftrace/ftrace-direct-multi-modify.o: warning: objtool: my_tramp2()+0x10: missing int3 after ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
