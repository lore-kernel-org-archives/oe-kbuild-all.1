Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96828327BEC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jul 2026 14:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784125248; cv=none; b=D5XWD9J0ZK++WXWrUTb8YT1GLOasrBnDX86KdyTmg4RkxLXelTNBnq8LiLruoUwzFhb8I7jcCXHZcY3qCig9uNXJfhP8buQJnkjBAuap5sFR23IYzqNOHrFimDKQASgKstQlZk6b/jPqZz2Ed741wwbuaOdtqqthyxMBzxGr5jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784125248; c=relaxed/simple;
	bh=1LcuTWqrlqrVqXgH313m6z5V4EdszcYPffvVD30Dmqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NDL+YLeFFXdZFierqcoM7R3dsbenJ2NZ33+zAAhXxwnZ+VDawBxNDbISCuaEr+YOUYohbe4Ghts8rVqNlcAqLjqIQvoxkUmb0KghknwjhSrIufJRilVfH9Y0UpDnFX6kEuGS3dY5TR4pgRcDfJjkjHj5CB1qHt2N4QZqh04bN2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMx45FlT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMx45FlT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784125247; x=1815661247;
  h=date:from:to:cc:subject:message-id;
  bh=1LcuTWqrlqrVqXgH313m6z5V4EdszcYPffvVD30Dmqc=;
  b=BMx45FlTylxt78uYCN4vkQ8V1rfpIxu6er8ydKBRDoLZFFZKvXYhZWBJ
   ctwALiExMBwz1bJ5+4tat9sqtezBCNc/pZiIhw5KxbzBvebw3RgZfaUZS
   Hj6F68zwNCZlQdl31WLqnSkM9+2CU4WsRafW60Csr5NUYew0IK7yMbuSO
   zWGhOPM1Gzr0f3qykFUskc2eRxSLFqvZt8LzMKjZ3xC3urJRJk5plb/uv
   OSBl/7bAIWtEaZ2ULuojfFDRsCPUsu4S5jgeNRtlwUJ5ZrygL5HCkkyJu
   zqAM0gOj8c4ODpQTgfPN0LXWw0XHNAvk/m8Hp6jjne3JDrKKDpIPx2XeW
   g==;
X-CSE-ConnectionGUID: 5DUek/AYQeiUgrq1KZ38cA==
X-CSE-MsgGUID: fb1w/SP7QgucOjnfmXoKLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83885333"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="83885333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 07:20:46 -0700
X-CSE-ConnectionGUID: a8FDoOkvTamxnFe4Dqazaw==
X-CSE-MsgGUID: wxOxfOHnQJKXlYNEzWau4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; 
   d="scan'208";a="249833512"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jul 2026 07:20:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk0TY-00000000Ni3-1Cca;
	Wed, 15 Jul 2026 14:20:40 +0000
Date: Wed, 15 Jul 2026 22:19:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-07 19/19]
 sound/soc/codecs/cs42l51-i2c.c:22:27: sparse: sparse: symbol
 'cs42l51_of_match' was not declared. Should it be static?
Message-ID: <202607152233.uBRrRjZR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-07
head:   b1ba76bbaa8ae0cd7a1ffe6ecccd44cd086418e0
commit: 66cf5f394abe33226834f5d3bcdff020abd6b586 [19/19] ASoC: cs42l51: fix driver to properly autoload with automatic module loading
config: arm-randconfig-r122-20260715 (https://download.01.org/0day-ci/archive/20260715/202607152233.uBRrRjZR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607152233.uBRrRjZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607152233.uBRrRjZR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/codecs/cs42l51-i2c.c:22:27: sparse: sparse: symbol 'cs42l51_of_match' was not declared. Should it be static?

vim +/cs42l51_of_match +22 sound/soc/codecs/cs42l51-i2c.c

    21	
  > 22	const struct of_device_id cs42l51_of_match[] = {
    23		{ .compatible = "cirrus,cs42l51", },
    24		{ }
    25	};
    26	MODULE_DEVICE_TABLE(of, cs42l51_of_match);
    27	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
