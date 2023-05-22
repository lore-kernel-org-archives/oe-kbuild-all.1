Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632459445
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 May 2023 09:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684748432; x=1716284432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EL6JBuGuCHV8qf0e+BttEZbwC/v5HO1kmQPpBBmAP4w=;
  b=F2Jc3RdHbq4gZlprdwJlJJpv2bXSfcjXtLhXUjGFuRLcdHnM47STijrb
   ynXgwuk2m8zIki1eaGUGCCTJjp17Ennp2ela0N5oC0qGsr5iAq+YEVsrV
   djdrsoj/1uPsd95lrjXiqUlYGsnBty74KUqt6RuftZvqvtlNMS5MNPh1J
   pJYD7/Mixxzi+/cKQthjIPDm8d3gq6oMnfhcy9hmukPyzRUrbFBBB/uaw
   zcw+MCAOj3TsyLlrYY4UrqB2mXfgFHw80Sp/CuVGBDV+OdglP5Yao2uSR
   JVFF+FRMkvXauapRMkc8DWGSbd41w9VC/amfW1PDjWi0TlThz/nb6SEgO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="439228454"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="439228454"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2023 02:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="877697870"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; 
   d="scan'208";a="877697870"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 May 2023 02:40:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q121l-000Clf-1v;
	Mon, 22 May 2023 09:40:29 +0000
Date: Mon, 22 May 2023 17:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Dutta, Ranjan" <ranjan.dutta@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Subject: [intel-lts:5.10/preempt-rt 2808/30000] htmldocs:
 Documentation/driver-api/rpmb/introduction.rst:79: WARNING: Unexpected
 indentation.
Message-ID: <202305221705.HunOXYrr-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 5.10/preempt-rt
head:   6f211f0eec79ebd4a63616dd92fe79e50e39b81c
commit: fb747b5c957573a326bc1b50a94395bb1f7c3e36 [2808/30000] char: rpmb: Document Replay Protected Memory Block (RPMB) subsystem
reproduce:
        # https://github.com/intel/linux-intel-lts/commit/fb747b5c957573a326bc1b50a94395bb1f7c3e36
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/preempt-rt
        git checkout fb747b5c957573a326bc1b50a94395bb1f7c3e36
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305221705.HunOXYrr-lkp@intel.com/

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
