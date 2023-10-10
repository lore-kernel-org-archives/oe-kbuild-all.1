Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A406D1DFF2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 13:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DDEiMFyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696945758; x=1728481758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZMjeUirLkAPAVw5PwYn2XeUXiHYwpNRbD0t65YlSkQ=;
  b=DDEiMFyvQXYuQI4wZ/9KTyalfmVUY+vy6dbsJ5cqG2xEfqT9C5Zexqh1
   V2mr4iDnOMeyjbBhoWLQl8c+eFXlhYRlgqBa7pVYARBAiNMpvs7RnijPG
   Lb93wgWbz77GecYVIpS+5ZNuPX4vA463WDtryAeRy3qX7qfy0VQXWD0+U
   TNOhF51sR35hxQYhY8yRzi0YN85yp+0g5zYzVSWjVMVgCY4gbixIBlOyY
   CSB3OPQytKeN5otv825YW64c8j3fudASEe+8BMMYXbsHiNVRKlhKRQgI4
   ee450b61cskADfnx6ZG/sjuIlz6ysslZmzs+V5zR+8IcB11Z0786CVV8B
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="2988858"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="2988858"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747073845"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="747073845"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Oct 2023 06:49:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqD6n-0000Vg-36;
	Tue, 10 Oct 2023 13:49:13 +0000
Date: Tue, 10 Oct 2023 21:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 11/38] checkpatch: WARNING:
 suspect code indent for conditional statements (16, 20)
Message-ID: <202310102126.91AY9Z8e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
head:   224f43124c24326eb21de553984a58d8528a48d0
commit: fbfe6aaf43966efa3b6911a69440c9da005bbc19 [11/38] WIP: irqchip: add driver for the ESP32 interrupt matrix
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102126.91AY9Z8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102126.91AY9Z8e-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (16, 20)
#119: FILE: drivers/irqchip/irq-esp32-intc.c:63:
+		if (fwspec[i].param_count != 2 ||
[...]
+		    return -EINVAL;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
