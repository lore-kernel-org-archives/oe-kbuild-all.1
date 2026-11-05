Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916540;
	b=YuVtsAH/tMNlDV09RdRlWPuMkStCBDPKnITg4AYb9VJc+fJB4urCxMIkj0UIiotzMQXJ
	 DZLm0V40noT6sSb7Zu2EF/7Kdcx8vV3/NpvN6BX8AI7qgA9fBFgxGh8cG7Zu/+Km0r+Et
	 qb0VQ1olsYrrfwL1HgkyoiSbmxD75gtXWJrCJmMCyjZmE+yN0CF9tLNPhtqCNtICA/2n0
	 YhUklhkoUg0+ABkfvrS6WECxzNwqZfdwEFHq/iCp75XLRfziQNXrfQpsifQNZ7ZuwLH7R
	 rTQodRYJbiQqL24bbtYLbrsy7VIQlFbxCu4JcRQe6FLbkVUrM1rwaF7pOyO7fVy7DHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916540;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hNVYUjBOfkRodYG62GE/rmlJ+ziFpw6lXVkqIntvMkg=;
	b=vY6w2PIAhsQ29TDxGIYH9keWA5wsK2QyezLNAN8gMrQ5318h0Xfw5R7u2I1vuFB8HSSq
	 YQtGeUBJyyaC7X9NhBfqMknw2iWZruFC1u++p8Icitxszy3ftuPKC3rRoY8v1L12nuTox
	 yJD7Ey/TIwcs44TF1n7P6RFsNhgi3DEXM7upjYYQem27MhK8F69qsV8IZPT+NJlSkKdB8
	 /Uj7TWW3h/QcbJhCO1ztR6sKSDSKw13CgnQXPck9Bmh4xEAsxS4BSMQ7Q3KyJ51yg+Yc6
	 VpO1YKZyhGC/wZ5fyiyI1Z/ZtNvsPIxePlKkeP1Fqg1lcUb5/KlooDfRAJUxYDgzJZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jabxPGNN;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879B0606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 22:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jabxPGNN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793916539; x=1825452539;
  h=date:from:to:cc:subject:message-id;
  bh=hYq1eyPP5thvjzV5wc19zyoNAegNO2EOM4+eY207AVg=;
  b=jabxPGNNhrkumA+lOMEnDVCQJp1tDhfu68CobRTPIMepvlLikFDVSYI0
   XLBZyYYCigSX8S3yb0yzhi0B3cTGlL/wXiI1twCh/pJO8vAT9sSxCXfQH
   7IKxbheaEL4yhlHv0/I7YPxmgIDaEYKq7Yo+5j0ATSSiMidYuGc8KtGad
   7Vf9vf0CNNoP9Uxnmplm7PPj5k4nncJyIKorvrfWQ79cZ/olTGqbIUV5W
   K0ez1Wjn/Ah9WUgWeg2qRz625GzAdHtpsJ6CpWAQUMrbpW6sVdLZgt3SW
   dGcd+UprrVdloSciP/Ydf3NScHkfnYajCtwZlem41bl81p+Zhl9oyWyv/
   g==;
X-CSE-ConnectionGUID: qix8BMDcQtCzsHpxvrZWZA==
X-CSE-MsgGUID: N7ODD0Q9TJ+TQIAyg/947Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2717844"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2717844"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 14:08:58 -0800
X-CSE-ConnectionGUID: J7xunbtBQDuBCS7LrUx0qA==
X-CSE-MsgGUID: s35NXF8hQ06iQidGTYdWjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7273971"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Nov 2026 14:08:56 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xP5dd-000000009pb-35Ua;
	Thu, 05 Nov 2026 22:08:53 +0000
Date: Thu, 05 Nov 2026 23:08:21 +0100
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/sound-rust-v7.3 25/56] error[E0425]:
 cannot find function `snd_info_get_line` in crate `bindings`
Message-ID: <202611052249.DPhLpTfI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/sound-rust-v7.3
head:   070444a8abf14da700680a5331d0a95cd11e578b
commit: e181d3e8f00ae014f1e75fade71c9dada6a53976 [25/56] ALSA: rust: add proc text-entry binding
config: arm64-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261105/202611052249.DPhLpTfI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611052249.DPhLpTfI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611052249.DPhLpTfI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `snd_info_get_line` in crate `bindings`
   --> rust/kernel/sound/info.rs:55:23
   |
   55 |             bindings::snd_info_get_line(
   |                       ^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `snd_info_get_str` in crate `bindings`
   --> rust/kernel/sound/info.rs:71:23
   |
   71 |             bindings::snd_info_get_str(
   |                       ^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `snd_info_create_card_entry` in crate `bindings`
   --> rust/kernel/sound/info.rs:230:23
   |
   230 |             bindings::snd_info_create_card_entry(
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `snd_info_register` in crate `bindings`
   --> rust/kernel/sound/info.rs:259:38
   |
   259 |         to_result(unsafe { bindings::snd_info_register(entry) })
   |                                      ^^^^^^^^^^^^^^^^^
   |
   ::: rust/bindings/bindings_generated.rs:138216:5
   |
   138216 |     pub fn snd_card_register(card: *mut snd_card) -> ffi::c_int;
   |     ------------------------------------------------------------ similarly named function `snd_card_register` defined here
   |
   help: a function with a similar name exists
   |
   259 -         to_result(unsafe { bindings::snd_info_register(entry) })
   259 +         to_result(unsafe { bindings::snd_card_register(entry) })
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
