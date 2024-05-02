Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C48020B3E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 May 2024 06:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714630653; cv=none; b=AGc2tSqbMIKMEPiSuEGMAx7yVLMgn2uGOO0lgTV7leC/6vj/XFolpoohuqTk5HKDwy4s59eJ1G2n/oMMFb5DokSs6RjJyb2DA+2fAx/FzrsDgD/oXPOiiWZT/UanVWJGsEw1I7ueXXPnUM19t0Q2Rd7iU+uNAlV/G5s4JHFnH8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714630653; c=relaxed/simple;
	bh=7UAWDIMV0SnbJSnM0tVm8TDbmSTxIT2onRj6vmS5v+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cOFMSdjyd6WLYNNZCPrYpXj6F5NyuRu7twzBCEGPFOpLu97F767g4U0/5xxulkRwHTimqE5VpCIZyBQ3+m7KYzk4ctSaFUhwd+GLiwVbzNSepMozag7d/7xzA3lSLjyR17b9h19w/3VDWqfF7xU8z8YbGH95wBrFfuVGkGen2Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jy2T9A0N; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy2T9A0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714630652; x=1746166652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7UAWDIMV0SnbJSnM0tVm8TDbmSTxIT2onRj6vmS5v+Y=;
  b=Jy2T9A0NMcKRN03qhPYki2GKoWvzm1TAAMQh7W54A4N/eqeYeXWV8xCD
   n6PrIe8OZs5Dc7FroyjcVAWb8+41fv0wUipdgsPZqUVIXPj56FQxWXh2o
   zUSz4jibFfhR9Tzja/8ayE8fLWmI7QoNKyGIT7b0i4JhO1nlm98IqQGe0
   3xEblWdKWzA16rUl3d9GVIJ0twOkZN9wRUJj1FsQnlKN7A6b7UdS9aX7l
   h0ALnlR7UxQk6rTQrsO3XDxhDl8HlsGtPWBDBs6H4xFFf08V+r1BC+Cl0
   +uIvwwvxzjsfmZMOwwwKqTkfjkQZhdUzjgHeuQF+bMzq6/MyqVBUssPZb
   Q==;
X-CSE-ConnectionGUID: ZpHDy3wjQYCjwwakgQYWYw==
X-CSE-MsgGUID: OCHgPd01Qp+7dAkQciHg9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10314514"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10314514"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 23:17:32 -0700
X-CSE-ConnectionGUID: fTPhyH8tRQC5mVJuF/msUw==
X-CSE-MsgGUID: Jl4K70+KQnmmt75wmCNSOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31824114"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 May 2024 23:17:30 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2Pl1-000ASC-2I;
	Thu, 02 May 2024 06:17:27 +0000
Date: Thu, 2 May 2024 14:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:pending-fixes 243/269]
 sound/pci/hda/patch_realtek.c:7207:13: warning:
 'alc287_s4_power_gpio3_default' defined but not used
Message-ID: <202405021426.kd3Wut93-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   609939ebb81cc404d3b90ce94838f6edb5c599ed
commit: 9b3c22ab3929672b117f5c46d718692abb65da0b [243/269] ALSA: hda/realtek: Fix build error without CONFIG_PM
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240502/202405021426.kd3Wut93-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240502/202405021426.kd3Wut93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405021426.kd3Wut93-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/pci/hda/patch_realtek.c:7207:13: warning: 'alc287_s4_power_gpio3_default' defined but not used [-Wunused-function]
    7207 | static void alc287_s4_power_gpio3_default(struct hda_codec *codec)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/alc287_s4_power_gpio3_default +7207 sound/pci/hda/patch_realtek.c

1e707769df0727 Kailang Yang 2024-04-30  7206  
1e707769df0727 Kailang Yang 2024-04-30 @7207  static void alc287_s4_power_gpio3_default(struct hda_codec *codec)
1e707769df0727 Kailang Yang 2024-04-30  7208  {
1e707769df0727 Kailang Yang 2024-04-30  7209  	if (is_s4_suspend(codec)) {
1e707769df0727 Kailang Yang 2024-04-30  7210  		alc_write_coef_idx(codec, 0x10, 0x8806); /* Change MLK to GPIO3 */
1e707769df0727 Kailang Yang 2024-04-30  7211  		alc_write_coefex_idx(codec, 0x5a, 0x00, 0x554f); /* write gpio3 as default value */
1e707769df0727 Kailang Yang 2024-04-30  7212  	}
1e707769df0727 Kailang Yang 2024-04-30  7213  }
1e707769df0727 Kailang Yang 2024-04-30  7214  

:::::: The code at line 7207 was first introduced by commit
:::::: 1e707769df072757bdcafab158bb159ead73daa4 ALSA: hda/realtek - Set GPIO3 to default at S4 state for Thinkpad with ALC1318

:::::: TO: Kailang Yang <kailang@realtek.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
