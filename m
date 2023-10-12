Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB592AB5E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uw+t8vhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697129748; x=1728665748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P42gYFO39P70YOnjJVnXaLEZCSp1MN920qiuRTiDZcU=;
  b=Uw+t8vhmKSLf7TPzY9pAiVwU1mEIfqqwx6bU5TALFQhFa0riSE/QZEUn
   zENqaEoRy0OsHwJuZk6e6vmlgfktzML4HTQbVdR03i//wLXDjhZxBiYTs
   eKmi8YG32qJAvbuSVX6+mmBvOjJ7zQLlpJd0thtQolbVDGfY6MmDuhxJ6
   ZodDVhBQoGamrR34DFB/Dk6L47h1MES5Swn5sUziPXTCd+S7W7Pwq3CIu
   RjczSQTHGpcEWJAEI+/6J7HE7137Q3//7RBYY5fOcJZDsVNHaF9pNJTQL
   GaRmSAX3uBh6CKQaNZW2krr5BQXvmMQZKRB/Hshlt1ZZfKQ80NxDuXtw+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375329553"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375329553"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878174179"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="878174179"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 09:55:47 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqyyP-0003fF-00;
	Thu, 12 Oct 2023 16:55:45 +0000
Date: Fri, 13 Oct 2023 00:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 69/196] checkpatch: ERROR: code
 indent should use tabs where possible
Message-ID: <202310130039.jkjTxwNO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   899711ed1c90b438d31e322d1b0638b328435963
commit: 513fe54f7475c9b4aa30d8a56f3d43725fe91b1d [69/196] arm64: dts: apple: Add initial t602x device trees
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130039.jkjTxwNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130039.jkjTxwNO-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#1090: FILE: arch/arm64/boot/dts/apple/t602x-die0.dtsi:23:
+                <0x2 0x8e10c000 0x0 0x1000>;$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
