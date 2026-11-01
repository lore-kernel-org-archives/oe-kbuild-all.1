Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548242;
	b=YCYXEv+606GietXk6onrar7ML0Z17l0rxaQ/Wg3KsueVsbeZoeRicfhg29A4th1KSk3U
	 qXT9kZSHfX+8ZTjfRBLXbguLJvMc0mSvUNHnaTwyLqxVVhYCq2hGwwVkI1bqtNzeJWKGi
	 BAA3lwPZG7FeTAaKi77+YfdvfY0WJyRhxF+LKErKZL22kMrbRJZ6UKtqQcYx3fGwA68JO
	 so8RALOiRA/DBfCnvKKtGimlN+jTuAOV3G+Y198JSdwNtTW935uu5F8pp1vOmFlkxYmzI
	 Tl9pNW21np/Q7Pg8igyCkhh+YSJ5xUjr4ea32l40q9MTQH87laVo3GbTEo1B3eTTUNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548242;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wUAAPp+vl8tkXMV28jtvl59dlzwxo/YLDrWzAVKE6bI=;
	b=a/dOqg0IyITx6Pq8DeXLWe5ONZhGV1jjiI6/gdLu6nf1j/IxljOXGf27TOPOiHzzyQ7U
	 YItYbKqkyo9u3F2AN26j2usdNFHgguxEsekOiQBInlGpEMCv/RYUmk7+3e0Wm/+EzM2Is
	 QCT58oZfCX9cscuhRBahAGKF5e692sAR9/iDANC6dAsaKx6Z3n78WJZZOnrsFf9DS282P
	 XlwqspsQq4Hlx14mPMJt8MNJ8cjJa047PsegmvFV2sIevPCGkto1K3fOHzgrdlAAMOnUf
	 0PGwzMFBLa7LPGDp10wdmpKsjkCv5nkvQP+VHdiD152OsObJ2YpCC4gF7euhuT7qU9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QdCsgE+l;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82EA606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 15:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C82EA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QdCsgE+l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793548240; x=1825084240;
  h=date:from:to:cc:subject:message-id;
  bh=kjDw+uXhAntvVqhrzXm2Eb+Rs248wj5RESuE7MGRsiU=;
  b=QdCsgE+lBxU0bB9EW+Pc5Lza85/FG1m/aHqlkeAmKxcvhIEVbiSgoUtd
   uTLA3DcKkzApKlLkDUGSTpSZIaHtqr8ucFwRdTCCqysk/xTDHcPKU2LQM
   ghqJsFoZKhiG6Yp5O82qsr5eRM98pmitVsJBda+9CMJk6n26vsRlubch7
   ahDPRo/rwmC6ygrVNUBRaJ8RcSUr23DN47fydamJE5t4BqWXf4wNMjshH
   AG3T6yyZ8Sy7CfS38nQFoJla/x0Drpr60aHakMb5BSUSPIGvcWXc+fpNb
   u9R9rJv8qGGFpRivelko+avn8X+srpkI33LBl/ZnN12moiUmSV0LQB39U
   A==;
X-CSE-ConnectionGUID: 9RFesVVaSvaDbwGYXJwygw==
X-CSE-MsgGUID: POyU9kzaTvysvb0dQ5HARQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2271967"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2271967"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 07:50:40 -0800
X-CSE-ConnectionGUID: 5E3pkgPiRM2+Geazfl3rkQ==
X-CSE-MsgGUID: PbVCt/9IR9G5zCJjvmk7bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6039927"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Nov 2026 07:50:39 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNXpM-000000007uZ-2YUF;
	Sun, 01 Nov 2026 15:50:36 +0000
Date: Sun, 01 Nov 2026 16:50:25 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.procfs.cleanup 71/115] Warning:
 drivers/scsi/scsi_proc.c:394 function parameter 'buffer' not described in
 'proc_scsi_write'
Message-ID: <202611011633.gcSrjOtj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/brauner/linux.git work.procfs.cleanup
head:   149defb030fc6398856817bad7186556426e0845
commit: ed6b48ffe0acd59a47fd2ec1568abff7740cd25f [71/115] scsi: core: let procfs copy in writes
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261101/202611011633.gcSrjOtj-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611011633.gcSrjOtj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611011633.gcSrjOtj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/scsi_proc.c:394 function parameter 'buffer' not described in 'proc_scsi_write'
>> Warning: drivers/scsi/scsi_proc.c:394 Excess function parameter 'buf' description in 'proc_scsi_write' (did you mean one of: 'buffer')
>> Warning: drivers/scsi/scsi_proc.c:394 function parameter 'buffer' not described in 'proc_scsi_write'
>> Warning: drivers/scsi/scsi_proc.c:394 Excess function parameter 'buf' description in 'proc_scsi_write' (did you mean one of: 'buffer')

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
