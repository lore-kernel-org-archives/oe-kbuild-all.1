Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3569820328
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 18:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732817589; cv=none; b=h0HZA2BzDT216j+GTFWyJ1kdNQpcOxrOqhHPRFQRV80VUhtf3PhYpeKhOWMOlgLib1BpHviGyh+ai+VWAGNS+sVFNGFBE9DfEcCIYkviJ5eFUInah83dIgHamayLod5m87940QqFBPpVe9kBdSgTQh+gPKZgRAVqT6nPGcACc1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732817589; c=relaxed/simple;
	bh=5BVEA3DTirRZ17P+dpS76coKts9JdEMUtWPyZ6C8GLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AryW/w82W3R1O0fkskMgtcYWjynORGZXdNyvPUXF4qCqN3bSH6VCqR8qhTmLJS/2XjWmas0vU3Pdc0N4rN2WbW3YSqVDjmuYfVxdzGVQE8lwMT1yMlQH/EWsrMk8/XIhQgB36k3m0oV+WTYntaiVqfVAW26zar0c3BFeM32IT6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUUO/oMW; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUUO/oMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732817587; x=1764353587;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5BVEA3DTirRZ17P+dpS76coKts9JdEMUtWPyZ6C8GLc=;
  b=bUUO/oMW5arUnGlsJDzR/GDMp1AaHNsHdFWIgxHVmHRsExaOcQ+YXgbv
   aMtVsL7uqkeYy2oFSFadSQcmGIYg7agYPEIi663Sy9HtdNt7trfK3oZFD
   zmgehE77BbY5+Xa4aONatWiKHVe+ykplpaknYZ4EPmPfS4H0a+Vv9xFLc
   7SBzoxcOhRFjw0mc5uSYiur0SRGgwzm6I96IBU8/7vqtKQLYB8ZJ+2Zry
   ioB1gx5bgl4qd10TFIMKbROU/DJEPmf3rISr3joO/VUKRrk5C9Y59Mc+U
   I4GE+B7v5y0Q4Gt1oVXbKt6HIQSLwzTlgKdYrx6nVguprL3yYVSGTRSKJ
   w==;
X-CSE-ConnectionGUID: 4eEhalBMSH6rqb6Ph5nt0Q==
X-CSE-MsgGUID: paOM5W4ZQbOTQvYBaWcCyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33190991"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33190991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 10:13:06 -0800
X-CSE-ConnectionGUID: 3KIWgvVKRcSE8MxlInywQg==
X-CSE-MsgGUID: 8GvJBoENTOK2KDKRf0ZdFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="93141347"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Nov 2024 10:13:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGj0g-0009tt-0w;
	Thu, 28 Nov 2024 18:13:02 +0000
Date: Fri, 29 Nov 2024 02:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9/12] crypto/fips140-module.c:575:8:
 error: call to undeclared function 'register_trace_android_vh_sha256'; ISO
 C99 and later do not support implicit function declarations
Message-ID: <202411290253.rjC7GARS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ff40f1da3fa336d891f5abc42ba6b4584dc2f54f
commit: 8a99ad0b72e2f0a56d72221a9a20f4f261dfa3c7 [9/12] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-001-20241129 (https://download.01.org/0day-ci/archive/20241129/202411290253.rjC7GARS-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290253.rjC7GARS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290253.rjC7GARS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> crypto/fips140-module.c:575:8: error: call to undeclared function 'register_trace_android_vh_sha256'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
                 ^
   crypto/fips140-module.c:575:8: note: did you mean 'trace_android_vh_sha256'?
   include/trace/hooks/fips140.h:18:1: note: 'trace_android_vh_sha256' declared here
   DECLARE_HOOK(android_vh_sha256,
   ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
   #define DECLARE_HOOK DECLARE_EVENT_NOP
                        ^
   include/linux/tracepoint.h:584:21: note: expanded from macro 'DECLARE_EVENT_NOP'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:150:1: note: expanded from here
   trace_android_vh_sha256
   ^
>> crypto/fips140-module.c:576:8: error: call to undeclared function 'register_trace_android_vh_aes_expandkey'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
                 ^
   crypto/fips140-module.c:576:8: note: did you mean 'trace_android_vh_aes_expandkey'?
   include/trace/hooks/fips140.h:25:1: note: 'trace_android_vh_aes_expandkey' declared here
   DECLARE_HOOK(android_vh_aes_expandkey,
   ^
   include/trace/hooks/vendor_hooks.h:119:22: note: expanded from macro 'DECLARE_HOOK'
   #define DECLARE_HOOK DECLARE_EVENT_NOP
                        ^
   include/linux/tracepoint.h:584:21: note: expanded from macro 'DECLARE_EVENT_NOP'
           static inline void trace_##name(proto)                          \
                              ^
   <scratch space>:3:1: note: expanded from here
   trace_android_vh_aes_expandkey
   ^
>> crypto/fips140-module.c:577:8: error: call to undeclared function 'register_trace_android_vh_aes_encrypt'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
                 ^
>> crypto/fips140-module.c:578:8: error: call to undeclared function 'register_trace_android_vh_aes_decrypt'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                 register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
                 ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]


vim +/register_trace_android_vh_sha256 +575 crypto/fips140-module.c

   570	
   571	static bool update_fips140_library_routines(void)
   572	{
   573		int ret;
   574	
 > 575		ret = register_trace_android_vh_sha256(fips140_sha256, NULL) ?:
 > 576		      register_trace_android_vh_aes_expandkey(fips140_aes_expandkey, NULL) ?:
 > 577		      register_trace_android_vh_aes_encrypt(fips140_aes_encrypt, NULL) ?:
 > 578		      register_trace_android_vh_aes_decrypt(fips140_aes_decrypt, NULL);
   579	
   580		return ret == 0;
   581	}
   582	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
