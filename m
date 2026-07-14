Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3450377A8E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 18:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784055339; cv=none; b=jlwTA+hTAhqhbHMteNIstxqjwfcXiAVdonNIhlp6uJqTrpdAAGvY0aTCASQcVmI57fws6G9/QtxElvlpCqs0asmR2XxdPQCKRQdhtJKQdx5gDD/tons3pJSeobrsCsqaQeY/QqQOF/vd6e5+OW5gT1RfKnvbqDHuMXzxnDwbtKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784055339; c=relaxed/simple;
	bh=e6PGcqgyBR9HSkXu0mj+E8eqfOoUDo7FwOy0Ed8nasg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EEJ/yvu8ouBBDoyEpFQu7TRboP8NbuGFzOrq8Ei0ijCjexXPQswb+vZFTpc/XCcXcPYRV0Hz+3rWoF2QuSPaxyHCYbPbSx9B+CPkkGajBRvhISAHWt8uR2hAyn2nyhePWITdQAgsFKZRa466mf3EfqIXvXvsmionLYrFDUkdKKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7lP+Emm; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7lP+Emm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784055336; x=1815591336;
  h=date:from:to:cc:subject:message-id;
  bh=e6PGcqgyBR9HSkXu0mj+E8eqfOoUDo7FwOy0Ed8nasg=;
  b=A7lP+EmmshGgfzgPFzRCdqE271HijCEnfC+Wjb8H0KDTG4HdIFeta+iM
   lY0Lx6w5KY45GOxCMviWS54FAD83y+6snV45Qlt+GDvVjiL1EzcjhUulA
   8r4KfGmEmKMzNtb+vHbKq0SY1/lZKObMIIt9Ww8IHLCFQukfzvoR8elex
   ivmAyzZqOYWFIfjA8A47OS54HeIilBgnLydEWf32Mhgemcg9hTTBz3Vd0
   ha4jL/GbxHUF2g0DV+WlkHKTU9RmhiyYxVQfsHS8fpbhwr0UniPyDDhZe
   Cle738aCyyk8RSRR3V5YujETHA/5K2bN7wdQnnr0Ce0OaOVZjk7QDhCX1
   g==;
X-CSE-ConnectionGUID: b4BTDSgWQDi+Qf48NVpXwg==
X-CSE-MsgGUID: 2iTRIytrSdeIrny+H6A/Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96050293"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="96050293"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 11:55:35 -0700
X-CSE-ConnectionGUID: rk2fAMjDTTGXNAOzuGGDMg==
X-CSE-MsgGUID: +YjK5+DvRlyzTdsC3NioSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="280362751"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jul 2026 11:55:34 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjiI0-0000000043d-0KC8;
	Tue, 14 Jul 2026 18:55:32 +0000
Date: Tue, 14 Jul 2026 20:54:53 +0200
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: aarch64-linux-gnu-ld:
 drivers/net/usb/r8153_ecm.c:64:undefined reference to `usbnet_write_cmd'
Message-ID: <202607142019.GO61MX9u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/net-usb-centralize-usbnet_cdc_zte_rx_fixup-in-usbnet/20260714-200029
head:   01c24668a6e35556ec573ceb5a3b709515946bc4
commit: fb17c1fe5a30a284abcb7bebbdd178d3dddc5f8d net: usb: remove dependencies on cdc_ether
date:   7 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260714/202607142019.GO61MX9u-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607142019.GO61MX9u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607142019.GO61MX9u-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `r8153_bind':
   drivers/net/usb/r8153_ecm.c:102:(.text+0x20): undefined reference to `usbnet_cdc_bind'
   aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `pla_write_word':
   drivers/net/usb/r8153_ecm.c:55:(.text+0x15c): undefined reference to `usbnet_read_cmd'
>> aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.c:64:(.text+0x1a4): undefined reference to `usbnet_write_cmd'
   aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `pla_read_word':
   drivers/net/usb/r8153_ecm.c:24:(.text+0x2ac): undefined reference to `usbnet_read_cmd'
   aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `rtl8153_ecm_probe':
   drivers/net/usb/r8153_ecm.c:157:(.text+0x318): undefined reference to `usbnet_probe'
   aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o: in function `pla_write_word':
   drivers/net/usb/r8153_ecm.c:55:(.text+0x3bc): undefined reference to `usbnet_read_cmd'
   aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.c:64:(.text+0x3fc): undefined reference to `usbnet_write_cmd'
>> aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data+0x10): undefined reference to `usbnet_disconnect'
>> aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data+0x20): undefined reference to `usbnet_suspend'
>> aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data+0x28): undefined reference to `usbnet_resume'
   aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.data+0x30): undefined reference to `usbnet_resume'
>> aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.rodata+0x98): undefined reference to `usbnet_cdc_unbind'
>> aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.rodata+0xb8): undefined reference to `usbnet_manage_power'
>> aarch64-linux-gnu-ld: drivers/net/usb/r8153_ecm.o:(.rodata+0xc0): undefined reference to `usbnet_cdc_status'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
