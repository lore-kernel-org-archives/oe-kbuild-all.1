Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86F7179
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 00:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692924300; x=1724460300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2T+jKDPy+/Mm7hFvTMk3qJSi94X86O8CjhJDKUj3iQo=;
  b=Vbyx6rgCBqKiQ7wOwbRrs7ca0W6NvSjP2wrFq0SbMftpofTbXWRlAcXL
   z8+BPLfdP4M69dzLjMfVWvoD+hrwnmOdftFxaQxCriS7wK3o58OcQ3NXu
   KD3Fmln2jqwG9hbGjHHVqhONI5MyyNTBRplZMrsy+Rm2nUJV5gXFMTSiR
   LWmZ4wXoIgD0sPShBt2Akn4WnxEXJWHXIrW4Lwr5k+A3GaK4fesHiUB3R
   r7WOY0xIH0xrlCrpFViVIW42Kz0ioJ7aC/+lmwAcSnEr8B8NmSk06QuJL
   HjJk0/UcKjIglPbwHHRXvI7vE/KEMIGFZ9oVxBeKxwpUNr29fiH5/ddND
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438541531"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="438541531"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="730852664"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="730852664"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 24 Aug 2023 17:44:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZKwZ-00035U-0X;
	Fri, 25 Aug 2023 00:44:55 +0000
Date: Fri, 25 Aug 2023 08:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: [linux-stable-rc:linux-5.10.y 9990/9999] test_set_error_stamp: rm
 /kbuild/obj/consumer/x86_64-defconfig/.reduce_errors/arch-x86-lib-retpoline.o:warning:objtool:.altinstr_replacement:unsupported-relocation-in-alternatives-section
Message-ID: <202308250836.EC6Ck8DK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   78bdf347b342992291284fd060ee34dbccf570a8
commit: fbda31ad0b4265bd0f261f4bd57b10cacce55d2b [9990/9999] x86/cpu: Cleanup the untrain mess
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230825/202308250836.EC6Ck8DK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250836.EC6Ck8DK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250836.EC6Ck8DK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/lib/retpoline.o: warning: objtool: .altinstr_replacement+0x90: unsupported relocation in alternatives section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
