Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB5A18C03F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301030; cv=none; b=gkZzTzVmywiH9EUdpAyNKX4dfXBdkcvN1IpP0Iu0hs6Gnrw5Rc+TqEi+dxeVf13wTzj2oeGCadUgmJaEw5AZ0E80Jy+/l4qODkZtfI0vRjhdTLFFZn7BWiS2PTu1n65R7EF3RUeNwcw2TRHbVQVTRrSXK/rQdKEw2xx5FpxPPU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301030; c=relaxed/simple;
	bh=gvOpS/CSU9zOtDTEg/2CzkuI1bv/x96uWiHEJDSy0l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPO33vEN/VQ98roxUPbzYY53wa45LOc5yA1jTsHF/F4VWOjGNCXnuRi9ZB8b+fJd3FP0zL2cQ0rXnpZm1v0ZzsjVYWaE2KMbbS2zOj4Nl3lMLXVwbdo9kbn/gkcIiD1FeNZAJX733nDBKAwsxHhbQXz/0HBgN2sbBmN1JJ4L8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIfLPvQn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIfLPvQn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733301028; x=1764837028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gvOpS/CSU9zOtDTEg/2CzkuI1bv/x96uWiHEJDSy0l4=;
  b=MIfLPvQnmGv5Fco+BW556A/JcHxsCop6UQc9CIFmWPTc92/2IVMcl60n
   g0AXjtVzsQwo38/Tu77E1+j17Yi+rzGxdEkhopsHwB/IOiAxgo2twaP7L
   KLNpHRg5SVxNJq1eLI9cwG9V88RtAKlOEogzeXql7/CIyU/M92vb4UHh9
   OoC0FZDhRVMypuWygZ3a4GyyjDLrSYwl0K8x7xRZbGnIw8G26uTG/WUaj
   S54sXHa8wbmGmSDNXbHWVgD1khhenWazoDbm0i2dVNwMzsv7vWD/KEuKe
   RbuzSadfYkOsmkq9QF+Cpjb6s7xEi5l2FonNWNJDsQfd7T0Hqt4lxY8Om
   Q==;
X-CSE-ConnectionGUID: Md+Wkjt7S6mtz9UF6A6fDg==
X-CSE-MsgGUID: bJLcgExbQny/zNiWI4HhQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="21135970"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="21135970"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 00:30:28 -0800
X-CSE-ConnectionGUID: 9J2fsjFmSYmXETH0NbSCQQ==
X-CSE-MsgGUID: wTnypkPZRRqunuh3ulGTaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="97760319"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2024 00:30:24 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIkly-0002lV-1c;
	Wed, 04 Dec 2024 08:30:17 +0000
Date: Wed, 4 Dec 2024 16:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?unknown-8bit?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?unknown-8bit?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	=?unknown-8bit?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5
 NVMEM
Message-ID: <202412041614.WGhDRXyh-lkp@intel.com>
References: <20241203-rmem-v1-5-24f4970cf14e@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203-rmem-v1-5-24f4970cf14e@bootlin.com>

Hi Théo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Th-o-Lebrun/dt-bindings-nvmem-rmem-Add-mobileye-eyeq5-bootloader-config/20241204-103417
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241203-rmem-v1-5-24f4970cf14e%40bootlin.com
patch subject: [PATCH 5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5 NVMEM
config: arc-randconfig-001 (https://download.01.org/0day-ci/archive/20241204/202412041614.WGhDRXyh-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041614.WGhDRXyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041614.WGhDRXyh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvmem/rmem.c: In function 'rmem_eyeq5_checksum':
>> drivers/nvmem/rmem.c:66:9: error: cleanup argument not a function
      66 |         void *buf __free(kfree) = NULL;
         |         ^~~~
>> drivers/nvmem/rmem.c:97:15: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      97 |         buf = kmalloc(header.size, GFP_KERNEL);
         |               ^~~~~~~
         |               mm_alloc
>> drivers/nvmem/rmem.c:97:13: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      97 |         buf = kmalloc(header.size, GFP_KERNEL);
         |             ^
   cc1: some warnings being treated as errors


vim +66 drivers/nvmem/rmem.c

    62	
    63	static int rmem_eyeq5_checksum(struct rmem *priv)
    64	{
    65		struct rmem_eyeq5_header header;
  > 66		void *buf __free(kfree) = NULL;
    67		u32 computed_crc, *target_crc;
    68		size_t data_size;
    69		int ret;
    70	
    71		ret = rmem_read(priv, 0, &header, sizeof(header));
    72		if (ret)
    73			return ret;
    74	
    75		if (header.magic != RMEM_EYEQ5_MAGIC)
    76			return -EINVAL;
    77	
    78		/*
    79		 * Avoid massive kmalloc() if header read is invalid;
    80		 * the check would be done by the next rmem_read() anyway.
    81		 */
    82		if (header.size > priv->mem->size)
    83			return -EINVAL;
    84	
    85		/*
    86		 *           0 +-------------------+
    87		 *             | Header (12 bytes) | \
    88		 *             +-------------------+ |
    89		 *             |                   | | data to be CRCed
    90		 *             |        ...        | |
    91		 *             |                   | /
    92		 *   data_size +-------------------+
    93		 *             |   CRC (4 bytes)   |
    94		 * header.size +-------------------+
    95		 */
    96	
  > 97		buf = kmalloc(header.size, GFP_KERNEL);
    98		if (!buf)
    99			return -ENOMEM;
   100	
   101		ret = rmem_read(priv, 0, buf, header.size);
   102		if (ret)
   103			return ret;
   104	
   105		data_size = header.size - sizeof(*target_crc);
   106		target_crc = buf + data_size;
   107		computed_crc = crc32(U32_MAX, buf, data_size) ^ U32_MAX;
   108	
   109		if (computed_crc == *target_crc)
   110			return 0;
   111	
   112		dev_err(priv->dev,
   113			"checksum failed: computed %#x, expected %#x, header (%#x, %#x, %#x)\n",
   114			computed_crc, *target_crc, header.magic, header.version, header.size);
   115		return -EINVAL;
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
