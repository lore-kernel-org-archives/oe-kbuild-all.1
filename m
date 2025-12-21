Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8923A562
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 11:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766316904; cv=none; b=hGXNykENTIHvCQxikxUGkud+KrhjYqieOdnjrAXQZ8LSMDCJ/xXUYynduB7egTFMwwm/mOzoxw8dUgvB2i4JhGOHi5zXR5lZ9A/ckN4+MyqQ7Ch4KdTBh78BNeLhUoBTxk0ApKONKatGfyjh33K69QmO+Vtituv4ODFicC9VrJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766316904; c=relaxed/simple;
	bh=GEA5udEmA77ArqHUvfRvDr4IJneITD+KTfG4td8w/Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Igb1HmO8K/EFzg/auGX5JRFcarDO6HG9rCAmsZfVheqQqXOkHFfjszmo8PzMNPBAWy5YJuPlI07oBqRKXD8QjWG+K4UKzjfkITV29vv2kHOQkB8AcmeBgen3JCW5hyRQZtE17hmsC0B6pxskIN8UaR4EPi4LYEq+WN+BPryiUZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQO4bUEn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQO4bUEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766316903; x=1797852903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GEA5udEmA77ArqHUvfRvDr4IJneITD+KTfG4td8w/Iw=;
  b=IQO4bUEnugjgvVhe+0PODSDhAF415CZ5U2t1e02rYKkpwSY50mZVe4FM
   jFhgEjMNOKh3Wq8SbQGjJd/5iU8tTQ58ECGbcKsOIvwBKzdv7AfGRGpJR
   emTbsJegKI9IkNUaAWp5GSovpGuvBmySDGQMEs8XjpPIs4XIxLJ0kkB9J
   bLUOrrCyUDFPh3lVw1TOsFoMgCw5Ltaiwk1xAMpqk85vccARkvMzIiVEf
   Yft9GiQfO6FeHwoXieaeR3ZMm2MRsvLa8euvBEUtJltHdsLzOB8sBn1UK
   1/E3R0dsHA8qNwe8JGyZHlA/a69wWt/C7IcEHkbbL004fQE2QsWhBYSRi
   A==;
X-CSE-ConnectionGUID: 2JE9UwHPRVW07IJ+RLJPIg==
X-CSE-MsgGUID: BWclt5V3RiqwiO3iGR69+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="90866464"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="90866464"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 03:34:59 -0800
X-CSE-ConnectionGUID: CanANkg8QL6sDtEOeMIk/w==
X-CSE-MsgGUID: 6l4CR3VkRkiimUgh7z+U7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199803894"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 03:34:58 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXHiC-0000000051I-0qGy;
	Sun, 21 Dec 2025 11:34:56 +0000
Date: Sun, 21 Dec 2025 12:34:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1] arch/x86/boot/string.c:368:
 warning: expecting prototype for kstrtoul(). Prototype was for
 boot_kstrtoul() instead
Message-ID: <202512211222.PhBbqZc2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   72ada78f601d704f44161ace443aa7cd03c257a7
commit: 97e28deab8bfe70d5687650f94484f8f9101e566 [1/1] ata: ahci: fix enum constants for gcc-13
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251221/202512211222.PhBbqZc2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211222.PhBbqZc2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211222.PhBbqZc2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/boot/string.c:368: warning: expecting prototype for kstrtoul(). Prototype was for boot_kstrtoul() instead


vim +368 arch/x86/boot/string.c

5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  351  
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  352  /**
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  353   * kstrtoul - convert a string to an unsigned long
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  354   * @s: The start of the string. The string must be null-terminated, and may also
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  355   *  include a single newline before its terminating null. The first character
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  356   *  may also be a plus sign, but not a minus sign.
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  357   * @base: The number base to use. The maximum supported base is 16. If base is
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  358   *  given as 0, then the base of the string is automatically detected with the
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  359   *  conventional semantics - If it begins with 0x the number will be parsed as a
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  360   *  hexadecimal (case insensitive), if it otherwise begins with 0, it will be
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  361   *  parsed as an octal number. Otherwise it will be parsed as a decimal.
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  362   * @res: Where to write the result of the conversion on success.
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  363   *
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  364   * Returns 0 on success, -ERANGE on overflow and -EINVAL on parsing error.
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  365   * Used as a replacement for the simple_strtoull.
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  366   */
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23  367  int boot_kstrtoul(const char *s, unsigned int base, unsigned long *res)
5fafbebc86a004 Vamshi K Sthambamkadi 2020-04-23 @368  {

:::::: The code at line 368 was first introduced by commit
:::::: 5fafbebc86a0043ca5bbd8d3ce4f63dc5a02ad8e x86/boot: Add kstrtoul() from lib/

:::::: TO: Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
