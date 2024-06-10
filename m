Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E46815216E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 23:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060859; cv=none; b=O+S2AhOqgYsPmGe0D2DwxZnmWdxDDM3dSY89HqydU9Zg/PZLcpywvHM4kCmbZ9QCEyhIrAg436muwEM3toTbNFxBwyKo28PvqFBjWNZoSOFYJ/6mOQjLxQ0z7R+jphELsUaNm9Sr/WNjqGxdWOxIG7nJoe2Wq/LKp/ACGNeIFMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060859; c=relaxed/simple;
	bh=G3OxxTeeZW3NrIFUy9+Ghm5HVStxOaqOGw1gI6s4p5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBMakyR62z3ukXZVts2clsK91lEDkqolx+H3M4uS3MO5/a9z9ghlz/rAn5dkzXyU6rTBeQEydJYS/Kn0OMJ8iLVfslWd1iMGr5tvpQFWufGZfRtoqUbKE4MEjuOGTxIBq7CXoUga2i04l2ciDivjFvDMw5RTcczth36CO6ZaYto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTJyAmMq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTJyAmMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718060858; x=1749596858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3OxxTeeZW3NrIFUy9+Ghm5HVStxOaqOGw1gI6s4p5U=;
  b=hTJyAmMqutDkJduc9ZusIMuPVylTFqf+nSlklpY3cD5YBeiX65+BFbiq
   bnSyRdMDruk7IjH4267P3FDPmHxjlVCM4di0Ebia3s3JWNeCQKvz4+212
   ADXNHXlmNCXVv7jwBtX0NgXi7xSfMVTlAfF1zUCByeK1zt2yb2dvy3/eO
   wg73EOBOmI6rssdEp1ySmaR5HU2pqIFSOBA1DEtnmuDyx/CzqnmCEJSgm
   WQmxyFjpspq7d/kOKI5NT0NWJKV5mhykJdeJXMnk3GmnJV4b9XvlCIVcp
   n+6/+NzfieLf0HFgIt9/LrvhHWbGoNjWTLQGKVAs59/AiwTN2eR7QN/Jw
   w==;
X-CSE-ConnectionGUID: ugYqUlVtTkW9vPIHCrefZw==
X-CSE-MsgGUID: Mno7OpUMTP+1K0lWzG0+zw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18601308"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="18601308"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 16:07:37 -0700
X-CSE-ConnectionGUID: ytHtKxsbQdqhJg7eABNZeA==
X-CSE-MsgGUID: Lx2SDY+sSVSqTQCW2LRApA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="62386458"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jun 2024 16:07:36 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGo6w-0002Z7-1i;
	Mon, 10 Jun 2024 23:07:34 +0000
Date: Tue, 11 Jun 2024 07:07:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>
Subject: [tglx-devel:devmsi-arm 25/25] kernel/irq/msi.c:31: warning: cannot
 understand function prototype: 'struct msi_device_data '
Message-ID: <202406110704.Imy7B0rf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git devmsi-arm
head:   c0f9480169244284eb4f7bc656ab52d03a5badd4
commit: c0f9480169244284eb4f7bc656ab52d03a5badd4 [25/25] genirq/msi: Move msi_device_data to core
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406110704.Imy7B0rf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110704.Imy7B0rf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110704.Imy7B0rf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq/msi.c:31: warning: cannot understand function prototype: 'struct msi_device_data '


vim +31 kernel/irq/msi.c

    23	
    24	/**
    25	 * msi_device_data - MSI per device data
    26	 * @properties:		MSI properties which are interesting to drivers
    27	 * @mutex:		Mutex protecting the MSI descriptor store
    28	 * @__domains:		Internal data for per device MSI domains
    29	 * @__iter_idx:		Index to search the next entry for iterators
    30	 */
  > 31	struct msi_device_data {
    32		unsigned long			properties;
    33		struct mutex			mutex;
    34		struct msi_dev_domain		__domains[MSI_MAX_DEVICE_IRQDOMAINS];
    35		unsigned long			__iter_idx;
    36	};
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
