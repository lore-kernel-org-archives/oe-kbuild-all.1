Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801E448CCA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 13:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oo/dsOXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704891694; x=1736427694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NgAp3zDR2gjK6sZoubJkGLTx9iS/KLYH3SwGXjgmnK4=;
  b=Oo/dsOXJmhx/irbZ5uj6RhdP4fNTqzFwqCQk8RrdbmUyU+Y5Wr2azIEP
   p2KLoaoQBye8EBtShRnXL9XVNwmZ/Nr2i8KXxCm9j+z40cAJdm0p5H5oW
   oYunQNC/xHvkIyJ6wSjFT0mgFJtFJICyIWZReFcPXQuV8QYaZJrmGuE8V
   5azb/bB6s8B+A26GrF5ZvUAbsEvECxAxHUdNINFNB1zJLhON3IEPxP8oQ
   7BwtCyQ4JXfssBGdOWDITDXW4OgvcdU9RqCZi8ylDauCpSt39wb4BRGWI
   OYxzrgPzkKgDT8heLA0NIiXUAROaX37Im2UsHE+SuxJsAGdXHtsvprwy3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="5879658"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5879658"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 05:01:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="16636314"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jan 2024 05:01:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNYD2-00072e-1H;
	Wed, 10 Jan 2024 13:01:28 +0000
Date: Wed, 10 Jan 2024 21:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 12217/30000]
 drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers
 or '...' before string constant
Message-ID: <202401102020.9sX02jiv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   782f2a2a1a090d013575b791b3caec126353458c
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [12217/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: i386-buildonly-randconfig-006-20240110 (https://download.01.org/0day-ci/archive/20240110/202401102020.9sX02jiv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401102020.9sX02jiv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401102020.9sX02jiv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected declaration specifiers or '...' before string constant
     697 | MODULE_LICENSE("GPL v2");
         |                ^~~~~~~~
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected declaration specifiers or '...' before string constant
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +697 drivers/soc/qcom/rpmh-rsc.c

   696	
 > 697	MODULE_LICENSE("GPL v2");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
