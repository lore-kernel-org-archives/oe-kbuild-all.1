Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FBC524F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 18:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729882470; cv=none; b=mrQseMlsJ4VCmrIIin2U5c5fM8EwkuANOZ5lWveg5e+NIIYW8HFe689E3X7s5UFDBLag3DcZlFAn7b/CSFewHbGvFBWuXsBrYSTol+c0fZaK0mR7jD1HWRcR2RYPpBAyyvZUKMA2MLfL2T9MQsEEG7YvGTibhHwm3bFNJUUY9k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729882470; c=relaxed/simple;
	bh=4e4g5vnXgjZ54S/Th13nMRlhaLWJhmMK6gRO2PJa3e8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cC6qoR/iJOxxs7A04PrJs/8H1TGD2MlbBU0jL+/PUp++4vHNS7MsaETfm+m4KzKEGQDCqsJv5IK+PYtlwbPnWeo3YVUcS4/FS90zXB+nPTfdzQDsPNFNpCaLejQXaRYpdwxVvTFVd5pYdBBAfRz83oNt3hzrnDUnsMq8nxh1Xr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JolCC3ol; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JolCC3ol"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729882468; x=1761418468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4e4g5vnXgjZ54S/Th13nMRlhaLWJhmMK6gRO2PJa3e8=;
  b=JolCC3olkzLHI9s9hNjWy/lbdDzxCTzEoCqlLBMcqtienFM+PRX4+QNO
   slfcZ2YWTMxUYM0TxmAifpnJeUQewlWgb9oBUYMkeG87UetjXHkv1Ejwp
   xlDzSOGj6N8r9lZ/oR3+5FBCf5rMFNoAk97mrpeQ8QhW6hv/IFvMcAmpQ
   Ab5H/ElprabNRTIu5bEWw2TgdEdTYiP6TscVdKRyTwmNDILAGdQzz6YZd
   fnTJS6o3is6HNkhV+5TkTIOiNxT/fact6SBIRddtmEsW4WtocpzCfb/t9
   i+uyouopOgE6F6PAhlEU25K0dBjkv8AZurh1VFlytrSWFIYUoTb5FPbOC
   Q==;
X-CSE-ConnectionGUID: c+A1GjRXQJm/rneEjBP8lQ==
X-CSE-MsgGUID: 7JWnV3cFSAWd7Reh/O/s+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="40938767"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="40938767"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 11:54:26 -0700
X-CSE-ConnectionGUID: 365gZtB1TrSQz6A+3/Pf6A==
X-CSE-MsgGUID: FxE0cn5XSymIacCvdTa/Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="85781594"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Oct 2024 11:54:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4PS2-000YlU-05;
	Fri, 25 Oct 2024 18:54:22 +0000
Date: Sat, 26 Oct 2024 02:53:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.de>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: [tiwai-sound:topic/compress-accel 1/1]
 sound/core/compress_offload.c:409:35: warning: variable 'runtime' set but
 not used
Message-ID: <202410260257.PNGCF9yq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/compress-accel
head:   04177158cf98a79744937893b100020d77e6f9ac
commit: 04177158cf98a79744937893b100020d77e6f9ac [1/1] ALSA: compress_offload: introduce accel operation mode
config: arm-randconfig-001-20241026 (https://download.01.org/0day-ci/archive/20241026/202410260257.PNGCF9yq-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260257.PNGCF9yq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260257.PNGCF9yq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/core/compress_offload.c: In function 'snd_compr_poll':
>> sound/core/compress_offload.c:409:35: warning: variable 'runtime' set but not used [-Wunused-but-set-variable]
     409 |         struct snd_compr_runtime *runtime;
         |                                   ^~~~~~~


vim +/runtime +409 sound/core/compress_offload.c

   404	
   405	static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
   406	{
   407		struct snd_compr_file *data = f->private_data;
   408		struct snd_compr_stream *stream;
 > 409		struct snd_compr_runtime *runtime;
   410		size_t avail;
   411		__poll_t retval = 0;
   412	
   413		if (snd_BUG_ON(!data))
   414			return EPOLLERR;
   415	
   416		stream = &data->stream;
   417		runtime = stream->runtime;
   418	
   419		guard(mutex)(&stream->device->lock);
   420	
   421		switch (stream->runtime->state) {
   422		case SNDRV_PCM_STATE_OPEN:
   423		case SNDRV_PCM_STATE_XRUN:
   424			return snd_compr_get_poll(stream) | EPOLLERR;
   425		default:
   426			break;
   427		}
   428	
   429		poll_wait(f, &stream->runtime->sleep, wait);
   430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
