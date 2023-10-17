Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE52C15F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 06:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Piht7cOp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697523089; x=1729059089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RpiE6rz7LrV4lRN2DIxnpj9x8aT5JWz8tXIkpwdp4Y0=;
  b=Piht7cOppXbLljeTCMvVBw4HYxL1xnnbI1CKQx0F7vc6txnet6J0NzG+
   aif3MK96v2WcfkiVrEvi+8LmrGXoBtafnaoZAnHqk4SQyCTK4WkBuJm5h
   PYa+NZYPIpdjR7OokClX6/fFECawIN6DQVEYeMb5Wb5fqsklJfCAL0FXC
   fPDFZrUAESuhnQcJztMQpmlMufIhBhQFCifxSPCchNuVlGdD6Dg+Cum4P
   jK5SIgkRYNnxRipytPhnAeZOAQTedo7kzhvAVTNTxvNWjQEQ+EPaugq6h
   eJo22mqxqyCHJareuaABQKZi9p0i/socyQqkc7BxC8XfbFtkhVlerqchq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449930655"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="449930655"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 23:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="872414019"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="872414019"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2023 23:11:28 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsdIT-00096b-00;
	Tue, 17 Oct 2023 06:11:20 +0000
Date: Tue, 17 Oct 2023 14:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 3871/30000]
 debug_symbols.c:undefined reference to `__per_cpu_start'
Message-ID: <202310171436.rDAgs7Fm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Prasad,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   92dd69513474bb5c9f16a9f99329637f5f6f2dd0
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [3871/30000] ANDROID: android: Create debug_symbols driver
config: arm-randconfig-003-20231017 (https://download.01.org/0day-ci/archive/20231017/202310171436.rDAgs7Fm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310171436.rDAgs7Fm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310171436.rDAgs7Fm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arm-linux-gnueabi-ld: warning: arch/arm/lib/delay-loop.o: missing .note.GNU-stack section implies executable stack
   arm-linux-gnueabi-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   arm-linux-gnueabi-ld: drivers/usb/gadget/function/f_audio_source.o: in function `audio_source_alloc_inst':
   f_audio_source.c:(.text+0x844): undefined reference to `create_function_device'
   arm-linux-gnueabi-ld: drivers/android/debug_symbols.o: in function `.LANCHOR0':
>> debug_symbols.c:(.rodata+0x14): undefined reference to `__per_cpu_start'
>> arm-linux-gnueabi-ld: debug_symbols.c:(.rodata+0x1c): undefined reference to `__per_cpu_end'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
