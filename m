Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A001F212D6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734006145; cv=none; b=QSZKJEAE0oTCH/UCgQAEZGsn21/4YrkPgmId8mo5HuNOQwDbRtjHDj6+ApQovN/P5QFM+nN2mXfcyjLofKWoyzhspGgE8qMVQtylJTBS7FIRHU4s+5VNwSrI/HAZ3tktHdfLINBioy/MkKgI5t3hwh2yPhBMqV7Uodym5w0NMRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734006145; c=relaxed/simple;
	bh=NblIXBAJLV6G84/j4l8GzbJeCCaflKI6d0l482olEwI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XUcXLJ++qn+H6HAK9YTfZpKgkPtAbfIJDHgAHt13Ynuq0s8UWxz0m7dRkzb7yexSAG2nTnwDUxgk/aN0OEZuxniCo6fnGbqfdK+1vdNUJz4JDF0xOYO2K5cV1iA8zG+tKexXa2FnEemSYkz7OoU8Dc0UNlYwrXxepLjHim/iiDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ndd/w/QR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ndd/w/QR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734006143; x=1765542143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NblIXBAJLV6G84/j4l8GzbJeCCaflKI6d0l482olEwI=;
  b=Ndd/w/QRPLKV8nkbFk1LBiuFaXc73ICW00+cs1KejvDAjDReE3tX/qCA
   rgBXtbAHk8FDg9VCh4QCk+lvAi1UvkOspH9OxnIemTgR41FDBrKHOZQFE
   cwC0UIwHAaXsng0GmrxRUsTRJgXKDF1M2eRks+HbKsO4bH1tHKNGRW/Sg
   qxhkS9AsAqtIHDuj+koB0HkX/9qpUevDbv600/5B5cT5s/V3Zgs8KHvTj
   sUX69wQRTx3LT5t0o5q/UFdbzVsvAlXvsGNcCmGzTuhTjwKCLQVpLm1UX
   xeLT07mmI2eyTiRDWSDNX1o4wWoQQp6cklw69edhpyO1Q3qn/6TGhZgyC
   Q==;
X-CSE-ConnectionGUID: IPLKRnSJRdKI4ObwUWmR6A==
X-CSE-MsgGUID: PmuPKLk9SPWg37gDi2Llww==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34342236"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34342236"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 04:22:23 -0800
X-CSE-ConnectionGUID: zwzTRp/qQBOGkkSo7drBbg==
X-CSE-MsgGUID: CfoHRfvMR0C06iJ6Ckoalg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="96088792"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2024 04:22:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLiCy-0007ou-0B;
	Thu, 12 Dec 2024 12:22:20 +0000
Date: Thu, 12 Dec 2024 20:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 11093/30000]
 drivers/usb/gadget/udc/core.c:517: warning: Function parameter or member
 'ep' not described in 'usb_gsi_ep_op'
Message-ID: <202412122006.XUaCvCQa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hridya,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: 632093eced49c76aa97f564248efc6d041779135 [11093/30000] ANDROID: GKI: USB: Resolve ABI diff for usb_gadget and usb_gadget_ops
config: arm-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412122006.XUaCvCQa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412122006.XUaCvCQa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412122006.XUaCvCQa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/udc/core.c:25: warning: Incorrect use of kernel-doc format:  * struct usb_udc - describes one usb device controller
   drivers/usb/gadget/udc/core.c:36: warning: cannot understand function prototype: 'struct usb_udc '
>> drivers/usb/gadget/udc/core.c:517: warning: Function parameter or member 'ep' not described in 'usb_gsi_ep_op'
>> drivers/usb/gadget/udc/core.c:517: warning: Function parameter or member 'req' not described in 'usb_gsi_ep_op'
>> drivers/usb/gadget/udc/core.c:517: warning: Function parameter or member 'op' not described in 'usb_gsi_ep_op'
   drivers/usb/gadget/udc/core.c:933: warning: Function parameter or member 'ep' not described in 'usb_gadget_giveback_request'
   drivers/usb/gadget/udc/core.c:933: warning: Function parameter or member 'req' not described in 'usb_gadget_giveback_request'
   drivers/usb/gadget/udc/core.c:1130: warning: Function parameter or member 'udc' not described in 'usb_gadget_udc_stop'
   drivers/usb/gadget/udc/core.c:1130: warning: Excess function parameter 'gadget' description in 'usb_gadget_udc_stop'
   drivers/usb/gadget/udc/core.c:1130: warning: Excess function parameter 'driver' description in 'usb_gadget_udc_stop'


vim +517 drivers/usb/gadget/udc/core.c

   508	
   509	/**
   510	 * usb_gsi_ep_op - performs operation on GSI accelerated EP based on EP op code
   511	 *
   512	 * Operations such as EP configuration, TRB allocation, StartXfer etc.
   513	 * See gsi_ep_op for more details.
   514	 */
   515	int usb_gsi_ep_op(struct usb_ep *ep,
   516			struct usb_gsi_request *req, enum gsi_ep_op op)
 > 517	{
   518		if (ep && ep->ops && ep->ops->gsi_ep_op)
   519			return ep->ops->gsi_ep_op(ep, req, op);
   520	
   521		return -EOPNOTSUPP;
   522	}
   523	EXPORT_SYMBOL_GPL(usb_gsi_ep_op);
   524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
