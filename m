Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3617C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 02:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679366951; x=1710902951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5pK+5dShW+n3tErteR8QnvKKMyxmY1LcSzkeV1UXM5U=;
  b=ErQJTM7NkFWaOUoeUJtiAYDXlrFFjokqZIIyFdAOsYuQdATtMgZ6rFGR
   lSC1YT1twzzfCUs7JR8D6utDSlMXhdcdRyEOPjhosoNSEGQSlsY99AluE
   7MS1vwko0euk7e0LJeLdzgg2Ar4ME22BPgi0lmxhnPnFiyizvpqz6xPmx
   DvK1elPvgaxIbymn0+RLyztI80b0mPyqyhz4EbD6GcIAZY688XZ7Et7Mk
   x/3xkrIGrDfp5O1tiSG9sHLrC9XoGjWBBBSug1gwohDdCETaGEiL8u57d
   snHlvP17l+k9DgqGFySdR3eWAp0kL8dVBR2/oxFGHuXTOPhO9FuD1xReY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="366559397"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="366559397"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 19:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="683684140"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="683684140"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Mar 2023 19:49:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peS3g-000BWc-02;
	Tue, 21 Mar 2023 02:49:08 +0000
Date: Tue, 21 Mar 2023 10:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 5/10] ERROR: modpost:
 "__static_call_update" [security/keys/trusted-keys/trusted.ko] undefined!
Message-ID: <202303211037.xiypoWgP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   fb748cd6c87665bb30d314dda05d536fd455dfef
commit: bd36c3a0b45ee0fb80d57718f00ea4292a071906 [5/10] static_call: Remove static_call.h dependency on cpu.h
config: i386-randconfig-s001 (https://download.01.org/0day-ci/archive/20230321/202303211037.xiypoWgP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=bd36c3a0b45ee0fb80d57718f00ea4292a071906
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout bd36c3a0b45ee0fb80d57718f00ea4292a071906
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211037.xiypoWgP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__static_call_update" [security/keys/trusted-keys/trusted.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
