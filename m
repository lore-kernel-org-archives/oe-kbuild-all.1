Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEEA2DB791
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 05:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772775063; cv=none; b=Mwn1oyKKJYem8kBk3NeUL0VrizJUrZ74zPOi3ILDr8YcAS39DkBsvDBcW/mo4KdSGwuPiDoAng0LS/yMY3HgzvTDb9aAMkaKgV3DRQtL4vFDwTvMVkfNBkLWi7GgbEyrDGnRK/PqUoVW4OMtOodZUTLGv0GebqVFuIAv5GKPBcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772775063; c=relaxed/simple;
	bh=UQVj+4TB1lno7CjQqt7Cp72eJsa9hK96zF25KWsGLkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hERvHG/xNz2AQKwH55JWZOnj4SvgPyzJEpxsWnwxeydrxiiyIvsgqlZKMFksbeI+A3q+gXS8GEhX4p7WSDFlhCFFqBQ4gOfxlvd7y9mAQo2x4z6pDRNsYWTr+yyKbOdcjPbRchtDfBHPPpxRJp/SjXUwLNbNnBk5+diPbwXhBu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7+ySN7f; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7+ySN7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772775061; x=1804311061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UQVj+4TB1lno7CjQqt7Cp72eJsa9hK96zF25KWsGLkU=;
  b=i7+ySN7f64vVTVjbT17eMlTjnc2hBGB49eXXMIwfJZeiBUK+2ugevexy
   FZwKJqXm2NwwrQ5mt2uM/D1eFJv9E35ItKoaXiPv3hEzSAt8I22gGGvCA
   UkqT5BcVNqUAdeizHMLKJ05Y85VPo8+4c2MGlzHBhZhv5ZdZxlRRS+5YN
   NOOAEqJ0ANR17Rca6DFpWQZKNwSJZDz+loyv1HmOoN6jQPY7yOxLxLD6/
   bFrVJg92Ejcr+YyA+o+d85ql24JrvvJJX7ufXgLV0VM5LFkIqmL98tARg
   3e7fsPJsmlpzfKEue1kJKzD87/S9FmjWsxpGzgO+sCtmz6M1tbU7bXEbH
   A==;
X-CSE-ConnectionGUID: j6veGxw4T9mRb5NtcNjdbA==
X-CSE-MsgGUID: ln4XegS1TYiU/g6PtKv06g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84962235"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="84962235"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 21:31:00 -0800
X-CSE-ConnectionGUID: IyWP3rrCSNSM77tXvLClcw==
X-CSE-MsgGUID: 6z5QUK0KT4iHtgWvKA6zRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="221730623"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Mar 2026 21:30:58 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyNm3-000000000PJ-3h44;
	Fri, 06 Mar 2026 05:30:55 +0000
Date: Fri, 6 Mar 2026 13:30:41 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] greybus: es2: drop redundant device reference
Message-ID: <202603061306.GsnCxitD-lkp@intel.com>
References: <20260305125036.10856-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305125036.10856-1-johan@kernel.org>

Hi Johan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johan-Hovold/greybus-es2-drop-redundant-device-reference/20260305-210146
base:   linus/master
patch link:    https://lore.kernel.org/r/20260305125036.10856-1-johan%40kernel.org
patch subject: [PATCH] greybus: es2: drop redundant device reference
config: i386-buildonly-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061306.GsnCxitD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061306.GsnCxitD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061306.GsnCxitD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/greybus/es2.c: In function 'es2_destroy':
>> drivers/greybus/es2.c:775:28: warning: variable 'udev' set but not used [-Wunused-but-set-variable]
     775 |         struct usb_device *udev;
         |                            ^~~~


vim +/udev +775 drivers/greybus/es2.c

f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  772  
57bc17ffc566de drivers/staging/greybus/es2.c    Johan Hovold       2015-11-04  773  static void es2_destroy(struct es2_ap_dev *es2)
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  774  {
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21 @775  	struct usb_device *udev;
1521eb6b6995dd drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  776  	struct urb *urb;
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  777  	int i;
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  778  
74cd6503e5d4f0 drivers/staging/greybus/es2.c    Johan Hovold       2015-11-04  779  	debugfs_remove(es2->apb_log_enable_dentry);
4b1d82047ebbb1 drivers/staging/greybus/es2.c    Alex Elder         2015-10-27  780  	usb_log_disable(es2);
ca3ec299c2d090 drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2015-03-27  781  
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  782  	/* Tear down everything! */
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  783  	for (i = 0; i < NUM_CPORT_OUT_URB; ++i) {
1521eb6b6995dd drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  784  		urb = es2->cport_out_urb[i];
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  785  		usb_kill_urb(urb);
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  786  		usb_free_urb(urb);
4b1d82047ebbb1 drivers/staging/greybus/es2.c    Alex Elder         2015-10-27  787  		es2->cport_out_urb[i] = NULL;
4b1d82047ebbb1 drivers/staging/greybus/es2.c    Alex Elder         2015-10-27  788  		es2->cport_out_urb_busy[i] = false;	/* just to be anal */
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  789  	}
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  790  
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  791  	for (i = 0; i < NUM_ARPC_IN_URB; ++i) {
1521eb6b6995dd drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  792  		usb_free_urb(es2->arpc_urb[i]);
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  793  		kfree(es2->arpc_buffer[i]);
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  794  		es2->arpc_buffer[i] = NULL;
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  795  	}
9d9d3777a9db5c drivers/staging/greybus/es2.c    Alexandre Bailon   2016-07-07  796  
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  797  	for (i = 0; i < NUM_CPORT_IN_URB; ++i) {
7330c48ec09367 drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  798  		usb_free_urb(es2->cport_in.urb[i]);
7330c48ec09367 drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  799  		kfree(es2->cport_in.buffer[i]);
7330c48ec09367 drivers/staging/greybus/es2.c    Greg Kroah-Hartman 2016-08-17  800  		es2->cport_in.buffer[i] = NULL;
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  801  	}
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  802  
52033fdebc9202 drivers/staging/greybus/es2.c    Vaibhav Agarwal    2016-05-27  803  	/* release reserved CDSI0 and CDSI1 cports */
52033fdebc9202 drivers/staging/greybus/es2.c    Vaibhav Agarwal    2016-05-27  804  	gb_hd_cport_release_reserved(es2->hd, ES2_CPORT_CDSI1);
52033fdebc9202 drivers/staging/greybus/es2.c    Vaibhav Agarwal    2016-05-27  805  	gb_hd_cport_release_reserved(es2->hd, ES2_CPORT_CDSI0);
52033fdebc9202 drivers/staging/greybus/es2.c    Vaibhav Agarwal    2016-05-27  806  
4b1d82047ebbb1 drivers/staging/greybus/es2.c    Alex Elder         2015-10-27  807  	udev = es2->usb_dev;
c1700479845bc3 drivers/staging/greybus/es2.c    Johan Hovold       2015-11-04  808  	gb_hd_put(es2->hd);
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  809  }
f587027e793cf8 drivers/staging/greybus/gb-es2.c Greg Kroah-Hartman 2015-01-21  810  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
