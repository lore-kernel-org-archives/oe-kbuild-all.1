Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BB23182D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 23:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765926661; cv=none; b=LcrJCxXL7RXng/c42PfvRj/yhB9lzzy8KBjxDPi3OgsSpwjG+1d7vQNxskgEuUKcyw/gCteb58I5vH5+OhtEv25vaxQ4pjtJJQA79+S0Xr9mngLXhseh3RkaMQmsOigQhOeQkab+Tv2AuHSqFx3j5dLeZq+n7o4fBNqUnz4OKQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765926661; c=relaxed/simple;
	bh=TmsFwGnmqUXi5HctEYs6ndaXOcw12iYUq6c1LARiWs0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbachPZGjirz7t9QoK3SzTyNf31N/WwGXDvzYwgfaE8bRcFRo+w3PvWT7urBOxV59S2lzwrt/frVskdyUbu31LQymUS5+Ozjv4+mbbGKqtn8t0p6edUKssMO8QDt6QtO4maejD3mM/s7PHsJ5UN8GY4uJYWASDOQ/cQYbkracYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CozmDIet; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CozmDIet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765926657; x=1797462657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TmsFwGnmqUXi5HctEYs6ndaXOcw12iYUq6c1LARiWs0=;
  b=CozmDIethveezwYZzCu9byIFK3DNH7O5xBm+g1zFim7T7eYIY2oUT7Cw
   NsavMMHJVn8ulUDdREZL/mxvYw63fqxM6Vw1Lz9JDAWNY0G13MR86n+iT
   D6PPWqcoWPV/mRg+dc0khcqlpvLW22NBC+iZPLRU1dlRQ9leqQLdnqvJU
   w5y4D1J6M+fdVOlk80/1XyRxXwjgrQe1BJeTh1tV+XH7XwbtOzNTmSTS8
   uveRlEOfvz6vFvKmgF/pOWJ/R9v0ujeEX0MIdFukLy5uAbI4kn/XifeOA
   pAy5DhxJtAubOb92UaTFphrh5ycG+38jOyXCMybD8GKrf3lOsP3JI3iv6
   g==;
X-CSE-ConnectionGUID: ZZFPkTE3Q+SZA8T3s1Ao5g==
X-CSE-MsgGUID: f67LK3jJTsWZGTBZu0nqIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70433790"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="70433790"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 15:10:56 -0800
X-CSE-ConnectionGUID: 6AW07miISU2ZX9pGVGaWvw==
X-CSE-MsgGUID: 78srWvbvQi2GFv0sv9Hrmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="197758067"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 16 Dec 2025 15:10:55 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVeBT-000000003vH-0g7Q;
	Tue, 16 Dec 2025 23:10:30 +0000
Date: Wed, 17 Dec 2025 07:09:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pan Deng <dengpan13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1944/1944]
 include/uapi/../../drivers/scsi/isci/isci.h:531:1: error: attempted to
 randomize userland API struct sci_base_state
Message-ID: <202512170724.x8psWT4W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   49bc452fdcb1e9ec3f9bb20cd3e15b865a2933fd
commit: 28617d9631dc65be773b8a28718e8614558caa5f [1944/1944] scsi: libsas: Abort all in-flight requests when device is gone
config: arm64-randconfig-001-20251217 (https://download.01.org/0day-ci/archive/20251217/202512170724.x8psWT4W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170724.x8psWT4W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170724.x8psWT4W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/../../drivers/scsi/isci/remote_node_context.h:67:0,
                    from include/uapi/../../drivers/scsi/isci/remote_device.h:61,
                    from drivers/scsi/libsas/sas_discover.c:36:
>> include/uapi/../../drivers/scsi/isci/isci.h:531:1: error: attempted to randomize userland API struct sci_base_state
    };
    ^


vim +531 include/uapi/../../drivers/scsi/isci/isci.h

12ef65444de9d3 Edmund Nadolski 2011-06-02  527  
12ef65444de9d3 Edmund Nadolski 2011-06-02  528  struct sci_base_state {
12ef65444de9d3 Edmund Nadolski 2011-06-02  529  	sci_state_transition_t enter_state;	/* Called on state entry */
12ef65444de9d3 Edmund Nadolski 2011-06-02  530  	sci_state_transition_t exit_state;	/* Called on state exit */
12ef65444de9d3 Edmund Nadolski 2011-06-02 @531  };
12ef65444de9d3 Edmund Nadolski 2011-06-02  532  

:::::: The code at line 531 was first introduced by commit
:::::: 12ef65444de9d387a383b9991960848bed5bbe74 isci: additional state machine cleanup

:::::: TO: Edmund Nadolski <edmund.nadolski@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
