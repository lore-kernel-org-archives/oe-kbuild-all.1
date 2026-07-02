Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414CE31355D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 03:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782964635; cv=none; b=FL6UHfJlWUA/fBhYE33bZ9/U0MRJvcwDU0MNJGCSpkRqMO/sn1WD7kdHXfCAs7d9lk7mnIJzITiSdNUCka6lX/3wDk/J5QJi55NRqu4uJFjPPLvkkp7oCgELiS1/j5VFCeWV9G0ou89sluvRKJoXMN01ne/jAdH9gULSf5SPSfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782964635; c=relaxed/simple;
	bh=q7hMpgXKBy33MTQMA1fqm01OBPGUH3jL5IJs8KFXJkI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VJ8lu8aP7GHEW0c+Tp0wpzlJIL+RWq3swYcSd32Yt8HgOhbs7n3HTyl/aZf6ije1n6Wl0omxyp0GzqxupAAg4bufgWDgWcQSiS1GAt143ebN80QvmdY4Bh8UeEyXg3iSw973G51JHNA/x1FQjFNoFjf5W6fFQxNf2RcIWAuNV30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aif9WRz8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aif9WRz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782964634; x=1814500634;
  h=date:from:to:cc:subject:message-id;
  bh=q7hMpgXKBy33MTQMA1fqm01OBPGUH3jL5IJs8KFXJkI=;
  b=Aif9WRz868nbJlaVaXU29hXRg2drZhfH9VQ7P8r51stACzYKQWGb+8DG
   Il2jisW2/zH0aShYkb9BbdYvGZyT29kLQOzvc8Y4EWVFv5Modye7LpXs8
   N+JMgON0y6ATUAJgG/Pb44zFO3kC8j09x/2e6dleQCR0EKTTaQe0z6gp3
   yoB4m0wx0PVnJKZ+tcvAXYh5JQLRa1JAstsrXp2LzXqYxS+z+wo0i7VYY
   X/AUQzL0FPPqu0RJ9a73ZS/tOL/n1oeCSxYFHoZUqnSYjqQy6DbCQb5fZ
   0jVIRrRdAlkFzhfUfSc9UTtj5mBAUgeZpVnSc7ezoxzGaaWUHlrMcXm3A
   Q==;
X-CSE-ConnectionGUID: fQe9kUUPS3uEUHln1UIecQ==
X-CSE-MsgGUID: 9TmovwIzSKmzT1G4pXXNIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83837746"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83837746"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:57:14 -0700
X-CSE-ConnectionGUID: AQNa4lkfSheDiPk2Ff9ufw==
X-CSE-MsgGUID: 94cSTUb6QL+xvGQ/8XPvmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="256658497"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2026 20:57:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf8Y1-000000009xb-3kBK;
	Thu, 02 Jul 2026 03:57:09 +0000
Date: Thu, 02 Jul 2026 11:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 166/166]
 fs/smb/client/cifsroot.c:83:12: warning: no previous prototype for function
 'cifs_root_data'
Message-ID: <202607021152.CulFVz6u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Steve,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2a9e8b82544e3c1e2678c2c07bef3d3706156ee4
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [166/166] smb: move client and server files to common directory fs/smb
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260702/202607021152.CulFVz6u-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021152.CulFVz6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021152.CulFVz6u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:24:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      24 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> fs/smb/client/cifsroot.c:83:12: warning: no previous prototype for function 'cifs_root_data' [-Wmissing-prototypes]
      83 | int __init cifs_root_data(char **dev, char **opts)
         |            ^
   fs/smb/client/cifsroot.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      83 | int __init cifs_root_data(char **dev, char **opts)
         | ^
         | static 
   2 warnings generated.


vim +/cifs_root_data +83 fs/smb/client/cifsroot.c

8eecd1c2e5bc73d fs/cifs/cifsroot.c Paulo Alcantara (SUSE  2019-07-16  82) 
8eecd1c2e5bc73d fs/cifs/cifsroot.c Paulo Alcantara (SUSE  2019-07-16 @83) int __init cifs_root_data(char **dev, char **opts)

:::::: The code at line 83 was first introduced by commit
:::::: 8eecd1c2e5bc73d33f3a544751305679dbf88eb4 cifs: Add support for root file systems

:::::: TO: Paulo Alcantara (SUSE) <paulo@paulo.ac>
:::::: CC: Steve French <stfrench@microsoft.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
