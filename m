Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB04153BD9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 00:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749516281; cv=none; b=bQbA+cMUum7n+J1xsIoKHj/KBf3uSl/iykihgyJC6g6VcUtn1Q6ZUC47vnDEsZwgqmiVZ4uCf16tUrF9RupBtmE5ks7iFcMkTB3gArM91ZW/bhtzSDvrOcbN2adnb1JrRaPmngcA0jRoV2WUsivXR2Xi309bE7qGOA+oAqst3yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749516281; c=relaxed/simple;
	bh=NMy7hFOCpF4CfdXW/UipB5/YtB3t+rCXnrKV93p+IaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S3318rCER9GEbXdBBwcx2vKO/CeHuEVRufi2A2dOtVRkOvNkEGZUh82GMtE9YSwEMrMkpDXTUM3EMzjcHJhqaQp6xjSMsj1IQx7saDws/g9FbF3p3IgiZgf625waZOfE7lZTOv2scXgt4ju1zm8TgTFi5YEXeJEgNHs+axPMjX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KG7iUoUl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KG7iUoUl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749516280; x=1781052280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NMy7hFOCpF4CfdXW/UipB5/YtB3t+rCXnrKV93p+IaY=;
  b=KG7iUoUljJurv571tE6VeiplCTDVsbs7yp3l+c3JnTar5Wr6Zk2Hb4Qg
   pfHlIpEjsSvwMG5HsF4K40qYLegi2tXoZnNHZEMxGD8RuvqVYlnu2zTjV
   Gm1ynbkvfFwzxcDsuOmBAI4rSpsWoShjJ57ZVYqt9OoicU1YxGoqI4Ufn
   X+bEsGb78/Vbyh42C8YMBmIfJhSS00ByyfJooemncP/A9n/NAjIZPvhZN
   XNUdNrsDrG1LYrf9MGr7mC/29rkKsgnY45Z4mtypTewQ5er1hwwYXJA4n
   yaD4+5WW345FI7xtefL9xDRKsvr0uYddsZFPhJwmhhDgjh2KMK4Dy1pfd
   A==;
X-CSE-ConnectionGUID: rahPL7uXQ4ispUMsBoqlxw==
X-CSE-MsgGUID: U+Mq3DdiQN60k3qTz2Xdcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="61878664"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="61878664"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 17:44:38 -0700
X-CSE-ConnectionGUID: AQv1bKVmTLOSUEFYs042UQ==
X-CSE-MsgGUID: pNmh3HXQRgefju0MDDwlKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151475825"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jun 2025 17:44:37 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOn6Q-0007ap-1P;
	Tue, 10 Jun 2025 00:44:34 +0000
Date: Tue, 10 Jun 2025 08:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 12/13] sound/pci/hda/patch_ca0132.c:4388:22:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202506100842.d8lwwdwU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   92f59aeb13252265c20e7aef1379a8080c57e0a2
commit: ed57a3d5a3118b9681de607692608fe573c5959d [12/13] ALSA: hda/ca0132: Enable hardware band EQ for Sound Blaster Core3D
config: i386-randconfig-061-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100842.d8lwwdwU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100842.d8lwwdwU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100842.d8lwwdwU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/pci/hda/patch_ca0132.c:4388:22: sparse: sparse: Using plain integer as NULL pointer
   sound/pci/hda/patch_ca0132.c:4389:22: sparse: sparse: Using plain integer as NULL pointer

vim +4388 sound/pci/hda/patch_ca0132.c

44f0c9782cc6ab Ian Minett   2012-12-20  4376  
44f0c9782cc6ab Ian Minett   2012-12-20  4377  static int add_tuning_control(struct hda_codec *codec,
44f0c9782cc6ab Ian Minett   2012-12-20  4378  				hda_nid_t pnid, hda_nid_t nid,
44f0c9782cc6ab Ian Minett   2012-12-20  4379  				const char *name, int dir)
44f0c9782cc6ab Ian Minett   2012-12-20  4380  {
975cc02a904ae3 Takashi Iwai 2013-06-28  4381  	char namestr[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
44f0c9782cc6ab Ian Minett   2012-12-20  4382  	int type = dir ? HDA_INPUT : HDA_OUTPUT;
44f0c9782cc6ab Ian Minett   2012-12-20  4383  	struct snd_kcontrol_new knew =
44f0c9782cc6ab Ian Minett   2012-12-20  4384  		HDA_CODEC_VOLUME_MONO(namestr, nid, 1, 0, type);
44f0c9782cc6ab Ian Minett   2012-12-20  4385  
44f0c9782cc6ab Ian Minett   2012-12-20  4386  	knew.access = SNDRV_CTL_ELEM_ACCESS_READWRITE |
44f0c9782cc6ab Ian Minett   2012-12-20  4387  			SNDRV_CTL_ELEM_ACCESS_TLV_READ;
44f0c9782cc6ab Ian Minett   2012-12-20 @4388  	knew.tlv.c = 0;
44f0c9782cc6ab Ian Minett   2012-12-20  4389  	knew.tlv.p = 0;
44f0c9782cc6ab Ian Minett   2012-12-20  4390  	switch (pnid) {
44f0c9782cc6ab Ian Minett   2012-12-20  4391  	case VOICE_FOCUS:
44f0c9782cc6ab Ian Minett   2012-12-20  4392  		knew.info = voice_focus_ctl_info;
44f0c9782cc6ab Ian Minett   2012-12-20  4393  		knew.get = tuning_ctl_get;
44f0c9782cc6ab Ian Minett   2012-12-20  4394  		knew.put = voice_focus_ctl_put;
44f0c9782cc6ab Ian Minett   2012-12-20  4395  		knew.tlv.p = voice_focus_db_scale;
44f0c9782cc6ab Ian Minett   2012-12-20  4396  		break;
44f0c9782cc6ab Ian Minett   2012-12-20  4397  	case MIC_SVM:
44f0c9782cc6ab Ian Minett   2012-12-20  4398  		knew.info = mic_svm_ctl_info;
44f0c9782cc6ab Ian Minett   2012-12-20  4399  		knew.get = tuning_ctl_get;
44f0c9782cc6ab Ian Minett   2012-12-20  4400  		knew.put = mic_svm_ctl_put;
44f0c9782cc6ab Ian Minett   2012-12-20  4401  		break;
44f0c9782cc6ab Ian Minett   2012-12-20  4402  	case EQUALIZER:
44f0c9782cc6ab Ian Minett   2012-12-20  4403  		knew.info = equalizer_ctl_info;
44f0c9782cc6ab Ian Minett   2012-12-20  4404  		knew.get = tuning_ctl_get;
44f0c9782cc6ab Ian Minett   2012-12-20  4405  		knew.put = equalizer_ctl_put;
44f0c9782cc6ab Ian Minett   2012-12-20  4406  		knew.tlv.p = eq_db_scale;
44f0c9782cc6ab Ian Minett   2012-12-20  4407  		break;
44f0c9782cc6ab Ian Minett   2012-12-20  4408  	default:
44f0c9782cc6ab Ian Minett   2012-12-20  4409  		return 0;
44f0c9782cc6ab Ian Minett   2012-12-20  4410  	}
44f0c9782cc6ab Ian Minett   2012-12-20  4411  	knew.private_value =
44f0c9782cc6ab Ian Minett   2012-12-20  4412  		HDA_COMPOSE_AMP_VAL(nid, 1, 0, type);
44f0c9782cc6ab Ian Minett   2012-12-20  4413  	sprintf(namestr, "%s %s Volume", name, dirstr[dir]);
44f0c9782cc6ab Ian Minett   2012-12-20  4414  	return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));
44f0c9782cc6ab Ian Minett   2012-12-20  4415  }
44f0c9782cc6ab Ian Minett   2012-12-20  4416  

:::::: The code at line 4388 was first introduced by commit
:::::: 44f0c9782cc6ab71ea947f8f710a46f2078a151c ALSA: hda/ca0132: Add tuning controls

:::::: TO: Ian Minett <ian_minett@creativelabs.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
