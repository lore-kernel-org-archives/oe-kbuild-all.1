Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD823D6690
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 07:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783583442; cv=none; b=Evc4GxrDyIfs/Kye0JMFiIhO0KcUA+5EpC/Ez+s/wHoi13NG3HWmen4EITL/MvgQPEP1jA81YcQ0YGWtNDGAstAx19nOzDhWPuAkcHy3j3KhenOeceg9F0tmDST0IAuynVZ8wm1v0CwuKmQyht9Kv+XgdWoZfjQwC5suhJV8CrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783583442; c=relaxed/simple;
	bh=FR4fPQr1FXaPhzDB5vldrbymEggqDqobAM7PBxvka9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=luhcb9hQpaS6b4jRAo2rtiG4mfps3rtuCLOADTGr7hHg68sk6gBRCB+W74N74J9HcjAflEozp3DptGOZBL2fEofwdhnFlelFobhPXoivBjPmNcY3yI0ucGT1NSCOuSGt+XpWByw3S2Ey5jJatX9qHFh7AD0lbwnZ5V4onhv/8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtrUhmTD; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtrUhmTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783583441; x=1815119441;
  h=date:from:to:cc:subject:message-id;
  bh=FR4fPQr1FXaPhzDB5vldrbymEggqDqobAM7PBxvka9U=;
  b=WtrUhmTDJzN0hvf4rmivB3rYfRMBXE70PjpyiVj7lLF9vbOKcLSaVLWS
   AfAXW48mlj6QHjolfqvIEgE4df9PrdmCi0W2wD2Op4g/lpxaV2Vwd2AEv
   yEgJQwy+Cj0fMyYqllq71gghq8wfaxNB84q7xAepPKrhQ0NfEG+1Beaj4
   5fuDRfUHvLbk7HiTkgelckMfOn7+McRGYg9PdD/uMsM5skfM3lXDeFp9j
   6HasM2T+nhAKkQws/MLUfhe4R3syny9atTGPLAd32NpdDRMODOpg1dTPU
   LCmu3M6E6PfSRhC1Oz++VYnMJ/Tl3LxTbjhcR0OX8F7Bo02NdxNIpbjYQ
   A==;
X-CSE-ConnectionGUID: KWM61V/vTTOsa4gDFlaFng==
X-CSE-MsgGUID: kw+k8VMXR7ueXhycneXYTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84037125"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84037125"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:50:40 -0700
X-CSE-ConnectionGUID: Vq4paiwxSxyYoJEtYbXdBQ==
X-CSE-MsgGUID: 5z/Nc0Y5R3C6quC+Bitxzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254027669"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 09 Jul 2026 00:50:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whjWc-00000000HQD-42Rk;
	Thu, 09 Jul 2026 07:50:31 +0000
Date: Thu, 09 Jul 2026 15:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: lib/crypto/curve25519-fiat32.c:229 fe_add_impl() warn:
 inconsistent indenting
Message-ID: <202607091514.micnNQRU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: afc4e4a5f122183b38095daba2264123cc86d8ab lib/crypto: tests: Migrate Curve25519 self-test to KUnit
date:   10 months ago
config: nios2-randconfig-r071-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091514.micnNQRU-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: afc4e4a5f122 ("lib/crypto: tests: Migrate Curve25519 self-test to KUnit")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091514.micnNQRU-lkp@intel.com/

New smatch warnings:
lib/crypto/curve25519-fiat32.c:229 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:447 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:111 fe_freeze() warn: inconsistent indenting

Old smatch warnings:
lib/crypto/curve25519-fiat32.c:230 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:231 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:232 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:233 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:234 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:235 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:236 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:237 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:238 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:239 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:240 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:241 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:242 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:243 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:244 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:245 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:246 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:247 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:248 fe_add_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:272 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:273 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:274 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:275 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:276 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:277 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:278 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:279 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:280 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:281 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:282 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:283 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:284 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:285 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:286 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:287 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:288 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:289 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:290 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:291 fe_sub_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:315 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:316 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:317 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:318 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:319 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:320 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:321 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:322 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:323 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:324 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:325 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:326 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:327 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:328 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:329 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:330 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:331 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:332 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:333 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:334 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:335 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:336 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:337 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:338 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:339 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:340 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:341 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:342 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:343 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:344 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:345 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:346 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:347 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:348 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:349 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:350 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:351 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:352 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:353 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:354 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:355 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:356 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:357 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:358 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:359 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:360 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:361 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:362 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:363 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:364 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:365 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:366 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:367 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:368 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:369 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:370 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:371 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:372 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:373 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:374 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:375 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:376 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:377 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:378 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:379 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:380 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:381 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:382 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:383 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:384 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:385 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:386 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:387 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:388 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:389 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:390 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:391 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:392 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:393 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:394 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:395 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:396 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:397 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:398 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:399 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:400 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:401 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:402 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:403 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:404 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:405 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:406 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:407 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:408 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:409 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:410 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:411 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:412 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:413 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:414 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:415 fe_mul_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:448 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:449 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:450 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:451 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:452 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:453 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:454 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:455 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:456 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:457 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:458 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:459 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:460 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:461 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:462 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:463 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:464 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:465 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:466 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:467 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:468 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:469 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:470 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:471 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:472 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:473 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:474 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:475 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:476 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:477 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:478 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:479 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:480 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:481 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:482 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:483 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:484 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:485 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:486 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:487 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:488 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:489 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:490 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:491 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:492 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:493 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:494 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:495 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:496 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:497 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:498 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:499 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:500 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:501 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:502 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:503 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:504 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:505 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:506 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:507 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:508 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:509 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:510 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:511 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:512 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:513 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:514 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:515 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:516 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:517 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:518 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:519 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:520 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:521 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:522 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:523 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:524 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:525 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:526 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:527 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:528 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:529 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:530 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:531 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:532 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:533 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:534 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:535 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:536 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:537 fe_sqr_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:638 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:639 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:640 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:641 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:642 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:643 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:644 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:645 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:646 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:647 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:648 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:649 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:650 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:651 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:652 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:653 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:654 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:655 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:656 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:657 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:658 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:659 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:660 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:661 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:662 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:663 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:664 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:665 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:666 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:667 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:668 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:669 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:670 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:671 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:672 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:673 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:674 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:675 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:676 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:677 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:678 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:679 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:680 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:681 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:682 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:683 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:684 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:685 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:686 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:687 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:688 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:689 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:690 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:691 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:692 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:693 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:694 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:695 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:696 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:697 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:698 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:699 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:700 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:701 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:702 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:703 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:704 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:705 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:706 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:707 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:708 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:709 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:710 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:711 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:712 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:713 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:714 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:715 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:716 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:717 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:718 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:719 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:720 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:721 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:722 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:723 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:724 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:725 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:726 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:727 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:728 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:729 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:730 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:731 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:732 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:733 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:734 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:735 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:736 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:737 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:738 fe_mul_121666_impl() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:112 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:113 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:114 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:115 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:116 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:117 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:118 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:119 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:120 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:131 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:132 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:134 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:136 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:138 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:140 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:142 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:144 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:146 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:148 fe_freeze() warn: inconsistent indenting
lib/crypto/curve25519-fiat32.c:150 fe_freeze() warn: inconsistent indenting

vim +229 lib/crypto/curve25519-fiat32.c

0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  107  
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  108  static __always_inline void fe_freeze(u32 out[10], const u32 in1[10])
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  109  {
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  110  	{ const u32 x17 = in1[9];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08 @111  	{ const u32 x18 = in1[8];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  112  	{ const u32 x16 = in1[7];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  113  	{ const u32 x14 = in1[6];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  114  	{ const u32 x12 = in1[5];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  115  	{ const u32 x10 = in1[4];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  116  	{ const u32 x8 = in1[3];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  117  	{ const u32 x6 = in1[2];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  118  	{ const u32 x4 = in1[1];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  119  	{ const u32 x2 = in1[0];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  120  	{ u32 x20; u8/*bool*/ x21 = subborrow_u26(0x0, x2, 0x3ffffed, &x20);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  121  	{ u32 x23; u8/*bool*/ x24 = subborrow_u25(x21, x4, 0x1ffffff, &x23);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  122  	{ u32 x26; u8/*bool*/ x27 = subborrow_u26(x24, x6, 0x3ffffff, &x26);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  123  	{ u32 x29; u8/*bool*/ x30 = subborrow_u25(x27, x8, 0x1ffffff, &x29);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  124  	{ u32 x32; u8/*bool*/ x33 = subborrow_u26(x30, x10, 0x3ffffff, &x32);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  125  	{ u32 x35; u8/*bool*/ x36 = subborrow_u25(x33, x12, 0x1ffffff, &x35);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  126  	{ u32 x38; u8/*bool*/ x39 = subborrow_u26(x36, x14, 0x3ffffff, &x38);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  127  	{ u32 x41; u8/*bool*/ x42 = subborrow_u25(x39, x16, 0x1ffffff, &x41);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  128  	{ u32 x44; u8/*bool*/ x45 = subborrow_u26(x42, x18, 0x3ffffff, &x44);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  129  	{ u32 x47; u8/*bool*/ x48 = subborrow_u25(x45, x17, 0x1ffffff, &x47);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  130  	{ u32 x49 = cmovznz32(x48, 0x0, 0xffffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  131  	{ u32 x50 = (x49 & 0x3ffffed);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  132  	{ u32 x52; u8/*bool*/ x53 = addcarryx_u26(0x0, x20, x50, &x52);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  133  	{ u32 x54 = (x49 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  134  	{ u32 x56; u8/*bool*/ x57 = addcarryx_u25(x53, x23, x54, &x56);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  135  	{ u32 x58 = (x49 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  136  	{ u32 x60; u8/*bool*/ x61 = addcarryx_u26(x57, x26, x58, &x60);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  137  	{ u32 x62 = (x49 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  138  	{ u32 x64; u8/*bool*/ x65 = addcarryx_u25(x61, x29, x62, &x64);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  139  	{ u32 x66 = (x49 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  140  	{ u32 x68; u8/*bool*/ x69 = addcarryx_u26(x65, x32, x66, &x68);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  141  	{ u32 x70 = (x49 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  142  	{ u32 x72; u8/*bool*/ x73 = addcarryx_u25(x69, x35, x70, &x72);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  143  	{ u32 x74 = (x49 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  144  	{ u32 x76; u8/*bool*/ x77 = addcarryx_u26(x73, x38, x74, &x76);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  145  	{ u32 x78 = (x49 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  146  	{ u32 x80; u8/*bool*/ x81 = addcarryx_u25(x77, x41, x78, &x80);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  147  	{ u32 x82 = (x49 & 0x3ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  148  	{ u32 x84; u8/*bool*/ x85 = addcarryx_u26(x81, x44, x82, &x84);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  149  	{ u32 x86 = (x49 & 0x1ffffff);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  150  	{ u32 x88; addcarryx_u25(x85, x47, x86, &x88);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  151  	out[0] = x52;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  152  	out[1] = x56;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  153  	out[2] = x60;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  154  	out[3] = x64;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  155  	out[4] = x68;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  156  	out[5] = x72;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  157  	out[6] = x76;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  158  	out[7] = x80;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  159  	out[8] = x84;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  160  	out[9] = x88;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  161  	}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  162  }
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  163  
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  164  static __always_inline void fe_tobytes(u8 s[32], const fe *f)
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  165  {
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  166  	u32 h[10];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  167  	fe_freeze(h, f->v);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  168  	s[0] = h[0] >> 0;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  169  	s[1] = h[0] >> 8;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  170  	s[2] = h[0] >> 16;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  171  	s[3] = (h[0] >> 24) | (h[1] << 2);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  172  	s[4] = h[1] >> 6;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  173  	s[5] = h[1] >> 14;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  174  	s[6] = (h[1] >> 22) | (h[2] << 3);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  175  	s[7] = h[2] >> 5;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  176  	s[8] = h[2] >> 13;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  177  	s[9] = (h[2] >> 21) | (h[3] << 5);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  178  	s[10] = h[3] >> 3;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  179  	s[11] = h[3] >> 11;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  180  	s[12] = (h[3] >> 19) | (h[4] << 6);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  181  	s[13] = h[4] >> 2;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  182  	s[14] = h[4] >> 10;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  183  	s[15] = h[4] >> 18;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  184  	s[16] = h[5] >> 0;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  185  	s[17] = h[5] >> 8;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  186  	s[18] = h[5] >> 16;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  187  	s[19] = (h[5] >> 24) | (h[6] << 1);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  188  	s[20] = h[6] >> 7;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  189  	s[21] = h[6] >> 15;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  190  	s[22] = (h[6] >> 23) | (h[7] << 3);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  191  	s[23] = h[7] >> 5;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  192  	s[24] = h[7] >> 13;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  193  	s[25] = (h[7] >> 21) | (h[8] << 4);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  194  	s[26] = h[8] >> 4;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  195  	s[27] = h[8] >> 12;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  196  	s[28] = (h[8] >> 20) | (h[9] << 6);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  197  	s[29] = h[9] >> 2;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  198  	s[30] = h[9] >> 10;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  199  	s[31] = h[9] >> 18;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  200  }
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  201  
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  202  /* h = f */
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  203  static __always_inline void fe_copy(fe *h, const fe *f)
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  204  {
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  205  	memmove(h, f, sizeof(u32) * 10);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  206  }
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  207  
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  208  static __always_inline void fe_copy_lt(fe_loose *h, const fe *f)
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  209  {
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  210  	memmove(h, f, sizeof(u32) * 10);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  211  }
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  212  
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  213  /* h = 0 */
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  214  static __always_inline void fe_0(fe *h)
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  215  {
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  216  	memset(h, 0, sizeof(u32) * 10);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  217  }
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  218  
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  219  /* h = 1 */
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  220  static __always_inline void fe_1(fe *h)
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  221  {
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  222  	memset(h, 0, sizeof(u32) * 10);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  223  	h->v[0] = 1;
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  224  }
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  225  
660bb8e1f833ea Ard Biesheuvel     2019-11-08  226  static noinline void fe_add_impl(u32 out[10], const u32 in1[10], const u32 in2[10])
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  227  {
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  228  	{ const u32 x20 = in1[9];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08 @229  	{ const u32 x21 = in1[8];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  230  	{ const u32 x19 = in1[7];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  231  	{ const u32 x17 = in1[6];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  232  	{ const u32 x15 = in1[5];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  233  	{ const u32 x13 = in1[4];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  234  	{ const u32 x11 = in1[3];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  235  	{ const u32 x9 = in1[2];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  236  	{ const u32 x7 = in1[1];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  237  	{ const u32 x5 = in1[0];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  238  	{ const u32 x38 = in2[9];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  239  	{ const u32 x39 = in2[8];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  240  	{ const u32 x37 = in2[7];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  241  	{ const u32 x35 = in2[6];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  242  	{ const u32 x33 = in2[5];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  243  	{ const u32 x31 = in2[4];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  244  	{ const u32 x29 = in2[3];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  245  	{ const u32 x27 = in2[2];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  246  	{ const u32 x25 = in2[1];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  247  	{ const u32 x23 = in2[0];
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  248  	out[0] = (x5 + x23);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  249  	out[1] = (x7 + x25);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  250  	out[2] = (x9 + x27);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  251  	out[3] = (x11 + x29);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  252  	out[4] = (x13 + x31);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  253  	out[5] = (x15 + x33);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  254  	out[6] = (x17 + x35);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  255  	out[7] = (x19 + x37);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  256  	out[8] = (x21 + x39);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  257  	out[9] = (x20 + x38);
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  258  	}}}}}}}}}}}}}}}}}}}}
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  259  }
0ed42a6f431e93 Jason A. Donenfeld 2019-11-08  260  

:::::: The code at line 229 was first introduced by commit
:::::: 0ed42a6f431e930b2e8fae21955406e09fe75d70 crypto: curve25519 - generic C library implementations

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
