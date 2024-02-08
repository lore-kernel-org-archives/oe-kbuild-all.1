Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADF7D53C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707352105; cv=none; b=fOzh1KfUk5k6qRyDqVl826fRMJNt16xXJONpuoPekiJJxL7R7dLPetLLDr7ZKHk0QEdYolWWq+WwSx5Q8OTQsuIGE7nGu6abaO1z2PwNyo14MWcx7VMK8snqdwJDAlCeOXUMfUZgFKDIPZuoXV4hCcaDOh5WPmwxjIy7jr9MVw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707352105; c=relaxed/simple;
	bh=xa0JePUnSK6/LjXX/gGPQnQN8lE9S1fj+neCHmBLJLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rNke3ZTXzX+Mxqi/ZvBvH8tyO+bbN2x0dMiPE+UU9hVjeqc21duMFs4i1f/Bj6ODjabsdpClQBYjoRh8zIKoEcMzh4o7u9VmNSmfplA6okP/8OmDTmNT+MYO78Lo/ODH6w+xaCGFdCpZ9B308308ME0GZWwEDcM+4oTpDXv0lys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biE4S7HF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biE4S7HF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707352104; x=1738888104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xa0JePUnSK6/LjXX/gGPQnQN8lE9S1fj+neCHmBLJLs=;
  b=biE4S7HFxrmLiQNg3T5t8A2YSW/qmWqf8gMXA/3NynmpdJrWQyJNNvJG
   kSQa1R7H2NH/HnwG6GzPruRKNYii8T0TUDhgkKQ9I86DDSBHW7wxtfljj
   nVgx/NqsnTQup5KFUIi0sG1B5Q1GC6Gnl8ShEHjn0PEZts7x4n/GI7Zpn
   dcXV+NRPRpXtweFG5e53MJUnVvSvCS7NuPv0KayHKeNYTO3B8l0G/zAtt
   ZiNFZbDqnI2377tev05A/YPaZknrUq5/A7g1Uxmlsf8ToFX21DmQ1SyIY
   +ggMrCTuV6g/QBShy1x+uwsMH7yh1Vrqh+K+ZNZ5DV63/DVEGFNcmAAmZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4977942"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="4977942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 16:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="1496110"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2024 16:28:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXsH2-0003Bo-1t;
	Thu, 08 Feb 2024 00:28:16 +0000
Date: Thu, 8 Feb 2024 08:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [cip:linux-6.1.y-cip-rt-rebase 25/208]
 drivers/usb/gadget/udc/rzv2m_usb3drd.c:120:34: warning:
 'rzv2m_usb3drd_of_match' defined but not used
Message-ID: <202402080828.VCOVzihW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rt-rebase
head:   c3f80d7eeb70a51f6e05a5ca8424af3780072f29
commit: 51809c427d6e04bb825f3f4c5e13fa03ad11a9cd [25/208] usb: gadget: Add support for RZ/V2M USB3DRD driver
config: m68k-randconfig-r061-20240207 (https://download.01.org/0day-ci/archive/20240208/202402080828.VCOVzihW-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402080828.VCOVzihW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402080828.VCOVzihW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/udc/rzv2m_usb3drd.c:120:34: warning: 'rzv2m_usb3drd_of_match' defined but not used [-Wunused-const-variable=]
     120 | static const struct of_device_id rzv2m_usb3drd_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~


vim +/rzv2m_usb3drd_of_match +120 drivers/usb/gadget/udc/rzv2m_usb3drd.c

   119	
 > 120	static const struct of_device_id rzv2m_usb3drd_of_match[] = {
   121		{ .compatible = "renesas,rzv2m-usb3drd", },
   122		{ /* Sentinel */ }
   123	};
   124	MODULE_DEVICE_TABLE(of, rzv2m_usb3drd_of_match);
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
