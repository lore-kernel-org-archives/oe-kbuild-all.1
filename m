Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CA14CB20
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 16:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VfQnM8/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704902669; x=1736438669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=latzeH/54fI32s8jXJkalnfR5LJRDtcQof+F08IkWZw=;
  b=VfQnM8/CvqOGTzc7w++mrxQOI8n4taxPrRZn/qaN0JPg0FpGCazNmLGN
   3YFSHoO/5orKdyfspqzsc+pTqWoHAgE1Jf4BtNjBnQiw1I3ddeDQDcUHt
   TFng5deRjrlAxvPQFULe2CGM8O36aTwhnAHrD7w0jqRrYXOGBNjrPBIxT
   xMfsqNjnwRgD3l0pyUCIevGOUIn6J9BAsbb8waROQtjb9JM2GwpOYS4w6
   oQVR4Wi3VFefHmtvYokA9w+94Rt7HCUkEoxx4tkF8Tag7Q8uUDeb6Zewg
   nrsVLIuu3HsrKrFXOhPkOS9Y1mmo6PtsLI4i/zWQJY6NYlc4pa6/X6dY3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5311333"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5311333"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 08:02:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="24309948"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2024 08:02:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNb1p-0007Di-0s;
	Wed, 10 Jan 2024 16:02:05 +0000
Date: Thu, 11 Jan 2024 00:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 12217/30000]
 drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected parameter declarator
Message-ID: <202401102326.hyXIHN2o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   782f2a2a1a090d013575b791b3caec126353458c
commit: 1ee367d36875a25c92ae7bb66d4b6f25f0d386d5 [12217/30000] ANDROID: GKI: drivers: qcom: rpmh-rsc: Add tristate support for qcom,rpmh-rsc driver
config: x86_64-buildonly-randconfig-006-20240110 (https://download.01.org/0day-ci/archive/20240110/202401102326.hyXIHN2o-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401102326.hyXIHN2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401102326.hyXIHN2o-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected parameter declarator
     697 | MODULE_LICENSE("GPL v2");
         |                ^
>> drivers/soc/qcom/rpmh-rsc.c:697:16: error: expected ')'
   drivers/soc/qcom/rpmh-rsc.c:697:15: note: to match this '('
     697 | MODULE_LICENSE("GPL v2");
         |               ^
>> drivers/soc/qcom/rpmh-rsc.c:697:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     697 | MODULE_LICENSE("GPL v2");
         | ^
         | int
>> drivers/soc/qcom/rpmh-rsc.c:697:15: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     697 | MODULE_LICENSE("GPL v2");
         |               ^        
         |                        void
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected parameter declarator
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                    ^
   drivers/soc/qcom/rpmh-rsc.c:698:20: error: expected ')'
   drivers/soc/qcom/rpmh-rsc.c:698:19: note: to match this '('
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                   ^
   drivers/soc/qcom/rpmh-rsc.c:698:1: error: type specifier missing, defaults to 'int' [-Werror,-Wimplicit-int]
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         | ^
         | int
   drivers/soc/qcom/rpmh-rsc.c:698:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     698 | MODULE_DESCRIPTION("Qualcomm RPM-Hardened (RPMH) Communication driver");
         |                   ^                                                   
         |                                                                       void
   8 errors generated.


vim +697 drivers/soc/qcom/rpmh-rsc.c

   696	
 > 697	MODULE_LICENSE("GPL v2");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
