Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03B7189B8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732877333; cv=none; b=VH6oqKbuTjb9hOZJlxAvF9GyN/Bv+gU8CgrCorm6gWnjMX3OEdaefTXD+IK7BMV/gkGY9plpDzOtPb5iAD0T5GjxfiaZ9AENCWG2GPhncvQMhyErAXIYvNookwrPjFdXbxL0f24bldEimnpSrdtQVnJfHVYShmHWjjoe1ZLx1OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732877333; c=relaxed/simple;
	bh=/GABF2MiOK0kW6LUFjm6Qy2y3lClI0kCBc2Ss9OARLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbbzaRjwBj5xmkILDMf3Q64ROVvEtWTj6DQ9Uz4mE8j5bRuMwHnAJjxIKARufFoNf6O0uLyiZ9EA/x0QyEmQbMZSGDvNi89V1am+s2aQflynRm8iVKpl7GyTWpPGrBmkiZW88vZwVacNr71Iw7uAjhpvKmYrVh9/aXnvon8YQYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW61T5cf; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW61T5cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732877332; x=1764413332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/GABF2MiOK0kW6LUFjm6Qy2y3lClI0kCBc2Ss9OARLQ=;
  b=XW61T5cfG8Al1v6bZKyHHiD9TKDq8y++Gz5U6d9+mLHadAHk4uHmarO/
   48NhCnKXkYcMY0rSDgkfTw4hN2FrlGnFO3NV8f0FqOganaYRo1IwFkiNg
   pcHFfuEEkxkIS5fROEbx+l54gLQU5+XPyncxMXbS7UEiVyFmDHSmVD8a8
   vp1IZ7cgtb1gqF/euVuhtJgr/oVj4uDFJkvjwEE7YUK83rlfL/xw8p1Gj
   AQFBFEtntA6kO17+AqO3SVJpIKu60GdMt3o7Oxn95bd98ZcT+9K0cLeEd
   /seTAORiZoZq48K48YbgBnlHP4oM1ikgHUCKY+CRKNPWuYH4PW7QSezWU
   w==;
X-CSE-ConnectionGUID: dqNe+MBvTU2ZAzMhUZ+Ruw==
X-CSE-MsgGUID: zp5npW97SkW34/e1wNGITg==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="43728282"
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="43728282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 02:48:51 -0800
X-CSE-ConnectionGUID: LLfZkoMtQLOu4MnLtz6HOQ==
X-CSE-MsgGUID: OFWRJCphS1CgghsPtC9AGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,195,1728975600"; 
   d="scan'208";a="96538299"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Nov 2024 02:48:47 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGyYH-0000FD-1p;
	Fri, 29 Nov 2024 10:48:45 +0000
Date: Fri, 29 Nov 2024 18:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	hverkuil@xs4all.nl, ricardo.ribalda@gmail.com,
	bingbu.cao@linux.intel.com
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, tomi.valkeinen@ideasonboard.com,
	jacopo.mondi@ideasonboard.com, daxing.li@intel.com,
	dongcheng.yan@linux.intel.com, ong.hock.yu@intel.com,
	balamurugan.c@intel.com, wei.a.fu@intel.com
Subject: Re: [PATCH v4] media: i2c: add lt6911uxe hdmi bridge driver
Message-ID: <202411291849.IwaKiYhE-lkp@intel.com>
References: <20241129061546.2237511-1-dongcheng.yan@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241129061546.2237511-1-dongcheng.yan@intel.com>

Hi Dongcheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongcheng-Yan/media-i2c-add-lt6911uxe-hdmi-bridge-driver/20241129-141630
base:   2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
patch link:    https://lore.kernel.org/r/20241129061546.2237511-1-dongcheng.yan%40intel.com
patch subject: [PATCH v4] media: i2c: add lt6911uxe hdmi bridge driver
config: i386-kismet-CONFIG_V4L2_CCI_I2C-CONFIG_VIDEO_LT6911UXE-0-0 (https://download.01.org/0day-ci/archive/20241129/202411291849.IwaKiYhE-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241129/202411291849.IwaKiYhE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291849.IwaKiYhE-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for V4L2_CCI_I2C when selected by VIDEO_LT6911UXE
   WARNING: unmet direct dependencies detected for V4L2_CCI_I2C
     Depends on [n]: MEDIA_SUPPORT [=y] && I2C [=n]
     Selected by [y]:
     - VIDEO_LT6911UXE [=y] && MEDIA_SUPPORT [=y] && ACPI [=y] && VIDEO_DEV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
