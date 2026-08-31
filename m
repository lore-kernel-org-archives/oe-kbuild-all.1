Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E94F33937B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 23:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788217842; cv=none; b=bHPf+/34KcFJTBNkzQTozAqUhApoORpUt/tMivb9+s/Q2d+mW6dwGVRklbZEEwFvSFOVgiH7BkiF0VQ1CP53AZNEpnwtb+f39Sb5xRhf8o/zZNa9F6/RhHBZlUcIKmDjdQZx5j7A3qUzohcKc2Hmz44sVWi7RES3TIKaufbW5bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788217842; c=relaxed/simple;
	bh=icDnWohuODiTut/hLMWjhkNWjLn0BWVRewPooO2sCWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtCmdSFig25Gzlr9JviCgKxk0IVjErWWtlcXvA/wi95BpOCFHCT9nqvMFHiE1UyhV39WYtIPj4pZTRq6Y9L0XS5M2V0CLuqEm7zXrotqpQcdb+n4hN9zzuGNNAFerePOPoRBX0+5DUcv/mEU3ppJM1UzEV380u5EF2zv3EUVq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0TBj8Xa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0TBj8Xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788217839; x=1819753839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=icDnWohuODiTut/hLMWjhkNWjLn0BWVRewPooO2sCWQ=;
  b=T0TBj8XaLXQ+CCQFsYuazZ3mcaP+lr65YUm+FHdeX5vEjcRJhoEzmyDr
   Uw4SxJF4beuTChjdgF7yBcuGYvvnLw2yw2bZ5fR6XW49Nxn1/gLIy4y2E
   B8eZZegwq6/BVFcbl8X50S+vMSMnO2XqfHqwHYVnBgKxN3T9HhDqRMuOo
   AhmyOJ1b6m4Ev0uxfitMQEhXfcdhSuDYzFah4iE6H1i1GLjdXyacZ1Xwz
   UpoL16pHmGccdKqODduLIcFj8fCl7wnyWOek93/KbJ7rIPlXIng956Cc5
   URRQyhzzm/RUz280ko/lpfZGsvlTjI7bJK8WmQzOZePzGidFPYYGTa32b
   w==;
X-CSE-ConnectionGUID: toeJgBXuQJybzy6qrK88wA==
X-CSE-MsgGUID: uk6WP49SSKm2Du202Z8HpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="99296628"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="99296628"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 16:10:39 -0700
X-CSE-ConnectionGUID: GxrgjAHOS0+HT1AvohFb2Q==
X-CSE-MsgGUID: qFbtSNQ/RfezBezneaBNsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="267610092"
Received: from lkp-server01.sh.intel.com (HELO 793b8a0addc2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Aug 2026 16:10:37 -0700
Received: from kbuild by 793b8a0addc2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1B99-0000000002x-16Cw;
	Mon, 31 Aug 2026 23:10:35 +0000
Date: Tue, 1 Sep 2026 07:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Isma=EFl?= Bahloul <i.bahloul01@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/1] ALSA: usb: add RME Babyface Pro FS driver
 (proprietary mode)
Message-ID: <202609010710.w6NVelt4-lkp@intel.com>
References: <20260829100333.32933-2-i.bahloul01@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260829100333.32933-2-i.bahloul01@gmail.com>

Hi Ismaïl,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus usb/usb-testing usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v7.3-rc1 next-20260831]
[cannot apply to peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Isma-l-Bahloul/ALSA-usb-add-RME-Babyface-Pro-FS-driver-proprietary-mode/20260829-110333
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260829100333.32933-2-i.bahloul01%40gmail.com
patch subject: [RFC PATCH 1/1] ALSA: usb: add RME Babyface Pro FS driver (proprietary mode)
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260901/202609010710.w6NVelt4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260901/202609010710.w6NVelt4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609010710.w6NVelt4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: sound/usb/babyfacepro/babyfacepro.o: in function `babyface_restore_state':
>> babyfacepro.c:(.text.babyface_restore_state+0x7cc): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: babyfacepro.c:(.text.babyface_restore_state+0x87c): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: sound/usb/babyfacepro/babyfacepro-ctl.o: in function `bf_exp2':
>> babyfacepro-ctl.c:(.text.bf_exp2+0x9c): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: sound/usb/babyfacepro/babyfacepro-ctl.o: in function `bf_pitch_put':
>> babyfacepro-ctl.c:(.text.bf_pitch_put+0x128): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: babyfacepro-ctl.c:(.text.bf_pitch_put+0x17c): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: sound/usb/babyfacepro/babyfacepro-ctl.o: in function `bf_eq_band_words':
>> babyfacepro-ctl.c:(.text.bf_eq_band_words+0x1ec): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: babyfacepro-ctl.c:(.text.bf_eq_band_words+0x550): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: babyfacepro-ctl.c:(.text.bf_eq_band_words+0x658): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: babyfacepro-ctl.c:(.text.bf_eq_band_words+0x9a4): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: babyfacepro-ctl.c:(.text.bf_eq_band_words+0xa18): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: sound/usb/babyfacepro/babyfacepro-ctl.o:babyfacepro-ctl.c:(.text.bf_eq_band_words+0xaf0): more undefined references to `__aeabi_ldivmod' follow

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
