Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD945957
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 12:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcJulQuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700136537; x=1731672537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BOb/8RhNlKkC0rdxULxYcCwlK+TEhj2aqR5Z1u+geKk=;
  b=VcJulQuFbQVpanMdHFC16MLjgtIch6DfCR6APcLJvZ7ZinuPki8N5S2N
   nHfb3aTfbpex+K97Ngg9cL0Z8/Ez0wNbLDJKyh1s8+hQkhRw8GVfp/8ne
   gRPACNTBJIV1Qth/2oyEX6e93Fdw92u/E/k83zyP1veGCBrceUeLnCXJN
   dhOMe0ufRmwzsslzaCQc0mtr/5ct70uxc9Ab9zRjTyK9rvfzUUCwTAiFa
   m2VR4PwfZDeS63ZhuobwAEs2ptDQ7Qm80ji7SG0KGoh3DLv1J0mJwKCgQ
   +ePJDfSFK+bwrW3STqnsGdt5D5TLFheEEB/GUbKkFF9bOTWiiGI+qbC+1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="389934131"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="389934131"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 04:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="758818120"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="758818120"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Nov 2023 04:08:54 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3bAy-0001cg-1L;
	Thu, 16 Nov 2023 12:08:52 +0000
Date: Thu, 16 Nov 2023 20:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2462/30000]
 drivers/staging/fsl_qbman/fsl_usdpaa.c:376:6: error: no previous prototype
 for 'dbci_portal'
Message-ID: <202311162040.c77bnPkd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Madalin,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: d30d0c1e963944b56c0b21744b1996039fa4eb8c [2462/30000] config: add SDK QBMan driver
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231116/202311162040.c77bnPkd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311162040.c77bnPkd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311162040.c77bnPkd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66,
                    from drivers/staging/fsl_qbman/fsl_usdpaa.c:26:
   include/linux/fsl_qman.h:415:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1679:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   In file included from drivers/staging/fsl_qbman/fsl_usdpaa.c:29:
   drivers/staging/fsl_qbman/qman_low.h: In function 'qm_shutdown_fq':
   drivers/staging/fsl_qbman/qman_low.h:1291:29: error: variable 'dequeue_wq' set but not used [-Werror=unused-but-set-variable]
    1291 |                         u16 dequeue_wq = 0;
         |                             ^~~~~~~~~~
   drivers/staging/fsl_qbman/fsl_usdpaa.c: At top level:
>> drivers/staging/fsl_qbman/fsl_usdpaa.c:376:6: error: no previous prototype for 'dbci_portal' [-Werror=missing-prototypes]
     376 | void dbci_portal(void *addr)
         |      ^~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/dbci_portal +376 drivers/staging/fsl_qbman/fsl_usdpaa.c

16ff861424bca7 Madalin Bucur 2017-05-10  373  
d74c7bad305495 Roy Pledge    2017-05-25  374  
d74c7bad305495 Roy Pledge    2017-05-25  375  /* Invalidate a portal */
d74c7bad305495 Roy Pledge    2017-05-25 @376  void dbci_portal(void *addr)
d74c7bad305495 Roy Pledge    2017-05-25  377  {
d74c7bad305495 Roy Pledge    2017-05-25  378  	int i;
d74c7bad305495 Roy Pledge    2017-05-25  379  
d74c7bad305495 Roy Pledge    2017-05-25  380  	for (i = 0; i < 0x4000; i += 64)
d74c7bad305495 Roy Pledge    2017-05-25  381  		dcbi(addr + i);
d74c7bad305495 Roy Pledge    2017-05-25  382  }
d74c7bad305495 Roy Pledge    2017-05-25  383  

:::::: The code at line 376 was first introduced by commit
:::::: d74c7bad3054956cf086061d138e3929718bc6dc fsl_qbman/usdpaa: Invalidate software portals before use

:::::: TO: Roy Pledge <roy.pledge@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
