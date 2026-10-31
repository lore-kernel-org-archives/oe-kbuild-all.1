Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793441203;
	b=5WGa9VKLyodxHI4f9MnoeT7cpMR2oK03bykz9QktU2V34EUodgO4dqFdPUcTHGEAE6UC
	 yaM8sMYNQyHG8cEf9wJ7eWKLvgDA4IQfujaD3tiaxT5XKWpWeHlFiFZNrisfENGB09ygY
	 lFk/Tnj9ntQSPD9Ls7Bt7BDfAfLW6Yv+7VmwW6qCNsc30TSKaFh43l4WjKhe2w4oVT0jJ
	 uLa+cYvY9wVvNIcb2I+I+v+ZXkXbZdt+wO4DkJr3OTr4dgkyauN0fzme3TlODtbNnyEP/
	 ugqSPMUpCoNojsOJY+LfevzzU87qAfwj7AfSFwujJOHC5zYLVELXnik1lAM5XqTu1VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793441203;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aWRjEHCB31EsLvn84+toDIMKGVS9UbozYGvfeUQzea4=;
	b=isoAkd3geImbsqXEB+P+aABJKBvjBMVypGlFFyin0rl4ays182O2JHgRRYJoYGn1bUSq
	 QchOifNVBzWb0MBfAZCzkfs46+PrhPKmYgALm+aRC/Eb7Eo9tAdkdrRf1auVFEXcJfG3d
	 IgW7xbJFLC9k3ux/P8ZIZKvy11D6smM8O7aMoFMAXjFzQVwJt7dJQyN9ux+vWKf/2u1cJ
	 Z20vVprfcMFoukhjdjIb9j5meTqOwTwLdrkF8jv6BggE/B+uykdqXO4SdBYKNSAxOlEZz
	 /uturv0SwRuTGx2k92NzmJPrkfihTpXvfWQ7c/rHWUFDHMCcOwc3J/3tQsVxDYAakzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XsNSiSsY;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B05606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 10:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B05606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XsNSiSsY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793441200; x=1824977200;
  h=date:from:to:cc:subject:message-id;
  bh=mTD+6eCqsXezVwKjNyScS1WeHoXywGjUt1y8SdcdUM0=;
  b=XsNSiSsYhm0p5E2bn8a+gs0T0314vS5dMNo8/e3BrBeJEVOjilzfTV+N
   gqPLQIpR8U6Jzylq9kwaO5ymzIEl8xhQb8Z9UqgsuqVegvtcyRsE5Heq3
   oiF+hUpBvqUlo+Qq1pQQ+mGwEmzmAUgQ61hd5ydZ+4gwlDN4XIdxBcgGW
   vo95wR6qd4rn1gjq9PEfpKCO9z93x88rUP1/0Dd0qat05FKKwpdWu6Lr0
   0g7bFlZxaioZM58mZV98eepC29QXBbKy6DatpqzRJFDcQz1kFXH0dI+y9
   Vx/FbwpM7v+gSu1vgj4Mnphptv2J6wOoEZt2xAoiQ8JRGRb8U92eeh8Nb
   Q==;
X-CSE-ConnectionGUID: mbTtfPpGS92qEeDs4EdSAw==
X-CSE-MsgGUID: 4hyVG/uZRHqAIDIjEYCrAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2076171"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2076171"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 03:06:37 -0700
X-CSE-ConnectionGUID: 8/xXsQx9SL+QQVX1DkyGZA==
X-CSE-MsgGUID: xQWZfei+SKuh8i5pY1FneQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="5665655"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2026 03:06:35 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN5yq-000000005x1-15gE;
	Sat, 31 Oct 2026 10:06:32 +0000
Date: Sat, 31 Oct 2026 11:06:20 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 33/36] WARNING: modpost: vmlinux: section
 mismatch in reference: sun50i_iommu_iova_to_phys+0x38 (section: .text) ->
 memblock_start_of_DRAM (section: .init.text)
Message-ID: <202610311025.5HEbN2oS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: fb330cb5c647353254defd7befae00c11c3e49b9 [33/36] iommu/sun50i: Allow mapping 3GB~4GB physical address
config: csky-randconfig-2000-20261030 (https://download.01.org/0day-ci/archive/20261031/202610311025.5HEbN2oS-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311025.5HEbN2oS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311025.5HEbN2oS-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: sun50i_iommu_iova_to_phys+0x38 (section: .text) -> memblock_start_of_DRAM (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sun50i_iommu_of_xlate+0x44 (section: .text) -> memblock_start_of_DRAM (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sun50i_iommu_map+0x22 (section: .text) -> memblock_start_of_DRAM (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sun50i_iommu_map+0x26 (section: .text) -> memblock_start_of_DRAM (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: sun50i_iommu_map+0x80 (section: .text) -> memblock_start_of_DRAM (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: sun50i_iommu_identity_attach+0xfc (section: .text) -> memblock_start_of_DRAM (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
