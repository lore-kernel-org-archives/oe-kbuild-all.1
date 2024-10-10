Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04441A0732
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728542514; cv=none; b=FJX4Qi1+L6+Df4HPBOg9/F334zn0cD0sVTE5GI1Ouny3R2IDvgGAXBo0cXSneIB48y3LSWlcFpuTgWURlkaHZQhfqN3pBjKwWO59YOBzE56j5ch/4Xz8Ek7wNj6va8lOjJ2GVz5nadOXWwqP6oYCS4GKbuqq6vJ0SqHkFX34j/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728542514; c=relaxed/simple;
	bh=jSBz0PfVXy3iVVjq81VEsmGgF8tcK5G4t5zat2WoUJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nljJObj4LiYEKW6ShEn9rALd10dnKrK90y1zHeo46BU/qxiDRcr3PGxRRoPGl1D4B0PUDbU4j1yBfhKTowfvETa8xvDaAG5zW28H07mAbnrTayUiOfYSFHtkQ3DitVbd2T2gntrfbAjgt2TS/eXTB3K5oW8EZHmUxLiYFfFER9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hG59Njlg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hG59Njlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728542513; x=1760078513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jSBz0PfVXy3iVVjq81VEsmGgF8tcK5G4t5zat2WoUJ0=;
  b=hG59Njlg7kbLKVwYCZ4hyxxIJPE5+wpOVsfpSeVzw/Wr51UHdU6rJ4i8
   Wkjjd4eE5HNu8MvkdY80RrDPw7P/ci+Q7WsiwO2hk4PzzhrnwYdcxhcsf
   cILnIMX1jSPxq6qnR5jjt64l+twVb1ZfKtR4Hcxnogg0L7i//rNDrOxRb
   6siRFc7KthbglQlyJFxgGghgzGewMj1U87YKo3j8QGdyD5JAwc1qX9eQs
   wDiFns74FImd2EDbY6WUwA0e+0M7Fe85L+/99TirSVpYIfKoSZmNOX+sx
   J4sIfFYxxrnWm0m4PSrvol2lotY2LzYVfx8+/ViB23NW2nCGUVw9njzVg
   A==;
X-CSE-ConnectionGUID: jZzvETIKT4aKvAmQgNDmZg==
X-CSE-MsgGUID: MSaqmq99TC6QAtsAJ0As+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="53285180"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="53285180"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 23:41:52 -0700
X-CSE-ConnectionGUID: gk4kHrejRGWIswhN807b2g==
X-CSE-MsgGUID: 9JrMziQIQOe80VXpfNqafQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="107224582"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Oct 2024 23:41:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1symrt-000AHv-15;
	Thu, 10 Oct 2024 06:41:49 +0000
Date: Thu, 10 Oct 2024 14:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 7/9] ASoC: loongson: Add I2S controller driver as
 platform device
Message-ID: <202410101439.Tfn5aT6i-lkp@intel.com>
References: <36c143358c7f48bc2e73c30e1d2009b2f2fc6498.1728459624.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36c143358c7f48bc2e73c30e1d2009b2f2fc6498.1728459624.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on d19f6bf5f17d77fb645654237130c94571c68a3d]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/ASoC-dt-bindings-Add-Everest-ES8323-Codec/20241009-155516
base:   d19f6bf5f17d77fb645654237130c94571c68a3d
patch link:    https://lore.kernel.org/r/36c143358c7f48bc2e73c30e1d2009b2f2fc6498.1728459624.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v3 7/9] ASoC: loongson: Add I2S controller driver as platform device
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241010/202410101439.Tfn5aT6i-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101439.Tfn5aT6i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101439.Tfn5aT6i-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/loongson/loongson_i2s_pci.c:157:1: warning: data definition has no type or storage class
     157 | module_pci_driver(loongson_i2s_driver);
         | ^~~~~~~~~~~~~~~~~
>> sound/soc/loongson/loongson_i2s_pci.c:157:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Wimplicit-int]
>> sound/soc/loongson/loongson_i2s_pci.c:157:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]
>> sound/soc/loongson/loongson_i2s_pci.c:149:26: warning: 'loongson_i2s_driver' defined but not used [-Wunused-variable]
     149 | static struct pci_driver loongson_i2s_driver = {
         |                          ^~~~~~~~~~~~~~~~~~~


vim +/loongson_i2s_driver +149 sound/soc/loongson/loongson_i2s_pci.c

d84881e06836dc Yingkun Meng 2023-06-15  148  
d84881e06836dc Yingkun Meng 2023-06-15 @149  static struct pci_driver loongson_i2s_driver = {
d84881e06836dc Yingkun Meng 2023-06-15  150  	.name = "loongson-i2s-pci",
d84881e06836dc Yingkun Meng 2023-06-15  151  	.id_table = loongson_i2s_ids,
d84881e06836dc Yingkun Meng 2023-06-15  152  	.probe = loongson_i2s_pci_probe,
d84881e06836dc Yingkun Meng 2023-06-15  153  	.driver = {
d84881e06836dc Yingkun Meng 2023-06-15  154  		.pm = pm_sleep_ptr(&loongson_i2s_pm),
d84881e06836dc Yingkun Meng 2023-06-15  155  	},
d84881e06836dc Yingkun Meng 2023-06-15  156  };
d84881e06836dc Yingkun Meng 2023-06-15 @157  module_pci_driver(loongson_i2s_driver);
d84881e06836dc Yingkun Meng 2023-06-15  158  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
