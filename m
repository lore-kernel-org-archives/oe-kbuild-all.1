Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB51524C62
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 14:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CGDbqD3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696946502; x=1728482502;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2XLnQ70zvHsnwN4ACiWxIB0ef0lD8B3fs5HLp8dUayk=;
  b=CGDbqD3Yc4ZonxWlXib0ckfLG75VmaeP4mfG286fR3pVbYOqck78iJQu
   QAvkt/dsXq23NMt6HPBlYOuW1UlelkoRX5XxOknp3NeeKIeqv029DpbzO
   lovCSlVinpGH814vTZ0X5JCbUkZ9eeg9A0tHo5ncVz9jZXMXu1AartcsK
   5lEPewpQAeb/tM/gLOHdpfBwpYXI7Z0wPOFWdqJ7GGHp2tEHsU/jX6/v1
   o/x4ameg5mBr0+8KW5K8TxKmQ3VMNJN5JA6ZHQ7KVeIwwkYXP9rRY31y+
   eX3hpL2zK8nAk1N1A6b6XZocrgxhveOo6h05xRCjEb+8LLt72Q/SGaAyj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="415414702"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="415414702"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 07:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="844141091"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="844141091"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2023 07:01:31 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqDIf-0000XE-2P;
	Tue, 10 Oct 2023 14:01:29 +0000
Date: Tue, 10 Oct 2023 22:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 30/38] checkpatch: WARNING:
 braces {} are not necessary for single statement blocks
Message-ID: <202310102129.vHI3N9oV-lkp@intel.com>
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
commit: d86202b1759ec45968dd814a2f397fe866af743a [30/38] WIP: mm/nommu: do_mmap: translate executable mappings
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102129.vHI3N9oV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102129.vHI3N9oV-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for single statement blocks
#24: FILE: mm/nommu.c:1218:
+	if ((vma->vm_flags & VM_EXEC) && result >= 0x3d800000 && result < 0x3e000000) {
+		result += 0x43000000 - 0x3d800000;
+	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
