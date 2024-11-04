Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFC51C7274
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 18:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730744616; cv=none; b=opmSaiVvnyuVixKkBzL9Yj33riq40bKVN3aHTXQWvuNaIAJDeGNXZmXskDTksNZQeVFPihn0g105QanHTxJN/dWbKMv/GB9Atj/J6tlc0M3CN3iNVFhplJAJHG+7dfbfbLELTB03Qc9PQ4AiLV6eLLZ+6RcpZywzidDur+4OcAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730744616; c=relaxed/simple;
	bh=A6hzEqWTeqonjW95K+t1XJXYA78y9lt27DRYr168Gsw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XEHgo1kzmn1NImgCZ1EqahR21HMJ5MxAnk41/CCzRfFCY+kUzODaCg0/s//9g1DXGTvYxwSKPDOxfuBmS0Kq+HjRas3HAdBcT47ApoJt+xULKTwHmEJbRoJYMt56cICyegbNpTqU+HMZ06mdbOzllA+gbXbnD5CxLe8TVyuU13o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l9wnl5eh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l9wnl5eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730744614; x=1762280614;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6hzEqWTeqonjW95K+t1XJXYA78y9lt27DRYr168Gsw=;
  b=l9wnl5ehgPUkGQTcnUfsP4n7O1mxre3ze54NbuuoHWkkdVo116ETgMp3
   zb53pvzZ/1mmhRHZP2hTi/N4VQmBRbARatB3L33/t9ky+X4oQAyqdgn4j
   Qoi4GSrrUINHxnFnNC5SVbrgc9iInQSRzM5J1dcBEFiT9JzC2xNwPP6HP
   gNH5neKPs8hyzAhaVzo6Tfq9HAX/FG9mKOhhv+CrRsDbuVOtdWvuAExz7
   frvQJ0+f+39NkB5Vw2dMN4j/nemtewq0wyNRs8CDrFchdBsDLy7SNhR0X
   FZaWd1QjZgHF6RvBI4NbLHsb1KTxSImgW807klOL/SPb3MV2fjJzGVIUu
   w==;
X-CSE-ConnectionGUID: 9STNgTuURUKTyjwr8LSFIQ==
X-CSE-MsgGUID: lGN0SgaYTP+C3sEe4hUrvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="29882642"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="29882642"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 10:23:31 -0800
X-CSE-ConnectionGUID: 5pAznSnLQWC2y05RIQo8wg==
X-CSE-MsgGUID: XTMTUZxYRemJ14qtEF5kvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83671566"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Nov 2024 10:23:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t81jb-000l7B-1P;
	Mon, 04 Nov 2024 18:23:27 +0000
Date: Tue, 5 Nov 2024 02:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 8/9] sound/pci/hda/hda_intel.c:1035:26:
 warning: variable 'bus' set but not used
Message-ID: <202411050247.3esQz7Am-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   149cb7d9537e241b43056fb4133f56832ac51b7a
commit: cac99f73f0752e1c83674e12fb2c605dca9ce474 [8/9] ALSA: hda: intel: Don't free interrupt when suspending
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20241105/202411050247.3esQz7Am-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411050247.3esQz7Am-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411050247.3esQz7Am-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/pci/hda/hda_intel.c: In function 'azx_suspend':
>> sound/pci/hda/hda_intel.c:1035:26: warning: variable 'bus' set but not used [-Wunused-but-set-variable]
    1035 |         struct hdac_bus *bus;
         |                          ^~~


vim +/bus +1035 sound/pci/hda/hda_intel.c

f5dac54d9d9382 Kai-Heng Feng  2020-10-27  1030  
3baffc4a84d759 Takashi Iwai   2018-12-07  1031  static int azx_suspend(struct device *dev)
3baffc4a84d759 Takashi Iwai   2018-12-07  1032  {
3baffc4a84d759 Takashi Iwai   2018-12-07  1033  	struct snd_card *card = dev_get_drvdata(dev);
3baffc4a84d759 Takashi Iwai   2018-12-07  1034  	struct azx *chip;
3baffc4a84d759 Takashi Iwai   2018-12-07 @1035  	struct hdac_bus *bus;
3baffc4a84d759 Takashi Iwai   2018-12-07  1036  
3baffc4a84d759 Takashi Iwai   2018-12-07  1037  	if (!azx_is_pm_ready(card))
c5c215232dfb71 Takashi Iwai   2012-12-04  1038  		return 0;
c5c215232dfb71 Takashi Iwai   2012-12-04  1039  
3baffc4a84d759 Takashi Iwai   2018-12-07  1040  	chip = card->private_data;
a41d122449bea3 Takashi Iwai   2015-04-14  1041  	bus = azx_bus(chip);
472e18f63c425d Imre Deak      2021-06-23  1042  	azx_shutdown_chip(chip);
785d8c4be82b45 Libin Yang     2015-05-12  1043  
785d8c4be82b45 Libin Yang     2015-05-12  1044  	trace_azx_suspend(chip);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1045  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1046  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1047  

:::::: The code at line 1035 was first introduced by commit
:::::: 3baffc4a84d759ba54c461e8e4583bd8890c749a ALSA: hda/intel: Refactoring PM code

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
