Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D72F2A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Mar 2023 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679758567; x=1711294567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n/TjVjWNTRAG1jZMifPMrdPkDbA+rPApCrvv2Fwg7jY=;
  b=j5i7RjA5XijBb6o0uET67+GNsf1ENPenblhwxAbf9XrJNFqdQqAqMESc
   yrVEtI8tXgqVcxTncCQzcGWPvlU38Q4NZ+oLIL3vpUH5D3LYiunYMiCpb
   Y4AH2evMCMHRQH3Lenon17trxPPvyfqxay0GUwgHLEwsBtywuYXURcW65
   +ZR6SBbsJ3kl+fTQASQHDmlgB4wrOLjmG2Ms/+iM35KJk5gcHJ/pW7zNF
   GEmHFxuH9SV7BFoXgslQsuUorkW7inCxKzXQdjl0l9vIFQh/K3pgHBQvc
   4Sf+w1+ZZ6XbcqfXeFZlNGnvsQ/FBWNomQI+rilNoROMM0XPzfqVoTPOz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="426244686"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="426244686"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2023 08:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10660"; a="772207577"
X-IronPort-AV: E=Sophos;i="5.98,290,1673942400"; 
   d="scan'208";a="772207577"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2023 08:36:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pg5w5-000GLV-2a;
	Sat, 25 Mar 2023 15:36:05 +0000
Date: Sat, 25 Mar 2023 23:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 375/25663] htmldocs:
 Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline
 emphasis start-string without end-string.
Message-ID: <202303252345.oHz4eLyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saravana,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   13e656b3b5d58dcb8b2f70a368547be9c06a5143
commit: 2d4a45a8388023a4a1f35813cad0e2bab225047b [375/25663] FROMGIT: docs: driver-model: Add documentation for sync_state
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android11-5.4
        git checkout 2d4a45a8388023a4a1f35813cad0e2bab225047b
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303252345.oHz4eLyo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline emphasis start-string without end-string.

vim +215 Documentation/driver-api/driver-model/driver.rst

2d4a45a8388023 Documentation/driver-api/driver-model/driver.rst Saravana Kannan 2019-10-11  214  
^1da177e4c3f41 Documentation/driver-model/driver.txt            Linus Torvalds  2005-04-16 @215  	int 	(*remove)	(struct device *dev);
^1da177e4c3f41 Documentation/driver-model/driver.txt            Linus Torvalds  2005-04-16  216  

:::::: The code at line 215 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
