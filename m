Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8732AD0F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 02:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725331537; cv=none; b=I9wCNYzgei0OnU6bgubpqsofZMjeqZei+Hy8ictN9Jk5BagfFe9pEWJLkeDEQwScLQTGRqtog1SG58jV191Jl+IrnPTX3/fu28zGCCRbZINosZVpPPyp/Et5zazGcUkS5fn0aQ4wiPPGH7MeStVNeI+tY8qO33OOZD1OKzNpmQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725331537; c=relaxed/simple;
	bh=MHHIYSVZTOItznYe8g3drAAVnhEfb5jPrC++Nbo5D3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy2GDXkYGvvqyMRhhxXscaR3QLH364KsMWRbuO+wNG2parzX2KvDwQgr2M2X050mw+NTMXB/U8oWaxMWB1TN2i2gCOGmAX6pJXth7naTsk2YfJNrxvFr0QrIa/lYpYcvortpfloDxQ4ryPYLqjmibvVHjzekOBwxeCNnCHnAVBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebbAvYM5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebbAvYM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725331535; x=1756867535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MHHIYSVZTOItznYe8g3drAAVnhEfb5jPrC++Nbo5D3U=;
  b=ebbAvYM5mWM+/fFIGZk7luecNhpUSoGIKlTLUiRfByNAVZoUfmAwCdnK
   kDcAjRZOD7t385riOZojLbhAfHwBb0r/e+5jV0IUnzTeIJsaC51ijX64g
   Q66kFnE5mR7P3WBl5hhoJl+MHskXkB0MEpHrqio/Gj9Aycu8ReD/PAvl8
   LgQ1cIE6RoQ5EjWusbdnGEDezNxsCmw2hk8cu7p1RJTW+S+3BAbpje1Un
   Wlaod15hrWcJMGGxXnMPJL2/oKU5jD0bc9ztX1IIPaQkIQUHmbKm1RsmI
   1zVOhXLPgrMwpIO64KH+F+qLKquew9mrStQpL+3/qxBRzVfP2ZzlTym/7
   Q==;
X-CSE-ConnectionGUID: HPJkJVQ0Tti922UFP74gwQ==
X-CSE-MsgGUID: sO0Y2OqNScCfmqNC8kfiSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34516785"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="34516785"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 19:45:35 -0700
X-CSE-ConnectionGUID: RyZusmreQp2Pu0RVgKK0dA==
X-CSE-MsgGUID: QHIJ3XojQUa5z3c9QV+Cug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="68892648"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 02 Sep 2024 19:45:33 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slJXv-00067a-0V;
	Tue, 03 Sep 2024 02:45:31 +0000
Date: Tue, 3 Sep 2024 10:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Abhash Jha <abhashkumarjha123@gmail.com>, linux-iio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, songqiang1304521@gmail.com,
	jic23@kernel.org, lars@metafoo.de, linux-kernel@vger.kernel.org,
	Abhash Jha <abhashkumarjha123@gmail.com>
Subject: Re: [PATCH v2 2/2] iio: proximity: vl53l0x-i2c: Added continuous
 mode support
Message-ID: <202409030911.PnMVrgOb-lkp@intel.com>
References: <20240902122557.129013-3-abhashkumarjha123@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902122557.129013-3-abhashkumarjha123@gmail.com>

Hi Abhash,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v6.11-rc6 next-20240902]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhash-Jha/iio-proximity-vl53l0x-i2c-Added-sensor-ID-check/20240902-204936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20240902122557.129013-3-abhashkumarjha123%40gmail.com
patch subject: [PATCH v2 2/2] iio: proximity: vl53l0x-i2c: Added continuous mode support
config: i386-buildonly-randconfig-001-20240903 (https://download.01.org/0day-ci/archive/20240903/202409030911.PnMVrgOb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409030911.PnMVrgOb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409030911.PnMVrgOb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iio/proximity/vl53l0x-i2c.c: In function 'vl53l0x_trigger_handler':
>> drivers/iio/proximity/vl53l0x-i2c.c:104:27: error: implicit declaration of function 'get_unaligned_be16' [-Werror=implicit-function-declaration]
     104 |         data->scan.chan = get_unaligned_be16(&buffer[10]);
         |                           ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/get_unaligned_be16 +104 drivers/iio/proximity/vl53l0x-i2c.c

    87	
    88	static irqreturn_t vl53l0x_trigger_handler(int irq, void *priv)
    89	{
    90		struct iio_poll_func *pf = priv;
    91		struct iio_dev *indio_dev = pf->indio_dev;
    92		struct vl53l0x_data *data = iio_priv(indio_dev);
    93		u8 buffer[12];
    94		int ret;
    95	
    96		ret = i2c_smbus_read_i2c_block_data(data->client,
    97						VL_REG_RESULT_RANGE_STATUS,
    98						sizeof(buffer), buffer);
    99		if (ret < 0)
   100			return ret;
   101		else if (ret != 12)
   102			return -EREMOTEIO;
   103	
 > 104		data->scan.chan = get_unaligned_be16(&buffer[10]);
   105		iio_push_to_buffers_with_timestamp(indio_dev, &data->scan,
   106						iio_get_time_ns(indio_dev));
   107	
   108		iio_trigger_notify_done(indio_dev->trig);
   109		ret = vl53l0x_clear_irq(data);
   110		if (ret < 0)
   111			return ret;
   112	
   113		return IRQ_HANDLED;
   114	}
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
