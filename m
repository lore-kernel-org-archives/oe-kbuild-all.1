Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADBA2C0F97
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762327780; cv=none; b=n0qhwDGyOADlLegLwYd3I2LSIoTXnOZa8XUyt+zAi+l9GXkfW3TYPL3//85KTQNWlLJgtOYD4fNfOQShvD8RFHHEx1rl+BUsKyTr+PMqS7rQXz0yYprPpd21suvK5VW6AYG7NUajTHAE5KMMV9VRmgZc+07MRvlWo63z5jhzwyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762327780; c=relaxed/simple;
	bh=dwf+iyDt8vMCAtPpcWOED1kLXLLcXms+AskDm27ZqZ8=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M58emqwaYbItrXRsFxDlIH5jFk2rD4Q486xoofBs4y1BkwWOJEgjyuA1Uw12Yz4fM7UZK8aL8TbRv0bEwBSSJz77aPrHwTKQcjYLTZkqGcYLx6inML5CcTAvbbHc7gsjywabQqb2Z9FBBwWeEIcjyQeeYItnkxhGotEpu+39lIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5uqWqyK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5uqWqyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762327779; x=1793863779;
  h=date:from:cc:subject:message-id:mime-version;
  bh=dwf+iyDt8vMCAtPpcWOED1kLXLLcXms+AskDm27ZqZ8=;
  b=U5uqWqyKlTCW181bllwh2u6cQ84AMppO9xMk79NHHDCzH5/w3Zsur6qr
   NyUw8i8V8L25lT/B94WQyxRn/DPTfx/3CjDbzaD4KINb6iP63kRbDZhH2
   12NZdQoV/9vc0ZwL0StssvwKokZ+jEvQp5eQ6ttpZ/FJza+xmMeiUPWHu
   d5KbN5jJT1H8reh49zSMRsmcF3uJ1Ef2oV2OhK6EnpWq9ydjg8k/9ZHyq
   3EalxipO93CrP54lBhpgOa7dYyKc6M6FR6nAuapNJLqlA0LslTSWXPzHD
   BgG9skGQ2Aov3ANgYEpSG6qoHEPDpoZ5CCNoK795LrGNvrYO3GeOHpC7p
   g==;
X-CSE-ConnectionGUID: Tu6p/3V/SmSdj3KJBNm8rA==
X-CSE-MsgGUID: Joo/Ha2KTtyUpVshk/fx+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="89897849"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="89897849"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 23:29:38 -0800
X-CSE-ConnectionGUID: nCX4bsTASX+G2wELzQKaHQ==
X-CSE-MsgGUID: 0zrGlyBpTR6hiYW1W/azhQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2025 23:29:37 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGXxW-000SGK-0J;
	Wed, 05 Nov 2025 07:29:34 +0000
Date: Wed, 5 Nov 2025 15:28:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	David Herrmann <dh.herrmann@gmail.com>,
	Marta Lofstedt <marta.lofstedt@intel.com>
Subject: [superm1:superm1/backlight-property 6/12] drm_drv.c:undefined
 reference to `drm_backlight_exit'
Message-ID: <202511051517.a1GqCQOR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/backlight-property
head:   e4d449a5f359fa7af06a7984f5e31875f8bee9dc
commit: 3c53f1d5865691253a429d54b800dd0b26f64a5d [6/12] drm: link connectors to backlight devices
config: arc-nsimosci_hs_defconfig (https://download.01.org/0day-ci/archive/20251105/202511051517.a1GqCQOR-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051517.a1GqCQOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051517.a1GqCQOR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: drivers/gpu/drm/drm_drv.o: in function `drm_core_exit':
>> drm_drv.c:(.text+0x2ea): undefined reference to `drm_backlight_exit'
>> arc-linux-ld: drm_drv.c:(.text+0x2ea): undefined reference to `drm_backlight_exit'
   arc-linux-ld: drivers/gpu/drm/drm_drv.o: in function `drm_core_init':
>> drm_drv.c:(.init.text+0x28): undefined reference to `drm_backlight_init'
>> arc-linux-ld: drm_drv.c:(.init.text+0x28): undefined reference to `drm_backlight_init'
   arc-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_unregister':
>> drm_connector.c:(.text+0x2ce): undefined reference to `drm_backlight_unregister'
>> arc-linux-ld: drm_connector.c:(.text+0x2ce): undefined reference to `drm_backlight_unregister'
   arc-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_register.part.0':
>> drm_connector.c:(.text+0xdb4): undefined reference to `drm_backlight_register'
>> arc-linux-ld: drm_connector.c:(.text+0xdb4): undefined reference to `drm_backlight_register'
   arc-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_cleanup':
>> drm_connector.c:(.text+0x1bb6): undefined reference to `drm_backlight_free'
>> arc-linux-ld: drm_connector.c:(.text+0x1bb6): undefined reference to `drm_backlight_free'
   arc-linux-ld: drivers/gpu/drm/drm_connector.o: in function `drm_connector_set_obj_prop':
   drm_connector.c:(.text+0x2368): undefined reference to `drm_backlight_set_brightness'
   arc-linux-ld: drm_connector.c:(.text+0x2368): undefined reference to `drm_backlight_set_brightness'
   arc-linux-ld: drivers/gpu/drm/drm_sysfs.o: in function `backlight_store':
>> drm_sysfs.c:(.text+0xda): undefined reference to `drm_backlight_set_name'
>> arc-linux-ld: drm_sysfs.c:(.text+0xda): undefined reference to `drm_backlight_set_name'
   arc-linux-ld: drivers/gpu/drm/drm_sysfs.o: in function `backlight_show':
>> drm_sysfs.c:(.text+0x12a): undefined reference to `drm_backlight_get_name'
>> arc-linux-ld: drm_sysfs.c:(.text+0x12a): undefined reference to `drm_backlight_get_name'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
