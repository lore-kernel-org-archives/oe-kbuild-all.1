Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BC71A08AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 02:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774576960; cv=none; b=AclIp2T3tY5Xcm7XLFv+3Bnlzl969D8BvytPMYZTu/rtmXXanbLEeJFqhmaaDNoiF+uTj35qDgJf5cdvYrZsisxBnmDdv+9z+UrfG14MOUnd2xn0vAxImd9P+6w7KuHOOQp4qKdLjlJj67eQIPsErRClhoWSDIQV9KyqVTaknRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774576960; c=relaxed/simple;
	bh=FzdE07b2tYW45qx8aG1KgKrXn+V2mnBg1Hg2NjRtGZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P24HiSkFnthnIr6/wXkBQFsa6o83ckz5qw45xbLeaN72pYLQnj09dcPQVsKmrmwRZdAADYwMbgpcaDzWdWOoYgtxSkl0IKMOngXRGu2kWFvaYU7X2jF0kmoGFZ9BIblbdaT7NkUkvbTL13fAKTpNYw9xFlo4+dYcZ+muJDHlp3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R569ta++; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R569ta++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774576959; x=1806112959;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FzdE07b2tYW45qx8aG1KgKrXn+V2mnBg1Hg2NjRtGZE=;
  b=R569ta++Q5vhCaPPYQhgv2EcRCPW2FZW3HpfoTjCJlF0Vc/YVPtSWRxH
   7VZVg2v8nGLWmQgw+THBRxUfvHyxkhko2M6C3cP8Y40dYYMjizu2ibINK
   elw04H3mDCfTxUKeg712ozYVcfcjowxN0lvAtOfXnQ05VavmqoR5gnEjd
   OnMXfc4tzb2DDmx71rua7mIjxa4pRH0ivZMxbdC5ASIhLZceUhKBFBUxU
   VzCvwWE0s+tFSKS8eqOHrI9qQqnDOJ1HDMO2xqYNodf0k9t1gDF6anVhz
   UfXjOUamSbyo3f5bMxw09/YQrVLaDO/6Y7TuM3zbKInDSh6rFFCHhb+la
   A==;
X-CSE-ConnectionGUID: 72wM3DJ5SxizNs1wE488uw==
X-CSE-MsgGUID: bKtsY5wvRgql/7uBfmetYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="86342211"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="86342211"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 19:02:38 -0700
X-CSE-ConnectionGUID: rfb/XM8NTw+aZJ5SeDGSAQ==
X-CSE-MsgGUID: lPaqEe1WTpuvzSZ78gXIMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="221864164"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 26 Mar 2026 19:02:38 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5wWx-000000009eb-2Yl1;
	Fri, 27 Mar 2026 02:02:35 +0000
Date: Fri, 27 Mar 2026 10:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V3] x86/VMBus: Confidential VMBus for dynamic DMA
 transfers
Message-ID: <202603270900.wxNPPy02-lkp@intel.com>
References: <20260325075649.248241-1-tiala@microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325075649.248241-1-tiala@microsoft.com>

Hi Tianyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc5 next-20260326]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/x86-VMBus-Confidential-VMBus-for-dynamic-DMA-transfers/20260325-162853
base:   linus/master
patch link:    https://lore.kernel.org/r/20260325075649.248241-1-tiala%40microsoft.com
patch subject: [RFC PATCH V3] x86/VMBus: Confidential VMBus for dynamic DMA transfers
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603270900.wxNPPy02-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270900.wxNPPy02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270900.wxNPPy02-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hv/vmbus_drv.c: In function 'vmbus_device_register':
>> drivers/hv/vmbus_drv.c:2194:17: error: implicit declaration of function 'swiotlb_dev_disable' [-Wimplicit-function-declaration]
    2194 |                 swiotlb_dev_disable(&child_device_obj->device);
         |                 ^~~~~~~~~~~~~~~~~~~


vim +/swiotlb_dev_disable +2194 drivers/hv/vmbus_drv.c

  2172	
  2173	/*
  2174	 * vmbus_device_register - Register the child device
  2175	 */
  2176	int vmbus_device_register(struct hv_device *child_device_obj)
  2177	{
  2178		struct kobject *kobj = &child_device_obj->device.kobj;
  2179		int ret;
  2180	
  2181		dev_set_name(&child_device_obj->device, "%pUl",
  2182			     &child_device_obj->channel->offermsg.offer.if_instance);
  2183	
  2184		child_device_obj->device.bus = &hv_bus;
  2185		child_device_obj->device.parent = vmbus_root_device;
  2186		child_device_obj->device.release = vmbus_device_release;
  2187	
  2188		child_device_obj->device.dma_parms = &child_device_obj->dma_parms;
  2189		child_device_obj->device.dma_mask = &child_device_obj->dma_mask;
  2190		dma_set_mask(&child_device_obj->device, DMA_BIT_MASK(64));
  2191	
  2192		device_initialize(&child_device_obj->device);
  2193		if (child_device_obj->channel->co_external_memory)
> 2194			swiotlb_dev_disable(&child_device_obj->device);
  2195	
  2196		/*
  2197		 * Register with the LDM. This will kick off the driver/device
  2198		 * binding...which will eventually call vmbus_match() and vmbus_probe()
  2199		 */
  2200		ret = device_add(&child_device_obj->device);
  2201		if (ret) {
  2202			pr_err("Unable to register child device\n");
  2203			put_device(&child_device_obj->device);
  2204			return ret;
  2205		}
  2206	
  2207		/*
  2208		 * If device_register() found a driver to assign to the device, the
  2209		 * driver's probe function has already run at this point. If that
  2210		 * probe function accesses or operates on the "channels" subdirectory
  2211		 * in sysfs, those operations will have failed because the "channels"
  2212		 * subdirectory doesn't exist until the code below runs. Or if the
  2213		 * probe function creates a /dev entry, a user space program could
  2214		 * find and open the /dev entry, and then create a race by accessing
  2215		 * the "channels" subdirectory while the creation steps are in progress
  2216		 * here. The race can't result in a kernel failure, but the user space
  2217		 * program may get an error in accessing "channels" or its
  2218		 * subdirectories. See also comments with vmbus_add_dynid() about a
  2219		 * related race condition.
  2220		 */
  2221		child_device_obj->channels_kset = kset_create_and_add("channels",
  2222								      NULL, kobj);
  2223		if (!child_device_obj->channels_kset) {
  2224			ret = -ENOMEM;
  2225			goto err_dev_unregister;
  2226		}
  2227	
  2228		ret = vmbus_add_channel_kobj(child_device_obj,
  2229					     child_device_obj->channel);
  2230		if (ret) {
  2231			pr_err("Unable to register primary channel\n");
  2232			goto err_kset_unregister;
  2233		}
  2234		hv_debug_add_dev_dir(child_device_obj);
  2235	
  2236		return 0;
  2237	
  2238	err_kset_unregister:
  2239		kset_unregister(child_device_obj->channels_kset);
  2240	
  2241	err_dev_unregister:
  2242		device_unregister(&child_device_obj->device);
  2243		return ret;
  2244	}
  2245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
