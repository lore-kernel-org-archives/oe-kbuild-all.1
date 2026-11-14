Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660656;
	b=FWJxsw/1HAN/rAr4pZfHbGa6YT6SprRFJ2Ec9qvSzxhxfPaet1/quIdoN/paUP2vJlgU
	 LWrGZ88H0zkopaCVYy/evPjbbZ+7A10/xByn2ohPbrkLig3bis0QG/KyAgz4nKCv4z1ba
	 cyowqv7WQ2vk3boGQ1lYPncp26l1i59MyS3si+4uWgh8/+1oBAF1embPZk3mz/3rwc+b7
	 lNqwdbkjIOY0ESrU8V3YECxnxlRz4KmCpL1ZthxJGSqxhMOY2Eh0oG0+puj9sJzD8Urxd
	 eO8dAB+veQDwVEZRjxicTe7MJRfI80FIlqVR3nwRFvGlpLYzHDzYZaDfsvNf65VAqUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660656;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=s1rvTJhiD+Ja9U1SJhMoE6JPuHKo8dRW0EbVts8YvGI=;
	b=byLc3GAJg+r8W8S22vN5/CAce9yJRObfcQlS0fDMLCzIG+WdvWz7C8eGHX18o9XScBR3
	 lyeQv60jT53QDFgdv8QQSlpN+pMM0sV7Ncdlm/GFTpiGLndeSAjVnu8iQ/3OHxCkXrlh8
	 HRysTUaXmxROn6TzG0T+EOEKMaPQBJBCOPQbCy/bljWXhkjJb1HJ0uhVz8d5M7zqR/M9D
	 en8uOS1jhSUdwWq4DKT4s9dD07dpvziQr2bMIkta0ON6IYxIVbSnywIk7P8exEAbweAnK
	 Z+GpZP09a0JMr8JDXsB3K4z9ZEW//g/cyfHNJTXx54Nu66Q/VMAq3BH8jWh2E1J6MFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iF1uDzUa;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7010606A331
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 12:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7010606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iF1uDzUa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794660655; x=1826196655;
  h=date:from:to:cc:subject:message-id;
  bh=8dQqUp2WzLSbvrGvMv/39a2xIl5xR/LKl9oyL+7zHm0=;
  b=iF1uDzUaj34zORkizHK19N0flQGg9gUUXzHxblTBLPeb0x/9dcCgyK+E
   gFS41FHIhw/Umwh2SmdDMLducKcDt773CzMr1hgQelJbBgRlFq2P9IVmB
   TjFPNrlmWQDa32Krvsa+A4/3ed/kzMCBCN2VAof02N7sYpq4MVa0Z7KOk
   OQxKi/VZgnZyHdI7SXIkfLvTnalUcRYe3Zjn+gU2F6oowmsYqvBlZGS2L
   pzc+A+fh5zlG9KYd6cLzyW8CEW9qhka5Xwm6PTvrZRU7HPkxGAyGvz94H
   IUlmxThLyVbPQSOlzH0OMhHm0uA0nNMO173Onjh9VuyXkllGMHHSImmk8
   Q==;
X-CSE-ConnectionGUID: ygW5VbTmSS2k8t+y6cgv7w==
X-CSE-MsgGUID: BDPsC0qURemqb773aUdZxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3330864"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3330864"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 04:50:55 -0800
X-CSE-ConnectionGUID: u9ZMjwkBTQC8/fSMVLDPlQ==
X-CSE-MsgGUID: zlARO2kwQYWWZWYJpvAJSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="8956828"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 14 Nov 2026 04:50:53 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSDDW-000000001bj-2r7d;
	Sat, 14 Nov 2026 12:50:50 +0000
Date: Sat, 14 Nov 2026 13:49:53 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2]
 sound/core/control.c:1296:5-11: inconsistent IS_ERR and PTR_ERR on line 1297.
Message-ID: <202611141346.3KgvEJJw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   3540cf724bf0fe246a3131fd1f3e9342fa03b03e
commit: 65d126a77de9cfabc230c734eadb9911be6663c7 [2/2] UPSTREAM: ALSA: control: Use automatic cleanup of kfree()
config: x86_64-randconfig-2103-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141346.3KgvEJJw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141346.3KgvEJJw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/core/control.c:1296:5-11: inconsistent IS_ERR and PTR_ERR on line 1297.

vim +1296 sound/core/control.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  1287  
82e9bae6fd253a Takashi Iwai     2005-11-17  1288  static int snd_ctl_elem_write_user(struct snd_ctl_file *file,
82e9bae6fd253a Takashi Iwai     2005-11-17  1289  				   struct snd_ctl_elem_value __user *_control)
^1da177e4c3f41 Linus Torvalds   2005-04-16  1290  {
65d126a77de9cf Takashi Iwai     2024-02-22  1291  	struct snd_ctl_elem_value *control __free(kfree) = NULL;
646494007b48e8 Giuliano Pochini 2006-03-13  1292  	struct snd_card *card;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1293  	int result;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1294  
ef44a1ec6eeef1 Li Zefan         2009-04-10  1295  	control = memdup_user(_control, sizeof(*control));
ef44a1ec6eeef1 Li Zefan         2009-04-10 @1296  	if (IS_ERR(control))
65d126a77de9cf Takashi Iwai     2024-02-22 @1297  		return PTR_ERR(no_free_ptr(control));
ef44a1ec6eeef1 Li Zefan         2009-04-10  1298  
646494007b48e8 Giuliano Pochini 2006-03-13  1299  	card = file->card;
646494007b48e8 Giuliano Pochini 2006-03-13  1300  	result = snd_ctl_elem_write(card, file, control);
7d8e8292013ab7 Takashi Iwai     2017-08-30  1301  	if (result < 0)
65d126a77de9cf Takashi Iwai     2024-02-22  1302  		return result;
7d8e8292013ab7 Takashi Iwai     2017-08-30  1303  
^1da177e4c3f41 Linus Torvalds   2005-04-16  1304  	if (copy_to_user(_control, control, sizeof(*control)))
65d126a77de9cf Takashi Iwai     2024-02-22  1305  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1306  	return result;
^1da177e4c3f41 Linus Torvalds   2005-04-16  1307  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  1308  

:::::: The code at line 1296 was first introduced by commit
:::::: ef44a1ec6eeef189998f84e7230e1d3535b01074 ALSA: sound/core: use memdup_user()

:::::: TO: Li Zefan <lizf@cn.fujitsu.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
