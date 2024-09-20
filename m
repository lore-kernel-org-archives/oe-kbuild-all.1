Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0B1168BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 21:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726869378; cv=none; b=WlyeFxo90lJWEaD/HFimm++mqvWiJ1vPYhPY4qWvEsal7dQ6ejt+jBuWwaaOVQqs+beoEe6odyT8/B+adaCRFyZ5qHVeelvDKjgA3LdbffwWOzvClFVID/pS3zfvwNUasbT6yUizcDKeCX21vd5xOwhJYuQWA7kSN2SWxSqzap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726869378; c=relaxed/simple;
	bh=WctTvx5OF8sAjzguANxXEl7HuvRDdmnkjdJt+gxCt+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWlchwekmP+suWFxK4ImjhQtT9MJd5SU8DacTJCeJCx5B9GISOaQAK7pU4abJ88mdBm7ou5i411NYAjPf/0+Aj5RGjwoAZO2B3su32DVgxCbnvsDBOzPj0TiyLdnwMemBl+uqIFWX1j9F75r2W2dLtMaepun7ehzVv8nvSOFxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzx9VpY4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzx9VpY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726869376; x=1758405376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WctTvx5OF8sAjzguANxXEl7HuvRDdmnkjdJt+gxCt+I=;
  b=fzx9VpY4uOR7/LuWJCr1E+tWzbz1BkRvykTiUUeu/TmqBViplHt1WdrK
   HZW9K82bQTjRrvWcUZ4oRtASc5QGa/Z1fL3UkXkqxyN4zbXINVJE3iypI
   17d48oOZSNzPjLwm7kwep35/WnmadpP0be03HGGO1OefimXbKIZtxhbLM
   aUl6ONk0ImF4YMsf6OA0gscgQOlsWgJcx6lUEOotYKV1pBPA71cU+GX1I
   sV8D2hEHKjwHWdzz3WNTSRkDmwFZ33kJpoHTUQBW944CyFmd72IfVIis3
   yTLkiF1Dn44Vpe4intrdC9LhUJMEHu9L9dB/1sxMKqxFcnkslkMc4bMdO
   w==;
X-CSE-ConnectionGUID: VVW/Sw+wREGmvoiy+wgqFw==
X-CSE-MsgGUID: vgoynGqeTrq7D5x2jadhoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="25840092"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="25840092"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 14:56:15 -0700
X-CSE-ConnectionGUID: UN/BonWuSoGkp514Cl9n0Q==
X-CSE-MsgGUID: wNp1ZsJ2R0KcgASA8DXUUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; 
   d="scan'208";a="75197429"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Sep 2024 14:56:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srlbn-000Esl-2p;
	Fri, 20 Sep 2024 21:56:11 +0000
Date: Sat, 21 Sep 2024 05:55:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 17/19] ./usr/include/fwctl/cxl.h:83:47: error:
 field 'query' has incomplete type
Message-ID: <202409210535.N1t3BbQ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   3175f4c0e49e730b73cd11048737516e461acf09
commit: 0490d2063eae6efc3c0ae64c562489926e4876e1 [17/19] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240921/202409210535.N1t3BbQ9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240921/202409210535.N1t3BbQ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409210535.N1t3BbQ9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/fwctl/cxl.h:83:47: error: field 'query' has incomplete type
      83 |                 struct cxl_mem_query_commands query;
         |                                               ^~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
