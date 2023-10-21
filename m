Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DAC182A3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hk4IVXGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697901798; x=1729437798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QrPwqfVzv/EEoQmBDLK0+L+viA2tgEaLCG254X5IdKc=;
  b=hk4IVXGVukk6pWN4k3xhPGfYYuB8mb5Drdc1ndPdJ473qJQwYx7exqlK
   GK5pvQ2tVMR2NuD6yiXASMwkTnmShHqQ+5A1ruIJj7ZuI7QPUygcYFPv7
   sye1xbjWIyPHhGtDJs6o6PF8v22ZNfIePyEZgX6/kPmCHvwcIkProz35t
   7ZAzxq1RVPGD4FbaNoDz669q65lDweQtwilHKFUyyySlAMuaAXWNl+/eS
   ZSz7CL/xLOWColdN+Ss113CYbG36qXnMe9ylBeA+GnMjCwl/JtpEw7wOv
   +eFEJjvjoPig9WqGH2QiXjqc1BViGfuhjjDZhDCFm1upBPfe4fkjl95ou
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="390526002"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="390526002"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 08:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="787071850"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="787071850"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Oct 2023 08:23:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quDoj-0004xY-2s;
	Sat, 21 Oct 2023 15:23:09 +0000
Date: Sat, 21 Oct 2023 23:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 69/209] checkpatch: ERROR: code
 indent should use tabs where possible
Message-ID: <202310212330.qBnyRpyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   37f4315008c663a55629554adcfcae4e5d88fdc7
commit: 513fe54f7475c9b4aa30d8a56f3d43725fe91b1d [69/209] arm64: dts: apple: Add initial t602x device trees
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310212330.qBnyRpyE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310212330.qBnyRpyE-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#1090: FILE: arch/arm64/boot/dts/apple/t602x-die0.dtsi:23:
+                <0x2 0x8e10c000 0x0 0x1000>;$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
