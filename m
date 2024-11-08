Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8FF1E0DAC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731058923; cv=none; b=YXd+mHSimWoqCyciG0aPrwp7kvlbKew4l9nveMUMmWh8cjdB+wg4q0SNH7Spvwx5vAYdVCrDr3SjAC4Qu0TkQrBxMYkNgHxKAL6DZalE5JoLu2NXjzHe4NGPEAyMCmdHtdM0UdpRYOuT+gnsvWnNJbw4pWfPDCZF+9pXXgwDv9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731058923; c=relaxed/simple;
	bh=nKtPPXEpNUH5k10o5RiNH9EMeDmQXlCLSScB7FkiAHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luavb/8KXagbpoyoOHEg88XKdD9zbx3AgR32sXfQNBaJQ8/nCy9nzd2v4iUn6uEwYWnej87tH++i6msnsJ2ywUODN+k8zd5H7Kv0lZYvhIGlHk2JKVpoSl5Lh97l/4fZHbfbL8eDEydl+FiqGxvJCMRv5CG3QkR4pfWX2+sh7Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DipcMmZZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DipcMmZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731058922; x=1762594922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nKtPPXEpNUH5k10o5RiNH9EMeDmQXlCLSScB7FkiAHk=;
  b=DipcMmZZ0HmMq5SEYHqTcwKtecP5Yw+5zH2xECgeM4c69N0OBbs/023i
   dZfAsv6cHyMqiBtfZnMxZa7czzhSqJsLt1l2op+S8zcAXsr1W0EVUAK1w
   lQHJELUG5J+bn9Rxd3hvh2om9p0FzNIPz1Kc8t6m+en0CaB7rKNwXVUUP
   I3ZQAF6ucxFRek+WcF+ObS4x7BDaKEwwsYeWJkj0AnqYwUMWUU4OLTA6E
   i+c4BkCQZfLqq0lirFIxeyNSc0QK9blesNwXGLL2q3eHmFuD2HeqLl3bl
   UcgdmiO0w//Yu422+u1ky2u/hz2PC9KknfKPNAOvdgnlMBLLD8l+vZy2f
   Q==;
X-CSE-ConnectionGUID: sgX19X9IRIuNkBszofDtqQ==
X-CSE-MsgGUID: 5Ssj+dlHTeGWziOyTGntDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="41544581"
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="41544581"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 01:41:59 -0800
X-CSE-ConnectionGUID: 089upF2OTkK+V+4iykwmiQ==
X-CSE-MsgGUID: jnIgSbSUSxa9l979yxDy5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="90014552"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2024 01:41:57 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9LV5-000rGx-2v;
	Fri, 08 Nov 2024 09:41:55 +0000
Date: Fri, 8 Nov 2024 17:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: Re: [PATCH] iio: light: veml6030: add support for triggered buffer
Message-ID: <202411081703.Ft0YjqcK-lkp@intel.com>
References: <20241107-veml6030_triggered_buffer-v1-1-4810ab86cc56@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-veml6030_triggered_buffer-v1-1-4810ab86cc56@gmail.com>

Hi Javier,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c9f8285ec18c08fae0de08835eb8e5953339e664]

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/iio-light-veml6030-add-support-for-triggered-buffer/20241108-042332
base:   c9f8285ec18c08fae0de08835eb8e5953339e664
patch link:    https://lore.kernel.org/r/20241107-veml6030_triggered_buffer-v1-1-4810ab86cc56%40gmail.com
patch subject: [PATCH] iio: light: veml6030: add support for triggered buffer
config: i386-randconfig-062-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081703.Ft0YjqcK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081703.Ft0YjqcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081703.Ft0YjqcK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/light/veml6030.c:958:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 @@     got int [addressable] reg @@
   drivers/iio/light/veml6030.c:958:39: sparse:     expected restricted __le16
   drivers/iio/light/veml6030.c:958:39: sparse:     got int [addressable] reg

vim +958 drivers/iio/light/veml6030.c

   944	
   945	static irqreturn_t veml6030_trigger_handler(int irq, void *p)
   946	{
   947		struct iio_poll_func *pf = p;
   948		struct iio_dev *iio = pf->indio_dev;
   949		struct veml6030_data *data = iio_priv(iio);
   950		int i, ret, reg;
   951		int j = 0;
   952	
   953		iio_for_each_active_channel(iio, i) {
   954			ret = regmap_read(data->regmap, VEML6030_REG_DATA(i), &reg);
   955			if (ret)
   956				goto done;
   957	
 > 958			data->scan.chans[j++] = reg;
   959		}
   960	
   961		iio_push_to_buffers_with_timestamp(iio, &data->scan, pf->timestamp);
   962	
   963	done:
   964		iio_trigger_notify_done(iio->trig);
   965	
   966		return IRQ_HANDLED;
   967	}
   968	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
