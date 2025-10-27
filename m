Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507E42FFDD9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761566817; cv=none; b=dEUekGRqRq4N5zBZtzE16cmn60ntENDx3+deXu+rJD055AKxh34h2+LhG0BACp9wY1HSnC0M/+hfMZfDYYKR/wcxQGWLqTlksAGAZhJqj/h+Qw8E1Ru1FMhwXZ0ozQtGUwEbyMg6Up2pVxsZFF8Nz2hWXnTyuS22JHHDGI5oexc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761566817; c=relaxed/simple;
	bh=qfSQMGH8684PV9GofVq3RRdPqjTx28fFX9bGKIByYqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czT3OfMN6UWDprxVJVKuUCtzmdcKhgzG6RD3XnSwa4vOJaybV02pUeS0TSJnmQbuV9DtyCxOVZ/39Bjy8UFSgauEBtU9TT8EolthoO0XnYUwfcDL2ZAKrG8+zy7DMc3Qyx6PwB4igERQ/2SQOb94s3OSu3efCC7re5htUbZRGao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgzCiSqE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgzCiSqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761566816; x=1793102816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qfSQMGH8684PV9GofVq3RRdPqjTx28fFX9bGKIByYqg=;
  b=AgzCiSqEQzyPe6rqdfKdrRKeT/yftaCUDlH/V76T1sht9MpZ4UDcfjwa
   g8qfAxbVQntIEfem8MCa5765cY4grc1YzrbkTgSI9NGOvxRFoZhpFY20b
   AErFikKC5TU7sLlr9dsNfh8RyVfbCzYxmOOyQonjdvz3ywHuZPOc7u9OV
   lu9Bcnb7oIV297fd8fV0hiqlBBg5BX1Wt7uRrJJqOP9sT0dEnricHlnTl
   l0YO/D6Q3VYaKS3gTSl0iDbu/8Eb8+lntjjwCvfSyyZUr+haTa9JxVhW8
   AFZo8YtqRkTNJ8z5Tx1EzEKaDSHwP09lKhso/mUr8ztq5LB/mLAK+H3cU
   Q==;
X-CSE-ConnectionGUID: 6EwRsyj5RKeiclXh3m7LjQ==
X-CSE-MsgGUID: Augrv5vVS+KgHYiqPJMi5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86271580"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="86271580"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 05:06:56 -0700
X-CSE-ConnectionGUID: vQhMdnKpTf6sS/ASuqqzYg==
X-CSE-MsgGUID: MaEyVA1lRXuMyA6jhTxsBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="190239785"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Oct 2025 05:06:52 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDLzu-000Gkz-0M;
	Mon, 27 Oct 2025 12:06:50 +0000
Date: Mon, 27 Oct 2025 20:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: Junjie Cao <caojunjie650@gmail.com>, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Junjie Cao <caojunjie650@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH 2/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
Message-ID: <202510271932.kN86aCge-lkp@intel.com>
References: <20251026123923.1531727-3-caojunjie650@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026123923.1531727-3-caojunjie650@gmail.com>

Hi Junjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-backlight/for-backlight-next]
[also build test WARNING on lee-leds/for-leds-next linus/master lee-backlight/for-backlight-fixes v6.18-rc3 next-20251027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Junjie-Cao/backlight-aw99706-Add-support-for-Awinic-AW99706-backlight/20251026-214135
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git for-backlight-next
patch link:    https://lore.kernel.org/r/20251026123923.1531727-3-caojunjie650%40gmail.com
patch subject: [PATCH 2/2] backlight: aw99706: Add support for Awinic AW99706 backlight
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20251027/202510271932.kN86aCge-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271932.kN86aCge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510271932.kN86aCge-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/video/backlight/aw99706.c:468:12: warning: 'aw99706_resume' defined but not used [-Wunused-function]
     468 | static int aw99706_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~
>> drivers/video/backlight/aw99706.c:461:12: warning: 'aw99706_suspend' defined but not used [-Wunused-function]
     461 | static int aw99706_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/aw99706_resume +468 drivers/video/backlight/aw99706.c

   460	
 > 461	static int aw99706_suspend(struct device *dev)
   462	{
   463		struct aw99706_device *aw = dev_get_drvdata(dev);
   464	
   465		return aw99706_update_brightness(aw, 0);
   466	}
   467	
 > 468	static int aw99706_resume(struct device *dev)
   469	{
   470		struct aw99706_device *aw = dev_get_drvdata(dev);
   471	
   472		return aw99706_hw_init(aw);
   473	}
   474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
