Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D60210FB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 04:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745988241; cv=none; b=ON7x6YR4T4mxoQ6YGKxMVt1ITZjXU+RsS/1KIWj+NpL+gqGIK+AcvXlxQR/keCGtoHq31eIHZz3LsoDCpRflZKhjzMY2zeJS28dxPyg8zalp+ClmFIW/2AE+dr2HOC4A8UOlIconZ4clDWwkHL5Zka6ApEqKM05pWL0HmplANLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745988241; c=relaxed/simple;
	bh=02gK4hyXbGF3IxjzU5rukMyEBvMWGP8tbNFrrIGk454=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U88/3JxkGwDwfVZ1itM9GG062Le3anQM2Ht2TH89C+4t0Fjd+0h8BnxnwR6JoV0TP9pHEHBhadX/QDEGrFZZ5Ebnu/18zVZ5I8ua0CUJr38ztOcvZ1rnwZFYvH/5qESVm6csZ0aktZoRdIfz5L33DiUF9IT/HtAprxzrrEgCvsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wb8/EFDS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wb8/EFDS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745988239; x=1777524239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=02gK4hyXbGF3IxjzU5rukMyEBvMWGP8tbNFrrIGk454=;
  b=Wb8/EFDSzclFfxjofYN8RJJmp21MkveuA99suYgJlJbPPk3g/tpBDUXx
   DZV2hvo/HtFQ6ccES0Mds8JNbS7oNkbFqu617SHMpXsHvR7ymuR2OSclA
   Thu720ideg48KwLmOCDqmrLOonM3szP5CiIIqWmVmk/cmoRGvyDq4DSar
   ytC5ZNJikO6Bn9A8Jel/mWpQ8d4K1Siy/K7cDAqzW87rU8F10BabmoQjy
   hnxdgPTdhVCaIiS73FJtv6Unh26/H6Ack5JIuN8xcCBI/+yjkzuXrgM8g
   QOST0qydvuA93N8mHK8SDdAHnOw8GeLH0OnnFEQIQNo/GFrMAtaChiACY
   Q==;
X-CSE-ConnectionGUID: PlLKCOsTRyi4zaWwqXCj7w==
X-CSE-MsgGUID: 7r5aHg3kQe28YTRqD1VrnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="46751979"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="46751979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 21:43:58 -0700
X-CSE-ConnectionGUID: Pm5NU9YRQciHNsRZqb/rOQ==
X-CSE-MsgGUID: /tGiKqQCQz2H6KdUnxKtYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138988726"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Apr 2025 21:43:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9zIY-00039t-1h;
	Wed, 30 Apr 2025 04:43:54 +0000
Date: Wed, 30 Apr 2025 12:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 42/42] drivers/usb/typec/ucsi/ucsi.c:2000:
 warning: expecting prototype for ucsi_con_mutex_lock(). Prototype was for
 ucsi_con_mutex_unlock() instead
Message-ID: <202504301239.wx3N8Utw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   38b4da75dbfefe3a6f89f52be6d65de0f650358c
commit: 38b4da75dbfefe3a6f89f52be6d65de0f650358c [42/42] BACKPORT: FROMLIST: usb: typec: ucsi: displayport: Fix deadlock
config: arm-randconfig-004-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301239.wx3N8Utw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301239.wx3N8Utw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301239.wx3N8Utw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/ucsi/ucsi.c:2000: warning: expecting prototype for ucsi_con_mutex_lock(). Prototype was for ucsi_con_mutex_unlock() instead


vim +2000 drivers/usb/typec/ucsi/ucsi.c

  1994	
  1995	/**
  1996	 * ucsi_con_mutex_lock - Release the connector mutex
  1997	 * @con: The connector interface to unlock
  1998	 */
  1999	void ucsi_con_mutex_unlock(struct ucsi_connector *con)
> 2000	{
  2001		mutex_unlock(&con->lock);
  2002	}
  2003	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
