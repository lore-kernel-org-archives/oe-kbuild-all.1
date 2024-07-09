Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BBA18A927
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720532974; cv=none; b=la8pt9hiJLaQvWRKjhcXFOgS59tqfnP7hIOisnQnDbN/Uwu2LQyZRu6s9EKav/ktQx+IC1dZ92cWw8PsVeo2PSZW/DvS6+y1+Vk60lsN2IY5JVN6EBZfKygMr8eOkyb7+FsXIk5kZKEmfNNcnaO5fBRmRS11q+CbvVCcpDbTY4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720532974; c=relaxed/simple;
	bh=HNsblS8y5NsAuOX/icGNDfr5/1yXuvBOQpddHKr9ltc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l3ivpW/TVVKd5MJzC4XpkK8y6EJX6VPd+i/s+UG9YVTbvMDVj4oPz37eUNk7+9aWqBs1dnU79CyExldBreU+TMZQ+wXfQVSjSvwRqN1ofFzJQtIkL2U7mZh5e5pgxKNHc7Zx6C9BlpJf/5/SiWoH3xV9oElLJAl5X2j6i1Kgr1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KD+hHceP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KD+hHceP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720532973; x=1752068973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HNsblS8y5NsAuOX/icGNDfr5/1yXuvBOQpddHKr9ltc=;
  b=KD+hHcePbMsypJ1C/OU45ycRiTZuiAukEfXwH6GsFCzk76xdcLbtsNOY
   ouK3ahkDBka9zsjdU1Qt9ArgRH4luRVjUf9COnn3krQlE8Bv6r9T/UrDh
   UP8LZ4YoDwidXf67Kz3iRqKPtaevGBvXiP9CAuQvHmKVdSIARRPI6gPKq
   zG0DdsdCIO5e8T+Jl1jk9jsE5SUym2eLByhvYVRSDfEqUf+r55OYnXfPz
   FRT4IdX9rzd4U67QmGVsWP82JHD4iZUw2UCaAtTnd0chpRmveLdHxCdAl
   ayVVVyIUznSElmnuaSCOeRKjWksWw4PINDEUgvPACAnoxAyR/mbNV2T8H
   A==;
X-CSE-ConnectionGUID: G1Fo01VJRSWfuEnXt0PKkw==
X-CSE-MsgGUID: fHY6aAhxSwKp6vjx5SKQhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17624979"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="17624979"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 06:49:32 -0700
X-CSE-ConnectionGUID: r3yqjzQqQK+epUW6IXApAA==
X-CSE-MsgGUID: RuPU6O7HRLisfBBVNA+5QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; 
   d="scan'208";a="47643454"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Jul 2024 06:49:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRBDk-000Wiu-1I;
	Tue, 09 Jul 2024 13:49:28 +0000
Date: Tue, 9 Jul 2024 21:48:43 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [linux-next:master 11634/11980] sh4-linux-ld:
 drivers/bluetooth/btmtk.c:568:undefined reference to `usb_free_urb'
Message-ID: <202407092123.7s5ilvsu-lkp@intel.com>
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
config: sh-buildonly-randconfig-r006-20220515 (https://download.01.org/0day-ci/archive/20240709/202407092123.7s5ilvsu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407092123.7s5ilvsu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407092123.7s5ilvsu-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   drivers/bluetooth/btmtk.c:568:(.text+0x754): undefined reference to `usb_alloc_urb'
>> sh4-linux-ld: drivers/bluetooth/btmtk.c:568:(.text+0x760): undefined reference to `usb_free_urb'
>> sh4-linux-ld: drivers/bluetooth/btmtk.c:568:(.text+0x778): undefined reference to `usb_anchor_urb'
>> sh4-linux-ld: drivers/bluetooth/btmtk.c:568:(.text+0x77c): undefined reference to `usb_submit_urb'
>> sh4-linux-ld: drivers/bluetooth/btmtk.c:568:(.text+0x78c): undefined reference to `usb_unanchor_urb'
   sh4-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   drivers/bluetooth/btmtk.c:515:(.text+0xa40): undefined reference to `usb_anchor_urb'
   sh4-linux-ld: drivers/bluetooth/btmtk.c:515:(.text+0xa44): undefined reference to `usb_submit_urb'
   sh4-linux-ld: drivers/bluetooth/btmtk.c:515:(.text+0xa54): undefined reference to `usb_unanchor_urb'
   sh4-linux-ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   drivers/bluetooth/btmtk.c:666:(.text+0xbcc): undefined reference to `usb_autopm_get_interface'
>> sh4-linux-ld: drivers/bluetooth/btmtk.c:666:(.text+0xbd8): undefined reference to `usb_autopm_put_interface'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
