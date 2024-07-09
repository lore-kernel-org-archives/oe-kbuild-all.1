Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B664204B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 03:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720496046; cv=none; b=DcxQGJFRclfjXaBEblijiHHT2rQLYH2E2X0jcoY8FGRboh8p2bsZcAshIEXA4G5eSVdDvnYRhlCgcE+NAyXs+obD/iPFROtFzT4f2hscpBnsGm8D1n2K4Za1Mw//IxBmLzyfWC8weEL/BtRuef1Kkq+QImTu7YxaLFAP4uBFY4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720496046; c=relaxed/simple;
	bh=8K8ll9z8R3pi3//nzmNdx3UpSjolEEmim8caF5eo7wU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8Nok5Uzlkk+jMOimVuhJPV7WI2YkZWJRYLSOWQzl4Q/gOaxLHoZAXnuShi1r6aAptA31EXdn+25pt/UEOD7/QlMKU4dLcVLGiFNYKLRqAaYFnHuWSZ6bBCWoymoucv6t6DY0mbjHImd/IWktr2SyLFjF/qDJmirfOofwYesbAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rwh/h0qM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rwh/h0qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720496044; x=1752032044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8K8ll9z8R3pi3//nzmNdx3UpSjolEEmim8caF5eo7wU=;
  b=Rwh/h0qMaWLKWzisdhZgzziUxv8YUalKjgworsU9ji8xNyCJ2+fUivvp
   kjFFVEt8jTqL0/9pCIpiswTf1ALj1JwH0tdRjI2rcCI003KLDcbvUJACZ
   2iC6okmA6kfu/lvG3u+hojZQIxks2cifu929OMAd1BIGc1NIzjyNQ6zoj
   EizK8wu3S8G2ro7PB3ngZqqmqxKEh5B192JvSdOF/5b3YocMsdhiBnmRV
   qA9koNz9bSP/gpjoe9Y/GQeTbARHy+ORDDbcYBKzpWT3Dcb3OBNau/YP7
   20gt98dbbgMHYNAVAhBhJWUS9k9fOxJd8kFubk0+5IvOdhay7lKehrITQ
   Q==;
X-CSE-ConnectionGUID: 4gikIzDBS5OPa4o31hGKGw==
X-CSE-MsgGUID: kPa5B1ssQ9akq9gyQ1CGyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17861179"
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="17861179"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 20:34:03 -0700
X-CSE-ConnectionGUID: ZtKtFcm0SuyeMLiY4lFNxA==
X-CSE-MsgGUID: NK58cz4JSMK7Kl0V+PpBew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,193,1716274800"; 
   d="scan'208";a="52038078"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jul 2024 20:34:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR1c8-000WIA-0b;
	Tue, 09 Jul 2024 03:34:00 +0000
Date: Tue, 9 Jul 2024 11:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: oe-kbuild-all@lists.linux.dev, Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-iio-backend-add-debugfs 15/17]
 arch/arm/boot/dts/xilinx/zynq-zed.dts:116:10: fatal error:
 adi-fmcomms1.dtsi: No such file or directory
Message-ID: <202407091100.mKBUHw7K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-iio-backend-add-debugfs
head:   4120536adfc0bc741c466d38ae50ffb9760576e3
commit: 813decf00f69c8e38c0b78cbd93c9a2b332c8bdf [15/17] fixup! Out of tree stuff to test the ad9467 FMC
config: arm-randconfig-004-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091100.mKBUHw7K-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091100.mKBUHw7K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091100.mKBUHw7K-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/boot/dts/xilinx/zynq-zed.dts:116:10: fatal error: adi-fmcomms1.dtsi: No such file or directory
     116 | #include "adi-fmcomms1.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +116 arch/arm/boot/dts/xilinx/zynq-zed.dts

   112	
   113	
   114	#define fmc_spi spi0
   115	//#include "adi-ad9467-fmc-250ebz.dtsi"
 > 116	#include "adi-fmcomms1.dtsi"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
