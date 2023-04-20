Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9095661
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 11:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681990781; x=1713526781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DwFWF5nQP95V46znnNwEVcYKrb8C0IURQYrgE26eRMw=;
  b=IURVAe00Dtq6x9NFz7GQOBQsX3CqTnvlOzPhfbmgdybb280IEyJYqBhF
   YOMn56JLULPIqD0IJkk5WD9EGM8mSDu7iOUOcm04FCXZDRTanWspTMIiw
   2YxSM9+PJhx7UYkTylvZ0swYH4CGk3FxuSWgM+QPPsqpFeOM+NilUJum+
   cJdx3iHYc8kgFSGZdgpOP8dEVes6goLAyaFaNM5dy8yaxTVZUrkvBp468
   rgBEJaFngA4QqLx7HUrL7KEzkMkAuk32kk6dlkWP15axAHibLLuqPzEQC
   46WUh01tevqgBJzVN5yPUTHD2JKGeE8TuX+7Jwvlj3Ac3+MjGqY2b3LHM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344461555"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="344461555"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 04:39:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="722339599"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="722339599"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Apr 2023 04:39:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppSdX-000fnO-1H;
	Thu, 20 Apr 2023 11:39:39 +0000
Date: Thu, 20 Apr 2023 19:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.10.y 275/658] htmldocs:
 Warning: Documentation/filesystems/erofs.rst references a file that doesn't
 exist: Documentation/filesystems/dax.rst
Message-ID: <202304201942.B7K30sGn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.10.y
head:   96c28582d8552c93401eab0b17b0e38a698d6db5
commit: e9de2f5d7502211fea93e88391c39853068a15c5 [275/658] erofs: dax support for non-tailpacking regular file
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common upstream-f2fs-stable-linux-5.10.y
        git checkout e9de2f5d7502211fea93e88391c39853068a15c5
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201942.B7K30sGn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/filesystems/erofs.rst references a file that doesn't exist: Documentation/filesystems/dax.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
