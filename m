Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6BA63D9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 05:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706419399; cv=none; b=ULcf/V6X+WzeJ0mJzDgvKCyDaCuMpeXxfQO5/msO/GPxKDpz7WJGom7/WPiKoucqxBWZzVU/0hRWomQkaOjy/f3qW6x09GEgs1X814+FB4ew3DP/LS3lu0WvEl6oJdtQ0jMgRyUr9+lu8Wwjz1wOXs94XJOscdK4eKwzAzhPWKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706419399; c=relaxed/simple;
	bh=MZNID/oj4RHslckb5p6X9sJ1ePsSg9O2KLRuoVBnrbA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gd4eb50/n8WFpTLZYA5c3H1yc1Glt7x1SyCuQ3FgJAUNWsnJNF6gycVbn0WFDlccQhtmVCDmoOzdeYCrIQU60EMTcRgKwy+/ycJRPQlXX6pfUcuzLsAS0RfGBxAodN7DdNPIhd7Zhrvh5U6CTxuWkTjzrSl6qgnnvXzhV/ft4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTVFoANh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTVFoANh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706419397; x=1737955397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MZNID/oj4RHslckb5p6X9sJ1ePsSg9O2KLRuoVBnrbA=;
  b=dTVFoANhDAvh5utyUMN7kYktKKKZ5TWhJEjxL0jkem1UW5dr3Zy0u1mE
   wGHBpGfoOMeipmKHpW1spaWQiyN0uu185RvRg076OzAN6BQm9DWUufywr
   +1vi+PF72J5+IKTlCBgWwXa8Qy0N6RrrTsvf0Yz1YwLVCkbtoP3qfI8Q+
   xNRkHoIuHqrN1rlIDvb/j//bo4e6p6KyIfLMC09bfK8H248H+P1eE2veZ
   xuYu1Ep6FSC1Pd2NSp7tEzOZpvuChb1LUzeCl+JjkoGxITG40ZkCoAu/h
   WKrDbBxpI0d0jV21xmklW0e914fC535Kxuz/AAecPrVoB9OQyH5HGT2NJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="16267688"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="16267688"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 21:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="910725632"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="910725632"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jan 2024 21:23:14 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTxdQ-00036c-1Q;
	Sun, 28 Jan 2024 05:23:12 +0000
Date: Sun, 28 Jan 2024 13:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 5/29] include/sound/sb.h:294:20: error:
 cannot combine with previous 'void' declaration specifier
Message-ID: <202401281302.usiU86hP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/pm-ops
head:   2fe6ffd7c79f740b73533d44de3ae0e542674857
commit: 9757c2b93cfed03065a14a6cd817474891eb55fe [5/29] ALSA: als4000: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
config: i386-randconfig-141-20240128 (https://download.01.org/0day-ci/archive/20240128/202401281302.usiU86hP-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281302.usiU86hP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281302.usiU86hP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/isa/als100.c:24:
>> include/sound/sb.h:294:20: error: cannot combine with previous 'void' declaration specifier
     294 | static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
         |                    ^
   include/sound/sb.h:295:20: error: cannot combine with previous 'void' declaration specifier
     295 | static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
         |                    ^
   2 errors generated.


vim +/void +294 include/sound/sb.h

   274	
   275	/* sb_common.c */
   276	int snd_sbdsp_command(struct snd_sb *chip, unsigned char val);
   277	int snd_sbdsp_get_byte(struct snd_sb *chip);
   278	int snd_sbdsp_reset(struct snd_sb *chip);
   279	int snd_sbdsp_create(struct snd_card *card,
   280			     unsigned long port,
   281			     int irq,
   282			     irq_handler_t irq_handler,
   283			     int dma8, int dma16,
   284			     unsigned short hardware,
   285			     struct snd_sb **r_chip);
   286	/* sb_mixer.c */
   287	void snd_sbmixer_write(struct snd_sb *chip, unsigned char reg, unsigned char data);
   288	unsigned char snd_sbmixer_read(struct snd_sb *chip, unsigned char reg);
   289	int snd_sbmixer_new(struct snd_sb *chip);
   290	#ifdef CONFIG_PM
   291	void snd_sbmixer_suspend(struct snd_sb *chip);
   292	void snd_sbmixer_resume(struct snd_sb *chip);
   293	#else
 > 294	static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
   295	static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
   296	#endif
   297	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
