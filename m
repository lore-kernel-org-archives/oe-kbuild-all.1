Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3E417D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 02:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689732161; x=1721268161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DjLCXP+DIKRVBa8ry5v14q6nPzULDoEjRs6kd+llHt0=;
  b=PQHJev6dBIS5V82mArqY48/qeFEM6Etxiom63jDTE/U1DcChpmGkx3DX
   tPDPYSNK0Dg4CjXDbOQ6qYN6TRUyG6mfEnVwCAXLGF7rGzKoTCL/RkL7D
   X0DaGacBaHyqx3agzeUrntDdR+MDUdlFPujFfRaN2PUhF2hHwO4bY/VuK
   W5Yr/AYCIbHpx+7d0qs8RzJKkiwyS9oHzw0ZKZfLMEP7vx5U18F7U/Zes
   wsDS2oMwQlFdkkhHf6N3hKTtcI/Dwb2iHHjb2XNyRNvJUp64+bljDe5vY
   AE6pYnaV0QFhaOqnWTmAPmvlV4rioIOTG1NNrVl/GQliz1bkXJ7CslSxL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="452730371"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="452730371"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 19:02:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="674126019"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="674126019"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Jul 2023 19:02:39 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLwWU-00042T-2h;
	Wed, 19 Jul 2023 02:02:38 +0000
Date: Wed, 19 Jul 2023 10:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 130/168] Cannot find symbol for section 4:
 .text.watchdog_hardlockup_enable.
Message-ID: <202307191046.1AsuyX9R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Douglas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   71434b829327327088bdd3de43426e3f0437bcd2
commit: 1a46e6ec597bd31668c7daf1201616195dc2f57e [130/168] UPSTREAM: watchdog/hardlockup: rename some "NMI watchdog" constants/function
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230719/202307191046.1AsuyX9R-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307191046.1AsuyX9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307191046.1AsuyX9R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Cannot find symbol for section 4: .text.watchdog_hardlockup_enable.
   kernel/watchdog.o: failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
