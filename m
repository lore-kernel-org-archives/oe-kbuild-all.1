Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0A8489
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 10:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfCURMk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698404250; x=1729940250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rm7Pj8Q4NF2rWlfgfEJ1V/Z0yNTF6yNsABWVVvO5Oz4=;
  b=dfCURMk0PJsmNo4z+ipr8QcQ0uCLL2g7cKzboT5XvIzL+j12T8ece7Sq
   hFI41cu/w8mOOmn9s4RgH2jHTmXAtMqJi8VdjRT4XbA5xz9P++oBPt/TP
   gefwaLdPOCiVERY6IZX8cHwnVqK8oiw18vmY8lWZ6OSOYeShnvBnGPm5g
   Vf/RShPhPhnC24WlV9qMSS4RJkiRXvsIYdOkUxcCjApTdmm1Lcl1jMn7L
   Tl1CPwPZJNlTHwOBleSZhvs1E3U4Q48V6t8IPojheiAzjAUTesmeNcOvA
   o4OGlmL4I1wFFcc0nbtGa/5UYO9E1J/MoUxsMXvHTJ7BcgUHTVTquxy3Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="386641667"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="386641667"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 03:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="799776"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2023 03:57:16 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwKWr-000AkZ-2m;
	Fri, 27 Oct 2023 10:57:25 +0000
Date: Fri, 27 Oct 2023 18:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4-lts 12507/29903] htmldocs:
 Documentation/arm64/amu.rst:26: WARNING: Unexpected indentation.
Message-ID: <202310271837.2t3rep7M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ionela,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4-lts
head:   fcdc8d9a71cdda01c736bb52ad5d494e5b0937a3
commit: 7adeb94694a689cd20d41e1405e493a4b17a7289 [12507/29903] UPSTREAM: Documentation: arm64: document support for the AMU extension
reproduce: (https://download.01.org/0day-ci/archive/20231027/202310271837.2t3rep7M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271837.2t3rep7M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/arm64/amu.rst:26: WARNING: Unexpected indentation.
>> Documentation/arm64/booting.rst:250: WARNING: Unexpected indentation.
>> Documentation/arm64/booting.rst:256: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +26 Documentation/arm64/amu.rst

    23	
    24	Version 1 of the Activity Monitors architecture implements a counter group
    25	of four fixed and architecturally defined 64-bit event counters.
  > 26	  - CPU cycle counter: increments at the frequency of the CPU.
    27	  - Constant counter: increments at the fixed frequency of the system
    28	    clock.
    29	  - Instructions retired: increments with every architecturally executed
    30	    instruction.
    31	  - Memory stall cycles: counts instruction dispatch stall cycles caused by
    32	    misses in the last level cache within the clock domain.
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
