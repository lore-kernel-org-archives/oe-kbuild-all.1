Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B4AD21
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678996489; x=1710532489;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QOgeuCpumfe4P8CD24k0g+v50wlRWZt5aONT8lKvi5w=;
  b=QdNyRBHzeeqVATrX6Q1tMgR9MXui49XFQ0yF/bLD1n3SoUL09YK5pUPU
   99dB2hniW4gWNcwJbaKDaXJLaglhmwKauLQ4WDbp4OTCSep68smt8KXjX
   8EtPrd/SeWDoAvD4tHwhjPeDrAA+tZBcX4f/X1JzXbZ7f1kyIdCL8QCgd
   J7fCzW5nijKN75qNRsiJ12EGuzfP8uaCZ30wd+tTBXDLs8V654KDEmONY
   LTfM1TrBodrUk3/sMp7n8IYFZR0qC2cKJ1JThD3UGNP64HLtdITVJwwgx
   MRCdXGgLDkjddsx/+cHDiJnkaY3afXucoDcUY6O7u2d1xG4XFTeAoUOBP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338115116"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="338115116"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 12:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712486994"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="712486994"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Mar 2023 12:54:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pctgP-0008mO-2S;
	Thu, 16 Mar 2023 19:54:41 +0000
Date: Fri, 17 Mar 2023 03:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [plbossart-sound:hdaudio/extended-multi-link 37/55] htmldocs:
 Documentation/sound/hd-audio/intel-multi-link.rst:2: WARNING: Explicit
 markup ends without a blank line; unexpected unindent.
Message-ID: <202303170328.2q2okF5F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/plbossart/sound hdaudio/extended-multi-link
head:   f423930a1ce99bb84fac6fa397fc486113748ab0
commit: 979b29edbe5828b53d007f27e08b65515b4aa961 [37/55] Documentation: sound: add description of Intel HDaudio multi-links
reproduce:
        # https://github.com/plbossart/sound/commit/979b29edbe5828b53d007f27e08b65515b4aa961
        git remote add plbossart-sound https://github.com/plbossart/sound
        git fetch --no-tags plbossart-sound hdaudio/extended-multi-link
        git checkout 979b29edbe5828b53d007f27e08b65515b4aa961
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170328.2q2okF5F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/sound/hd-audio/intel-multi-link.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
>> Documentation/sound/hd-audio/intel-multi-link.rst:2: WARNING: Undefined substitution referenced: "copy".

vim +2 Documentation/sound/hd-audio/intel-multi-link.rst

   > 2	:Copyright: |copy| 2023 Intel Corporation
     3	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
