Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FB63FF4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707557295; cv=none; b=GORUVeFQJH8mpiqpFS4VnNAV+MfH6Hch5jyOMZVS2aBP464d34DugF5uTeCrClcWRx7zgSm16f/+FkpTh8ho1ey/1/1fSEWYbIfuCzcTz7beC+Fdwc+NyZDj8yX/30Efrxk/cExq9LOnF8q9xPPfQ5Y18uX1yVrA7KGk2rT30Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707557295; c=relaxed/simple;
	bh=uCyzkFY1OjLOXGbCn0cmaAb6px83bVxABpF+AYARBo0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G6pNbN7200qVw+9LluOv1e9EEhZZdg8LLIv8OaXA0t53pBdOv6oesz5lMgYS8uKO0Pb7Gd/y68exsjfHmVZCBJv6i+b4JwNIH5BAkszRB33a8G+eV2Lvwp7/V2TRsvksa73J6l7uY3NyDVDFcrgNfYK3nH1I+OqPAYoh3a0kerc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiXXudRw; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiXXudRw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707557293; x=1739093293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCyzkFY1OjLOXGbCn0cmaAb6px83bVxABpF+AYARBo0=;
  b=MiXXudRwqJMTd2GiGtfTlfiVAOdAniOAmCONJzBMDFzMl1oaeIzOa604
   yEfYnQNvIMoJaKeEA+IA427Mg2hOMnOX0+nF+0yM6rsOMv0eobUeGxmKe
   rvI1oSpHUA5hsWD81W4V6j7HcpzKYoc31IdEceYQP85FGNuJQWSM/x0xj
   OPMvYB6eI8aY/TwLQuTz0OPlw2F4LhqWU89zHDa3Nx6n1v92Ow4PqGlhw
   Vc0Dicn8hZ30bY9vRapMRBShZEaPPgh6P+wvNTPPH6rPySwVATBxxwC5q
   UAUOaBlNUqBvsKBKUcp3JYBxQXXDlba+wo1pu4AF8vlNw1kRcAHYSdvLm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="395984828"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="395984828"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 01:28:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="910959250"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="910959250"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2024 01:28:10 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYjea-0005X6-2J;
	Sat, 10 Feb 2024 09:28:08 +0000
Date: Sat, 10 Feb 2024 17:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Dorcas Anono Litunya <anonolitunya@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:outreachy-vivid-v6.7 12/12]
 drivers/media/test-drivers/vivid/vivid-core.c:2177:32: warning: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 7
Message-ID: <202402101718.aulsSJWt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git outreachy-vivid-v6.7
head:   4bc7849217d6c105cb59d78e9995b8e129f0deaf
commit: 4bc7849217d6c105cb59d78e9995b8e129f0deaf [12/12] media: vivid: Update menu controls for HDMI in multiple instance
config: x86_64-randconfig-102-20240210 (https://download.01.org/0day-ci/archive/20240210/202402101718.aulsSJWt-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101718.aulsSJWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101718.aulsSJWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/test-drivers/vivid/vivid-core.c: In function 'vivid_init':
>> drivers/media/test-drivers/vivid/vivid-core.c:2177:32: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 7 [-Wformat-truncation=]
          MAX_STRING_LENGTH, "HDMI %d", k);
                                   ^~
   drivers/media/test-drivers/vivid/vivid-core.c:2177:26: note: directive argument in the range [0, 2147483647]
          MAX_STRING_LENGTH, "HDMI %d", k);
                             ^~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-core.c:2176:5: note: 'snprintf' output between 7 and 16 bytes into a destination of size 12
        snprintf(vivid_ctrl_hdmi_to_output_strings[count],
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          MAX_STRING_LENGTH, "HDMI %d", k);
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-core.c:2180:37: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Wformat-truncation=]
          MAX_STRING_LENGTH, "HDMI %03d-%d", i, k);
                                        ^~
   drivers/media/test-drivers/vivid/vivid-core.c:2180:26: note: directive argument in the range [0, 2147483647]
          MAX_STRING_LENGTH, "HDMI %03d-%d", i, k);
                             ^~~~~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-core.c:2179:5: note: 'snprintf' output between 11 and 20 bytes into a destination of size 12
        snprintf(vivid_ctrl_hdmi_to_output_strings[count],
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          MAX_STRING_LENGTH, "HDMI %03d-%d", i, k);
          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2177 drivers/media/test-drivers/vivid/vivid-core.c

  2158	
  2159	static int __init vivid_init(void)
  2160	{
  2161		int count = FIXED_MENU_ITEMS;
  2162		int ret;
  2163	
  2164		for (int i = 0; i < n_devs; i++) {
  2165			if (!(node_types[i] & (1 << 8)))
  2166				continue;
  2167			for (int j = 0, k = 0; j < num_outputs[i] &&
  2168			     count < MAX_MENU_ITEMS; ++j) {
  2169				if (!(output_types[i] & BIT(j)))
  2170					continue;
  2171				vivid_ctrl_hdmi_to_output_strings[count] =
  2172					kmalloc(MAX_STRING_LENGTH, GFP_KERNEL);
  2173				if (!vivid_ctrl_hdmi_to_output_strings[count])
  2174					goto cleanup;
  2175				if (n_devs == 1) {
  2176					snprintf(vivid_ctrl_hdmi_to_output_strings[count],
> 2177						 MAX_STRING_LENGTH, "HDMI %d", k);
  2178				} else {
  2179					snprintf(vivid_ctrl_hdmi_to_output_strings[count],
  2180						 MAX_STRING_LENGTH, "HDMI %03d-%d", i, k);
  2181				}
  2182				k++;
  2183				count++;
  2184			}
  2185		}
  2186		ret = platform_device_register(&vivid_pdev);
  2187		if (ret)
  2188			goto cleanup;
  2189		ret = platform_driver_register(&vivid_pdrv);
  2190		if (ret) {
  2191			platform_device_unregister(&vivid_pdev);
  2192			goto cleanup;
  2193		}
  2194		return ret;
  2195	
  2196	cleanup:
  2197		for (int i = FIXED_MENU_ITEMS; i < MAX_MENU_ITEMS; i++)
  2198			kfree(vivid_ctrl_hdmi_to_output_strings[i]);
  2199	
  2200		return ret;
  2201	}
  2202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
