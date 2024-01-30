Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F7865BAC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jan 2024 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706602879; cv=none; b=S7BqsoF58bF0CTVnLTJ4OL8kCExppF12uf6LtIuj1nbJAoyPKKxfo3MKWBd90JtfkKj73buvnv6gidMwO5inUZcfrfAzRbraGLBh1WqgCovnyI6EYulD5Ftv69z3Y1dUpxd17vUWiQoBqYHgx+Rn/9+tyvcxFMggCV2yp1wcaEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706602879; c=relaxed/simple;
	bh=K3A6/01OkdrP0ndk3EQUW4huoabE9/8MQs4RzE4XD0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYrBn+E3EFR3up5ZnRtxYcEHP+WMqZ+UbyzCm5AbU7M8o4FmjU0YNHlZ8WrmBfSiu9Ys1RZSSvKUwA/FGSSseoKtsesRXQY7Xtk7SjsK3kyB8vxcShvA3vv+SUr4pyRmnRHHNIA5X/MyTZHu1NmU4BmeCUM+uZ5dGskWZ6Bt5Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QxbGw0UT; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QxbGw0UT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706602877; x=1738138877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K3A6/01OkdrP0ndk3EQUW4huoabE9/8MQs4RzE4XD0U=;
  b=QxbGw0UTcWIwEAlBXGjAuyQzAsrrzodH0KWoKGn/MgzL3cFJPirc9hxU
   zVH6gUZtWFlqxfpTqOl95YKReOG2/glsbosJn3wVoVJuQfkNVxtTfVkWH
   GAiFOzopKt1QehVxGOE7/HV1SxynFxNzi9o6nmAIaBtHePbayj/TSYviN
   7zSOQ8KQQ0+W3EiLEYNOh6JQ5MQxyjBmgoWD/iBwb0nATzXKescdiU19V
   wZgKCBFuazMC81XDlNap0xD1JyFzKj/bwO0F5rgc3PX90okiHIHgke8kY
   HrFFHtmdVSIUwjLMxxLUb+Zf+o4pmRtY6+THS+8tL0ej5zaZYec75fVV4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393637277"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="393637277"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 00:21:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="961183969"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="961183969"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 30 Jan 2024 00:21:13 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUjMk-00007t-2c;
	Tue, 30 Jan 2024 08:21:10 +0000
Date: Tue, 30 Jan 2024 16:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mnyman-xhci:feature_interrupters 4/4]
 drivers/usb/host/xhci-sideband.c:244:18: error: too few arguments to
 function 'xhci_create_secondary_interrupter'
Message-ID: <202401301657.ftLjRURt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
head:   a7f098b5bba5fe24fe938751ed128c6dd9b967f9
commit: a7f098b5bba5fe24fe938751ed128c6dd9b967f9 [4/4] xhci: sideband: add initial api to register a sideband entity
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240130/202401301657.ftLjRURt-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401301657.ftLjRURt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401301657.ftLjRURt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/host/xhci-sideband.c: In function 'xhci_sideband_create_interrupter':
>> drivers/usb/host/xhci-sideband.c:244:18: error: too few arguments to function 'xhci_create_secondary_interrupter'
     244 |         sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci));
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/usb/host/xhci-sideband.c:14:
   drivers/usb/host/xhci.h:2093:1: note: declared here
    2093 | xhci_create_secondary_interrupter(struct usb_hcd *hcd, int num_seg);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/xhci_create_secondary_interrupter +244 drivers/usb/host/xhci-sideband.c

   224	
   225	/**
   226	 * xhci_sideband_create_interrupter - creates a new interrupter for this sideband
   227	 * @sb: sideband instance for this usb device
   228	 *
   229	 * Sets up a xhci interrupter that can be used for this sideband accessed usb
   230	 * device. Transfer events for this device can be routed to this interrupters
   231	 * event ring by setting the 'Interrupter Target' field correctly when queueing
   232	 * the transfer TRBs.
   233	 * Once this interrupter is created the interrupter target ID can be obtained
   234	 * by calling xhci_sideband_interrupter_id()
   235	 *
   236	 * Returns 0 on success, negative error otherwise
   237	 */
   238	int
   239	xhci_sideband_create_interrupter(struct xhci_sideband *sb)
   240	{
   241		if (sb->ir)
   242			return -EBUSY;
   243	
 > 244		sb->ir = xhci_create_secondary_interrupter(xhci_to_hcd(sb->xhci));
   245		if (!sb->ir)
   246			return -ENOMEM;
   247	
   248		return 0;
   249	}
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
