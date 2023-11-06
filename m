Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB7A2F3D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 06:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZSDZG2/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699250546; x=1730786546;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2IvIeBHCR4DRJTRxP2mOe7CLG5lPikuBzxiufFck0/4=;
  b=nZSDZG2/VVUnE2RBFxm0hBsFklqYcD+zuZjU8fHkld2Ep/PpUJNZQzan
   AG8aqrLmH8UnJfxJFi/qGzkYtMdlTfiUmL9CSFNjXjylruPgRzSBbDpEv
   XyrniC7KR/OB4Zss31RDhsVyrnPCl4qECax3SpTry/XAcyolVddMnLLoJ
   gKKORHNE1lnN1fxUKTNdsn3O/JnIwQo0EIMtfsXgw6gs/1cDNwky3x75G
   WX/rNylHTovp8+MKuEoMcY8XVIMUMZm00zZNgqeuXYGQicgJDhVc+Pte+
   xWuAtQIrpBUjn95n8ILfKPR4AJQKQG80BAJfqLb3twhbfDVovjM/CtiQ8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455697634"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="455697634"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 22:02:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3516889"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2023 22:02:23 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzsgm-0006Aa-2k;
	Mon, 06 Nov 2023 06:02:20 +0000
Date: Mon, 6 Nov 2023 14:00:12 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [asahilinux:bits/090-spi-hid 13/21]
 drivers/hid/hid-magicmouse.c:575: warning: This comment starts with '/**',
 but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202311061305.pqAoqR6N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   aefaf432ff80e54092c35dcba09404239f181de6
commit: c45d7d45dd2ec956e9fc4b5fc3c88d43fd638eb9 [13/21] hid: magicmouse: Add MTP multi-touch device support
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20231106/202311061305.pqAoqR6N-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061305.pqAoqR6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061305.pqAoqR6N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hid/hid-magicmouse.c:171: warning: Function parameter or member 'pos' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:171: warning: Function parameter or member 'hdev' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:171: warning: Function parameter or member 'work' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:171: warning: Function parameter or member 'battery_timer' not described in 'magicmouse_sc'
   drivers/hid/hid-magicmouse.c:171: warning: Function parameter or member 'input_ops' not described in 'magicmouse_sc'
>> drivers/hid/hid-magicmouse.c:575: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * vendor trackpad report
   drivers/hid/hid-magicmouse.c:589: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * standard HID mouse report


vim +575 drivers/hid/hid-magicmouse.c

   573	
   574	/**
 > 575	 * vendor trackpad report
   576	 *
   577	 * @num_fingers:	the number of fingers being reported in @fingers
   578	 * @buttons:		same as HID buttons
   579	 */
   580	struct tp_header {
   581		// HID vendor part, up to 1751 bytes
   582		u8 unknown[22];
   583		u8 num_fingers;
   584		u8 buttons;
   585		u8 unknown3[14];
   586	};
   587	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
