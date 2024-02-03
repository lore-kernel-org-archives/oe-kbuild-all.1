Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874581754B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 23:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707004457; cv=none; b=k6dMio9n6P/3sR/hObnSrLsdItRpTRd+kY7JavXCEdOpfiqWd9fIlhEZHfWiY+qwj4qlxH7+a+DBErNRuqyS+BzPjUhNDmR2+9dvzLHlA2gdAdKakb0AuSVTnmZg8Pl2V60U92qP5PNeV50gdNsYye053XG8ZIobPwcrUpW4Ibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707004457; c=relaxed/simple;
	bh=40AZdHO8wcuSQRp4vNa3O1TClVrrjn4ceXDlegYULcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUTpGCEREWYR7Aui/wcCK0EPWNP9flgJUEDU7aASz5yV770zLRldEytFHAiCSAFTAdxvyP084IlJYuTHi3HdkVVmyuqEY4tPtHfUXGKHS602jMs2fgpC/YW6rEfLbbY27jDIPcq9IsKF5dhV34ry89l2SXKVVsOSMwM9cth5SrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTzn5ut1; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTzn5ut1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707004454; x=1738540454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=40AZdHO8wcuSQRp4vNa3O1TClVrrjn4ceXDlegYULcY=;
  b=RTzn5ut1iTqwJMkfmm4N0BIjp+vxcAF9DrTIN1Mw8FzF5oNOIHwqvTIM
   No3BdETgLL9wETzVd2+TnbTHTtsNLpnn2gD6mJ/lpQwMqCmOCaIx6q/VM
   RplVeOgsaFAOnHmAqtusag+Ia6yjf3gIIUkDoX/mgeOu7V5ys7N6a2T0x
   GS9Knjgjx/2f6x9h1fJNDmRttssfMHSTjE+qp32bZv2eR4vy5XlSPmo4T
   9CTOpQ5SgLqiR2HuCYB+XDc3+IU6ii6GlCtGUP2VjF1k+Knh+UpZBvsjK
   8EihVW7KqZ45pTbNU3omaA6IHAZ6hSA38GW2QBZnMLerIPeTeKKxLrNq/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="435486889"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="435486889"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 15:54:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="37822298"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2024 15:54:12 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWPpp-0005kg-2z;
	Sat, 03 Feb 2024 23:54:09 +0000
Date: Sun, 4 Feb 2024 07:53:33 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.8-rc2-esp32 49/52]
 drivers/dma/esp32s3-gdma.c:126:23: warning: 'chan2dev' defined but not used
Message-ID: <202402040735.wMkYChyN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.8-rc2-esp32
head:   b25ff15921c2ce0b8abd0f2797f4942a28866d9e
commit: 56caa312033111ebf2deda0883cc9be38a3213c7 [49/52] WIP: gdma driver
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20240204/202402040735.wMkYChyN-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040735.wMkYChyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040735.wMkYChyN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma/esp32s3-gdma.c:126:23: warning: 'chan2dev' defined but not used [-Wunused-function]
     126 | static struct device *chan2dev(struct esp32_dma_chan *chan)
         |                       ^~~~~~~~
>> drivers/dma/esp32s3-gdma.c:114:31: warning: 'to_esp32_dma_chan' defined but not used [-Wunused-function]
     114 | static struct esp32_dma_chan *to_esp32_dma_chan(struct dma_chan *c)
         |                               ^~~~~~~~~~~~~~~~~


vim +/chan2dev +126 drivers/dma/esp32s3-gdma.c

   113	
 > 114	static struct esp32_dma_chan *to_esp32_dma_chan(struct dma_chan *c)
   115	{
   116		return container_of(c, struct esp32_dma_chan, vc.chan);
   117	}
   118	
   119	#if 0
   120	static struct esp32_dma_desc *to_esp32_dma_desc(struct virt_dma_desc *vdesc)
   121	{
   122		return container_of(vdesc, struct esp32_dma_desc, vdesc);
   123	}
   124	#endif
   125	
 > 126	static struct device *chan2dev(struct esp32_dma_chan *chan)
   127	{
   128		return &chan->vc.chan.dev->device;
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
