Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54C03CBE66
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 20:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615061; cv=none; b=OLysqdqzUq2Hb/9s8CgKN6LbgkL914LeLPbn8e6yHV0aqJzkhIcdS/7+A2szYWghnzfynsn6lU1qDRQcwWqLQfXM6IwYUEU2arKA78j3oZ2VdrwgolmV4ETb/Brh1xys8tPaAXLz9hN1q+qnuPuJgP76uS8K08UHwdquNqpYPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615061; c=relaxed/simple;
	bh=YACdbDtr2HlXj6MkHFVCOmyRS5dl2tkQmrfHjsJnZ+s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HlPLZ9+IOes12vExTpqcMDAcBMsKtwDDhfX9Y/vfawJPMyPfj6eUXXaJR8lxbkCFAVsQYhgwof8dJzHUJ7GZoaFrOQK7+fMgWv9Z7tqBBMLRITb17MI6BWwGbDsqr5Y8Bgyk0VZKv2jnrooT+rM/AFzLoSJe7zLcs/DlpNX1aOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fb/PAFOc; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fb/PAFOc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785615059; x=1817151059;
  h=date:from:to:cc:subject:message-id;
  bh=YACdbDtr2HlXj6MkHFVCOmyRS5dl2tkQmrfHjsJnZ+s=;
  b=Fb/PAFOcpNAx8xWFKEepnpcx4GTyAOHkX/qUW6FR5zfZmkYn1hlTealk
   yQI2h69j6Oi8gW4G0NfpfDfuJ1SMapuyl301yRDvUxJOIUiz5JckwsucT
   yKmNxq/nZuiTk1CpHFt7oOoZCu4ktGPHDGkEz1L71AdxmrTRAr1eTZkUO
   olanHtRE0FOW3TI0/SfiEroDTkJAxXAYBZzR3adwsok40Ecc6aoEf8tz3
   ZOWlRCI8vj5SCf6qMJvL4GGjqwZygY37RcHlk53pS0c/0KW8O8Uz9+CEY
   xHdqeHVsIFhz0ibqlktgoP/WzLvL0bmKgr3kHcm1t/ZG+si1IJCX6eHmT
   g==;
X-CSE-ConnectionGUID: hed2EjUdRFOG8pNQEclANg==
X-CSE-MsgGUID: 0pCAH6KWTveWgEYO0mS15Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="96799599"
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="96799599"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 13:10:58 -0700
X-CSE-ConnectionGUID: 3Odk0P4bSTePU/GXQ1yO1A==
X-CSE-MsgGUID: pUIVxau/T7+9yosgP47Vyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,199,1779174000"; 
   d="scan'208";a="265126887"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2026 13:10:56 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqG2o-000000003qX-1Zmb;
	Sat, 01 Aug 2026 20:10:54 +0000
Date: Sun, 02 Aug 2026 04:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [linux-next:master 4106/11507]
 arch/sh/boards/mach-rsk/devices-rsk7203.c:49:55: error: initializer element
 is not constant
Message-ID: <202608020345.iCwkQ6oH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: 6905cdac0e51b067f0060b052724d696b4087f8a [4106/11507] sh: mach-rsk: rsk7203: use static device properties for LEDs and GPIO buttons
config: sh-randconfig-001-20260802 (https://download.01.org/0day-ci/archive/20260802/202608020345.iCwkQ6oH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020345.iCwkQ6oH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608020345.iCwkQ6oH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sh/boards/mach-rsk/devices-rsk7203.c:49:55: error: initializer element is not constant
      49 |         .properties = (const struct property_entry[]) {
         |                                                       ^
   arch/sh/boards/mach-rsk/devices-rsk7203.c:49:55: note: (near initialization for 'rsk7203_green_led_node')
   arch/sh/boards/mach-rsk/devices-rsk7203.c:60:55: error: initializer element is not constant
      60 |         .properties = (const struct property_entry[]) {
         |                                                       ^
   arch/sh/boards/mach-rsk/devices-rsk7203.c:60:55: note: (near initialization for 'rsk7203_orange_led_node')
   arch/sh/boards/mach-rsk/devices-rsk7203.c:72:55: error: initializer element is not constant
      72 |         .properties = (const struct property_entry[]) {
         |                                                       ^
   arch/sh/boards/mach-rsk/devices-rsk7203.c:72:55: note: (near initialization for 'rsk7203_red1_led_node')
   arch/sh/boards/mach-rsk/devices-rsk7203.c:84:55: error: initializer element is not constant
      84 |         .properties = (const struct property_entry[]) {
         |                                                       ^
   arch/sh/boards/mach-rsk/devices-rsk7203.c:84:55: note: (near initialization for 'rsk7203_red2_led_node')
   arch/sh/boards/mach-rsk/devices-rsk7203.c:95:55: error: initializer element is not constant
      95 |         .properties = (const struct property_entry[]) {
         |                                                       ^
   arch/sh/boards/mach-rsk/devices-rsk7203.c:95:55: note: (near initialization for 'rsk7203_gpio_keys_node')
   arch/sh/boards/mach-rsk/devices-rsk7203.c:103:55: error: initializer element is not constant
     103 |         .properties = (const struct property_entry[]) {
         |                                                       ^
   arch/sh/boards/mach-rsk/devices-rsk7203.c:103:55: note: (near initialization for 'rsk7203_sw1_key_node')
   arch/sh/boards/mach-rsk/devices-rsk7203.c:114:55: error: initializer element is not constant
     114 |         .properties = (const struct property_entry[]) {
         |                                                       ^
   arch/sh/boards/mach-rsk/devices-rsk7203.c:114:55: note: (near initialization for 'rsk7203_sw2_key_node')
   arch/sh/boards/mach-rsk/devices-rsk7203.c:125:55: error: initializer element is not constant
     125 |         .properties = (const struct property_entry[]) {
         |                                                       ^
   arch/sh/boards/mach-rsk/devices-rsk7203.c:125:55: note: (near initialization for 'rsk7203_sw3_key_node')


vim +49 arch/sh/boards/mach-rsk/devices-rsk7203.c

    45	
    46	static const struct software_node rsk7203_green_led_node = {
    47		.name = "green",
    48		.parent = &rsk7203_gpio_leds_node,
  > 49		.properties = (const struct property_entry[]) {
    50			PROPERTY_ENTRY_STRING("label", "green"),
    51			PROPERTY_ENTRY_GPIO("gpios", &pfc_gpiochip_node,
    52					    GPIO_PE10, GPIO_ACTIVE_LOW),
    53			{ }
    54		},
    55	};
    56	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
