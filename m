Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379022F2E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751708324; cv=none; b=sG4tXIubzMkbjXjI87AJlhNGx9jpMlL92i81ckqdumsZXqLEuYiAO0T7eUOmwHuUr2Mnoht4Ggx74V+Arsh/6Nu0VxFYVzebXvPSpURMI0O/She+F2psOTMpQnzFPACMA/0qn7tYVYW2yGQIqEAS7BaT+JlQPbyDwzTQvFqGzBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751708324; c=relaxed/simple;
	bh=NjIeY1DkpP0LAKTYwpJdguSJjLPT23TJ/cGrednR9wM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCgdgXu4HeX+64yaDESoVJ10E6ZhPXsd8M6d2O8MnHFOXFs5GLrR9oHj6z2ZfgMClk5/X6uBYDkv5jS/Z+3FkC5BuXBXQ3WmiC9dtQpQjkKIWUy+23ZX6PpDRDw8Zhdhc+9II5tRPTEwwtTJ7d1RybjDPp1nVRLU5cZgqWkrfdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y3kDchJn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y3kDchJn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751708323; x=1783244323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NjIeY1DkpP0LAKTYwpJdguSJjLPT23TJ/cGrednR9wM=;
  b=Y3kDchJnQWc2cFJuNUvEKalnA2PnVWgd1ud6w5gTsIBHxbiibDTRebyq
   3trIVdHYOpAwLwiGiCoyAy7UwkNgKL2p/I4DzktM+uhlS9VkPy818DMZ6
   3A99cpfvXbG/TnI+LvhfqCoYkJ0AwjzkgGxVUvmneEaPVmuJ9vVXG0tt3
   c1hemBoRSA8uJcvZC+WdH1UXGpXY5uW8FBZO/WaZu8bXR/rbKjw/zkt3v
   G8JqkWVCSsaCQYFKS0KZ1yrddkoDIwFb8vExzXTpEnXoQeRYbSybmsZ4x
   oIW1Y3hOvP/EddMC5bdnEC1oIDXtxUEEtqesEBwHMH7l6friMLYTxO01E
   Q==;
X-CSE-ConnectionGUID: TqP6g72/RKOQZsp3N1rf8w==
X-CSE-MsgGUID: 1NDurjCjSK6T+egrKhyEhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53873529"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="53873529"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 02:38:42 -0700
X-CSE-ConnectionGUID: e34Hf/IZQ3C07A3oWW4pGw==
X-CSE-MsgGUID: 7unZSAMGSKetG0B4FJmTLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="185816999"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jul 2025 02:38:40 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXzLy-0004QV-21;
	Sat, 05 Jul 2025 09:38:38 +0000
Date: Sat, 5 Jul 2025 17:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/hda-reorg 41/53]
 sound/hda/codecs/cirrus/cs421x.c:561:35: warning: 'cs421x_codec_ops' defined
 but not used
Message-ID: <202507051737.DMAkxayN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/hda-reorg
head:   6119728edf86cefcbf7b20e000414c85916e900d
commit: 484072d3f99c402030fcee94e28ab3ea76d04247 [41/53] ALSA: hda/cirrus: Split to cs420x and cs421x drivers
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250705/202507051737.DMAkxayN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051737.DMAkxayN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051737.DMAkxayN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/hda/codecs/cirrus/cs421x.c:561:35: warning: 'cs421x_codec_ops' defined but not used [-Wunused-const-variable=]
     561 | static const struct hda_codec_ops cs421x_codec_ops = {
         |                                   ^~~~~~~~~~~~~~~~


vim +/cs421x_codec_ops +561 sound/hda/codecs/cirrus/cs421x.c

   560	
 > 561	static const struct hda_codec_ops cs421x_codec_ops = {
   562		.probe = cs421x_probe,
   563		.remove = snd_hda_gen_remove,
   564		.build_controls = snd_hda_gen_build_controls,
   565		.build_pcms = snd_hda_gen_build_pcms,
   566		.init = cs421x_init,
   567		.unsol_event = snd_hda_jack_unsol_event,
   568		.suspend = cs421x_suspend,
   569		.stream_pm = snd_hda_gen_stream_pm,
   570	};
   571	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
