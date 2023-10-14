Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA62586
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bm177eBi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697275324; x=1728811324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rgYClhAwtEC7WW+4MJs19Begxvjgq++gia1Ii2kmm0g=;
  b=bm177eBiiEruAXDRpFGu1cfqgX8TBt9+IsDBtxt8F1cC5o25clmlPrhs
   0JroDVl4n3znUPVG/P7Men8g0KsyRB4h0TEwt9kJX63du+XTUjl6LXczh
   yRajsEhq5ra+oYl1r873SbVZtVUSfb5Zwdy9bhTFw3vCBIkqgbGT22tek
   EidXRpD2Dw74sygVWOvDw0GDR/wCOgDs3+1T41yDP0hSdauvagzwkMjfB
   8WKV3MZu1/wjvk3Zgem+KIRwH3ByEYcwqs3jxzyCuBnKpfIvdIHVRV0pP
   JU4jQwxp718s5gwYYJ98QI06/lckD0auZVnDLgqFx1WItJj+9BQS3rrha
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="449503163"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="449503163"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 02:22:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928710945"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="928710945"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2023 02:22:03 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qraqO-0005zR-2j;
	Sat, 14 Oct 2023 09:22:00 +0000
Date: Sat, 14 Oct 2023 17:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mkp-scsi:queue 8/25] checkpatch: WARNING: quoted string split
 across lines
Message-ID: <202310141713.ATkGRlkU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git queue
head:   b6f2e063017b92491976a40c32a0e4b3c13e7d2f
commit: b0597fd5a953833399bbb6be55337dd655060143 [8/25] scsi: imm: Add a module parameter for the transfer mode
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141713.ATkGRlkU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141713.ATkGRlkU-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPLIT_STRING: quoted string split across lines
#64: FILE: drivers/scsi/imm.c:61:
+MODULE_PARM_DESC(mode, "Transfer mode (0 = Autodetect, 1 = SPP 4-bit, "
+	"2 = SPP 8-bit, 3 = EPP 8-bit, 4 = EPP 16-bit, 5 = EPP 32-bit");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
