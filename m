Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0CA4BA1D0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 19:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276424; cv=none; b=lpNIGiY4vbtQ/e0tcVs48U9jTkBgE+EZNBJz80N5flsECw/Vz2NFQBW+/qR5WJ91fEAZw/BTptY8jw9F6AbJCAW0M3XKMLEgDgXNhE5dQHK/KiitqXmIxyaG87zTa+MqnbQbSaQu1eotlrUqSGxQRl5/Nu3IqpcS6O5N6Hk3VrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276424; c=relaxed/simple;
	bh=YEExdPMCswEkI1GEdYjf96nPigh6uwXAttNLtArx8p4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iltMJWKZW6gWHKcJwSstRd/u8k781cV6i7mxSlke1TTpQWs8O6/hHwn2ExS7n3fjZ9KehwT2wgFzBKHnkADf8O5svULsF5lUd7Er7k/X7lOxWjeV3vAAZDnUThi5WaOS+oDsYYqwipvZtuRxptbWiIt7scCO5zVm5aFuJK+UWeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5Ut+dus; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5Ut+dus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790276421; x=1821812421;
  h=date:from:to:cc:subject:message-id;
  bh=YEExdPMCswEkI1GEdYjf96nPigh6uwXAttNLtArx8p4=;
  b=a5Ut+dusPrvFyWpc5iGzBYludXqnrQ6LbyGMavyfDqLLuNc8iW8t9Y1o
   60Jz6aFamqBWwiBjPjo8HL+xVNlXsgyBT1rUvgbX4aKDw/Nzrvp6WpEhY
   qrHo329OAzyq/hs5gQVmswk04cNly+6WSU0uGq65T0p+CWcTFPfL2NX2c
   K0ga3x691sSiRgZQjXfTRQPi/U2xUy8DpUTr/IN2vrW90PzLITBlH8s0G
   HXN7LOT1Y/4Cyfo793BOA/aoyhZackEWoy3AX1pr8mFjSEq75nT5etZv9
   T6GXXk3UYyl3keTf6jCsgpiHY9iIvoCtUg2TKvqTNWEv+XkQLSLP5fPQX
   w==;
X-CSE-ConnectionGUID: KsSg7FtmR/OLyHNvOqO8yg==
X-CSE-MsgGUID: 9LoJzILwTkKyzSkQZUuhMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="100397566"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="100397566"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 11:59:53 -0700
X-CSE-ConnectionGUID: tal5LyweTVS6j/7tiQitwg==
X-CSE-MsgGUID: gNdbiiA7QAeBQiJCyeR0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="312029964"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Sep 2026 11:59:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9ofd-00000000JRI-3fM2;
	Thu, 24 Sep 2026 18:59:49 +0000
Date: Fri, 25 Sep 2026 02:58:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-panic 11/11]
 drivers/firmware/efi/libstub/efi-stub-helper.c:841:17: error: 'messsage'
 undeclared; did you mean 'message'?
Message-ID: <202609250221.g7Zv5gVn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-panic
head:   26122a1889cbac101c0fabcddf161a87db4ba38c
commit: 26122a1889cbac101c0fabcddf161a87db4ba38c [11/11] efi/libstub: Implement efi_panic()
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260925/202609250221.g7Zv5gVn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250221.g7Zv5gVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609250221.g7Zv5gVn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/libstub/efi-stub-helper.c: In function 'efi_check_panic':
>> drivers/firmware/efi/libstub/efi-stub-helper.c:841:17: error: 'messsage' undeclared (first use in this function); did you mean 'message'?
     841 |                 messsage = p;
         |                 ^~~~~~~~
         |                 message
   drivers/firmware/efi/libstub/efi-stub-helper.c:841:17: note: each undeclared identifier is reported only once for each function it appears in


vim +841 drivers/firmware/efi/libstub/efi-stub-helper.c

   808	
   809	void efi_check_panic(void)
   810	{
   811		const efi_char16_t *message;
   812		void *p;
   813	
   814		p = get_efi_config_table(capsule_header.guid);
   815	
   816		if (p) {
   817			message = p + sizeof(efi_capsule_header_t);
   818		} else {
   819			unsigned long size = 0;
   820			efi_status_t status;
   821	
   822			get_efi_var(panic_reason, &capsule_header.guid, NULL, &size, NULL);
   823			if (!size)
   824				return;
   825	
   826			efi_warn("Found panic report from previous boot (%lu bytes)\n");
   827	
   828			status = efi_bs_call(allocate_pool, EFI_LOADER_DATA, size, &p);
   829			if (status == EFI_SUCCESS)
   830				get_efi_var(panic_reason, &capsule_header.guid, NULL, &size, p);
   831	
   832			/* clear the reason even on allocation failure */
   833			set_efi_var(panic_reason, &capsule_header.guid,
   834				    EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_NON_VOLATILE,
   835				    0, NULL);
   836	
   837			if (status != EFI_SUCCESS) {
   838				efi_err("%a(): Failed to allocate memory\n", __func__);
   839				return;
   840			}
 > 841			messsage = p;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
