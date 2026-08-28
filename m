Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0425B08F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 23:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787959347; cv=none; b=Hu2yLbVc82gJ9OE24wo3BiNCKWWIer97YD3/JjZt3x2pdPwPRzV2flWjgX9ZUrOQsmEtrA9ykgMDa7rViPieQEsTs9FouGRXt5eVDzLGcHK14SoOBmtD2Q2LWtM2CogNlrRqg7/Fr5q5uBkaywpFkLqO5CqGbnnrEShknJLsuJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787959347; c=relaxed/simple;
	bh=qGvfWfjGG1+xLgNivTV5wEVoNEWiVMHRrX1lZ4npzoc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pt/A9Y+AFflRFhfl8DPduW1gXL5AtMFSqCdJPtC9E/LmeYuHPvWqc8DhV834ffmeepnZysiHkmjDcWXbYU+ZtlHG6mNob5DQI/ok91tOT6iIuvQ/rcfSkCJ9yj3M/u8ylZ0PZu/5bfwu+IkKgvkw/pKhSabLfto1gsbH2gJx3BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hb1cpLIq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hb1cpLIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787959344; x=1819495344;
  h=date:from:to:cc:subject:message-id;
  bh=qGvfWfjGG1+xLgNivTV5wEVoNEWiVMHRrX1lZ4npzoc=;
  b=Hb1cpLIqSUqAE0SyrSJTJkpw8WKQpslhaI+tUblTMEDlKdM4xy5lBesj
   1XFuL81DPxC1g7uFS2lvX1g2+V85/xBcLyWcqAYSwMe2j4H5OCFzM24sI
   gRSVIfTTab0+1/md3uaAJwRXxJedY69SjtclOJrR7KOiKs8WnBNNdKdXD
   qW0B35hXKsDWOT073InWgKIQab2lneIlQCxpbHjxJv3K1sOGB5S0cRJBQ
   aNTfYmVztc6RPZEHLzFNJDXpiK6y+EYE1crNT+N9kJ7HS9X2t5RFmbSpP
   SnSjpocUO4QkAV9RwpHaW2DVgg5s4gsQ3LonEwq1E7q0AGcyR0XEQo0nk
   A==;
X-CSE-ConnectionGUID: 01zxYU+7S6qA2VDD+elCKQ==
X-CSE-MsgGUID: RwVZfcZISue+pDtejb9ezg==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99069342"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="99069342"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 16:22:21 -0700
X-CSE-ConnectionGUID: 2jC58K/uQ8iqskLMVu8LWA==
X-CSE-MsgGUID: cOzgmQlJQuaYUWGyhEbxTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="270231635"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2026 16:22:20 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x05tq-00000000C5o-0XUH;
	Fri, 28 Aug 2026 23:22:18 +0000
Date: Sat, 29 Aug 2026 07:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2026-06 3/3]
 drivers/usb/gadget/function/f_accessory.c:1493:5: sparse: sparse: symbol
 'acc_ctrlrequest_configfs' was not declared. Should it be static?
Message-ID: <202608290757.TgNd4V6l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2026-06
head:   3fc92ed75e44bfb2b12bc625fad7a054b939f8a6
commit: 2b2acb8f4020d07622e2957a39e3e0bf9232427d [3/3] ANDROID: usb: f_accessory: Avoid bitfields for shared variables
config: arm64-randconfig-r134-20260829 (https://download.01.org/0day-ci/archive/20260829/202608290757.TgNd4V6l-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260829/202608290757.TgNd4V6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608290757.TgNd4V6l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/gadget/function/f_accessory.c:372:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/f_accessory.c:769:35: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/f_accessory.c:783:23: sparse: sparse: Using plain integer as NULL pointer
   drivers/usb/gadget/function/f_accessory.c:825:23: sparse: sparse: Using plain integer as NULL pointer
>> drivers/usb/gadget/function/f_accessory.c:1493:5: sparse: sparse: symbol 'acc_ctrlrequest_configfs' was not declared. Should it be static?

vim +/acc_ctrlrequest_configfs +1493 drivers/usb/gadget/function/f_accessory.c

483cb5629ea789 Benoit Goby 2011-12-19  1492  
483cb5629ea789 Benoit Goby 2011-12-19 @1493  int acc_ctrlrequest_configfs(struct usb_function *f,
483cb5629ea789 Benoit Goby 2011-12-19  1494  			const struct usb_ctrlrequest *ctrl) {
483cb5629ea789 Benoit Goby 2011-12-19  1495  	if (f->config != NULL && f->config->cdev != NULL)
483cb5629ea789 Benoit Goby 2011-12-19  1496  		return acc_ctrlrequest(f->config->cdev, ctrl);
483cb5629ea789 Benoit Goby 2011-12-19  1497  	else
483cb5629ea789 Benoit Goby 2011-12-19  1498  		return -1;
483cb5629ea789 Benoit Goby 2011-12-19  1499  }
483cb5629ea789 Benoit Goby 2011-12-19  1500  

:::::: The code at line 1493 was first introduced by commit
:::::: 483cb5629ea7893f94481511e630ae14a5c0d1c0 ANDROID: usb: gadget: f_accessory: Add Android Accessory function

:::::: TO: Benoit Goby <benoit@android.com>
:::::: CC: Todd Kjos <tkjos@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
