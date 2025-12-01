Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986AC2DCF41
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764588397; cv=none; b=pBQfF8ErzJp+6FfwWijEVAfY4rljhCuef2Xf6OBo0WdkJGm+N2/XkIqJz+LCkjN6vEfPVMa6LODIXhADn5MF0iiMQ7nhKnCx7jw9XCwy9GONy/GEXk+aQVLsEJNJ10rZN/GoqVc1uPRXFNXMMHofYDRHXeRbaydAJxlbAHoCO1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764588397; c=relaxed/simple;
	bh=4kaKj/0xrQLn/vNruNbrdTaCoBMPELQmqpqaTe7Xaj8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Axz7iQ4a/2gdpEMlm2ULnKOCGtvbtN1YQFiEbxmRYkYziLrVkOzDBCounvcHrBJSSHW2UbU++xbbNX88LWzd9Qdh9V19jZw1lGkRTqa5l7lezkskaJKDZSJL1wjNRypaj2bN1eivyaAUZYCnZF8h9Mn7ujM/kDxh+8+LDx0uu2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYKOJa3Z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYKOJa3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764588395; x=1796124395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kaKj/0xrQLn/vNruNbrdTaCoBMPELQmqpqaTe7Xaj8=;
  b=EYKOJa3Zk+9i3qQ5SL/FltHae7ms62hHF8ntkMJzbqlPgKr/HPvrXRxe
   xi2Xuwbao8YnPwgSZQREkqHuxDayyG+qh9a8eModPQxOJUf8v49i4s7sz
   iB7Lw3eHCJVN+cXt2hV9zM4IZTki/PpS+jaNygRELYM8oES9r+st2eHFP
   7XoHvEfT8CFXnB6d93GgmFYynEkuIReUOYQpU81qnlj69AM1FQ172f1sj
   qdVAx8sFZCLxmj4UFUOvyqRymYCkg20UaBdKpfV87ddNWGHbkuu1vxwKC
   IpH28lzudXiaKq8/eReMfmqS0CfO8e4hI+6jMBbu+eNlG9sH49NoMgSTO
   Q==;
X-CSE-ConnectionGUID: JfqOz4rtQeiLlihfCx7rkg==
X-CSE-MsgGUID: sR2AenbnSY6AHjIoXomBmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77209323"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77209323"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 03:26:35 -0800
X-CSE-ConnectionGUID: mmNDIfS8Tqm+WFqjMEgHqw==
X-CSE-MsgGUID: w9WEI88CSSiOOV2cCmQhTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194832359"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Dec 2025 03:26:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ236-000000008WT-0Cli;
	Mon, 01 Dec 2025 11:26:32 +0000
Date: Mon, 1 Dec 2025 19:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 13169/13171] Warning:
 drivers/crypto/ccp/sev-dev-tio.c:249 #define TIO_DEV_DISCONNECT_FLAG_FORCE
   BIT(0); error: Cannot parse struct or union!
Message-ID: <202512011905.z4ACJpAS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 281a569adbeaa7661286f4fdf549f937e975e172 [13169/13171] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/devsec/tsm.git
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251201/202512011905.z4ACJpAS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011905.z4ACJpAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512011905.z4ACJpAS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/crypto/ccp/sev-dev-tio.c:80 struct member 'reserved1' not described in 'sla_buffer_hdr'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:80 struct member 'reserved2' not described in 'sla_buffer_hdr'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:188 struct member 'reserved' not described in 'sev_data_tio_status'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:213 struct member 'reserved1' not described in 'sev_data_tio_dev_create'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:213 struct member 'reserved2' not described in 'sev_data_tio_dev_create'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved1' not described in 'sev_data_tio_dev_connect'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved2' not described in 'sev_data_tio_dev_connect'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved3' not described in 'sev_data_tio_dev_connect'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved4' not described in 'sev_data_tio_dev_connect'
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:249 #define TIO_DEV_DISCONNECT_FLAG_FORCE   BIT(0); error: Cannot parse struct or union!
>> Warning: drivers/crypto/ccp/sev-dev-tio.c:267 #define TIO_DEV_MEAS_FLAG_RAW_BITSTREAM BIT(0); error: Cannot parse struct or union!
   Warning: drivers/crypto/ccp/sev-dev-tio.c:289 struct member 'reserved' not described in 'sev_data_tio_dev_certs'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:303 struct member 'reserved' not described in 'sev_data_tio_dev_reclaim'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:80 struct member 'reserved1' not described in 'sla_buffer_hdr'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:80 struct member 'reserved2' not described in 'sla_buffer_hdr'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:188 struct member 'reserved' not described in 'sev_data_tio_status'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:213 struct member 'reserved1' not described in 'sev_data_tio_dev_create'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:213 struct member 'reserved2' not described in 'sev_data_tio_dev_create'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved1' not described in 'sev_data_tio_dev_connect'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved2' not described in 'sev_data_tio_dev_connect'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved3' not described in 'sev_data_tio_dev_connect'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:239 struct member 'reserved4' not described in 'sev_data_tio_dev_connect'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:289 struct member 'reserved' not described in 'sev_data_tio_dev_certs'
   Warning: drivers/crypto/ccp/sev-dev-tio.c:303 struct member 'reserved' not described in 'sev_data_tio_dev_reclaim'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
