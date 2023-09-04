Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7FFA20
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 06:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693809830; x=1725345830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EIvFoCI8D4SNE8lkUnoOF5hXgFXL7+ifkBSgkwYpwd0=;
  b=E9YGf4FqenU8Z/ng586Ak8T1FVOQWePr20+SZcuamkgq/uGHloT6zweU
   Ml5LQp6O2jdK6E3EvDu3+lmg3w5NrAx8CTYT4PtM2LVR395GWk13frOwM
   ePKV0Zecrlylc9M7gwgIixAG+FJjMnaYrIwX9X/Lv510q9aFMYE8w0yv6
   7KuZQWTdyLNZTgGDlCn3RRbuxsAdacrCFVEoiuO2WbYozCsfT9VUqFdUq
   hdHNvW7SPSHoG9uFJUjaZq4p4EjgPlQoigqYQpoSYhYoYXLIKJc0CbULd
   8FlfCSNC/vlPj538+E5EO7nif58zpmFS6cbMWs3s9teipxoKVwbxLe5XT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="379244852"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="379244852"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 23:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="864229008"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="864229008"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 03 Sep 2023 23:43:49 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd3JF-0000En-10;
	Mon, 04 Sep 2023 06:43:43 +0000
Date: Mon, 4 Sep 2023 14:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 50/75] sound/usb/mixer_maps.c:371:64:
 warning: excess elements in struct initializer
Message-ID: <202309041431.djtcgbdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   685a3043e4703a119d750efb0a28138f371b3d69
commit: 7fb0bcf2b0faa4798d9b9eba17548e5b03fd2445 [50/75] ALSA: usb-audio: Add quirk for Microsoft Modern Wireless Headset
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230904/202309041431.djtcgbdF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309041431.djtcgbdF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309041431.djtcgbdF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/usb/mixer.c:98:
>> sound/usb/mixer_maps.c:371:64: warning: excess elements in struct initializer
     371 | static const struct usbmix_dB_map ms_usb_link_dB = { -3225, 0, true };
         |                                                                ^~~~
   sound/usb/mixer_maps.c:371:64: note: (near initialization for 'ms_usb_link_dB')


vim +371 sound/usb/mixer_maps.c

   368	
   369	/* Microsoft USB Link headset */
   370	/* a guess work: raw playback volume values are from 2 to 129 */
 > 371	static const struct usbmix_dB_map ms_usb_link_dB = { -3225, 0, true };
   372	static const struct usbmix_name_map ms_usb_link_map[] = {
   373		{ 9, NULL, .dB = &ms_usb_link_dB },
   374		{ 10, NULL }, /* Headset Capture volume; seems non-working, disabled */
   375		{ 0 }   /* terminator */
   376	};
   377	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
