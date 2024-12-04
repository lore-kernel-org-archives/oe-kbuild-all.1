Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C571B3945
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733312693; cv=none; b=YMsjYfHUH/59/rmnL400VLeIAPmZKyhBBSd7D6IyMKMuLg8LIZJerJ4fxsimjZOFxGML63hXVabNZ9bmkSUrz9YwakejlT9gQSPu9DMNGdYK8WT3OHO2N5df5rdyW7cKan1fklxrdCQ7lke1/BYv7ZaeEXFpszhoDgcIFNw6Dig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733312693; c=relaxed/simple;
	bh=pHwngGRAb/vPrnt8FnpBqAiQofRnngsM9ULIkXyMQ/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvognRBSneZs+hs1cW7TvKULpPE4Ss8V1/WKsAOC96qdpf0HGeDIk9QPKthA5VrBOSl+W+c0x2+UFcAKHhFsKBsnUBdOAJBGoNfxBlLh2T01RMgvF4HJM01vShSucKWeLYoxyn5y9dWQdc4TiqBbQD0J25NSU0JiPVcMJzBo/Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSuU0YwM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSuU0YwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733312692; x=1764848692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pHwngGRAb/vPrnt8FnpBqAiQofRnngsM9ULIkXyMQ/k=;
  b=lSuU0YwMyx/SGA2bvdQyQkMvdc4ma12WBTR9trLFXzc9LpkENPkTFatz
   UeA3kEDvhBNM3lV+gckBju9+PdN9//p/qVUeSE1ELVEfNZPB5b3wCzl8Y
   i9RIhRs7+Dx2hjv9PO+VkWZ/EKTKYKueLS/wTRPdvH+SranG05X2ZcEoA
   19q1iToIEw2G2tYWOrDKEdD6geswiR3eCC+G8GirQLtq4OOeBazpYs7Da
   wlKhgyg2KPrPdzEXTEU56qkhN2dS0spYP9hdITgKwU9XLOTOllpdzm/aC
   wB11Rww1xQfTdttYNNijWFZxvu5LcJYxy2a+awc+zXdZmh/joNFTNFG16
   A==;
X-CSE-ConnectionGUID: VI3yLE0WR3mDNcJLZgfXHQ==
X-CSE-MsgGUID: pyjcaYuWQ8yTf2cycgDR2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44966377"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44966377"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 03:44:51 -0800
X-CSE-ConnectionGUID: HDlhMaCOTWywTgMaKE+3LA==
X-CSE-MsgGUID: jQRd2aMvS7iD2XB5yQMDDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="124670341"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Dec 2024 03:44:48 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tInoE-0002yV-0R;
	Wed, 04 Dec 2024 11:44:46 +0000
Date: Wed, 4 Dec 2024 19:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lothar Rubusch <l.rubusch@gmail.com>, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	eraretuya@gmail.com, l.rubusch@gmail.com
Subject: Re: [PATCH v3 10/10] iio: accel: adxl345: add kfifo with watermark
Message-ID: <202412041901.a986bAPP-lkp@intel.com>
References: <20241203205241.48077-11-l.rubusch@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203205241.48077-11-l.rubusch@gmail.com>

Hi Lothar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.13-rc1 next-20241203]
[cannot apply to jic23-iio/togreg v6.13-rc1 v6.12 v6.12-rc7 next-20241128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lothar-Rubusch/iio-accel-adxl345-fix-comment-on-probe/20241204-121629
base:   linus/master
patch link:    https://lore.kernel.org/r/20241203205241.48077-11-l.rubusch%40gmail.com
patch subject: [PATCH v3 10/10] iio: accel: adxl345: add kfifo with watermark
config: i386-buildonly-randconfig-004 (https://download.01.org/0day-ci/archive/20241204/202412041901.a986bAPP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041901.a986bAPP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041901.a986bAPP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/accel/adxl345_core.c:434: warning: expecting prototype for irqreturn_t adxl345_event_handler()(). Prototype was for adxl345_event_handler() instead


vim +434 drivers/iio/accel/adxl345_core.c

   425	
   426	/**
   427	 * irqreturn_t adxl345_event_handler() - Handle events of the ADXL345.
   428	 * @irq: The irq being handled.
   429	 * @p: The struct iio_device pointer for the device.
   430	 *
   431	 * Return: The interrupt was handled.
   432	 */
   433	static irqreturn_t adxl345_event_handler(int irq, void *p)
 > 434	{
   435		struct iio_dev *indio_dev = p;
   436		struct adxl345_state *st = iio_priv(indio_dev);
   437		u8 int_stat;
   438		int samples;
   439	
   440		int_stat = adxl345_get_status(st);
   441		if (int_stat < 0)
   442			return IRQ_NONE;
   443	
   444		if (int_stat == 0x0)
   445			goto err;
   446	
   447		if (int_stat & ADXL345_INT_OVERRUN)
   448			goto err;
   449	
   450		if (int_stat & (ADXL345_INT_DATA_READY | ADXL345_INT_WATERMARK)) {
   451			samples = adxl345_get_samples(st);
   452			if (samples < 0)
   453				goto err;
   454	
   455			if (adxl345_fifo_push(indio_dev, samples) < 0)
   456				goto err;
   457	
   458		}
   459		return IRQ_HANDLED;
   460	
   461	err:
   462		adxl345_fifo_reset(st);
   463	
   464		return IRQ_HANDLED;
   465	}
   466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
