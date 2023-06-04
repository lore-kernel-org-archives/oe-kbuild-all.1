Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9C23CD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jun 2023 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685868142; x=1717404142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJMt7m4k5+WaSVfQTvCc8gtd2DXExhXS7cMTnOC9DoM=;
  b=Apei/JQHB50orpKo089OKPI1sCiEMug+wGqFwFjxDNF5m27bDxlmjuF8
   TM8dmqrTQhihLEb6fDgLq8llLp9G0/2kcpPSXAfEIGtDXhLJkg6lwJcWX
   RaJHI+2jK+5+U9zZAxO5FWg2gwdWRl9FkuE6tk3xy9srkMPqqg2Ybz0VC
   d2EnxJ4HcRpFvnTr07Xr7h38WL/eAaEiYf0z5LRli+f8nGS1p4UwAwQNP
   NZN8yD/G96siEMlcyhVleFJUMGqcMflVEKA27+GP1pJOSI/L0NfGS1n1R
   MaP0dORpR1WyTDCFA17MXpUDD+irtCn7SY6ORYWKGupKHMZslCAp9GQCI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="356179021"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="356179021"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 01:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="708313694"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="708313694"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Jun 2023 01:42:19 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5jJb-0002Ut-0i;
	Sun, 04 Jun 2023 08:42:19 +0000
Date: Sun, 4 Jun 2023 16:42:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Dutta, Ranjan" <ranjan.dutta@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [intel-lts:5.10/dovetail-xenomai 1920/30000] htmldocs:
 Documentation/driver-api/rpmb/introduction.rst:79: WARNING: Unexpected
 indentation.
Message-ID: <202306041659.LEEUwjSo-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 5.10/dovetail-xenomai
head:   5610fff176c8ff3eb470b8270294bc7a7acb4a15
commit: fb747b5c957573a326bc1b50a94395bb1f7c3e36 [1920/30000] char: rpmb: Document Replay Protected Memory Block (RPMB) subsystem
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/fb747b5c957573a326bc1b50a94395bb1f7c3e36
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/dovetail-xenomai
        git checkout fb747b5c957573a326bc1b50a94395bb1f7c3e36
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306041659.LEEUwjSo-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
