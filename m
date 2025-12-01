Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB01E3DED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764580947; cv=none; b=emSv4t+bCTzJjWJSg9R8ahYuxK8a60C+NvcRp+JyAMZDcwJxkcDl6UYA/02yTPbxRZXJHcHmdr+xIeUHw6UK75HwogjzoHX/h1LEjzoqMaoKpAG3XbwfsMMtYSl9dNNRNWGtD2eINOCk0N0n2la1VltzMWfrmA6eJt8C3kiouG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764580947; c=relaxed/simple;
	bh=S2qBBJzgwPzn82LD1GNQ0U95ZOBFsILuA/oyI3ZGByI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TPT9qGXZfTxKX+NGRuIPkhUlAaeBO/hthKxU+1so0k4h1FBCObw0sr0EBSLN4Ox9HBd6a8oginPWKjeHP7Hf4pVghBd7Hbgvk0JJNxZygb1IVPnMcyqo4joJEyThl9WpYYc+Th38N5ODKG5aozi5o5DqnOOoo+8a2hTY1jchbB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SL4/fO2V; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SL4/fO2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764580946; x=1796116946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S2qBBJzgwPzn82LD1GNQ0U95ZOBFsILuA/oyI3ZGByI=;
  b=SL4/fO2V49gRUp4HEjO4caR2uADtwZhOedlQZwT3QyU+hogXXLh3eSOr
   /0alDk9ejhM4BvYZ+3VAgxridJtxvRi0RbhaB3ER6t4jXlv7ye0Ko3bJH
   BPVh8ViJzyzkpoGlpOsn+lEzP+iBKfH5iO+1GwsrfpctwpYqLqyWqcOAO
   Yy8jDtAeg+TU0PgZszzrSTd/KqNLNi4GANO1IrYsTrBebh0L8Tj8lI4HV
   mm9QVJbd/xmv0MNFG9dY0wCgwK6fDcj6DTklBcE0T3D6dlaiEkr6VQ0JS
   9PMKgnk6PhoPDXrGg5H2/4gmw4/OoAwERL37zF6+/mbTO533sBg07Cfo5
   A==;
X-CSE-ConnectionGUID: cSxY2Q+pRmaKgC0f45RAQA==
X-CSE-MsgGUID: FOUHNXXZRLODkhRURwLcOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89163638"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="89163638"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 01:22:26 -0800
X-CSE-ConnectionGUID: S40Wh/W8RpavNrIiy4uUuA==
X-CSE-MsgGUID: wfx70AyqQTKKLLMe9NCidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193282963"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Dec 2025 01:22:24 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ06v-000000008Qv-3vAi;
	Mon, 01 Dec 2025 09:22:21 +0000
Date: Mon, 1 Dec 2025 17:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Subject: [linux-next:master 12765/13171] Warning:
 drivers/crypto/ccp/sev-dev-tio.c:80 struct member 'reserved1' not described
 in 'sla_buffer_hdr'
Message-ID: <202512011732.RHIyTQHZ-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 3532f6154971dc631062ed1f436b7a9eca6c8882 [12765/13171] crypto/ccp: Implement SEV-TIO PCIe IDE (phase1)
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251201/202512011732.RHIyTQHZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011732.RHIyTQHZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512011732.RHIyTQHZ-lkp@intel.com/

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
