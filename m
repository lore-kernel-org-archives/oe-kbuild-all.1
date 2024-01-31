Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4DA60DCC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706689657; cv=none; b=aunf9aa6ZEwje+PnWhzNoPUaa3CkdK7hwKXfSPD+ke3tVpwIKbPzlifLIx1uTORloBF3iBGyNN+Ncae2rOOm/m+k0NFnLy82AYeCvX7vEEWnJ49uuUX/Kh5OEG3poYutrh7u7XD+fiGxH07N3AHrfAmguJ3upQgX402xvNTKbBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706689657; c=relaxed/simple;
	bh=cQqffGkWEGvuZbOMzSYPqGnaB4kKDG+ios7M62HEOLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ns3anwPcqCa7jpJYzEC5aIuyW4/9AWMF6w8ZFaWae2NdV1NvwuzFxzLforEVNBQ/DiVsI9EVQ0iJEuXTThF3aHSW3Iiy6MJ7Sq205/GyJ/q3moltDuB6kfYXlMbdJu7oFV1noU0UB4UjbbRSyOfe2V4OFxqy03qD151gXOJNoxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GSc8RO4O; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GSc8RO4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706689655; x=1738225655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQqffGkWEGvuZbOMzSYPqGnaB4kKDG+ios7M62HEOLg=;
  b=GSc8RO4OkzvdCFcN5zhRqTPCXGuCeF38RWGikEinjrIrnetTem5q2aXg
   hOYh0lHLJOVOlw6Q/oXK2zzpiFimve8Xrr9qXcc+WuO0VdQsxB1uok17c
   lDSv+nXdshXYHfn5iwoSssnLdRFNO6Iwgysr69vZMNRzg5PDPbGB0dWKO
   +M0tJo47mqjNmwcBQTo0yZnq4bjSQK83CDdj0Yczb3G/vGkq9Z7aMuHJ6
   uxMOYfVJdUZ1Wz5nR0MjeyrUgPwojfTMP8M6Rmko0V21/pWCWOhIHRzBz
   tjBJ2HKR3nV6SLUXUh9YpsySYCfyP8VKe3YZ9ahb6S2IT8E6iwkfF5ywS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407250342"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="407250342"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 00:27:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3969495"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jan 2024 00:27:33 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV5vA-0001Kq-0G;
	Wed, 31 Jan 2024 08:26:37 +0000
Date: Wed, 31 Jan 2024 16:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 2759/3001] sound/core/sound_kunit.c:106:9:
 sparse: sparse: restricted snd_pcm_format_t degrades to integer
Message-ID: <202401311655.FJYxii3p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   06f658aadff0e483ee4f807b0b46c9e5cba62bfa
commit: 3e39acf56ededdebd1033349a16b704839b94b28 [2759/3001] ALSA: core: Add sound core KUnit test
config: i386-randconfig-062-20240131 (https://download.01.org/0day-ci/archive/20240131/202401311655.FJYxii3p-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401311655.FJYxii3p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401311655.FJYxii3p-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/core/sound_kunit.c:106:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
>> sound/core/sound_kunit.c:106:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:106:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:106:9: sparse:     got int
>> sound/core/sound_kunit.c:106:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
>> sound/core/sound_kunit.c:106:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:106:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:106:9: sparse:     got int
   sound/core/sound_kunit.c:107:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:107:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:107:9: sparse:     got int
   sound/core/sound_kunit.c:107:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:107:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:107:9: sparse:     got int
   sound/core/sound_kunit.c:119:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:119:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:119:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:119:9: sparse:     got int
   sound/core/sound_kunit.c:119:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:119:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:119:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:119:9: sparse:     got int
   sound/core/sound_kunit.c:120:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:120:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:120:9: sparse:     got int
   sound/core/sound_kunit.c:120:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:120:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:120:9: sparse:     got int
   sound/core/sound_kunit.c:134:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:134:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:134:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:134:9: sparse:     got int
   sound/core/sound_kunit.c:134:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:134:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:134:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:134:9: sparse:     got int
   sound/core/sound_kunit.c:135:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:135:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:135:9: sparse:     got int
   sound/core/sound_kunit.c:135:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:135:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:135:9: sparse:     got int
   sound/core/sound_kunit.c:149:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:149:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:149:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:149:9: sparse:     got int
   sound/core/sound_kunit.c:149:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:149:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:149:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:149:9: sparse:     got int
   sound/core/sound_kunit.c:150:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:150:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:150:9: sparse:     got int
   sound/core/sound_kunit.c:150:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:150:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:150:9: sparse:     got int
   sound/core/sound_kunit.c:151:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:151:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:151:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:151:9: sparse:     got int
   sound/core/sound_kunit.c:151:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:151:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:151:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:151:9: sparse:     got int
   sound/core/sound_kunit.c:152:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:152:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:152:9: sparse:     got int
   sound/core/sound_kunit.c:152:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:152:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:152:9: sparse:     got int
   sound/core/sound_kunit.c:179:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:179:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:179:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:179:9: sparse:     got int
   sound/core/sound_kunit.c:179:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:179:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:179:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:179:9: sparse:     got int
   sound/core/sound_kunit.c:274:9: sparse: sparse: restricted snd_pcm_format_t degrades to integer
   sound/core/sound_kunit.c:274:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:274:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:274:9: sparse:     got int
   sound/core/sound_kunit.c:275:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted snd_pcm_format_t [usertype] format @@     got int @@
   sound/core/sound_kunit.c:275:9: sparse:     expected restricted snd_pcm_format_t [usertype] format
   sound/core/sound_kunit.c:275:9: sparse:     got int

vim +106 sound/core/sound_kunit.c

    96	
    97	static void test_phys_format_size(struct kunit *test)
    98	{
    99		u32 i;
   100	
   101		for (i = 0; i < ARRAY_SIZE(valid_fmt); i++) {
   102			KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(valid_fmt[i].format),
   103					valid_fmt[i].physical_bits);
   104		}
   105	
 > 106		KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(WRONG_FORMAT), -EINVAL);
   107		KUNIT_EXPECT_EQ(test, snd_pcm_format_physical_width(-1), -EINVAL);
   108	}
   109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
