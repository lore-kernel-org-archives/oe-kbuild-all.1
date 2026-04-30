Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEC63BB5A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 04:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777522904; cv=none; b=ihMb9S/O7Ojtia4doQsuPKy6Px4KcVch0h+MPm0yIrOXtex2gNCs42kHmPqIkFWes1eROv75JkhZDfmPji+oLia+ZQ9XYniYDB+Z+2gCYrR5peIA9QJTnjwejIYy3JdJI3Qk1BB3F8wkWi/Ri1w2wPojS2RGTqGHf0rDYRYZm0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777522904; c=relaxed/simple;
	bh=IK4mszjFSyM3Tee9prfV7dVhtjAUoFe3udzznjtst1c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pDZ+xaqgIiyUPzuJgz8YEcJjSu522ft3/SEyxZpqNbX0JvJCrZcHzHaWOrecHeLraqkOPe29GbiVgwMmSaEe/uA8yP0wpP+a3WKDAOdaaijqUdHxY7+p0xXRnReAkVg8CRJ1LoTGebDijPt2glPhbIggiDiGHd+gHqLxC8iKiCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NdyQUORX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NdyQUORX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777522902; x=1809058902;
  h=date:from:to:cc:subject:message-id;
  bh=IK4mszjFSyM3Tee9prfV7dVhtjAUoFe3udzznjtst1c=;
  b=NdyQUORXbtyU/zbL3WBdD2tFLkp4UEOKOnLcpkQ/Wc/K8ElWVgrmhERy
   /uqKejjFBSisOh4Nnb5OZA9ws36SazztxxPYkp1hNzVNisgd7FBjrkBzY
   ks3IZMk1QUx8mTPcYAthE9bm3myYb2zFhgAhO2XRz77+Rn4RsKAzug2A7
   s51gDGd3upG3qAhAZN6LGEJFE6KFlSYRAhIOPSSM23Hq3+MuJMKJtON3H
   Mdz7kwvfGPfmVr9uJmBMgO/1+GnoK1GvORiP0r4adptVN9wMyKF7G0tLq
   VOdv+8SBUTqX5BoBwxJeolIA1qjFz3Pl2K2CLPWtbilAAAUXPMlzoJxuK
   Q==;
X-CSE-ConnectionGUID: 1wB3qJqxQFKLbehUfLXT/A==
X-CSE-MsgGUID: 96h7yUAIRi61m8+g3fkwug==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78332033"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78332033"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 21:21:41 -0700
X-CSE-ConnectionGUID: By5tKsiASbWoI6DZnMBBWQ==
X-CSE-MsgGUID: c/hyEqVYRtW7gLtKifRERQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="234737385"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Apr 2026 21:21:41 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIIuA-00000000BwC-0Fwj;
	Thu, 30 Apr 2026 04:21:38 +0000
Date: Thu, 30 Apr 2026 12:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_mark_userns 9/11] kernel/nscommon.c:149:9:
 error: implicit declaration of function 'fsnotify_ns'; did you mean
 'fsnotify_mnt'?
Message-ID: <202604301258.lAz6GlTE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/amir73il/linux fan_mark_userns
head:   f2a3e4bb97217a9bed53d32a78ddd22353868118
commit: 4dcba799f789519dcdfd1892e990ec313c3f4539 [9/11] fanotify: add support for watching the namespaces tree
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604301258.lAz6GlTE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301258.lAz6GlTE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604301258.lAz6GlTE-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/nscommon.c: In function 'ns_common_notify':
>> kernel/nscommon.c:149:9: error: implicit declaration of function 'fsnotify_ns'; did you mean 'fsnotify_mnt'? [-Wimplicit-function-declaration]
     149 |         fsnotify_ns(mask, owner_userns, ns->ns_id,
         |         ^~~~~~~~~~~
         |         fsnotify_mnt


vim +149 kernel/nscommon.c

   147	
   148		/* Report child namespace events to owner userns watchers */
 > 149		fsnotify_ns(mask, owner_userns, ns->ns_id,
   150			    to_ns_common(owner_userns)->ns_id);
   151	}
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
