Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE552907
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 15:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676387596; x=1707923596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WpTeNJGC+58QwSEozjaO7NNlxHhSkz/mZX6irXdaVR8=;
  b=W1Xa0HRU6HqYYbUTSmIqYR8dJACOhLB1iUiQbdwEoPhD7L4akCQfoVwq
   3uvucx12VTX1ebLQtxwf75nYRUQ0zgIgRRWox2lY+iz4TGe0JI9Z0JTeF
   ega+f27iowBTc2F/bFz3OUHYQdw9XIiSCpCV14cqFaiqDE3idTsTkb49Y
   stGkoOng2tnYMoSXuUBM+iXJS62KVhYK5d/5zgPVckqopE6W23Vyeqz7x
   oh2kHydUe1kwMpc+EhSFCp+wZ1M6HqONlhSVKFM9l+RJFDJomnEXTYLba
   vupfZlUfp6iqq9VQ2gOgeBq4xivsIsWtasB2elF2PrWDK/ikl6H1WNQV7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="331180752"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="331180752"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 07:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="662565016"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="662565016"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Feb 2023 07:13:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRwzY-0008aP-2W;
	Tue, 14 Feb 2023 15:13:12 +0000
Date: Tue, 14 Feb 2023 23:13:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.4 16/33] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
Message-ID: <202302142307.EmHKwsdF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.4
head:   5cb1abec5ca7f2341b8ac90559bac242d55e5e01
commit: 91c05e94ed2ca3ae6fbbcdd365004ca7ca07a4d7 [16/33] UPSTREAM: media: dt-bindings: Add ch7322 media i2c device
reproduce:
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.4
        git checkout 91c05e94ed2ca3ae6fbbcdd365004ca7ca07a4d7
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142307.EmHKwsdF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
