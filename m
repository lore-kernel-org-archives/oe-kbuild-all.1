Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D73258EFB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Nov 2025 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764525809; cv=none; b=ZflBI3J2UaQYB8XxJXlVYwVteuTk3qNeZfodE0qzUpkfQVbg/p7CyJwybhzcrsNm2z5Tq2VDMGYBfLCiuABsSWyMfDnyYz7HcXUNBPfu4BOvS7A0oW6Kk+ZVtctO9LpUdjWuDNtpPOE1zWneoezny8bKzoTdY+UIFbw/PUNskD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764525809; c=relaxed/simple;
	bh=ZqVwHivoVUmWgEvQjyk/WhrXNd4Z9xULQneMl4nM6rU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VJaOn5a7Wt5JZMDG/SKFRI1/TLVWM/0J00OykVX+aKu85fIqL1/szgzfycS9/fngRTKMW/2MfATtgoxqnWJqhX9gqIq5/SmGW1AHW0hEkfIeneqzOq08UOeRW7jATDdmkQXZF5TNPopF2axevAHSEtPLpHfKMqjikaETc8EVC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kilhvBVB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kilhvBVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764525807; x=1796061807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZqVwHivoVUmWgEvQjyk/WhrXNd4Z9xULQneMl4nM6rU=;
  b=kilhvBVBIemra2Or7AB5RFe1Rf8cMH2YTp9vbyuDhABBUxj9FCFWfIkR
   qXeIt+xQcBJ6DNgioFr8fxuYhTgnfHo/hpYBZ3dgV0w/W3+98wtNuIdn0
   +rq4/CG22Ji6p0cj8npqDZqy8SfrEHK2f/9+zb0UoIVAMoSZvBohchfDj
   W/QRg2B9UbaMelItMNG08T4qgeen8gh/UAdh7Ly7EvLAchjn6bKUNpdos
   HPyilbzDVu4Vaeaky3lzCNcwsP7CSB3UPkAb4piBXiPE0+znK/JyVxo0v
   1lWsGsei7vC1v195DPEPMsBKr7TtT2lt7ltfIKz360/Er/0sVcrz27Jas
   Q==;
X-CSE-ConnectionGUID: P4N/zIl9TcOpTkH3Dz4SxQ==
X-CSE-MsgGUID: jpiS/MkxR728x51RzFZAlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="91941626"
X-IronPort-AV: E=Sophos;i="6.20,239,1758610800"; 
   d="scan'208";a="91941626"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 10:03:21 -0800
X-CSE-ConnectionGUID: s5k5X2RzQm28zCM/kuD36A==
X-CSE-MsgGUID: vQ0YvH49QfmpYNRq2pk5Lg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 30 Nov 2025 10:03:19 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPllW-000000002a5-1Xzz;
	Sun, 30 Nov 2025 18:03:18 +0000
Date: Sun, 30 Nov 2025 19:02:25 +0100
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Subject: [devsec-tsm:next 22/22] Warning: drivers/crypto/ccp/sev-dev-tio.c:80
 struct member 'reserved1' not described in 'sla_buffer_hdr'
Message-ID: <202511301956.8VtI6PCU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexey,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm next
head:   3532f6154971dc631062ed1f436b7a9eca6c8882
commit: 3532f6154971dc631062ed1f436b7a9eca6c8882 [22/22] crypto/ccp: Implement SEV-TIO PCIe IDE (phase1)
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251130/202511301956.8VtI6PCU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301956.8VtI6PCU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301956.8VtI6PCU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/crypto/ccp/sev-dev-tio.c:80 struct member 'reserved1' not described in 'sla_buffer_hdr'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:80 struct member 'reserved2' not described in 'sla_buffer_hdr'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:188 struct member 'reserved' not described in 'sev_data_tio_status'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:213 struct member 'reserved1' not described in 'sev_data_tio_dev_create'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:213 struct member 'reserved2' not described in 'sev_data_tio_dev_create'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved1' not described in 'sev_data_tio_dev_connect'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved2' not described in 'sev_data_tio_dev_connect'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved3' not described in 'sev_data_tio_dev_connect'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved4' not described in 'sev_data_tio_dev_connect'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:289 struct member 'reserved' not described in 'sev_data_tio_dev_certs'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:303 struct member 'reserved' not described in 'sev_data_tio_dev_reclaim'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
