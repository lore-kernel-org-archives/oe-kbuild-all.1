Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F80B13D28F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jul 2024 06:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720159811; cv=none; b=L3tC/ZLX9DVlKoTQ/cX9nJTF1Oo856li57+F/cU6EjJHGiA+amO50AIgNYTBVcS2PUj0me8+nMyzZrQaVQu2Z4plrkBlaBPoQDjT98p8sjlPse38HNEuNbfA8iVbY5hyYPdkEyWcBmMwbbQvUNfyxAIK6Q7fCOLn7fwJZmn/SYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720159811; c=relaxed/simple;
	bh=2M0fguvjxnITBIXwZE83kBtpWTCgS/US+uG4BdqttDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=etcWjTmuAtTW5YkViRmB1glOG6zmG1ACm5VEFQA7tbVHwn5OGX9n8vQ7aKss4hN5rU7X6KazunD0XWgjWcz+HrNJv/wi1/WfPRiphFTZwPJ3q5bBkJ3E4uMOlGKHH53pua/PEZCBjaJlpNrl6ELHFhzZhcbelXTaBLGSOnnwkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nwrsw+z/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nwrsw+z/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720159809; x=1751695809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2M0fguvjxnITBIXwZE83kBtpWTCgS/US+uG4BdqttDE=;
  b=nwrsw+z/aEfOOg0pNskqE/DDs4t5HLn0Ab8b7yfHv4T5IIxwQqd/Th+b
   3qQCCD4O4s+F6bj46sO8qALcrf/59d+xTzPcAlZBA0Rc7MEsDWmnTWEfi
   9QWRM43CqH2aDUETlYh6h7rrGWtdXFuO0wJu+4Avkh0abVmcayq2k5u6P
   RueZoGNQlFVjExjMTi2oisjtcnqufV6ZlGrTiLbFSTSqkEG5oTFJCHkiq
   UcHR8uaA4qhaerz8hlU7CibdIphlhHqbvhwvmXAoPfUcT9lq2W2ovNaf7
   LlZymDEeb0pElPv6vINnBCHihlTmepgMCmA/b18VIhFtgDA0aTdAZmzab
   Q==;
X-CSE-ConnectionGUID: 17yE66VMRRiCTg0JrnOgDA==
X-CSE-MsgGUID: J6H5H+WEQQWOFGXdlRYZiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17587069"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17587069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 23:10:09 -0700
X-CSE-ConnectionGUID: faNjunHSSmudEYsE/gcmUA==
X-CSE-MsgGUID: K4hQdQ3qSj68keOXZfwe/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="77518698"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jul 2024 23:10:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPc8x-000S0l-21;
	Fri, 05 Jul 2024 06:10:03 +0000
Date: Fri, 5 Jul 2024 14:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Lu <chris.lu@mediatek.com>, Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Von Dentz <luiz.dentz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Wang <sean.wang@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-mediatek <linux-mediatek@lists.infradead.org>,
	Chris Lu <chris.lu@mediatek.com>
Subject: Re: [PATCH v7 5/8] Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to
 btmtk.c
Message-ID: <202407051325.i8Ac4Nz9-lkp@intel.com>
References: <20240704060116.16600-6-chris.lu@mediatek.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704060116.16600-6-chris.lu@mediatek.com>

Hi Chris,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on next-20240703]
[cannot apply to bluetooth/master linus/master v6.10-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Lu/Bluetooth-btusb-mediatek-remove-the-unnecessary-goto-tag/20240705-043833
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240704060116.16600-6-chris.lu%40mediatek.com
patch subject: [PATCH v7 5/8] Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c
config: i386-buildonly-randconfig-001-20240705 (https://download.01.org/0day-ci/archive/20240705/202407051325.i8Ac4Nz9-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051325.i8Ac4Nz9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051325.i8Ac4Nz9-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_submit_wmt_recv_urb':
   btmtk.c:(.text+0x731): undefined reference to `usb_alloc_urb'
>> ld: btmtk.c:(.text+0x7c5): undefined reference to `usb_anchor_urb'
>> ld: btmtk.c:(.text+0x7d1): undefined reference to `usb_submit_urb'
>> ld: btmtk.c:(.text+0x7de): undefined reference to `usb_free_urb'
>> ld: btmtk.c:(.text+0x820): undefined reference to `usb_unanchor_urb'
   ld: btmtk.c:(.text+0x829): undefined reference to `usb_free_urb'
   ld: btmtk.c:(.text+0x83e): undefined reference to `usb_free_urb'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_hci_wmt_sync':
   btmtk.c:(.text+0x8bd): undefined reference to `usb_autopm_get_interface'
>> ld: btmtk.c:(.text+0x8f9): undefined reference to `usb_autopm_put_interface'
   ld: btmtk.c:(.text+0x9bf): undefined reference to `usb_autopm_put_interface'
   ld: drivers/bluetooth/btmtk.o: in function `btmtk_usb_wmt_recv':
   btmtk.c:(.text+0xb67): undefined reference to `usb_anchor_urb'
   ld: btmtk.c:(.text+0xb73): undefined reference to `usb_submit_urb'
   ld: btmtk.c:(.text+0xc8e): undefined reference to `usb_unanchor_urb'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
