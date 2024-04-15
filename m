Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BAD156979
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 23:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713224739; cv=none; b=kcXuKiFD2kbbrVbefje4ol2fCuGrxiHUKJEBFLjZxsVmkW3fBGZR7OL757XfaG070sv85Ft0+2l0ArODRBZ/wFhGsg/HW0I1beO29Vm/d0JcYolP5a67VDg0mxErqUqcVl7jNKs8w6dE4scE1jp8dMm8jWfsmkcw0DJm3LoGwU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713224739; c=relaxed/simple;
	bh=j8+n/U18YjrHTwa5EWeIKUhqT9a3bzP49oaxVyOcWrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TvTG64nslQfFkhDIIoM8/s7Y4mYCu2x/Oz8+CkJ1B+qCVQH4KsXSdllO2y+WzXuGbYBwKdClFR9W2k5EzkXRzxqNk66LHDTrg6Uon+aP4zg7iMOP2bPUdjtAB3lXHVzLw9UDPu5QdusCjEYZAr9H5JKIaeJlc1EZvVrJZRJTnew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCLOZa7+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCLOZa7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713224738; x=1744760738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j8+n/U18YjrHTwa5EWeIKUhqT9a3bzP49oaxVyOcWrA=;
  b=fCLOZa7+ndHwZKLRxntzZpaIkWc3zYtgc8ZxoB7zc+INKIK369G5m9a7
   ysLUmEjr4m2bD8ETRa/Z3DRZ2wku0Neb4J2LHrmFpK3aZMYt0fJ/mzX1t
   R8hse9IK0DO20JqXThxDbHyjcW77ILzT74g4Jzze1WR6LRW31GHSkgH5Y
   m6T4vh3tNGduatuIg/RVvwhScg3yR/rpYJqNWLQLRIv0yqzzXu2f8GNQi
   x1TznATWXqFr9R6G/9jcVGRjzcwxWzNHDf8+25YOebSnQUk2DIB29oCv3
   s9B7NNHsDHXBQVtgYX3qJ5LC5CsTQwV/msuK9V3sCtI5G5cUXvSMQGBWm
   A==;
X-CSE-ConnectionGUID: hNXztsuLTfWSd/kuUlFByA==
X-CSE-MsgGUID: VLpepqzxTGOBZBbruo/NLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8860043"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8860043"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 16:45:37 -0700
X-CSE-ConnectionGUID: wD59IYmYQ1GOQTHdk0moDw==
X-CSE-MsgGUID: iMcphzg8SG6IwfcS3gOgDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="53028665"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 15 Apr 2024 16:45:36 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwW0z-0004jY-2j;
	Mon, 15 Apr 2024 23:45:33 +0000
Date: Tue, 16 Apr 2024 07:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/5] mm/pgsize_migration.c:98:
 warning: expecting prototype for What(). Prototype was for
 init_pgsize_migration() instead
Message-ID: <202404160720.XSWZtpfE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   084d22016ccabe60338ea69b0a1c4c264551bd4c
commit: 9274c308d8469e26a5f3fb8b598000edcff6b135 [1/5] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_miration/enabled
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240416/202404160720.XSWZtpfE-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160720.XSWZtpfE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160720.XSWZtpfE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/pgsize_migration.c:98: warning: expecting prototype for What(). Prototype was for init_pgsize_migration() instead


vim +98 mm/pgsize_migration.c

    81	
    82	/**
    83	 * What:          /sys/kernel/mm/pgsize_migration/enabled
    84	 * Date:          April 2024
    85	 * KernelVersion: v5.4+ (GKI kernels)
    86	 * Contact:       Kalesh Singh <kaleshsingh@google.com>
    87	 * Description:   /sys/kernel/mm/pgsize_migration/enabled
    88	 *                allows for userspace to turn on or off page size
    89	 *                migration mitigations necessary for app compatibility
    90	 *                during Android's transition from 4kB to 16kB page size.
    91	 *                Such mitigations include preserving /proc/<pid>/[s]maps
    92	 *                output as if there was no segment extension by the
    93	 *                dynamic loader; and preventing fault around in the padding
    94	 *                sections of ELF LOAD segment mappings.
    95	 * Users:         Bionic's dynamic linker
    96	 */
    97	static int __init init_pgsize_migration(void)
  > 98	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
