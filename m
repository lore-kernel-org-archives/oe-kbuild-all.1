Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED421DFF4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="So0hQvbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696945766; x=1728481766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mhXblwuG6Eq7XkJXuXYqT+794q0DbbjZ37YtrWl0eiY=;
  b=So0hQvbNe4GiuodVpwSdWuz00owYkaN3HW4hyQ5N/kP9yj6/ymAjddJ6
   UUBPZ2tIqfhpbv6EUC+8x4ndC/W8UKOUP79uMa6EJNbOmbbl6daD41bv2
   bKmWhgATg0xxKTK7tpVeSo2l2+j62RhkIx5u02UZiGdm19WnE7QfrIliX
   pvxekASYDTIVrff21iOx5KkTgGQvT3RoIx0rvmhV9IEEXSSIx3l2X+heX
   HT+hPJ17LhNk4M/ldu0zsL08FquQsH/jyjoAyF3bdfohsECcifCsFmh8P
   LJgsZ8JlafX891u3jcbv8U/LnA5j2einAgSjBToArJQuBRsK02SBbbzkO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="5962432"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="5962432"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:49:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="823788513"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="823788513"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Oct 2023 06:49:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqD6o-0000Vr-0P;
	Tue, 10 Oct 2023 13:49:14 +0000
Date: Tue, 10 Oct 2023 21:48:45 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 14/38] checkpatch: WARNING:
 else is not generally useful after a break or return
Message-ID: <202310102114.th3gqJyQ-lkp@intel.com>
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
commit: 8264985b44b56ae0e4bc756d11424b7297ae34e2 [14/38] misc/esp32-ipc: introduce generic IPC for ESP32
reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102114.th3gqJyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102114.th3gqJyQ-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#161: FILE: drivers/misc/esp32-ipc.c:112:
+			break;
+		} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
