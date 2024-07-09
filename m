Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BD612DDAE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 12:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720526553; cv=none; b=GZDrCSxiiRuSg+db1U5pzVuunzLI9G/qiLlLkXUt09qACu8Bdo+RSHj4Gkg1to1SdqXNtJYdgQ0SzKXiQlwJwhMK+2OgcvHomyzxIVGX9vuNjiWl2SBHKkMJ1vZ44bCalFZLxVNe531QyiNB+XKCvqoFtG0YI4ENSbNRbH+TGQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720526553; c=relaxed/simple;
	bh=w+uo8ok3k6N2dReDZTi17c5nB7WjJq66RfIzR43PpmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmgREw8DldoQh3/KSdyMkic2x+QSKLszf9HFo3/pweSZ264tkzeI/2REACEiOfpNVSBZzHL8GT2q5wUi7kvslErjNK0p3o6FAelWT9e1nUv5CyYXuqyOxV9v+7BKkpCgFePGrkqbjceaNdJGOcMzCAoLEKVUVMcDXsXi1sKH3NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRKGKDGF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRKGKDGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720526552; x=1752062552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+uo8ok3k6N2dReDZTi17c5nB7WjJq66RfIzR43PpmM=;
  b=QRKGKDGFbjSsIKH7T/WCrI3oxrYzbzkki6xRPWRFpy+KMb01mJqxlBSM
   XyXgzxhPJL8Bj9/cnue2q6rz8cWynoEnRl6JBwag6an1S6DEkcyDoEp2Q
   UqT30Kc0cenfJjEYnr0bZfzFDOdKXuaLCwj+S0IiHFgZgD3k9BloA2Bff
   ASSOWRLTs1oDEPv/1PtUoOHAR/gC12xrNiMpJOF/VaEZmfqe2PTzEVprn
   Kt0QZVj5C04acKHzCu5Yn3M0DjeBMA1ZldfT6sBCzW7J8dyEGjyLIVMdQ
   IAwt6deICI9iNRDoOwK57Qzd6nbzEa9nUHijwIXmTZmhENPJubVKGLHhy
   g==;
X-CSE-ConnectionGUID: xQRw80GuQl+A8nyQ8iUQPQ==
X-CSE-MsgGUID: lXia/HJvQoawp1R1Sk8OMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="29177700"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="29177700"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:02:27 -0700
X-CSE-ConnectionGUID: v0L7LTUpRrS4Lv3dSyxF0g==
X-CSE-MsgGUID: 7+F01VRgQpmw63mqTE8s6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="71038352"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jul 2024 05:02:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR9Y7-000Wdq-1M;
	Tue, 09 Jul 2024 12:02:23 +0000
Date: Tue, 9 Jul 2024 20:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [linux-next:master 11634/11980] btmtk.c:(.text+0x8a8): relocation
 truncated to fit: R_NIOS2_CALL26 against `usb_alloc_urb'
Message-ID: <202407091928.AH0aGZnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82d01fe6ee52086035b201cfa1410a3b04384257
commit: 39a9e1c69e742a401e5bd9eb85ff406550448130 [11634/11980] Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
config: nios2-randconfig-001-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091928.AH0aGZnx-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091928.AH0aGZnx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407091928.AH0aGZnx-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   btmtk.c:(.text+0x8a8): undefined reference to `usb_alloc_urb'
>> btmtk.c:(.text+0x8a8): relocation truncated to fit: R_NIOS2_CALL26 against `usb_alloc_urb'
>> nios2-linux-ld: btmtk.c:(.text+0x8f8): undefined reference to `usb_free_urb'
>> btmtk.c:(.text+0x8f8): relocation truncated to fit: R_NIOS2_CALL26 against `usb_free_urb'
   nios2-linux-ld: btmtk.c:(.text+0x958): undefined reference to `usb_free_urb'
   btmtk.c:(.text+0x958): relocation truncated to fit: R_NIOS2_CALL26 against `usb_free_urb'
>> nios2-linux-ld: btmtk.c:(.text+0x9b4): undefined reference to `usb_anchor_urb'
>> btmtk.c:(.text+0x9b4): relocation truncated to fit: R_NIOS2_CALL26 against `usb_anchor_urb'
>> nios2-linux-ld: btmtk.c:(.text+0x9c0): undefined reference to `usb_submit_urb'
>> btmtk.c:(.text+0x9c0): relocation truncated to fit: R_NIOS2_CALL26 against `usb_submit_urb'
>> nios2-linux-ld: btmtk.c:(.text+0xa08): undefined reference to `usb_unanchor_urb'
>> btmtk.c:(.text+0xa08): relocation truncated to fit: R_NIOS2_CALL26 against `usb_unanchor_urb'
   nios2-linux-ld: btmtk.c:(.text+0xa10): undefined reference to `usb_free_urb'
   btmtk.c:(.text+0xa10): relocation truncated to fit: R_NIOS2_CALL26 against `usb_free_urb'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   btmtk.c:(.text+0xfcc): undefined reference to `usb_anchor_urb'
   btmtk.c:(.text+0xfcc): relocation truncated to fit: R_NIOS2_CALL26 against `usb_anchor_urb'
   nios2-linux-ld: btmtk.c:(.text+0xfd8): undefined reference to `usb_submit_urb'
   btmtk.c:(.text+0xfd8): relocation truncated to fit: R_NIOS2_CALL26 against `usb_submit_urb'
   nios2-linux-ld: btmtk.c:(.text+0x1028): undefined reference to `usb_unanchor_urb'
   btmtk.c:(.text+0x1028): relocation truncated to fit: R_NIOS2_CALL26 against `usb_unanchor_urb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
