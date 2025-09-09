Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC5C1CAA92
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 07:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757403930; cv=none; b=bRZeiMbwhMUDw0EqfZb6LHZ1C6R0jpdGWvUh3SJPqZqDmyFk1KxWa/mt3t5PRbijbknDzLilZYl/uIQE6MC55U2yxp/u/hKx8oIuyNOR4K4KXMVEDpAQ5w+KANDb0HnJkSbfi3OikUCetrSgJdYGRhP0V0wCbo677y9P3e9lEZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757403930; c=relaxed/simple;
	bh=X/DW+XDr/QPdO9a80OoyfQCEGiP9qzPpSj3j9NYHBIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F9jBE+3XDhJ0TrV/pQXrKuWQRU1CfZ+1B8QbNe0BCdypmzz3+H4ZsR2AqgVrYBJqLM2aeQ+BM2lWZSnG80mwUBdgzFMtKPSUbh4HXO+ZyUUeekQSrSrDVkZRWsHRQPaX4o1BtyJ1hqJB8Itcj7qN/aA7DEjBnieZFdFOhnQvLZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbAXGjan; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbAXGjan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757403929; x=1788939929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X/DW+XDr/QPdO9a80OoyfQCEGiP9qzPpSj3j9NYHBIc=;
  b=JbAXGjanNQQD0TYOvKLITerpIwqxraWYSu6DPuuZiTepZphfm6hNiWJc
   sFj8dWWzRDY72qFQM8xoRyGn0AMn2Vb6O9Zp5pwZYWE8VxTgHjiA5rxOR
   NMyXXdipzwMYn0OuLhePkHu/SzbclIxCBOc7jhlteCZkRb9GSN/RDcebS
   ha3z+L6KHi7KPCz2eZJsgqf3buWcDwHhjlg/+aW6CIPE8XPHZDF+7k5Me
   IZsRHBHmks1z1yFg1n2+7efKMOzxMFki+wPIr0nRMcm262c7/goNtU8Ag
   4Neqimj/S0JNOT9FHzLscWdeFL5BGRJ9anjqoeiIm8JF29gm9cOtBho2H
   w==;
X-CSE-ConnectionGUID: 3guqgFzsTlaLcxuLOdnvfA==
X-CSE-MsgGUID: 6Vv5tEq0QIqK15DS38Ck3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59614021"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="59614021"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 00:45:28 -0700
X-CSE-ConnectionGUID: umIAFaMSTwOBbtEwE1kNww==
X-CSE-MsgGUID: YgDHJ2I4S3KvlvDrTjQG1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; 
   d="scan'208";a="172888739"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2025 00:45:27 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvt2a-0004bb-2H;
	Tue, 09 Sep 2025 07:45:24 +0000
Date: Tue, 9 Sep 2025 15:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 9/9] mm/pgsize_migration.c:98:
 warning: expecting prototype for What(). Prototype was for
 init_pgsize_migration() instead
Message-ID: <202509091525.0CM0EcIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   7471f5c09c55a4ca5f9e0d92e1710a05b74e4ee5
commit: 918c98f267d6a1512cb5d671523bb408da4b070a [9/9] ANDROID: 16K: Introduce /sys/kernel/mm/pgsize_migration/enabled
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250909/202509091525.0CM0EcIe-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091525.0CM0EcIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091525.0CM0EcIe-lkp@intel.com/

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
