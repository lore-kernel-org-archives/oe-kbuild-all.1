Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAA81B9AD6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 19:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718911283; cv=none; b=Z55wmbQzqU9C0fYU+auaNLW3BZ9O0dafJidZfiPvOrqvhBrl6USW5R2MZszlqcLx3QvP3qXimYA6D4UPq98mlcTAPbMHvclLTzMnTF3jiAbZa+u6ki1jUDMJoLY/E228B9PeAeWW/29ZJHcfVMtYz7kOS7kToaPJNxU4Rys23Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718911283; c=relaxed/simple;
	bh=XSVT6PFmAaNpRktinrY391B9iPJ5NoX4S4/JPI8NAOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WOGw8SN6Oc7kPJPsELgTG8OlHXuERfvd1LC8Op2luBoLYUKbZiDthx6eCTZMQtP6l4PeK6U/Soe2lds+8k6UC+/ULEuLvRLLwWMC+OvbUqUKOvU7Fsktnd8cQd1ImOuXSdzfgtnhTgH5z+7IFf19fOA0ZDz4b9d8lpzXl6/vOwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ggArujOQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ggArujOQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718911281; x=1750447281;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XSVT6PFmAaNpRktinrY391B9iPJ5NoX4S4/JPI8NAOM=;
  b=ggArujOQ8Mden4i9gePItfJJvjBIDZomyBtMUSsEG4r0FctkdW1+Qa3P
   EIBX1FqzlzknZT7Kp2uNDbon1h8jxs6h11236XVhc/7nzhBnbc+shEEop
   V/oGVmeFWe1Xx86Kao3jKYnp74hXnuHoQ6My1QZjTXrB84SoqIZBQ6MIX
   1x1HTh4ma1mHnX/Si04t1Ypp2gFW6VhaWpmKZV+zghZEI3pnJ9c+tDIIX
   v/RuIbD6yrzY2kC7E0J/a8AuQw3RWXmL98Jxt9EEu9q1wFv8LGsOumg3j
   vRR61ZqjFy5YKlTPQCrUmCjnjKcXhJPeDdO1bq1YQbQMzoL1TlF4oNa1K
   A==;
X-CSE-ConnectionGUID: fXPhaj/GSvadWo0e4BTbIg==
X-CSE-MsgGUID: vaC5HqfMRuaf59uwM1cwvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="19697598"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="19697598"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 12:21:20 -0700
X-CSE-ConnectionGUID: 1Fxvo6V0QkCCOlnhfn1a8w==
X-CSE-MsgGUID: 8lSF01etQ6GwIhDgM0frkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="46868426"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jun 2024 12:21:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKNLQ-0007ri-20;
	Thu, 20 Jun 2024 19:21:16 +0000
Date: Fri, 21 Jun 2024 03:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2133/7397] drivers/gpu/drm/sti/sti_hda.c:696
 sti_hda_bind() warn: inconsistent indenting
Message-ID: <202406210357.uLQ9cfev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
commit: 74bde7581df3e18061119e1b27b63d0a9ea57b7a [2133/7397] drm/sti: Allow build with COMPILE_TEST=y
config: loongarch-randconfig-r071-20240620 (https://download.01.org/0day-ci/archive/20240621/202406210357.uLQ9cfev-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210357.uLQ9cfev-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/sti/sti_hda.c:696 sti_hda_bind() warn: inconsistent indenting

vim +696 drivers/gpu/drm/sti/sti_hda.c

c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  672  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  673  static int sti_hda_bind(struct device *dev, struct device *master, void *data)
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  674  {
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  675  	struct sti_hda *hda = dev_get_drvdata(dev);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  676  	struct drm_device *drm_dev = data;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  677  	struct drm_encoder *encoder;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  678  	struct sti_hda_connector *connector;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  679  	struct drm_connector *drm_connector;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  680  	struct drm_bridge *bridge;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  681  	int err;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  682  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  683  	/* Set the drm device handle */
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  684  	hda->drm_dev = drm_dev;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  685  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  686  	encoder = sti_hda_find_encoder(drm_dev);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  687  	if (!encoder)
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  688  		return -ENOMEM;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  689  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  690  	connector = devm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  691  	if (!connector)
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  692  		return -ENOMEM;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  693  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  694  	connector->hda = hda;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  695  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30 @696  		bridge = devm_kzalloc(dev, sizeof(*bridge), GFP_KERNEL);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  697  	if (!bridge)
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  698  		return -ENOMEM;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  699  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  700  	bridge->driver_private = hda;
b07b90fd178a47 Ajay Kumar        2015-01-20  701  	bridge->funcs = &sti_hda_bridge_funcs;
a25b988ff83f3c Laurent Pinchart  2020-02-26  702  	drm_bridge_attach(encoder, bridge, NULL, 0);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  703  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  704  	connector->encoder = encoder;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  705  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  706  	drm_connector = (struct drm_connector *)connector;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  707  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  708  	drm_connector->polled = DRM_CONNECTOR_POLL_HPD;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  709  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  710  	drm_connector_init(drm_dev, drm_connector,
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  711  			&sti_hda_connector_funcs, DRM_MODE_CONNECTOR_Component);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  712  	drm_connector_helper_add(drm_connector,
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  713  			&sti_hda_connector_helper_funcs);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  714  
cde4c44d8769c1 Daniel Vetter     2018-07-09  715  	err = drm_connector_attach_encoder(drm_connector, encoder);
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  716  	if (err) {
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  717  		DRM_ERROR("Failed to attach a connector to a encoder\n");
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  718  		goto err_sysfs;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  719  	}
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  720  
9b60514d889a99 Vincent Abriou    2016-02-05  721  	/* force to disable hd dacs at startup */
9b60514d889a99 Vincent Abriou    2016-02-05  722  	hda_enable_hd_dacs(hda, false);
9b60514d889a99 Vincent Abriou    2016-02-05  723  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  724  	return 0;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  725  
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  726  err_sysfs:
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  727  	return -EINVAL;
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  728  }
c86a5f6e1b9c84 Benjamin Gaignard 2014-07-30  729  

:::::: The code at line 696 was first introduced by commit
:::::: c86a5f6e1b9c84064231ec867aca281d9e8514a2 drm: sti: add HDA driver

:::::: TO: Benjamin Gaignard <benjamin.gaignard@linaro.org>
:::::: CC: Benjamin Gaignard <benjamin.gaignard@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
