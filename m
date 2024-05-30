Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B288EAC5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 01:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717031264; cv=none; b=a7bfxuipKRAD+JwFjt4afd4YXHw+yOOYl0rbNBjuFheIzBdwRlX2lVCu4m4CR6z9YpwVZdJy9S7MDu0j3ryhqQqn+ToVh7F0bAx/czDHkfq1qzjXQ4Mg4iictNVQ44q/L77bAYnQWtpVBDiaN1toEJ8NdYtjDhr3XVyD/x/yCfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717031264; c=relaxed/simple;
	bh=DJmoYBOGcoVNLMBEvrCcota/ugc5wL4TTlwryI1YZpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1LVit0uQ1zCXfwyLB5zaUk69UvLXWFuZWqqwkDeijXTOhv2emvifIFd9U2BBkXd4OmPSFZxZiMfgECXcodnVjSdeUhtxOjTezLHQ7u6K+LF2rjmC2U3rtgZgNFB2H3H3FbEZgJ42pmz33YRcXhCSgw53YVbpYSV+wLgsTqW3E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dy6pleqr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dy6pleqr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717031263; x=1748567263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DJmoYBOGcoVNLMBEvrCcota/ugc5wL4TTlwryI1YZpw=;
  b=Dy6pleqrS5gPDkQRuHNYtUhERxxt6hyS6HhbbhWrZnrd3c3kwyL+Z5X/
   r6MHHkJJWBbPrkXZHSlbVbvU/djeigfxNJ1KXhRENh+TXSyZUerqpgR0N
   72tCgyUuEEQcBy/I5UfUFahIOswIeR3Mccb0cQh110+HXi1MryXX+/hBx
   bIdbXdJpf8o4D1Y4g2CPgJ4u8RCAMKk4lCKODMksjDj1FGjE4xuKpJ5xF
   g/ygKxZQ0e+GRH32g4qDzRqMv6Z/maH4hNWXZGSvfhqz8T1CZp/G2hthO
   11U+41Ot7H2po5W/lOH4PKma68OA/rK8T4SafSZ3QBu8YoVtXRRZ78NBQ
   g==;
X-CSE-ConnectionGUID: wBMA083nSj29Y+lBVziBGw==
X-CSE-MsgGUID: GEnntdNuQEOMlLuyeoctjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24894761"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24894761"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 18:07:41 -0700
X-CSE-ConnectionGUID: cvEuSgAhSLKkjZZE3aipcw==
X-CSE-MsgGUID: vg6zkNkiQB+cW9xJ4m4Yyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="73089446"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 May 2024 18:07:39 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCUGV-000EOl-34;
	Thu, 30 May 2024 01:07:35 +0000
Date: Thu, 30 May 2024 09:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yasin Lee <yasin.lee.x@outlook.com>, jic23@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, andy.shevchenko@gmail.com,
	lars@metafoo.de, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, nuno.a@analog.com,
	swboyd@chromium.org, u.kleine-koenig@pengutronix.de,
	yasin.lee.x@gmail.com, yasin.lee.x@outlook.com
Subject: Re: [PATCH v3 2/2] iio:proximity:hx9023s: Add TYHX HX9023S sensor
 driver
Message-ID: <202405300812.jv99FywV-lkp@intel.com>
References: <SN7PR12MB81019AB7F38806097F2C8A34A4F22@SN7PR12MB8101.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN7PR12MB81019AB7F38806097F2C8A34A4F22@SN7PR12MB8101.namprd12.prod.outlook.com>

Hi Yasin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on robh/for-next linus/master v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yasin-Lee/iio-proximity-hx9023s-Add-TYHX-HX9023S-sensor-driver/20240529-170307
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/SN7PR12MB81019AB7F38806097F2C8A34A4F22%40SN7PR12MB8101.namprd12.prod.outlook.com
patch subject: [PATCH v3 2/2] iio:proximity:hx9023s: Add TYHX HX9023S sensor driver
config: x86_64-randconfig-r113-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300812.jv99FywV-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300812.jv99FywV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300812.jv99FywV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/proximity/hx9023s.c:1242:44: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 @@     got int @@
   drivers/iio/proximity/hx9023s.c:1242:44: sparse:     expected restricted __be16
   drivers/iio/proximity/hx9023s.c:1242:44: sparse:     got int

vim +1242 drivers/iio/proximity/hx9023s.c

  1228	
  1229	static irqreturn_t hx9023s_trigger_handler(int irq, void *private)
  1230	{
  1231		struct iio_poll_func *pf = private;
  1232		struct iio_dev *indio_dev = pf->indio_dev;
  1233		struct hx9023s_data *data = iio_priv(indio_dev);
  1234		int bit;
  1235		int i = 0;
  1236	
  1237		guard(mutex)(&data->mutex);
  1238		hx9023s_sample(data);
  1239		hx9023s_get_prox_state(data);
  1240	
  1241		for_each_set_bit(bit, indio_dev->active_scan_mask, indio_dev->masklength)
> 1242			data->buffer.channels[i++] = data->diff[indio_dev->channels[bit].channel];
  1243	
  1244		iio_push_to_buffers_with_timestamp(indio_dev, &data->buffer, pf->timestamp);
  1245	
  1246		iio_trigger_notify_done(indio_dev->trig);
  1247		return IRQ_HANDLED;
  1248	}
  1249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
