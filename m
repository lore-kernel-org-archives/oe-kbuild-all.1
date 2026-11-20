Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203468;
	b=VxUjpQ56K0szDMeYRKXbDIX0jAaeLJXkm0usIdKbb5PsIzaxzA5ANKH4hmTSVGzy4Sy1
	 Ozd5BdcgIG8zbxRwDDuaklNQAY72VpibBVHRDvb/AXGZ0x+fvdbm18hlriqJ9r5DDB49f
	 lqyj12biAS3VVVQJDktJrnTupWdZSddJm1Sc9cU0JlivjWKez8fNCNCy33V2H+1qSrA0q
	 bIIn5dOzcBV/uKIIWJF+BYrq2AF0hsS0D81wPTGMsnmY3gP3K58YQfQDO37TPLgpWbx+3
	 A3t39HNxsvPEQlbQqPH2VHuNdPjiB801nBFGVDK4m9+zu5nUMnzoL9gKVImMES9KcWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203468;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=PpkBWg73siaVtPLgU+wteCjzVixsxQxZ7WbWHzddazg=;
	b=FLy6bF2vwce5nW+0jWlS+uwalnK5+PO0rRRNP4kNhApQxU7tj8w2mOuXLShTqW1zXaik
	 53MKgr6eYrao1bDvPsahrZzS2UNqto7uAOLI2Q4o7qy++m5VIbghKZuK3Gy04+r/wgit6
	 nwZnn5os8e8/P6KR/Hmu5Kud12yinwoq3dlFUv3sXmsCz1epWmqc8f+FGAoBMboyWY998
	 VsWTHraCrzNg8P3sNpPpcogUL9bw7jk9S7eJDfOPyBzcH5Dk67elKh2GNG/gg32wBVCp3
	 F/dd+DfmHOge/kqSbHt7rL6wSXkXsiNoP+w0EhmTfJWCptd69r9Bm3alJsqkqgml87g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="BY+NeHy/";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EE4606A6DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 19:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EE4606A6DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BY+NeHy/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795203463; x=1826739463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zy9gc1RP4EMMMJftR1/jeBO+YhbU4lMj5Uf4m6zIKlg=;
  b=BY+NeHy/fX3l3vKDxrJBYP0Um1yjGLgBD2g1dVnCkEdU6zY7bA+D2BSF
   HchptwtFwY2QYMNC9YEqFMhFnQqMv30C+n02Z34s35XSP6VArZzZznp8d
   r7OQmOYpRb6yrVgHXCO0+2qmJTxSccjnU1MyH01qCA+ylxoCcd+iub0Ez
   qH45fQj5m1hvzUt4UKt3jmV3cshJZNpge+6cH6IDx32d34YzPeZ1pjkk+
   b85qyu6bBzuk8mc6ua3IPdPNIs6Is7VDDl4eYb941kS9iJJXoSvXZ68vn
   Dni4VrsEpUpxzpP/DNck2C5bVKHD+JQOLcDqb8t5zwKVI1CKHlh3Hguy3
   w==;
X-CSE-ConnectionGUID: C4d9oQw7RtmPgjAWjyhW3A==
X-CSE-MsgGUID: EF0qIzb1T3KddoBUl1z4NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3972981"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3972981"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 11:37:42 -0800
X-CSE-ConnectionGUID: 3+MGPmkjSyKMx9wxD7raNg==
X-CSE-MsgGUID: RqQFEMgcSya7V0AHYMCpDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10845732"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Nov 2026 11:37:40 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUUQT-00000001IOl-1qNv;
	Fri, 20 Nov 2026 19:37:37 +0000
Date: Sat, 21 Nov 2026 03:37:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>, Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/9] nvme-auth: switch to use 'struct key'
Message-ID: <202611210315.8aA2D5rd-lkp@intel.com>
References: <20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee@kernel.org>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee@kernel.org>

Hi Hannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 68099cf27253a8c89d703a282d3d811446d9453b]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/nvme-auth-modify-nvme_auth_transform_key-to-return-status/20261120-121400
base:   68099cf27253a8c89d703a282d3d811446d9453b
patch link:    https://lore.kernel.org/r/20261120-dhchap-keyring-v4-v4-3-5f8c7d9926ee%40kernel.org
patch subject: [PATCH v4 3/9] nvme-auth: switch to use 'struct key'
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261121/202611210315.8aA2D5rd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611210315.8aA2D5rd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611210315.8aA2D5rd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/nvme/common/auth.c:154 function parameter 'keyring' not described in 'nvme_auth_extract_key'
>> Warning: drivers/nvme/common/auth.c:154 function parameter 'keyring' not described in 'nvme_auth_extract_key'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
