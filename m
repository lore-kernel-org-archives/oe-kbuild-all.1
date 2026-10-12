Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D84D598B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 21:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841741; cv=none; b=bzK4EX+Rk4VZWAMCdC92q0HMA8BEMbI6tycHxZhwDXlXzb/sye3rXGVaOtClxEoewoVrElntP7+ur5AHqlubEzp4ysnUaDfsi4wtNr+thMavsNrhmEixtiOpWsO8rqZggL9ezTGw8wSmWg4yVcqZv/zdlwsdIfV2wWxOWHmFzao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841741; c=relaxed/simple;
	bh=leEAO+IOHxe6ST/fFBwArXvyPJw7ELKQZctOpk6KOQA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g6UKwrYxhd/Myl0OJWN27aJ0k1kzsFqJ//ZwNjHGAnfBTKFkARUeoYf2XRFwKZelcdun5EyfptM4AkwDO2OxVe9JTiHfyWAYTlVPMQRhRpPBJZOA4oAod6i8ki4Em/88kVUAlO3XxlASQfQARZrpDokSQBW/MSD3PnhCppReWxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDkuKhP5; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDkuKhP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791841738; x=1823377738;
  h=date:from:to:cc:subject:message-id;
  bh=leEAO+IOHxe6ST/fFBwArXvyPJw7ELKQZctOpk6KOQA=;
  b=mDkuKhP5O7BB1kgzsY/LxkqRJtOXhhtvy8O3bIFzUmIG5shWSR40VvJn
   J9Ew0zvl8y0iG1Nh/35+eVjsubK0GyEcYfUnxeXKHJL+Qe/KBmGibQ5tp
   /8Ng65DHpTdjW0pyw1U9u8J4MxFN8JTEzvltyoYF7EWOnu/bufDyZ8qwN
   g+F6DPdSiIx7HGJlcqju0DLcJZfMCa1TzekB6oDx/emoYw3S1szwtPjWM
   bh0Bqc+858U7P52tmM8Iq2yYVy1w6y1ZnAeo2/CXe/Dmw3mv5QIhewwiX
   /CZfm5nuCMF4NFFYEjkMzc2lSO8aRpeAyHbLVvMBOy8fMQj2oT88ueujZ
   g==;
X-CSE-ConnectionGUID: ztbT7UHhRZO1Hh2QC2c5ng==
X-CSE-MsgGUID: z8IUG8/nTZe0JDxO17pjPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="666773"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="666773"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 14:48:58 -0700
X-CSE-ConnectionGUID: ndOHkZZKQ92AkGNWDYBbkg==
X-CSE-MsgGUID: AQHfGUbNR3SDZOViG+ea5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1321215"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2026 14:48:57 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGNt8-00000000ACp-0K4g;
	Mon, 12 Oct 2026 21:48:54 +0000
Date: Mon, 12 Oct 2026 23:47:51 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-lts 17/17]
 mm/kasan/sw_tags.c:211:6: warning: no previous prototype for
 'kasan_tag_mismatch'
Message-ID: <202610122317.t66cpwdW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10-lts
head:   d64ecae82de0fbce86193fbe4fd7aff0ac4d6597
commit: ce21379c4441e8c705785180f74b8686fe98b496 [17/17] UPSTREAM: kasan: arm64: support specialized outlined tag mismatch checks
config: arm64-randconfig-2001-20261012 (https://download.01.org/0day-ci/archive/20261012/202610122317.t66cpwdW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610122317.t66cpwdW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610122317.t66cpwdW-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> mm/kasan/sw_tags.c:211:6: warning: no previous prototype for 'kasan_tag_mismatch' [-Wmissing-prototypes]
     211 | void kasan_tag_mismatch(unsigned long addr, unsigned long access_info,
         |      ^~~~~~~~~~~~~~~~~~


vim +/kasan_tag_mismatch +211 mm/kasan/sw_tags.c

   210	
 > 211	void kasan_tag_mismatch(unsigned long addr, unsigned long access_info,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
