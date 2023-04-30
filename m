Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D657D198
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Apr 2023 02:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682822059; x=1714358059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VLDnEpfHdvzK19hgl+BTtq5GNfDkxwP0xfNlW12iQR4=;
  b=eRIJuGWbb8DiIJRwyj7ryOTAA93SQAc5WD7+DkSWLsd11YI1S+8Oy5f0
   yJmWO5WaX3dWfDc5ZGwhdzgGeK5LPcF4JGghGtp92Vw0TXhYcug42xELH
   Fl7LIEq2AxmI4WwRutOVt6VjkUf9XxMUIuPscB42Hzz5EAzrNmDYOdDA3
   bmJdkUHFHpkzuw4OycvnYiF1rNxQqlnAD4E2uJW71PbHa/QiftfSPw770
   PZ3WFCJQvomrWd5IYVwbe2HmqfXstpti020rkgTlKVennT+cnlcsX5IPj
   vnXwxwWx1KAslsPlGf83z5vNEF9yogckJmNZfTOww3ackCJX39OicrypX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="328326170"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="328326170"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 19:34:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="698095118"
X-IronPort-AV: E=Sophos;i="5.99,238,1677571200"; 
   d="scan'208";a="698095118"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2023 19:34:18 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pswtF-0001TZ-12;
	Sun, 30 Apr 2023 02:34:17 +0000
Date: Sun, 30 Apr 2023 10:33:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 12507/27008] htmldocs:
 Documentation/arm64/amu.rst:26: WARNING: Unexpected indentation.
Message-ID: <202304301027.48NRsFfc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ionela,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   d5ed2ca98e482beb70819315665172025f8a3bc6
commit: 7adeb94694a689cd20d41e1405e493a4b17a7289 [12507/27008] UPSTREAM: Documentation: arm64: document support for the AMU extension
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout 7adeb94694a689cd20d41e1405e493a4b17a7289
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304301027.48NRsFfc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/arm64/amu.rst:26: WARNING: Unexpected indentation.
>> Documentation/arm64/booting.rst:250: WARNING: Unexpected indentation.
>> Documentation/arm64/booting.rst:256: WARNING: Block quote ends without a blank line; unexpected unindent.

vim +26 Documentation/arm64/amu.rst

    23	
    24	Version 1 of the Activity Monitors architecture implements a counter group
    25	of four fixed and architecturally defined 64-bit event counters.
  > 26	  - CPU cycle counter: increments at the frequency of the CPU.
    27	  - Constant counter: increments at the fixed frequency of the system
    28	    clock.
    29	  - Instructions retired: increments with every architecturally executed
    30	    instruction.
    31	  - Memory stall cycles: counts instruction dispatch stall cycles caused by
    32	    misses in the last level cache within the clock domain.
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
