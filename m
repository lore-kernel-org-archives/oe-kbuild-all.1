Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A6080603
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Feb 2024 19:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706903216; cv=none; b=DVY2hWuoSoP6JzJtpGDfBkos9V7hRudNvN50h7UfBHdkEOMMJqhpz2KxqNg+zzWrcruKvp101uT6oKPAU6ZB+JAbyiCrCbG+8bBIru+FTz/PxMaIe7guc1qX48pjqpY3YLAShZDPR87uznukqKjinGXAFK8WpFbSqs0U09lqvw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706903216; c=relaxed/simple;
	bh=pjJ14wDfigNM3cbr4UEd9tYJ6mJMX2WWnujlyDoKRVE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cmDYNJnSe0KP+DXV8QALBHrVED2mosnBMG/sGb/smuR+t6/vAj6cHAiAy3xKVarL9aqKQZH23feslFyMMQr2UFGB/9vlqbgjVeIUutBtQWF2rWA/FLuaSZItGE3EclxQQMS694h8sAJFIOOzys0f3leF1Ul7EWP7l/B1zDzrgGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lc4mc5Mv; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lc4mc5Mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706903214; x=1738439214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pjJ14wDfigNM3cbr4UEd9tYJ6mJMX2WWnujlyDoKRVE=;
  b=Lc4mc5MvMiKRa4kuNTG3w64DwmcE5JAfPGLvtJJqdWWzIqaXxF4bnOug
   C4z9Sb29jbh94yLhuPtNJcCoB5CwOq2q1YBQkDyepJNDyG7/5wjYbq9Vp
   yNWWdCmqCiP+YZYbOlGWl4XSVc8snTXxhWV3/P/Nqh2YPX65a51n87MP2
   g3pkTQRYLr5xIYWgDqc1wmXUFxRxa3mgAP3QN8yWRmTwtysSWvXrXpbGz
   9u0c3oQHY7Tu9TLvwyV2EiE1IIxBGSsFQ3wyq6wNw1jqvaZWgPpo3tVie
   4ZI5k85hytbEWdDt/h1Q3xZQpV7ED2Z46vOO2N1kjFfo21aOBIM4hJRNr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="435369763"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="435369763"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 11:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="157903"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 02 Feb 2024 11:46:52 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVzUu-0004DK-05;
	Fri, 02 Feb 2024 19:46:49 +0000
Date: Sat, 3 Feb 2024 03:46:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 2558/3789] sound_kunit.c:undefined reference to
 `snd_pcm_format_name'
Message-ID: <202402030306.l4idnFyz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   076d56d74f17e625b3d63cf4743b3d7d02180379
commit: 3e39acf56ededdebd1033349a16b704839b94b28 [2558/3789] ALSA: core: Add sound core KUnit test
config: openrisc-randconfig-r013-20211230 (https://download.01.org/0day-ci/archive/20240203/202402030306.l4idnFyz-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030306.l4idnFyz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402030306.l4idnFyz-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: sound/core/sound_kunit.o: in function `test_pcm_format_name':
>> sound_kunit.c:(.text+0x54): undefined reference to `snd_pcm_format_name'
>> sound_kunit.c:(.text+0x54): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_name'
>> or1k-linux-ld: sound_kunit.c:(.text+0x118): undefined reference to `snd_pcm_format_name'
   sound_kunit.c:(.text+0x118): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_name'
   or1k-linux-ld: sound_kunit.c:(.text+0x18c): undefined reference to `snd_pcm_format_name'
   sound_kunit.c:(.text+0x18c): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_name'
   or1k-linux-ld: sound/core/sound_kunit.o: in function `_test_fill_silence':
>> sound_kunit.c:(.text+0x258): undefined reference to `snd_pcm_format_set_silence'
>> sound_kunit.c:(.text+0x258): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_set_silence'
   or1k-linux-ld: sound/core/sound_kunit.o: in function `test_format_signed':
>> sound_kunit.c:(.text+0x3b0): undefined reference to `snd_pcm_format_signed'
>> sound_kunit.c:(.text+0x3b0): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_signed'
>> or1k-linux-ld: sound_kunit.c:(.text+0x410): undefined reference to `snd_pcm_format_unsigned'
>> sound_kunit.c:(.text+0x410): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_unsigned'
>> or1k-linux-ld: sound_kunit.c:(.text+0x490): undefined reference to `snd_pcm_format_width'
>> sound_kunit.c:(.text+0x490): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_width'
   or1k-linux-ld: sound_kunit.c:(.text+0x4ec): undefined reference to `snd_pcm_format_width'
   sound_kunit.c:(.text+0x4ec): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_width'
   or1k-linux-ld: sound/core/sound_kunit.o: in function `test_format_width':
>> sound_kunit.c:(.text+0x5b4): undefined reference to `snd_pcm_format_width'
   sound_kunit.c:(.text+0x5b4): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_width'
   or1k-linux-ld: sound_kunit.c:(.text+0x618): undefined reference to `snd_pcm_format_width'
   sound_kunit.c:(.text+0x618): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `snd_pcm_format_width'
   or1k-linux-ld: sound_kunit.c:(.text+0x674): undefined reference to `snd_pcm_format_width'
   sound_kunit.c:(.text+0x674): additional relocation overflows omitted from the output
   or1k-linux-ld: sound/core/sound_kunit.o: in function `test_format_endianness':
>> sound_kunit.c:(.text+0x734): undefined reference to `snd_pcm_format_little_endian'
>> or1k-linux-ld: sound_kunit.c:(.text+0x794): undefined reference to `snd_pcm_format_big_endian'
>> or1k-linux-ld: sound_kunit.c:(.text+0x814): undefined reference to `snd_pcm_format_little_endian'
   or1k-linux-ld: sound_kunit.c:(.text+0x870): undefined reference to `snd_pcm_format_little_endian'
   or1k-linux-ld: sound_kunit.c:(.text+0x8cc): undefined reference to `snd_pcm_format_big_endian'
   or1k-linux-ld: sound_kunit.c:(.text+0x928): undefined reference to `snd_pcm_format_big_endian'
   or1k-linux-ld: sound/core/sound_kunit.o: in function `test_phys_format_size':
>> sound_kunit.c:(.text+0x9ec): undefined reference to `snd_pcm_format_physical_width'
>> or1k-linux-ld: sound_kunit.c:(.text+0xa50): undefined reference to `snd_pcm_format_physical_width'
   or1k-linux-ld: sound_kunit.c:(.text+0xaac): undefined reference to `snd_pcm_format_physical_width'
   or1k-linux-ld: sound/core/sound_kunit.o: in function `test_format_fill_silence':
   sound_kunit.c:(.text+0xbe8): undefined reference to `snd_pcm_format_set_silence'
>> or1k-linux-ld: sound_kunit.c:(.text+0xc48): undefined reference to `snd_pcm_format_set_silence'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
