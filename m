Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08639182
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Jan 2023 00:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674951363; x=1706487363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MX5ykeC8MBHmO6kHdlm6YOUWxvG5RXFsTFJYuGBiNAM=;
  b=Sy8HtrOGxmDgPAJ00OmZVdDPh5aoqfMZz52fQzynPaqFDZsGquSxRfFF
   GDOUcyjq5LhSRRD2V6X/ADHHTPhDcw40XqfEKPGhFbGi4OQzCekxyxr/Y
   RHjQtRZYrvb9I4ZALtLLkX6bJ4ejnmhqRVjORZoveNaT7ZcvPFwCO5oDJ
   A0fAEzs4ZHhUr8tQI7WQbF2p7xvcC+agDmt30BvKLGD06jO44Kwy7Y6hX
   QMXJdMNujHMXE5qmlyGoPzIuZpkwGjX6ZDixYAiIacyWLbsca/TII0HBz
   3UBChBN8uQSQwiUPOzsReNwrpS6Yua2zfL8T1EhdTb8et+VVDO3PinCY/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="326019787"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="326019787"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 16:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="641119694"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="641119694"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jan 2023 16:16:00 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLvMV-0001GK-1d;
	Sun, 29 Jan 2023 00:15:59 +0000
Date: Sun, 29 Jan 2023 08:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_modify 25/29] fs/namespace.c:491:5: warning: no
 previous prototype for '__sb_mnt_want_write_file'
Message-ID: <202301290836.xJY7zVtp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_modify
head:   98a5f0e208bb7b3378da3912e93c51bc400b65cf
commit: d6522cc6094a6e54cfd1c352c24cc534deb67ff2 [25/29] fanotify: introduce FAN_PRE_ATTRIB permission event
config: arc-randconfig-r043-20230129 (https://download.01.org/0day-ci/archive/20230129/202301290836.xJY7zVtp-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/d6522cc6094a6e54cfd1c352c24cc534deb67ff2
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il fan_pre_modify
        git checkout d6522cc6094a6e54cfd1c352c24cc534deb67ff2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/namespace.c:491:5: warning: no previous prototype for '__sb_mnt_want_write_file' [-Wmissing-prototypes]
     491 | int __sb_mnt_want_write_file(struct file *file)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/__sb_mnt_want_write_file +491 fs/namespace.c

   481	
   482	/**
   483	 * __sb_mnt_want_write_file - get write access to a file's mount and sb
   484	 * @file: the file who's mount on which to take a write
   485	 *
   486	 * This is like mnt_want_write, but if the file is already open for writing it
   487	 * skips incrementing mnt_writers (since the open file already has a reference)
   488	 * and instead only does the freeze protection and the check for emergency r/o
   489	 * remounts.  This must be paired with mnt_drop_write_file.
   490	 */
 > 491	int __sb_mnt_want_write_file(struct file *file)
   492	{
   493		int ret;
   494	
   495		sb_start_write(file_inode(file)->i_sb);
   496		ret = __mnt_want_write_file(file);
   497		if (ret)
   498			sb_end_write(file_inode(file)->i_sb);
   499		return ret;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
