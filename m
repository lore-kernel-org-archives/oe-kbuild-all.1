Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061531A683B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 00:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783557453; cv=none; b=sN6I2TpU8lL2ijKiCoKLKnRkeS/XGv43DAaBSXuiQrktQHNcbznjlFRlTFwYK1zZtDbjJDuiyWd16f3eHLbvCIleDcAQloJ8Ye0MO/rlc1xRUfKaMVnNqI/9YboCqoYUQUIFswcyllQpVgw7j3hxgzkpcjEjseEmTQNBMbymYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783557453; c=relaxed/simple;
	bh=nWPUhsqBNHhR2z4IDqPt71HCi9FM6asqvFkRHhoF2CI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OUid01Il3yIVQ2eZnWvQ1bFXl1jou0p29XsRrFBvcdwE7bmFfm1C5ZmYPI6Yf/bGfekbdv9zTlaVChzfzzoJ8ZICLn+IcvzTjuPu6Jonyopv+s0p5n8AAXFlEB7tjxvWtm5QdgKNHucGiHvjgwvdh8SUs4umWcTtwIKjYwPpFV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPi5FASE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPi5FASE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783557452; x=1815093452;
  h=date:from:to:cc:subject:message-id;
  bh=nWPUhsqBNHhR2z4IDqPt71HCi9FM6asqvFkRHhoF2CI=;
  b=PPi5FASE1zagtGrghWS+jf36FfRnC0CEeB5qr1VxDQ4AAUR5vQi/FlH+
   VEb0jCGrOT710pWvklcGktUyG1LzAWcxWrKux7XtaECCoJ4mPmWLZ959E
   Sknfm8EElUCTYZWMZTgBAvZQZHvH2HxAo6RRp10QUByeISLUKSYPMjDpX
   douQPCrANo5Iqf/SWPzvz5Wed3gcf5fDR5nHFReoeEw8n9rX9VdJE+dpv
   bZWL+qHeXYuGwLTtI+W0RkDdGrsByJdM5m9pIDU0/HhvZfKlWz3xU0nr/
   WfTSPp89zs9Jf9gnoNOWzS2GAm4mFCDK5xup5X1bWSoBhlI8hqx6OKUTJ
   Q==;
X-CSE-ConnectionGUID: TDRTYbAkTrybvDN/PfA8mQ==
X-CSE-MsgGUID: x4ju+ELWRy+pCe1BQc40dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101776426"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101776426"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 17:37:31 -0700
X-CSE-ConnectionGUID: Wzoc5+GWSuWQ1AItXWwtcg==
X-CSE-MsgGUID: wrBkq/qLSn+rAW+0r6CHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253339806"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Jul 2026 17:37:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whclY-00000000H4z-2eBE;
	Thu, 09 Jul 2026 00:37:24 +0000
Date: Thu, 09 Jul 2026 08:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [wens:mtk-wip 43/60] drivers/usb/core/port.c:868:28:
 warning: unused variable 'hdev'
Message-ID: <202607090859.7Q3v8qOp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   6bb13b3f06e1186263e25a011225629d221dcf65
commit: 7192167c4bf58c320f52683c295860d88506d9de [43/60] usb: hub: Associate port@ fwnode with USB port device
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260709/202607090859.7Q3v8qOp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090859.7Q3v8qOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090859.7Q3v8qOp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/core/port.c: In function 'usb_hub_remove_port_device':
>> drivers/usb/core/port.c:868:28: warning: unused variable 'hdev' [-Wunused-variable]
     868 |         struct usb_device *hdev = hub->hdev;
         |                            ^~~~


vim +/hdev +868 drivers/usb/core/port.c

   865	
   866	void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
   867	{
 > 868		struct usb_device *hdev = hub->hdev;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
