Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641880;
	b=vIPJ/KKmFgZGeKozsUN9wdTNXGz9Z4vvJBvfOM6xO5IGUnRhYsDMNIIFWjAxkhkItqZK
	 aaya/SAxiBd2dst/pGSTsn15Jb2K/xZNEmSuxIShcYuH3oBUnfOd402TQcjN06JU9TPsu
	 Tdzm261tir4kono9dl0UVMBJTFSiDx12w13VQFSs9fMDgA0tJ01pOClyfqa5NDasb2gDd
	 bXu/Wy2mIAiyhrzoaEvl2G/epLtdYw+VCNdSOyDMV6TCu0r2eHUdqdcrkTToOGHYvqVR1
	 koLoexwj0+QtbjQaUVd6CQq0I8dzPVI45qmc2axLj6IaDE4M1myo/RNd/mP9sNCQ5Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641880;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xAj7jpiEyoy7Xq1F4KpD+VMjNYtyQcBnCaT7UmuxD7Y=;
	b=jMRzV1fzjMm9C/YH4UIie0TkEW/x2MNMKCUN46xWMxX9fMPWWL/uedTY6sf1EyAhGusK
	 El8e509pJ812xiKEOq+wC3uT0Uhkcn1w/dhFc7lDvBcA8LxxBJ8U1Nic7a3cV/CKX3iWw
	 zCvQhR9B47xYO7Yyj24Dl5GG3JaKHFooylUk5NtHxkJzJ7DZ9bxzPKAUjxVZshpKkuMug
	 H8+QLV9YBycajF8ND5qrjFAsD4zd0V/zJDwu7js5hmKqTrnqsTToE0w09NBrHir8G3TIT
	 DxrEp/ae6kAaTSZ1UtS0swnhBrS/OvFKmaOOCICE6Hkb236E28x0zLM3s+Tsuxieepg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BCMZSN3n;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C57E606A337
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 17:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C57E606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BCMZSN3n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793641880; x=1825177880;
  h=date:from:to:cc:subject:message-id;
  bh=O/FoZfbNSwEwM5qKq0NgzbhbBhBk12X04EVAdvMZPqE=;
  b=BCMZSN3n0/kDj/4OaHBMSSgHZlPL4MZ6lj809j2rZ0p3Lj4rKeVWe9tm
   BZrBpKhezoFLwwP1Dc1cBTirEKLmqPGiy5aHm/uPxJy8kiBy3v95t/Vco
   Rqj+kJE1xxG5cu/9mnmTt5KKo6vaRWL3GbIvtwpDlLo+pjfjymMqEVT+k
   JzJUp3AbbzP9o/rIgs0j4yJvLSNkE95kk0bPUG/SbScp2LFy0dcGsH6k5
   +8BH/WOh6H+9+YYIHUnhVNIraLYD71CkkyeFaz4ol6n/A1B525Lu2FgV7
   zFmJxg0aOPl+EglMJCXVw6RN9rSQ4zq2rtjzsCuGisBFySBbvRSVEgs4x
   A==;
X-CSE-ConnectionGUID: CQYQcLAQSTqf89+7JaWfMQ==
X-CSE-MsgGUID: 2NwqsxyTQgWkG6KIamK7RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2357887"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2357887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 09:51:19 -0800
X-CSE-ConnectionGUID: M80WmDdCQ52oChSm6JdD6w==
X-CSE-MsgGUID: bpIe2jflTfiP0C0juoivWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6296973"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 02 Nov 2026 09:51:18 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNwBf-000000008gh-12cI;
	Mon, 02 Nov 2026 17:51:15 +0000
Date: Mon, 02 Nov 2026 18:50:38 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 20/20]
 drivers/usb/gadget/function/android_f_accessory.c:353:23: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202611021830.yYnGiO5Z-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e92b73070f9a9cf42236e34fdc16537c05349f91
commit: d718cad4b605a726d93e9d6fc032fed768a7fcdb [20/20] ANDROID: usb: gadget: Add Android Accessory Function
config: i386-randconfig-r2309-20261102 (https://download.01.org/0day-ci/archive/20261102/202611021830.yYnGiO5Z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261102/202611021830.yYnGiO5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611021830.yYnGiO5Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/android_f_accessory.c:353:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:786:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:798:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/android_f_accessory.c:840:23: sparse: sparse: Using plain integer as NULL pointer
>> drivers/usb/gadget/function/android_f_accessory.c:1392:6: sparse: sparse: symbol '__acc_req_match' was not declared. Should it be static?

vim +353 drivers/usb/gadget/function/android_f_accessory.c

   344	
   345	/* remove a request from the head of a list */
   346	static struct usb_request *req_get(struct acc_dev *dev, struct list_head *head)
   347	{
   348		unsigned long flags;
   349		struct usb_request *req;
   350	
   351		spin_lock_irqsave(&dev->lock, flags);
   352		if (list_empty(head)) {
 > 353			req = 0;
   354		} else {
   355			req = list_first_entry(head, struct usb_request, list);
   356			list_del(&req->list);
   357		}
   358		spin_unlock_irqrestore(&dev->lock, flags);
   359		return req;
   360	}
   361	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
