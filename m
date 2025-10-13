Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E762E266C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 22:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760394240; cv=none; b=moWjIsJQaeRmZAmPpYi0c/bs76P8IgVMfoubtRuSMByvxfHwYtg51o8aCgp2AgTFjuPzfwA3okonsso0zFCzJqrhIkvTvUfAxTshQC1BB800uN1Zw7AzJqNuKaep/GNeXcc4leA0zcm3a32uh1lJpyQR+np4srUK77Tz0kN+yP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760394240; c=relaxed/simple;
	bh=xhDQ8jQ2JeiHsGWFBexfvoz+gmbLmvKB7GakKQCB+Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IWXg5k4IEJBjn1Snpc7Avc9IEqrU2d0bGryP9vv37vNlrfiT29r6PRFs4InpsMqaq/3HBSjmuiAVGzJxtdN0jqYZnqPj4AzUYql7bAuMEK5wNUg+x0zIubbjgqhQ+/wPfQxhznKWIZJtPv/dfLihGP4tmWBBf6sSrbs5C9GL490=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GACD2Zbq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GACD2Zbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760394239; x=1791930239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xhDQ8jQ2JeiHsGWFBexfvoz+gmbLmvKB7GakKQCB+Ug=;
  b=GACD2Zbq+030KzxywA8/ftVTNfANbzE+JFv+5kXuihgbmNiVx+zo94F/
   otyAZYo/+v8HaXc/YUH6nllp9PQ42qpR8ss/EtWenTUJ6cJf1HjvCytQK
   pGP6+KWflEeXpVNDofUovjc9otITNsLL8Nix4o8/B9zBkJqTyKt1FhCUg
   isS8UI/IfmXMzpklVn3y+e9tAhlXFTOAcfpu430A1fXlXwc8ZuyhpdfvL
   lRRJCVAWZTfodAsXatWf5Aw1IGSFrcCaAGCIn0R1nYKBDLMJ/nvHqagoo
   RtnTBpRj5CyzSnpQElXzvz2KvCHxVwA7mfO5vdF7ihKrH+3O+sHbR1PtF
   Q==;
X-CSE-ConnectionGUID: aroUE02XQ1Sw1eltaEEAcA==
X-CSE-MsgGUID: bPH18oSwQ22WPUtmsbNQrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62479971"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62479971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 15:23:59 -0700
X-CSE-ConnectionGUID: +DT6luHHSS21geBRihQwPA==
X-CSE-MsgGUID: jXV5YpwFR02Os+Njlbr73w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; 
   d="scan'208";a="185967524"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 13 Oct 2025 15:23:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8QxO-00027b-1s;
	Mon, 13 Oct 2025 22:23:54 +0000
Date: Tue, 14 Oct 2025 06:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [pci:for-linus 1/1] hppa-linux-ld: drivers/pci/vgaarb.c:559:
 undefined reference to `screen_info'
Message-ID: <202510140617.pslAecqF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
head:   17643231e97742d29227e3ed065f9a16208d3740
commit: 17643231e97742d29227e3ed065f9a16208d3740 [1/1] PCI/VGA: Select SCREEN_INFO
config: parisc-randconfig-002-20251014 (https://download.01.org/0day-ci/archive/20251014/202510140617.pslAecqF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510140617.pslAecqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510140617.pslAecqF-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/pci/vgaarb.o: in function `vga_arbiter_add_pci_device':
   drivers/pci/vgaarb.c:596: undefined reference to `screen_info'
>> hppa-linux-ld: drivers/pci/vgaarb.c:559: undefined reference to `screen_info'
>> hppa-linux-ld: drivers/pci/vgaarb.c:559: undefined reference to `screen_info'
>> hppa-linux-ld: drivers/pci/vgaarb.c:559: undefined reference to `screen_info'
   hppa-linux-ld: drivers/video/screen_info_pci.o: in function `screen_info_fixup_lfb':
   include/linux/screen_info.h:98: undefined reference to `screen_info'
   hppa-linux-ld: drivers/video/screen_info_pci.o:include/linux/screen_info.h:98: more undefined references to `screen_info' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
