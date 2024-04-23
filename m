Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A42224F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Apr 2024 18:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713897827; cv=none; b=DA7YWXFEn/dFLLpz4IUqQ0jlCDqhiGZvXhoPhO0cRyFQmSBLjt8iU7f0jmWoCCpRHFnnUgwU8gkZt2hCnPi3ZZwE2K7+rTcG51sqn90uWjWZLJrk8D1gK2Jdil2yRluZN7+b/9L/u8/i9+6Jb0yCQdzhIq8bd47k1QEf1Ddz4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713897827; c=relaxed/simple;
	bh=dnDTg2hhfjuMJSf3lpUjKS5ed+pt7dtcGLK4en30Zpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMLkJk9mSApxEnkswUWOz10uClSPNxTOsSJxlbZiijMbPqGT7xx+P29mzAqL9d7ZLRMsGWRuPl1ouSXbX/vNtYgcQ3B6rv+8o5CrhixkvWb8pkqrjpZusUjMQCNx7FmZYhpR6o809MjIMPdnJ+0z3Slp1rk9r33Pe8MNnAn/6Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4cNQXFH; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4cNQXFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713897826; x=1745433826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dnDTg2hhfjuMJSf3lpUjKS5ed+pt7dtcGLK4en30Zpg=;
  b=I4cNQXFHlSfyYX8ZbVQTSggEYMG0jG/Zw/F0Oy92wNwyXCWqEOWOEokb
   f4w6FXrQEDz0K40i2KA26qVAss250oLAnQftHetlOcVtSWagdj/8zsTnc
   u8SEyDgWTNU5XPmdSK5xORGppJt4w74LXGXxS6JtE+ILyt6ALYaPreepI
   mp5T9r5xQS0rFsiOlRXfoKy/1LpYnAqBIbvLmzUKnjeFE5lScwWba6jeI
   wGv1c7jy9NThfOvDsw12MhTTRW2muYytvXi4it2fs/QNqEAecRWgWUTOm
   Lnux2OFZVO/270yimX6/ZSPnfBNZ1QgAz9z/YYGJTjaXARbJa4OrhW7AY
   A==;
X-CSE-ConnectionGUID: lE8hJ0I8TzeP/DIkMcEyKw==
X-CSE-MsgGUID: Ty/GqfZnSy6FFJcuIOQWvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13289803"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="13289803"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 11:43:45 -0700
X-CSE-ConnectionGUID: O142LiH0RNCb7xMVQ+IT6w==
X-CSE-MsgGUID: ANXAfjkxRSyRv31/ArsfyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24509645"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Apr 2024 11:43:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzL7D-0000Rc-1Z;
	Tue, 23 Apr 2024 18:43:39 +0000
Date: Wed, 24 Apr 2024 02:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Michal Simek <monstr@monstr.eu>, Bjorn Helgaas <helgaas@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: pci: xilinx-nwl: Add phys
Message-ID: <202404240241.n4QeoKna-lkp@intel.com>
References: <20240422195904.3591683-2-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422195904.3591683-2-sean.anderson@linux.dev>

Hi Sean,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus xilinx-xlnx/master robh/for-next linus/master v6.9-rc5 next-20240423]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-pci-xilinx-nwl-Add-phys/20240423-040215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20240422195904.3591683-2-sean.anderson%40linux.dev
patch subject: [PATCH 1/7] dt-bindings: pci: xilinx-nwl: Add phys
compiler: loongarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.4
reproduce: (https://download.01.org/0day-ci/archive/20240424/202404240241.n4QeoKna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404240241.n4QeoKna-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/pci/xlnx,nwl-pcie.yaml: properties:phy-names: {'maxItems': 4, 'items': [{'pattern': '^pcie-phy[0-3]$'}]} should not be valid under {'required': ['maxItems']}
   	hint: "maxItems" is not needed with an "items" list
   	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
