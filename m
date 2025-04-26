Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9681FDA9E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Apr 2025 23:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745709170; cv=none; b=kMF09H0MlEOelTFFeOdklarb145hcWS/oJzh94RaMiImuqE56qiWwUIfr1LoUXFEQJKtvV9Uesr16tosmqFgSW+JyjE+CUTHh8JRWrSX89CHfjNVBoQ2uQSHFUlNTaZmxKC9waKMN9NwhSMNAGlPWiNAkKRvN3bqkEy/OhRgmzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745709170; c=relaxed/simple;
	bh=9VaDAmxc1ixBPM0kBiOWa5qi+HHQsBw9TRiO/1iSbPI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E97zJQc1rJzg8qcyb/kyVBXuqmOetMuqxCA7RsGOgR5upW53kXVMgeiItUEeO702OZQjXT3LBSTTPbAQxLN10Yg7XzL2+f8OMLZSm2d+UHtiPDUJdFnzKqrZj9X6MXj6LVLOjoxnKSochZu58W6NAYaUd8RAliEZFzbVy8kvai0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kd1qNarM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kd1qNarM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745709168; x=1777245168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9VaDAmxc1ixBPM0kBiOWa5qi+HHQsBw9TRiO/1iSbPI=;
  b=kd1qNarMXqG/KId+DIWq/EDxd03086hbW0xLhMt3hjSPYCGetvyjaKRk
   k2iZbVketEflZqrXpEapFPYwxIxBHfRjEfBOc8VUeqbJe5H6eRgIavwGl
   00frktagpt/FXHnHQ30b924lScK4rBc6HcoaRmPOT0VVESySbPczb/1jh
   Oxt0pritbgBtrRcBfjqif7xKYjOOJ+swg9NPIcgwD755BuRCn8Zejqyp6
   CbDVhBfiqQze2XMge989Xc0a/cgR+OrDaHJyk4F1bBxgGgdsHWv1voxDx
   hD5sFjP6AEfv3/kUotapOzce1PMd6zJD4gXRiwCllwTYnEl4iD+qwtv8B
   Q==;
X-CSE-ConnectionGUID: /WIgMsxoSPikKZ+mAAMrJA==
X-CSE-MsgGUID: VEpxtFE1T8Waiq6YpIGLaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47243163"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="47243163"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 16:12:48 -0700
X-CSE-ConnectionGUID: 6JFAAcLeRdiCyA1jafWnLg==
X-CSE-MsgGUID: +nnEoBEbSZaPyvVZljks5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="133164275"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Apr 2025 16:12:46 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8ohP-00061R-2K;
	Sat, 26 Apr 2025 23:12:43 +0000
Date: Sun, 27 Apr 2025 07:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 2287/6092] sound/soc/codecs/wm_adsp.c:421:5-11:
 inconsistent IS_ERR and PTR_ERR on line 422.
Message-ID: <202504270751.nR3Ngfrq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   393d0c54cae31317deaa9043320c5fd9454deabc
commit: b5d057a86e2086af0b1e6d0ca8b306be1c73a627 [2287/6092] ASoC: wm_adsp: Use vmemdup_user() instead of open-coding
config: mips-randconfig-r053-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270751.nR3Ngfrq-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270751.nR3Ngfrq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/soc/codecs/wm_adsp.c:421:5-11: inconsistent IS_ERR and PTR_ERR on line 422.

vim +421 sound/soc/codecs/wm_adsp.c

   411	
   412	static int wm_coeff_tlv_put(struct snd_kcontrol *kctl,
   413				    const unsigned int __user *bytes, unsigned int size)
   414	{
   415		struct soc_bytes_ext *bytes_ext =
   416			(struct soc_bytes_ext *)kctl->private_value;
   417		struct wm_coeff_ctl *ctl = bytes_ext_to_ctl(bytes_ext);
   418		struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
   419		void *scratch __free(kvfree) = vmemdup_user(bytes, size);
   420	
 > 421		if (IS_ERR(scratch))
 > 422			return PTR_ERR(no_free_ptr(scratch));
   423	
   424		return cs_dsp_coeff_lock_and_write_ctrl(cs_ctl, 0, scratch, size);
   425	}
   426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
