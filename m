Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2503E00B4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 21:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790370454; cv=none; b=gmlK8LH9CiTfno7HV9E1h6LjraoxGbtxeUKrM71+PLxtRV/nHnVErzphZG/VW2oddwn96Kbwy6xEvc21J6g1eDmdvbjDBkQcAchhK7IXSTdlQvZ7dWkrppNK2zmYnRM4Jkl4O3GW5rb7OrWzAH3i00J3DE1bUTCMAHonf+NGYFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790370454; c=relaxed/simple;
	bh=lSv3zCjjYqgdYcK8MjdGkYbv8l9HrgdrBWtbctv6HKI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V6NwltGbuDaRS/xv0r5HnVCv45nQ/J3gLcQs5ZRQplR+wAdPJuWCMS8h3WWc67FAaa0eT3tpGKcA9x1POmsUltb0aUqgX3vKlX/PU9GRSgE5JQN0wl5ZPUkmjJKtu8VjSvGt/ZQ24HgU0uiPbHT4umU4XSKqVcRno70IWC+ry9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/8KcoVX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/8KcoVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790370453; x=1821906453;
  h=date:from:to:cc:subject:message-id;
  bh=lSv3zCjjYqgdYcK8MjdGkYbv8l9HrgdrBWtbctv6HKI=;
  b=H/8KcoVXZXQJeEAKOYyCkBmsvcEvmrWtkaRMKED7DqSseGp0DGB4NNeF
   GY26san6Re5N9w9/od57x0G34AueZYjQWrDnkWvow3G2mU5muOUyUsFLl
   CMawMs26rZM3WX/TnDgXQsi4n10JYXhgQu22fxlYh2JD5XbOqjWdKwobK
   0lYYA1aKKnsrP8mm+/tjc5WrQl0WSn/OpLytGuK+rgPJCo+uy3QM+05ke
   tjSrjxz5spJz6xv2vFolUKtC5zBGegxtOr+LgWAh8eKPRnym6X1D2jklB
   +BXdIX2YrNydVocZt6rJJlfIyS4mp/4y4x9/KWs49nla6NlPud1K4Cy+r
   Q==;
X-CSE-ConnectionGUID: ierMiKx4RGK5E4NH/xsmxw==
X-CSE-MsgGUID: JSrmcTutQQ6gvGAg/6e2TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90028506"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90028506"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:07:32 -0700
X-CSE-ConnectionGUID: xJkWvw1AQnGRmNDRicGKrg==
X-CSE-MsgGUID: LGnPrwVcSLK4cHoq5d+RKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="282506614"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2026 14:07:30 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAD8h-000000000t8-248k;
	Fri, 25 Sep 2026 21:07:27 +0000
Date: Fri, 25 Sep 2026 23:06:55 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 467/673]
 arch/s390/kernel/setup.c:301:1: warning: the frame size of 1024 bytes is
 larger than 960 bytes
Message-ID: <202609252053.GxTH6Qxs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: acb21639a56634b326a26f5c179ba3f94ab5b6c2 [467/673] fixup! testing: allow building more quickly with W=12
config: s390-randconfig-2000-20260925 (https://download.01.org/0day-ci/archive/20260925/202609252053.GxTH6Qxs-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252053.GxTH6Qxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609252053.GxTH6Qxs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/s390/kernel/setup.c: In function 'conmode_default':
>> arch/s390/kernel/setup.c:301:1: warning: the frame size of 1024 bytes is larger than 960 bytes [-Wframe-larger-than=]
    }
    ^


vim +301 arch/s390/kernel/setup.c

^1da177e4c3f41 Linus Torvalds      2005-04-16  245  
^1da177e4c3f41 Linus Torvalds      2005-04-16  246  static void __init conmode_default(void)
^1da177e4c3f41 Linus Torvalds      2005-04-16  247  {
^1da177e4c3f41 Linus Torvalds      2005-04-16  248  	char query_buffer[1024];
^1da177e4c3f41 Linus Torvalds      2005-04-16  249  	char *ptr;
^1da177e4c3f41 Linus Torvalds      2005-04-16  250  
52109a067aaa96 Heiko Carstens      2025-02-07  251  	if (machine_is_vm()) {
740b5706b9c4b3 Heiko Carstens      2006-12-04  252  		cpcmd("QUERY CONSOLE", query_buffer, 1024, NULL);
^1da177e4c3f41 Linus Torvalds      2005-04-16  253  		console_devno = simple_strtoul(query_buffer + 5, NULL, 16);
^1da177e4c3f41 Linus Torvalds      2005-04-16  254  		ptr = strstr(query_buffer, "SUBCHANNEL =");
^1da177e4c3f41 Linus Torvalds      2005-04-16  255  		console_irq = simple_strtoul(ptr + 13, NULL, 16);
740b5706b9c4b3 Heiko Carstens      2006-12-04  256  		cpcmd("QUERY TERM", query_buffer, 1024, NULL);
^1da177e4c3f41 Linus Torvalds      2005-04-16  257  		ptr = strstr(query_buffer, "CONMODE");
^1da177e4c3f41 Linus Torvalds      2005-04-16  258  		/*
^1da177e4c3f41 Linus Torvalds      2005-04-16  259  		 * Set the conmode to 3215 so that the device recognition 
^1da177e4c3f41 Linus Torvalds      2005-04-16  260  		 * will set the cu_type of the console to 3215. If the
^1da177e4c3f41 Linus Torvalds      2005-04-16  261  		 * conmode is 3270 and we don't set it back then both
^1da177e4c3f41 Linus Torvalds      2005-04-16  262  		 * 3215 and the 3270 driver will try to access the console
^1da177e4c3f41 Linus Torvalds      2005-04-16  263  		 * device (3215 as console and 3270 as normal tty).
^1da177e4c3f41 Linus Torvalds      2005-04-16  264  		 */
740b5706b9c4b3 Heiko Carstens      2006-12-04  265  		cpcmd("TERM CONMODE 3215", NULL, 0, NULL);
^1da177e4c3f41 Linus Torvalds      2005-04-16  266  		if (ptr == NULL) {
8c0933eeb701eb Peter Oberparleiter 2008-02-05  267  #if defined(CONFIG_SCLP_CONSOLE) || defined(CONFIG_SCLP_VT220_CONSOLE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  268  			SET_CONSOLE_SCLP;
^1da177e4c3f41 Linus Torvalds      2005-04-16  269  #endif
^1da177e4c3f41 Linus Torvalds      2005-04-16  270  			return;
^1da177e4c3f41 Linus Torvalds      2005-04-16  271  		}
d0b319843baddc Vasily Gorbik       2019-08-19  272  		if (str_has_prefix(ptr + 8, "3270")) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  273  #if defined(CONFIG_TN3270_CONSOLE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  274  			SET_CONSOLE_3270;
^1da177e4c3f41 Linus Torvalds      2005-04-16  275  #elif defined(CONFIG_TN3215_CONSOLE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  276  			SET_CONSOLE_3215;
8c0933eeb701eb Peter Oberparleiter 2008-02-05  277  #elif defined(CONFIG_SCLP_CONSOLE) || defined(CONFIG_SCLP_VT220_CONSOLE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  278  			SET_CONSOLE_SCLP;
^1da177e4c3f41 Linus Torvalds      2005-04-16  279  #endif
d0b319843baddc Vasily Gorbik       2019-08-19  280  		} else if (str_has_prefix(ptr + 8, "3215")) {
^1da177e4c3f41 Linus Torvalds      2005-04-16  281  #if defined(CONFIG_TN3215_CONSOLE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  282  			SET_CONSOLE_3215;
^1da177e4c3f41 Linus Torvalds      2005-04-16  283  #elif defined(CONFIG_TN3270_CONSOLE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  284  			SET_CONSOLE_3270;
8c0933eeb701eb Peter Oberparleiter 2008-02-05  285  #elif defined(CONFIG_SCLP_CONSOLE) || defined(CONFIG_SCLP_VT220_CONSOLE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  286  			SET_CONSOLE_SCLP;
^1da177e4c3f41 Linus Torvalds      2005-04-16  287  #endif
^1da177e4c3f41 Linus Torvalds      2005-04-16  288  		}
52109a067aaa96 Heiko Carstens      2025-02-07  289  	} else if (machine_is_kvm()) {
a5ff1b34e16c20 Masahiro Yamada     2016-08-25  290  		if (sclp.has_vt220 && IS_ENABLED(CONFIG_SCLP_VT220_CONSOLE))
8f50af49f564d4 Peter Oberparleiter 2016-07-07  291  			SET_CONSOLE_VT220;
a5ff1b34e16c20 Masahiro Yamada     2016-08-25  292  		else if (sclp.has_linemode && IS_ENABLED(CONFIG_SCLP_CONSOLE))
8f50af49f564d4 Peter Oberparleiter 2016-07-07  293  			SET_CONSOLE_SCLP;
8f50af49f564d4 Peter Oberparleiter 2016-07-07  294  		else
8f50af49f564d4 Peter Oberparleiter 2016-07-07  295  			SET_CONSOLE_HVC;
^1da177e4c3f41 Linus Torvalds      2005-04-16  296  	} else {
8c0933eeb701eb Peter Oberparleiter 2008-02-05  297  #if defined(CONFIG_SCLP_CONSOLE) || defined(CONFIG_SCLP_VT220_CONSOLE)
^1da177e4c3f41 Linus Torvalds      2005-04-16  298  		SET_CONSOLE_SCLP;
^1da177e4c3f41 Linus Torvalds      2005-04-16  299  #endif
^1da177e4c3f41 Linus Torvalds      2005-04-16  300  	}
^1da177e4c3f41 Linus Torvalds      2005-04-16 @301  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  302  

:::::: The code at line 301 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
