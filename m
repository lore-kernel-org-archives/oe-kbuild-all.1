Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4428A152527
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 14:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720535556; cv=none; b=Jpevut/O0mnOntyATYUDusPkKvroE/1LRGn1y5DUV+ERC0F/naQnj7jwVL1aGI4o4fISskTl4FZVVzkHonxMTyEn3J4QKtrsG3VBCbVAOMh7u0VkyYPfdhe9WgWd5UuCHBbOY/qWV59hnlgWVyLqHVvTfOK3Phl1yokIIFRIgBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720535556; c=relaxed/simple;
	bh=sPBl5sfJzdUfohdzCXPn9Fnm5FtQBWS6i1mXPn5/rE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVatJoL/+zb0wFkNKG8zDrHmLdKerSILQLxl/0LwZaRRjz3D2nVUSAoK2jX4/vGyFB2obRLWqTOeZHte4B5d2d/5jEIYsGOndLTYYMdsqko0wCTprP+hPEZzpm2Hos6x7P1j8wHQR4ADW551dXFxg6jxSXaC0zGwhSzL7rVijjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Px3vVTCd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Px3vVTCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720535554; x=1752071554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sPBl5sfJzdUfohdzCXPn9Fnm5FtQBWS6i1mXPn5/rE0=;
  b=Px3vVTCdjhMm/wv8W/8PZWt6lP3OgXvGwrXXU+Vsbt++XReFFNmRYZ5L
   U6jr4LQE1xoxL4sXNkXIX/3CZeMqTtWYGEMQe1vlqdXbi6von4NtrwSJC
   3SClUs8uLai99f2rQiWp5T7puANSLlU6QRzTzv4XHNstfkD5r8MB5g2aq
   IT3ge+/KU1gcv7nM9DUTngxHsShSlLdzTaQGomV5+/UBm7BJqc0w3W+jK
   UtTW30RHURL4hmI3KS3vJCHqFfAnX/rSIoN48KuN1/3iEm55fkUdxB3sm
   mtX2EN63z7AqjUX9uXpr4t1W/Kqp7jjuoW1cBRaasSN4Et15h3PPxp0LA
   g==;
X-CSE-ConnectionGUID: eo//0A0QTCKOMDiuj/K+QA==
X-CSE-MsgGUID: /jefbRT1TI2CpLHZx/A/fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21666387"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="21666387"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 07:32:33 -0700
X-CSE-ConnectionGUID: wkDNjDYhSwKAxqGffpDsEQ==
X-CSE-MsgGUID: 5DcfZPm8SW2K/4Zep2ZL6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="52467061"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jul 2024 07:32:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRBtO-000WlA-03;
	Tue, 09 Jul 2024 14:32:30 +0000
Date: Tue, 9 Jul 2024 22:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: [linux-next:master 11637/11980] nios2-linux-ld: btmtk.c:undefined
 reference to `usb_kill_anchored_urbs'
Message-ID: <202407092247.AqsPQFKg-lkp@intel.com>
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
commit: 7eac027d1b204b4d0c8acb2bf21e443f8a078cbf [11637/11980] Bluetooth: btusb: mediatek: add ISO data transmission functions
config: nios2-randconfig-001-20240709 (https://download.01.org/0day-ci/archive/20240709/202407092247.AqsPQFKg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092247.AqsPQFKg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407092247.AqsPQFKg-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_submit_intr_urb':
   btmtk.c:(.text+0x8d4): undefined reference to `usb_alloc_urb'
   btmtk.c:(.text+0x8d4): relocation truncated to fit: R_NIOS2_CALL26 against `usb_alloc_urb'
   nios2-linux-ld: btmtk.c:(.text+0x908): undefined reference to `usb_free_urb'
   btmtk.c:(.text+0x908): relocation truncated to fit: R_NIOS2_CALL26 against `usb_free_urb'
   nios2-linux-ld: btmtk.c:(.text+0x9b8): undefined reference to `usb_anchor_urb'
   btmtk.c:(.text+0x9b8): relocation truncated to fit: R_NIOS2_CALL26 against `usb_anchor_urb'
   nios2-linux-ld: btmtk.c:(.text+0x9c4): undefined reference to `usb_submit_urb'
   btmtk.c:(.text+0x9c4): relocation truncated to fit: R_NIOS2_CALL26 against `usb_submit_urb'
   nios2-linux-ld: btmtk.c:(.text+0xa0c): undefined reference to `usb_unanchor_urb'
   btmtk.c:(.text+0xa0c): relocation truncated to fit: R_NIOS2_CALL26 against `usb_unanchor_urb'
   nios2-linux-ld: btmtk.c:(.text+0xa14): undefined reference to `usb_free_urb'
   btmtk.c:(.text+0xa14): relocation truncated to fit: R_NIOS2_CALL26 against `usb_free_urb'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   btmtk.c:(.text+0xa6c): undefined reference to `usb_alloc_urb'
   btmtk.c:(.text+0xa6c): relocation truncated to fit: R_NIOS2_CALL26 against `usb_alloc_urb'
   nios2-linux-ld: btmtk.c:(.text+0xabc): undefined reference to `usb_free_urb'
   btmtk.c:(.text+0xabc): relocation truncated to fit: R_NIOS2_CALL26 against `usb_free_urb'
   nios2-linux-ld: btmtk.c:(.text+0xb1c): undefined reference to `usb_free_urb'
   btmtk.c:(.text+0xb1c): relocation truncated to fit: R_NIOS2_CALL26 against `usb_free_urb'
   nios2-linux-ld: btmtk.c:(.text+0xb78): undefined reference to `usb_anchor_urb'
   btmtk.c:(.text+0xb78): relocation truncated to fit: R_NIOS2_CALL26 against `usb_anchor_urb'
   nios2-linux-ld: btmtk.c:(.text+0xb84): undefined reference to `usb_submit_urb'
   btmtk.c:(.text+0xb84): additional relocation overflows omitted from the output
   nios2-linux-ld: btmtk.c:(.text+0xbcc): undefined reference to `usb_unanchor_urb'
   nios2-linux-ld: btmtk.c:(.text+0xbd4): undefined reference to `usb_free_urb'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_suspend':
   btmtk.c:(.text+0xc08): undefined reference to `usb_kill_anchored_urbs'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_isointf_init':
   btmtk.c:(.text+0x12a0): undefined reference to `usb_set_interface'
>> nios2-linux-ld: btmtk.c:(.text+0x13a4): undefined reference to `usb_kill_anchored_urbs'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   btmtk.c:(.text+0x15f0): undefined reference to `usb_anchor_urb'
   nios2-linux-ld: btmtk.c:(.text+0x15fc): undefined reference to `usb_submit_urb'
   nios2-linux-ld: btmtk.c:(.text+0x164c): undefined reference to `usb_unanchor_urb'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `alloc_mtk_intr_urb':
   btmtk.c:(.text+0x16a8): undefined reference to `usb_alloc_urb'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_intr_complete':
   btmtk.c:(.text+0x1a84): undefined reference to `usb_anchor_urb'
   nios2-linux-ld: btmtk.c:(.text+0x1a90): undefined reference to `usb_submit_urb'
   nios2-linux-ld: btmtk.c:(.text+0x1ae4): undefined reference to `usb_unanchor_urb'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_reg_read':
   btmtk.c:(.text+0x1ba8): undefined reference to `usb_control_msg'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_uhw_reg_write':
   btmtk.c:(.text+0x1c90): undefined reference to `usb_control_msg'
   nios2-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_uhw_reg_read':
   btmtk.c:(.text+0x1d9c): undefined reference to `usb_control_msg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
