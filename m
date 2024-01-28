Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2438803
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 02:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706409194; cv=none; b=cz2bE55/b1BfDhBvNPI1dVu8t7arCTFu2K6GEf4Y8vM+K8mp8mAxEkW89HgmMYQMeqKaaBe/QVJYQORYJ8TpHUUeKF7GPlOk6Qur0oyAVELeqWAuRv0o3ZYg3atVvnFxkA1RkJTUaHYW+Ax6nNRrIh4Qhv7mvDVqj1CAMYJr6Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706409194; c=relaxed/simple;
	bh=E0fa1VPQXbtcFEgKpTvAiX2TZvxe2F/4CpKfEvu9u7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjabqML0ppqJmWRbJWKTK9qYbTXB2CM935KJ0ZGOJYXT73uUk7XrW766l60R40v5iM7yJDC681ifXYSVHNl618W6p25lBq5sfYxaH+8uHzJ/gF26CGasWQvujL/qlCUMZwWVYhcq5d4tz9Fo4NX6w2X1DC8FJsk/GxLoBsIDSeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKIqV9CY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKIqV9CY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706409192; x=1737945192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0fa1VPQXbtcFEgKpTvAiX2TZvxe2F/4CpKfEvu9u7g=;
  b=oKIqV9CYAEEj//c9fg6qprT1/MrSNcpV9tQnXcEwE873CBmiwNHcWrlR
   qN0AlSK55yw/DHK9Jsji0Dbqk+KIh/TTodBP/hC8SciSiTiIZL8GIvX+Q
   uVJZfAK7ydbrweoLda+r+FyBG5AHqF4ACvKzBbWEjbVZxxlAQr/P92gfS
   NCkJN5EG98LInL/VRNCsWgDvO4yldVkC/3Lm0C9rWeJhD4yU42toi39l5
   IjpL86LiwBKElYn5vZ9uaM/BScJq87F13wphsNCBesqVnKLOFMnZ8hR/u
   h4+qbAaIALHH5CuLRoWzN2gGLD4Y/Z3kpNpkHcryTkNzBn3FR82Xtjz4f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="9847819"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9847819"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 18:33:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="787475148"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="787475148"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jan 2024 18:33:10 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTuyq-0002zH-1c;
	Sun, 28 Jan 2024 02:33:08 +0000
Date: Sun, 28 Jan 2024 10:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 5/29] include/sound/sb.h:294:20: error:
 two or more data types in declaration specifiers
Message-ID: <202401281001.74RRLOzP-lkp@intel.com>
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
config: i386-randconfig-052-20240127 (https://download.01.org/0day-ci/archive/20240128/202401281001.74RRLOzP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401281001.74RRLOzP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401281001.74RRLOzP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/isa/sb/sb_common.c:17:
>> include/sound/sb.h:294:20: error: two or more data types in declaration specifiers
     294 | static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
         |                    ^~~~
   include/sound/sb.h:295:20: error: two or more data types in declaration specifiers
     295 | static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
         |                    ^~~~


vim +294 include/sound/sb.h

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
