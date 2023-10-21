Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4F7379
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 00:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfM3Y22k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697849020; x=1729385020;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rogP8ZwQEfUqO6hiQ7efbQWO1mLeWsgvpn0snePYOuU=;
  b=nfM3Y22k9Gxz+PXmlb0857W4LE0cZXe+uMX+F9CPmVJkmyRALbYm0uIY
   ShKEwVarA3DQOwx2UCJnMtIB82PoV031x53ke6DiGmP3NVzrCZK4a75Aj
   IkE0ZuMQv7/VC2egvF/WeiW54umgn/uT+N05kYR7l2x87e04Z4vyW4oIC
   aj1GREe1pI6bcwNVa+F7zGqjLs1n0cdmYhfAXfvgJ/ktQo26OvL+PDeRj
   ZaI9YL/QnkRRsV3bu1vHi8vW7QJASYcbIT2mm2qy8I80O+4dF2G7wsUxm
   MXffZjshxZGLiFY2ACGg4jVNz6o8JHyMozkfBBaxiNZsyj/pbQe3MPCdB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="453075571"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="453075571"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 17:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="848247301"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="848247301"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Oct 2023 17:43:38 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qu05Y-0004B4-0F;
	Sat, 21 Oct 2023 00:43:36 +0000
Date: Sat, 21 Oct 2023 08:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.6-rc6-esp32 37/43] checkpatch: WARNING:
 Consider removing the code enclosed by this #if 0 and its #endif
Message-ID: <202310210828.pXUntDnj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc6-esp32
head:   7b60fbaf629519456a4de1b76bf9edfb331ffb50
commit: c34cbec4c804156cb51afaaf146e550c4c1d8134 [37/43] WIP: perf: support mmapping event on noMMU
reproduce: (https://download.01.org/0day-ci/archive/20231021/202310210828.pXUntDnj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310210828.pXUntDnj-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:IF_0: Consider removing the code enclosed by this #if 0 and its #endif
#32: FILE: kernel/events/core.c:6529:
+#if 0

WARNING:UNSPECIFIED_INT: Prefer 'unsigned int' to bare use of 'unsigned'
#108: FILE: kernel/events/core.c:6639:
+static unsigned perf_mmap_capabilities(struct file *file)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
