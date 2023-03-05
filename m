Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A903D60
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Mar 2023 22:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678055869; x=1709591869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T8Oi5su8Z6tJ8BjBxF1HAmUapAajvP7vAZAjvslSJJo=;
  b=iFwRPZD3tpxk1ypZyqADCYT1NRfXojFP5raNvfECDt9iFbbzvBaFaq1a
   k+4oUqH1rGw1JEynSUDnDho3BIe5yvYPOAXGO+gDH2Y+04vXFp9wHQwlC
   r8XLgGlRo68O3kRwaGeW1pcrenq3qXJI4AhyonFegZpJYW7VfHbtX3dMx
   rpRlYl91Gw4us2ZSd9dgDhcC9GY4pb+ncKkxG74kySu0vMx4BYrjaHkFV
   pQM5qGgr7IkQ0+t+RFzwpfwr0he3CztGC4vk5HsjuUQdTrLF5zQyyalaN
   Q73J8idDYP3ZS86IPDwFbNpcOcOD36HSfwdald/LzPnu2T7yfCD7H9sHP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337747911"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="337747911"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 14:37:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="819104265"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="819104265"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2023 14:37:47 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYwzD-000380-0V;
	Sun, 05 Mar 2023 22:37:47 +0000
Date: Mon, 6 Mar 2023 06:37:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Dutta, Ranjan" <ranjan.dutta@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [intel-lts:5.10/yocto 4712/30000] htmldocs:
 Documentation/driver-api/rpmb/introduction.rst:79: WARNING: Unexpected
 indentation.
Message-ID: <202303060654.qWVb37Hm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tomas,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   abd42491338c1d15ac7f00baaa8490063545737e
commit: fb747b5c957573a326bc1b50a94395bb1f7c3e36 [4712/30000] char: rpmb: Document Replay Protected Memory Block (RPMB) subsystem
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/fb747b5c957573a326bc1b50a94395bb1f7c3e36
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout fb747b5c957573a326bc1b50a94395bb1f7c3e36
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303060654.qWVb37Hm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/driver-api/rpmb.rst
>> Documentation/driver-api/rpmb/introduction.rst:79: WARNING: Unexpected indentation.
>> Documentation/driver-api/rpmb/introduction.rst:80: WARNING: Block quote ends without a blank line; unexpected unindent.
>> Documentation/driver-api/rpmb/rpmb-tool.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
>> MAINTAINERS:33827: WARNING: unknown document: ../driver-api/rpmb

vim +79 Documentation/driver-api/rpmb/introduction.rst

    73	
    74	A parallel user space API is provided via /dev/rpmbX character
    75	device with two IOCTL commands.
    76	- First ``RPMB_IOC_VER_CMD``, return driver protocol version,
    77	- second ``RPMB_IOC_CAP_CMD`` return capability structure,
    78	- last ``RPMB_IOC_SEQ_CMD`` where the whole RPMB sequence, and
  > 79	  including ``RESULT_READ`` is supplied by the caller.
  > 80	https://android.googlesource.com/trusty/app/storage/
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
