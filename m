Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FAA7F7C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 23:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711151325; cv=none; b=ezxItSVIQ/X5FAGQrXcWvG90Mv+bcEzQfkM7bETAhLsicuU7yZrsw5t67yC4kZHljWihrfrwcFghauw0yY7SmCdmGFxEG+16a3xQCk7pKt2KlG0fJ51tB0lytHHTAh8HdgU5yukIMxK4sIS8HK9iUJEGT1xYItrEQkfazCfbNPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711151325; c=relaxed/simple;
	bh=/KAFB3eEIkWpHqsTJT0/ADvPwvXhbIeGg3e7rpeh9N4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y5sz/y8S7OGaeZ0tgnCnf7rn8QC9md4OFQvSJisZMzbUcG7SmGDuLn+BpaLHzcjIj5D4k2dvrGlJplTmgBSiU4PQu/+l2GXJNnVWZwC0yzqvT5evF5KRYCd2fTNWQ+iUTuwnUAsOxc5nzcei4kNGclvWjsBKcBypqgo9mRzcU7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDFh0osR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDFh0osR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711151322; x=1742687322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/KAFB3eEIkWpHqsTJT0/ADvPwvXhbIeGg3e7rpeh9N4=;
  b=lDFh0osRcOHsb7CqJId2FHUsR1sp4EN+6KwJV9MXp2O87DSD5RTi8R3i
   lptqtevWVyj3VsCudvYPQgkUwql5LVy4ywFAH9oCcrgC2k4Ap0u40G/iA
   +oyLvd3qOEij0a2UoB1SoBLktRcVttLk7I8jRQ8vDcG43INfmAEfG5EDC
   7xOHV/Yk4QtmCIecpYFjr6MDmisk4OUquCVlfehEQHySwsMGcHSMvnf+Q
   +ANfAP9OhD+5+xnDcjcis15XVXUJFNuMOoAn40sadK4Y7R/A0MyOufamV
   /Zio917h2gyuMfNE+DfLHGzqe5qKbqPh3Iwei2IUz3VdcFj3o7Dwxz+lO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6409943"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6409943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 16:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="15125686"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Mar 2024 16:48:41 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnocp-000KiF-26;
	Fri, 22 Mar 2024 23:48:39 +0000
Date: Sat, 23 Mar 2024 07:48:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: [akpm-mm:mm-unstable 55/141] ERROR: modpost: "memcpy"
 [fs/nfs/nfs.ko] undefined!
Message-ID: <202403230731.fved39RH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   af520f81c51001f7ccdf0579fc73df282b26292d
commit: fa5bfe65d50ae7006d711f490bba3cb4d437bcad [55/141] fix missing vmalloc.h includes
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240323/202403230731.fved39RH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230731.fved39RH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230731.fved39RH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs_common/grace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv3.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/block/loop.o
ERROR: modpost: "memcpy" [fs/reiserfs/reiserfs.ko] undefined!
>> ERROR: modpost: "memcpy" [fs/nfs/nfs.ko] undefined!
>> ERROR: modpost: "memcpy" [fs/nfs/nfsv3.ko] undefined!
>> ERROR: modpost: "memcpy" [fs/nfsd/nfsd.ko] undefined!
>> ERROR: modpost: "memcpy" [fs/lockd/lockd.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/seqiv.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/crypto_null.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/sha512_generic.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/sha3_generic.ko] undefined!
>> ERROR: modpost: "memcpy" [crypto/cbc.ko] undefined!
WARNING: modpost: suppressed 16 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
