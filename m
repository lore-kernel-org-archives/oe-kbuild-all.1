Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD3114008
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 02:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707360207; cv=none; b=Rv06S1bOfx1yRs2A6aFROpRvYmLJGOElhuteGdWZARE+o5AiX4wyEyCQpahHnyXOAvsrDPrBHS2uc9d9nHBWZXC+X9CBPQlM+YWwrz/ktDL/f3ucA9Hs11ecgZK5F/QqCdE5PJNsP17YzBqrzUe0SyIeYXXq/BhLaz8a2f+isPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707360207; c=relaxed/simple;
	bh=17qUkxJsRvjIwPnofp/eqIE56SmHTSHd/YBgUAZH3yY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt/Ox8kO6kZ5R1k9kfHdTfzQYreRASYMbLo+sE3Q2Z5pBR2zlLoIf55ACXJXqJOvBaCzczMFOmiPHffOs6vpsjgbgguKaOFtOWwZLYHBtumgYmU8h5rfcpuz1xJaZuYNY76iFnI7czLF57qr0Qdzm5b+cGvVP9lIvUdwY6MHeKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h8DcT4X8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h8DcT4X8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707360206; x=1738896206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=17qUkxJsRvjIwPnofp/eqIE56SmHTSHd/YBgUAZH3yY=;
  b=h8DcT4X8sOKZ4EzIGtcZ9kt8hvKran3jDeJic2lpnGljc/tZ7TCKoZqW
   gqN2Z4woIGW4BJAYWwwlucbqgNDo+3t1iPIWbk1Hjf2avhzrKW6s+Rb2v
   tta2HEWzBThnmKcG7FS639Pn466wTi4wQT6klQh6quhANRQYD+Z/h8cKP
   z1nsggMWQD7ea//g7FkxADB1TFvraI0v1YBPJsvN0LVHC0+FywHW0rFTe
   2VtvR7yPe592ca/aZdh/mGWhy5vnloT43Ziiqyv29FdEEkuczEYgkboVN
   NCRGZQFHv/LEsORE6IFoFDIbPaZLkPmrnJXKb/iEphnN+UjAex4vu258K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11766596"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="11766596"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 18:43:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1533666"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Feb 2024 18:43:22 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXuNk-0003H3-0x;
	Thu, 08 Feb 2024 02:43:20 +0000
Date: Thu, 8 Feb 2024 10:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: James Ogletree <jogletre@opensource.cirrus.com>,
	dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, jeff@labundy.com
Cc: oe-kbuild-all@lists.linux.dev, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	James Ogletree <jogletre@opensource.cirrus.com>
Subject: Re: [PATCH v6 4/5] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Message-ID: <202402081011.F6Z941U6-lkp@intel.com>
References: <20240207003612.4187370-5-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207003612.4187370-5-jogletre@opensource.cirrus.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes broonie-sound/for-next linus/master v6.8-rc3 next-20240207]
[cannot apply to dtor-input/next dtor-input/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Ogletree/firmware-cs_dsp-Add-write-sequencer-interface/20240207-083734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240207003612.4187370-5-jogletre%40opensource.cirrus.com
patch subject: [PATCH v6 4/5] Input: cs40l50 - Add support for the CS40L50 haptic driver
config: sh-randconfig-r122-20240207 (https://download.01.org/0day-ci/archive/20240208/202402081011.F6Z941U6-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240208/202402081011.F6Z941U6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081011.F6Z941U6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/input/misc/cs40l50-vibra.c:245:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *__from @@     got signed short [noderef] [usertype] __user *custom_data @@
   drivers/input/misc/cs40l50-vibra.c:245:53: sparse:     expected void const *__from
   drivers/input/misc/cs40l50-vibra.c:245:53: sparse:     got signed short [noderef] [usertype] __user *custom_data
   drivers/input/misc/cs40l50-vibra.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   drivers/input/misc/cs40l50-vibra.c:239:45: sparse: sparse: dereference of noderef expression

vim +245 drivers/input/misc/cs40l50-vibra.c

   216	
   217	static int vibra_upload_owt(struct vibra_work *work_data, struct vibra_effect *effect)
   218	{
   219		struct ff_periodic_effect add_effect = work_data->effect->u.periodic;
   220		u32 len = 2 * add_effect.custom_len, wt_offset, wt_size;
   221		struct vibra_info *info = work_data->info;
   222		struct owt_header header;
   223		u8 *out_data;
   224		int error;
   225	
   226		error = regmap_read(info->regmap, info->dsp.owt_size_reg, &wt_size);
   227		if (error)
   228			return error;
   229	
   230		if ((wt_size * sizeof(u32)) < sizeof(header) + len) {
   231			dev_err(info->dev, "No space in OWT bank for effect\n");
   232			return -ENOSPC;
   233		}
   234	
   235		out_data = kzalloc(sizeof(header) + len, GFP_KERNEL);
   236		if (!out_data)
   237			return -ENOMEM;
   238	
   239		header.type = add_effect.custom_data[0] == CS40L50_PCM_ID ? CS40L50_TYPE_PCM :
   240									    CS40L50_TYPE_PWLE;
   241		header.offset = sizeof(header) / sizeof(u32);
   242		header.data_words = len / sizeof(u32);
   243	
   244		memcpy(out_data, &header, sizeof(header));
 > 245		memcpy(out_data + sizeof(header), add_effect.custom_data, len);
   246	
   247		error = regmap_read(info->regmap, info->dsp.owt_offset_reg, &wt_offset);
   248		if (error)
   249			return error;
   250	
   251		error = regmap_bulk_write(info->regmap, info->dsp.owt_base_reg +
   252					  (wt_offset * sizeof(u32)), out_data,
   253					  sizeof(header) + len);
   254		if (error)
   255			goto err_free;
   256	
   257		error = info->dsp.write(info->dev, info->regmap, info->dsp.push_owt_cmd);
   258	err_free:
   259		kfree(out_data);
   260	
   261		return error;
   262	}
   263	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
