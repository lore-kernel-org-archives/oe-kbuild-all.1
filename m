Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867852E3FE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716056432; cv=none; b=Qvu6Q5v/eHppbQuDznmEDL3H781K1s+zWXCI7jEnyJiwa38FRpdOlA7mGa590y6N9bLBImlBbhi+S1t+3inZAjZQzItN+K2uuGDGaHjGGbZbbOlPxSpZzjBGIYfq0cib6AKMhcZp6QQXJifUarWlco22itNaCaHZiM4p7gmC/0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716056432; c=relaxed/simple;
	bh=zTLlpiX4ukikI4l9vn6scBATmPAKF5aQrUXklLy8mDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z5Me/I1jVlsJT3G0uy3k2J6PYT0CDi9aBUCqA+A8zeJCsJ2+KN+M8sf3MpFfYlLcF3WyG1CUJAo6+URLmUzyVAawFK4IW9KwTjmGGk8thKbCSB5mV1xPXfhO7Dlu4IRJrZqbRV6QT8uE6pkGuo1ckMqt044ZzX/UYJEPqjelIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkoMzxMe; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkoMzxMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716056430; x=1747592430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zTLlpiX4ukikI4l9vn6scBATmPAKF5aQrUXklLy8mDQ=;
  b=OkoMzxMewihmgPrVAg5pQmjml+CIOJVzrSLZFljS1w9hxsVQnc9wKxPW
   l/38yB1JidX1mO4PgSFkq+mm+CCPGLhChRLFFlVbjVlXk7IAOt9H6Pys5
   RV8HffeYW0CvL1bkEGERWVka6ohPCeZpPlSsis1EB/NiVV7vNJOm5TlC+
   QHjZtZW68p0tpLoeUm5mhOqtpnpgkqonTdx5fu+TWR/zXdSBMJWAm7U5t
   AREP73R5knAsRlGZCZZs5TNJ51vnhI2Pd7HFyh0Dre1EDFVRZ5CT8dm8e
   cVjliH/hE2SGY6nkjNeVeVswNQkt2YSOMHDOkTwqR8XkGU2FjRxHhu5/m
   w==;
X-CSE-ConnectionGUID: Hbvy100IS1mb4HmqZcuIfg==
X-CSE-MsgGUID: IYJnyOxNSlO0SbLTrnOLUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12337506"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12337506"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 11:20:29 -0700
X-CSE-ConnectionGUID: S2zvM12VQ7mtvCl/+zNgAg==
X-CSE-MsgGUID: HJNdUZvOQi+6PWqTXsHXtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32687004"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 May 2024 11:20:27 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8OfR-0002UC-1A;
	Sat, 18 May 2024 18:20:25 +0000
Date: Sun, 19 May 2024 02:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Janne Grunau <j@jannau.net>
Subject: [arm-platforms:kvm-arm64/mmu-pgt 773/874]
 arch/arc/include/uapi/asm/swab.h:28:9: warning: 'txchain' is used
 uninitialized
Message-ID: <202405190213.5s1Al3aa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/mmu-pgt
head:   1ed29f79e7c6441ef29c25a43d7c82d91e884dcc
commit: e529bcaa17060f516d1e4f345ea460ea206317d1 [773/874] [brcmfmac] Compute number of available antennas and set it in wiphy structure.
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20240519/202405190213.5s1Al3aa-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405190213.5s1Al3aa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405190213.5s1Al3aa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/uapi/linux/swab.h:8,
                    from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/arc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23,
                    from drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:8:
   In function '__fswab32',
       inlined from 'brcmf_fil_iovar_int_get' at drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h:123:19,
       inlined from 'brcmf_setup_wiphybands' at drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7359:8:
>> arch/arc/include/uapi/asm/swab.h:28:9: warning: 'txchain' is used uninitialized [-Wuninitialized]
      28 |         __asm__(                        \
         |         ^~~~~~~
   include/uapi/linux/swab.h:60:16: note: in expansion of macro '__arch_swab32'
      60 |         return __arch_swab32(val);
         |                ^~~~~~~~~~~~~
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c: In function 'brcmf_setup_wiphybands':
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:7316:13: note: 'txchain' was declared here
    7316 |         u32 txchain;
         |             ^~~~~~~


vim +/txchain +28 arch/arc/include/uapi/asm/swab.h

ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  24  
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  25  #define __arch_swab32(x)		\
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  26  ({					\
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  27  	unsigned int tmp = x;		\
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18 @28  	__asm__(			\
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  29  	"	swape	%0, %1	\n"	\
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  30  	: "=r" (tmp)			\
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  31  	: "r" (tmp));			\
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  32  	tmp;				\
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  33  })
ca15c8ecd588dd arch/arc/include/asm/swab.h Vineet Gupta 2013-01-18  34  

:::::: The code at line 28 was first introduced by commit
:::::: ca15c8ecd588dda4377d18d6d27bc1e87b4177cb ARC: Checksum/byteorder/swab routines

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
