Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA108C09
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 18:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680200466; x=1711736466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79U4Et4Dj+Bq2N13kFMDOjSXuT+zZqNqA+Cec4M9vdk=;
  b=E0tg/uVxlY1gybXKMoENRkbtlugMmV5nTDcvPgEFQ8SWxErxvvYHKkHz
   A5O1QXGYHAl2uY8QNPxpQzT7kR6e/A3Fcfuc9unZhAnzECzFj/c4lml6V
   mb51p6HwL9lEgAo7ijVJu1Dc/6gCeO12NLgd8hiRmbTXu6RefgGGnAYmo
   4ZHWci6d2FeGvfYEMByBxILH1wMhSaxPAWvfqpxBMSgO+c392SoV9hHlv
   GaS5IaZtRwmLBxOSjfaedRcybpfSjYhL0QMZ9SLVO7y17wzB4Io+R579K
   jnI0K1NVV8ClgDaqGbcydpuHCS3DbSTnAsS2NzjCFcYawCShG94PaEB5V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="341267262"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="341267262"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 11:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="859010400"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="859010400"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Mar 2023 11:21:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phwtU-000L52-0X;
	Thu, 30 Mar 2023 18:21:04 +0000
Date: Fri, 31 Mar 2023 02:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.4.y 505/975] htmldocs:
 Warning: MAINTAINERS references a file that doesn't exist:
 Documentation/filesystems/f2fs.txt
Message-ID: <202303310256.MrxYO2Dl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaegeuk,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.4.y
head:   493f9241a6b8df703431ca8204a1dba1ccc05256
commit: 510e16de6b283b071f584c6aabdff7acf1831600 [505/975] f2fs: remove obsolete f2fs.txt
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common upstream-f2fs-stable-linux-5.4.y
        git checkout 510e16de6b283b071f584c6aabdff7acf1831600
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310256.MrxYO2Dl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/filesystems/f2fs.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
