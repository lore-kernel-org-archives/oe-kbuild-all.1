Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1684848C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 02:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733279339; cv=none; b=sR+WaqmlaDrt+GL429YUHn0wAP8o+z8JRoEdPwsxMmAy9HaOcXkpDc3TEsVJg94XCFFznrXDCdSCpoIC1IetNr4RLQ+Byd3Qxp+Ak8jU6n/6NvS/g8LI3fpjJHAo4VrNqgZU1ZrVA/op8FBAjgqti/k6aW9vJQgzqv17N3cIAxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733279339; c=relaxed/simple;
	bh=1X5HYFWweaeB/ajssZScgfhH28SenKgIIOerZI9pbYg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WK5l3HxanupSKtL7rnwxShOedsEPgCCDNdB+qaM8D07Iya1bBe6NmfkJ4j2UvT5ko2PDeBD8XVS4zyRMRQocNAD1nRjeMxntd3dSBnTuhUMBJ3Dd7r8YblZPuWhSFpb7DMDE27QFxYP7AsPpizv0LTM+zt6Yu3zLmgUiB8E76bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4xK4Zja; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4xK4Zja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733279338; x=1764815338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1X5HYFWweaeB/ajssZScgfhH28SenKgIIOerZI9pbYg=;
  b=a4xK4ZjaaMe3JrCwfC9aEdNdIVGqCoEuv7kXOKQqbRpzBonw2Yop39pJ
   n64gOhRAofEOFwybsxv8ekzLYv9Shllx83aL+RzZGFkGSxe03Np5gz2hg
   HTwDOuLG7y/p+uWNXJADT0tW0mEVx8Qi9OyPydji5t0ctMzKq0F/5zxr/
   ACsf0d798AKkE8t71UeJxpvEEu+DXxViq3z1MgR5eLTnow0tunY+M1nLj
   NaOKIbxuj8hkIdIJFrbB422oqDIEvfETq7cB2vXCX7wMSs3+xW5fM+3t3
   WWQoQtl5rMYXBipuxjvz489lRkF2ERjy+eLVGA5jFodm0lZxPddpQS7nt
   w==;
X-CSE-ConnectionGUID: pz5RiVTZStqlB+D31Ohsng==
X-CSE-MsgGUID: 22iYsS28RAy5e3aFR/6FzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33659919"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="33659919"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 18:28:57 -0800
X-CSE-ConnectionGUID: TD0jOGmeR82QWuo8UdmRag==
X-CSE-MsgGUID: 8VaS3oYvRYKnHeAcNJdoeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="98610216"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Dec 2024 18:28:56 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIf8H-0000TN-2k;
	Wed, 04 Dec 2024 02:28:53 +0000
Date: Wed, 4 Dec 2024 10:28:49 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan <mufengyan@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516] drivers/net/ub/dev/ubl.c:92:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202412041042.sDm6Qcib-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Junxin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   50144653bfd09743bb9ce60543744e9e8cbb6489
commit: eb44201ee79cffdcf1b16759a54940dca047aae5 [2516/2516] ubl: add CONFIG_UBL definition and UBL interface
config: arm64-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041042.sDm6Qcib-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041042.sDm6Qcib-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041042.sDm6Qcib-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ub/dev/ubl.c:92:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
      92 | const static struct header_ops ubl_header_ops ____cacheline_aligned = {
         | ^~~~~


vim +/static +92 drivers/net/ub/dev/ubl.c

    91	
  > 92	const static struct header_ops ubl_header_ops ____cacheline_aligned = {
    93		.create		= ubl_create_header,
    94		.parse_protocol	= ubl_header_parse_protocol,
    95	};
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
