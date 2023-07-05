Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C832134C0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688579285; x=1720115285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UBCRISO5bvEzaroCbX4doD2mQ5QibjmGkyPvu/AjBxc=;
  b=SiaylBysa4pB7WItpbOo4wm0q12WmnCjlRVSGo9XIMNLHmfEnRBTPC78
   hIIE0489CSagV+OS4pH05apDuG1ys7WkEATFSw3q/nbpBEgYNbgJu2Pgs
   L/F89WFXdajbzMfrZQIbPGwujFiHk+X260E4y94unt10mZGiKngARbXIC
   l6VwHPEbgFRO8OUKJnIoGl1Xu2yO5sQeAr+r46I5NSYcPBaN6ytsQ8vsu
   rzcIFVKX4/p6cps8Kw8opc5KIVuprnvYG3gGzPiy8iYAIWktW8X0VeBBj
   6FZun/3qkiKnTV6CaYEIeNMfrmKqApcR6fL47Y0Le2r+kV5TjBwIk5JsL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="427088001"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="427088001"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 10:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="669481729"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="669481729"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jul 2023 10:48:03 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qH6bj-0000ko-0E;
	Wed, 05 Jul 2023 17:48:03 +0000
Date: Thu, 6 Jul 2023 01:47:55 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 40/54] htmldocs:
 ./include/sound/control.h:162: warning: expecting prototype for
 snd_ctl_find_id(). Prototype was for snd_ctl_find_id_mixer() instead
Message-ID: <202307060119.mTXEyy6N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   9ad18619a06d551105bd84191dca5bb5295277c7
commit: 59444a29dbfd44718fef15083aa339c2c8b579b5 [40/54] ALSA: control: Introduce snd_ctl_find_id_mixer()
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060119.mTXEyy6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060119.mTXEyy6N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./include/sound/control.h:162: warning: expecting prototype for snd_ctl_find_id(). Prototype was for snd_ctl_find_id_mixer() instead

vim +162 ./include/sound/control.h

   147	
   148	/**
   149	 * snd_ctl_find_id - find the control instance with the given name string
   150	 * @card: the card instance
   151	 * @name: the name string
   152	 *
   153	 * Finds the control instance with the given name and
   154	 * @SNDRV_CTL_ELEM_IFACE_MIXER. Other fields are set to zero.
   155	 *
   156	 * This is merely a wrapper to snd_ctl_find_id().
   157	 *
   158	 * Return: The pointer of the instance if found, or %NULL if not.
   159	 */
   160	static inline struct snd_kcontrol *
   161	snd_ctl_find_id_mixer(struct snd_card *card, const char *name)
 > 162	{
   163		struct snd_ctl_elem_id id = {};
   164	
   165		id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
   166		strscpy(id.name, name, sizeof(id.name));
   167		return snd_ctl_find_id(card, &id);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
