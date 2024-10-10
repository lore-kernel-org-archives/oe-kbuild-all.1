Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11E23716D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 02:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728528823; cv=none; b=GrKvGpkfo/gbcMrlKu+KgsNA1gidsgT2oqSLqkVgYOqvvJLLHtyhaxMP+JyXZfhBHjY3IgQPbL5TUvrMndCBLs+dHnsRdBXvsKbOL9YZicduTEoBDGzTuT5f+ugOiEdqRT9TstHHFyekD4dS7ZT+HzNiBVaMpZNxjAs1s9oNOuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728528823; c=relaxed/simple;
	bh=/VfNoC7MhLJs8IqZseyW2S9q/yrPoOx2Cu6ZY6p4xZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WIWiapvovrK3P4tZlVobSKlqqm0wYnETetH6AFwCDG7HfEVpse+pak4jvphQLG6VyxT81DC6FX+1WZp2rHqiudUJ+Wstuo+1UQ23+G+atnvuTXDKoLZHeoCcCBNKVRsjAxSKvGf9KaU890igjBwrC1VkK7qs47G7BjBoPFh800I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hL5w1rXA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hL5w1rXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728528822; x=1760064822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/VfNoC7MhLJs8IqZseyW2S9q/yrPoOx2Cu6ZY6p4xZc=;
  b=hL5w1rXArC7mNPro7GskUvnJbKGF7HOlGZn04RVQDl4X2/QsWE6i9AWp
   PlMp9+EpGXe3zh7CNg+nYceIvj8JdqDCRcBwJS9oVuWI2jHZ5bbUwLx2T
   v5RyD0sAyZy+1pGeISC017moUqwzlp0EwJD01ImX0h7IoZ6K9VVe2C3qv
   ApfZqe9e+q2FtKMneH+eG0801c1aLVf0fshHqJF1MXJFH+qd44rTKeQPm
   xID1Qg0TzjoAibEgFcsNB+cpVJ+5R9LO1OFZ6Snkr1A6E1qwIIiUpsA1X
   HDFfLNbNnXLZOUKcdxAPbo4hIaCvJ0HBF2ZQCtwqcvvf54wuK829hb5AR
   Q==;
X-CSE-ConnectionGUID: cFrYnzgOQN2wK16osT+DDQ==
X-CSE-MsgGUID: vPGmY5pKQRSPzHBg8cqrJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27996541"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="27996541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 19:53:42 -0700
X-CSE-ConnectionGUID: d6qrqsnYRtWWetopXguRUw==
X-CSE-MsgGUID: OMUxvuFwSx+jZYUKkRbeKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="77275947"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Oct 2024 19:53:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syjJ4-000A5L-16;
	Thu, 10 Oct 2024 02:53:38 +0000
Date: Thu, 10 Oct 2024 10:53:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ram Muthiah <rammuthiah@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: undefined reference to `tty_port_tty_get'
Message-ID: <202410101022.BfoSzPOW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 180e8150bde1627efa62910f16ff32d2e4fa85db ANDROID: GKI: build in HVC_DRIVER
date:   4 years, 7 months ago
config: i386-buildonly-randconfig-004-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101022.BfoSzPOW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101022.BfoSzPOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101022.BfoSzPOW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/putuser.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_cleanup':
   hvc_console.c:(.text+0x35a): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_set_winsz':
   hvc_console.c:(.text+0x3c5): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0x3f6): undefined reference to `tty_do_resize'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_hangup':
   hvc_console.c:(.text+0x4ee): undefined reference to `tty_port_tty_set'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_open':
   hvc_console.c:(.text+0x589): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x630): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x63f): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_remove':
>> (.text+0x678): undefined reference to `tty_port_tty_get'
>> ld: (.text+0x6bb): undefined reference to `tty_port_put'
>> ld: (.text+0x6c6): undefined reference to `tty_vhangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_close':
   hvc_console.c:(.text+0x6f4): undefined reference to `tty_hung_up_p'
   ld: hvc_console.c:(.text+0x74c): undefined reference to `tty_port_tty_set'
   ld: hvc_console.c:(.text+0x796): undefined reference to `tty_wait_until_sent'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc':
>> (.text+0x7e5): undefined reference to `__tty_alloc_driver'
>> ld: (.text+0x824): undefined reference to `tty_std_termios'
>> ld: (.text+0x843): undefined reference to `tty_set_operations'
>> ld: (.text+0x886): undefined reference to `tty_register_driver'
>> ld: (.text+0x8f1): undefined reference to `tty_port_init'
   ld: drivers/tty/hvc/hvc_console.o: in function `__hvc_poll':
   hvc_console.c:(.text+0xab8): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0xaf8): undefined reference to `tty_buffer_request_room'
   ld: hvc_console.c:(.text+0xb41): undefined reference to `__tty_insert_flip_char'
   ld: hvc_console.c:(.text+0xca4): undefined reference to `tty_port_tty_get'
   ld: hvc_console.c:(.text+0xcf6): undefined reference to `tty_wakeup'
   ld: hvc_console.c:(.text+0xd34): undefined reference to `tty_flip_buffer_push'
   ld: hvc_console.c:(.text+0xd4b): undefined reference to `tty_hangup'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_install':
   hvc_console.c:(.text+0x119c): undefined reference to `tty_port_install'
   ld: hvc_console.c:(.text+0x11bb): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_instantiate':
>> (.text+0x1271): undefined reference to `tty_port_put'
   ld: drivers/tty/hvc/hvc_console.o: in function `hvc_alloc.cold':
>> hvc_console.c:(.text.unlikely+0x3f): undefined reference to `put_tty_driver'
>> ld: hvc_console.c:(.text.unlikely+0x71): undefined reference to `put_tty_driver'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
