Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573CC1E47B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Dec 2024 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734106865; cv=none; b=PFeFlKruWEWezqnciLY8rjYvSX0RWFTn/ApFPaN+om8E5YoCBBov9J+ByKcRWANE4pPp6jt7Fo+NY7i9zuLFdc2TJ/aXhB7LNsDkPJA+Sm4NuPbt6ZdnPU+L8SxngHyssTC7qDGoQrr6p/3cI/9HNnlHOL1uL64pPcCROOz5Vnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734106865; c=relaxed/simple;
	bh=zJMFJqqgv6DbdbcMMuigEUjPy2DuFTp2STkqjgaXCqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZZwrExBLkM+SdOhRmBZsMCgQ9dilOyaq4hxwV05WHLTrayuIdWv/GiDgvz6BzRQlKdYGsipesRfYBlTIl1fHLShzWbsMR0qY4yA5jj7VfrezazLBfl6maRq8U4sIwur51ZHZcMB0dZKrk4nyxfW/NwU+q5Z9rCrW2gnIWMmm38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OZ6AvvxS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OZ6AvvxS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734106861; x=1765642861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJMFJqqgv6DbdbcMMuigEUjPy2DuFTp2STkqjgaXCqE=;
  b=OZ6AvvxScrz2pATwD8Epyt3YFodKnz5JQfWBxJYr60QpuJ95ATUeJsxn
   DtH0/d5Hn5ZHdkteJA6bf7f3+9KCfqzdqhVVhjFqYp5PFPOxzcxkAF+Bz
   0B+Bt0wCh1FxeaXf18jHlVCcwlENwRQzKkNffhm3Rm5YzQ61dNL435Y91
   lNjVjfNQ+e4y5iMjhvqS8ebWgUwWiK3Pqgc74/LwtcmvwuWLFHAlGw83f
   96ZZOsTgaNLu425XJuhwXIkmLsRGWSg6e1r4sawuiEqjFa6310dZxv8j7
   0wIOgp84LD1PyncQm/X2XxK7fEWapf+NTiY5T666PTD1Kqt98BhfnSxFQ
   w==;
X-CSE-ConnectionGUID: Q/P4yVpaQBSjgbcSWJ+5ZQ==
X-CSE-MsgGUID: a3lrlvBoSdW3TOX4Us8BsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="45256043"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="45256043"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 08:21:01 -0800
X-CSE-ConnectionGUID: anxCZYHGQvqGjzhGYtpANg==
X-CSE-MsgGUID: zf0+UV8NSpOtGRFCmdklAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="96461217"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2024 08:20:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM8PR-000CDl-1g;
	Fri, 13 Dec 2024 16:20:57 +0000
Date: Sat, 14 Dec 2024 00:20:24 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: sound/sh/sh_dac_audio.c:166:53: error: passing argument 2 of
 'copy_from_iter' makes integer from pointer without a cast
Message-ID: <202412140019.jat5Dofr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f932fb9b40749d1c9a539d89bb3e288c077aafe5
commit: 9b5f8ee43e48c25fbe1a10163ec04343d750acd0 ALSA: sh: Use standard helper for buffer accesses
date:   2 weeks ago
config: sh-randconfig-r111-20241212 (https://download.01.org/0day-ci/archive/20241214/202412140019.jat5Dofr-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241214/202412140019.jat5Dofr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140019.jat5Dofr-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/sh/sh_dac_audio.c: In function 'snd_sh_dac_pcm_copy':
>> sound/sh/sh_dac_audio.c:166:53: error: passing argument 2 of 'copy_from_iter' makes integer from pointer without a cast [-Wint-conversion]
     166 |         if (copy_from_iter(chip->data_buffer + pos, src, count) != count)
         |                                                     ^~~
         |                                                     |
         |                                                     struct iov_iter *
   In file included from include/sound/pcm.h:19,
                    from sound/sh/sh_dac_audio.c:18:
   include/linux/uio.h:216:42: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct iov_iter *'
     216 | size_t copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
         |                                   ~~~~~~~^~~~~
>> sound/sh/sh_dac_audio.c:166:58: error: passing argument 3 of 'copy_from_iter' makes pointer from integer without a cast [-Wint-conversion]
     166 |         if (copy_from_iter(chip->data_buffer + pos, src, count) != count)
         |                                                          ^~~~~
         |                                                          |
         |                                                          long unsigned int
   include/linux/uio.h:216:66: note: expected 'struct iov_iter *' but argument is of type 'long unsigned int'
     216 | size_t copy_from_iter(void *addr, size_t bytes, struct iov_iter *i)
         |                                                 ~~~~~~~~~~~~~~~~~^


vim +/copy_from_iter +166 sound/sh/sh_dac_audio.c

   158	
   159	static int snd_sh_dac_pcm_copy(struct snd_pcm_substream *substream,
   160				       int channel, unsigned long pos,
   161				       struct iov_iter *src, unsigned long count)
   162	{
   163		/* channel is not used (interleaved data) */
   164		struct snd_sh_dac *chip = snd_pcm_substream_chip(substream);
   165	
 > 166		if (copy_from_iter(chip->data_buffer + pos, src, count) != count)
   167			return -EFAULT;
   168		chip->buffer_end = chip->data_buffer + pos + count;
   169	
   170		if (chip->empty) {
   171			chip->empty = 0;
   172			dac_audio_start_timer(chip);
   173		}
   174	
   175		return 0;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
