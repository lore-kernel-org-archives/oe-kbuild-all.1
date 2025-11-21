Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EFB1C5D59
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 05:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763703558; cv=none; b=hGGs1cgqaLUI0D3BMsbXD3DD23WT39vGQ47Q5NnPOUAnddPRYTi9ZDpyBSaQmw+hnfVDn1GxpvMuTwO31Fdg/mHnXps2l/XFoE4lQ5l/PzrItXTmZUv0gT4+9IVwlR+RQPX+ftUw7+zRKYRvbG3YBQD7V6Sjbz8l0I/7Ois/cP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763703558; c=relaxed/simple;
	bh=Z/IIOasj73CXW4/au1p9VNcZj/kUKbhHkLVY18xRVtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j6ezPNxh4mVIBmyzcxbcp/F9TQ1cqhKwKBfZfqqCZ41iNsoWPMWeecWzftYjZhJMq856OaKpPYUXSPSESSZSgJbX1vLeFlTr80X3iKJNb+yq09jlUneUFb7DAmMvSq1HiCw2JZ9gkUQWNvp+MqU0RBXLrvddkil3IEqmdLVaLqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUIubQD5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUIubQD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763703556; x=1795239556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/IIOasj73CXW4/au1p9VNcZj/kUKbhHkLVY18xRVtI=;
  b=IUIubQD5fnkApLX4tAwoIznCQ+33mRCT3qK3eNErUMUQAQQDC8gSBCOP
   ZqLSt5rVbUIFit1ZJsyH2bJ8yuvoseR9mA1fFaen+BWr1upJllbi+jl9C
   I4OJHivR/SHon242aUeUkdDIW7+7IEitmBc16A71eS0uSVwUnw7XvWERc
   HHlV8SrsOmzBVAvEEnwal3gLZT3CkVNiL149HHyaa+JkYFvv8enR0d+nu
   v3jCu/CZ4LFvazr4T2eXs7K8/T35elvr6b1UHaspSxi3REqZLa/9TRXM2
   nw3o2DwogEMQQFLJZM9xakccbucR+iimzaJ5yicpoeyCKZ7StB0eitLum
   Q==;
X-CSE-ConnectionGUID: 99ORmJi3RGqatVlaeObb2A==
X-CSE-MsgGUID: umjx7HFHQF2GyDzwLmxaug==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65821028"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="65821028"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 21:39:16 -0800
X-CSE-ConnectionGUID: tl8bqFlVQ3qEukVnsOEWyg==
X-CSE-MsgGUID: XZv3xocsSQS+6vq9O3Czdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="196075279"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Nov 2025 21:39:15 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMJrU-00050R-1y;
	Fri, 21 Nov 2025 05:39:12 +0000
Date: Fri, 21 Nov 2025 13:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 5/8] make[4]: *** No rule to make target
 'crypto/mldsa.o', needed by 'crypto/built-in.a'.
Message-ID: <202511211351.S8EZksFx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   0baca2aa9ee7559c68e1631bb8a9be65fc4a99dc
commit: b674f2e232b8e3e6016ad724ab94c4f03a54ae0b [5/8] crypto: Add ML-DSA crypto_sig support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20251121/202511211351.S8EZksFx-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211351.S8EZksFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511211351.S8EZksFx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'crypto/mldsa.o', needed by 'crypto/built-in.a'.
   make[4]: Target 'crypto/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
