Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085621758E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 14:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708870379; cv=none; b=qMfajVsUTCEXlRs+X5j5HwQoEKbgsh15We1h1AND/wfS0plJFjVe1UKgPBgbm7iziSSsoNalKA+4CozvQtpjJ3P+3zw65KZcxjDSUUgOJhVsG1z6zJgiU1Cz6wByUxEtEF9ubT/TNGuWn+4b44nIyz/+gJYe2zJzsCxGqWh9n+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708870379; c=relaxed/simple;
	bh=D+XkPwGE0cRmjvrvtJN4NDlVfIm1glZyeI1QHoPVvbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bhRy1CizlNuJrn9aVDu6eEBqz5i2xotCQYWnnJ7fDa4ezr0NG9ADCOCxMGsmy8WyVbC/p8v67PWaFY0Nz1/Dysj0BekqGmODXYPHFsv3PThtKdQvsNav7geutKff5JKq0Z/8dNixUrLErTg0xz7AEgpibLbufhfASkaN5VGxEVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNgyn7Fl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNgyn7Fl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708870378; x=1740406378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D+XkPwGE0cRmjvrvtJN4NDlVfIm1glZyeI1QHoPVvbQ=;
  b=cNgyn7FlES0ZnFiPrjII0QSqYTKoLcwsvT5/jbRZHZqulFYrR4hQPfn7
   NndEzcB1lEDmVmHjykZY38X42EU4J007GGWBT8hmNQ4MfJMbYo/v+ObWF
   k3J0f0AZlw4RZ4DJsP/dfc3Ht0lGR1WWv7C7olRcC29H5RsFjWtqnQwlM
   xBhWSHpcY7Dwmo4w6hRKnlhzcpiNEW9vkb0JJ7Z3LeturCJ5koa+cFWYy
   jTng6+sy6f0tPj9gy8mXLj6l+23V8g3EFEQB5J6p9BpHvyLA9TDVGd2ul
   mP4mar2AYJyR2hHKWvvTJ+6BIBGn/nwZV1kAmJg2Jxr3PllOuScrWpYUs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="13710657"
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="13710657"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 06:12:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,183,1705392000"; 
   d="scan'208";a="29579141"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Feb 2024 06:12:55 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reFFN-0009Yu-0a;
	Sun, 25 Feb 2024 14:12:53 +0000
Date: Sun, 25 Feb 2024 22:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 1/6]
 sound/soc/soc-generic-dmaengine-pcm.c:321:5: warning: no previous prototype
 for function 'dmaengine_pcm_prepare'
Message-ID: <202402252258.bDEY6OwE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   06aa44273378b04ac8e0185d373052806da1dfb7
commit: 7ff6902b6e5082643c2d5dd34d34fc5a8e53d7d8 [1/6] HACK: ALSA: dmaengine: Synchronize dma channel in prepare()
config: i386-randconfig-002-20240225 (https://download.01.org/0day-ci/archive/20240225/202402252258.bDEY6OwE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402252258.bDEY6OwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402252258.bDEY6OwE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-generic-dmaengine-pcm.c:321:5: warning: no previous prototype for function 'dmaengine_pcm_prepare' [-Wmissing-prototypes]
     321 | int dmaengine_pcm_prepare(struct snd_soc_component *component,
         |     ^
   sound/soc/soc-generic-dmaengine-pcm.c:321:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     321 | int dmaengine_pcm_prepare(struct snd_soc_component *component,
         | ^
         | static 
   1 warning generated.


vim +/dmaengine_pcm_prepare +321 sound/soc/soc-generic-dmaengine-pcm.c

   320	
 > 321	int dmaengine_pcm_prepare(struct snd_soc_component *component,
   322				  struct snd_pcm_substream *substream)
   323	{
   324		return snd_dmaengine_pcm_prepare(substream);
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
