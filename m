Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971592119
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 00:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711498750; cv=none; b=O5sLQ0/1/ykLpMXgCDvgao3aC56PFfq//GEh/IV2VMBnmRgH8Q7sxonr9SBjZ8AvXlgIVwQkCeHPcUchQMiSL13UavUW0gakrG+ccQc1DsKegtKDu9YPJSDIq7Xw/bPzVeyAYwVc58vCAuJNuWjzjKWtPf5+fVRFBnpA+XYykIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711498750; c=relaxed/simple;
	bh=CmUNVuseagjkXlaJ8jSlcHPrxpD6w4E6H3hA9k8Iy1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=teHusM+FgC++V3lCok5rnd9EPRbVEI1Gj+3i/ETkXZDfEZl/fcm2EtePOOtMEv/96N6U4hqrLDFnha/vDO/htHngAgy/tfaiQNNONWHQiKvGd8IjCDjf4pjXOibRj8m3KQ19aXP/Lk6q7p/n27mPafU2cGS1+Jo/FMI+3rUIIyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/lq39z7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/lq39z7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711498749; x=1743034749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmUNVuseagjkXlaJ8jSlcHPrxpD6w4E6H3hA9k8Iy1s=;
  b=m/lq39z7hpORwtBWXmXFMrpf8EALVJXQYA+vWtF9Zg8gzuIhC1yq7W7f
   ICTGwM1Nj4DndMTqm+YA5Fjla+F0T3sYr5KhTnf0+BeoVdVGgRcq5g54H
   teL4Q8WgQJ+wJJijQjF0F/uBM7iNqZ80ufWVeYi0lZLz5TZkxwJZrXMiG
   VS4FCfGd+wGPiLsbFVqmouxmu5E/daC3CXoqJDVslRWYu9OGRvT3gU66w
   VcUP9M/1P2MyAZ2Rw5mLBWTYxFZ01RZL8fNZ6E3wvw/9UC8DjEiJhVvi7
   fMaQnVFTsz3s1WOW6+wSRNRAxhML9DcM19CGElhV1kO6ohjckya6EQLBx
   A==;
X-CSE-ConnectionGUID: gFW54dXtQYGmPZyAh/Yt+w==
X-CSE-MsgGUID: sGNuDBAsQUq5TG8oy+0Rdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6472808"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="6472808"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 17:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="20671068"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Mar 2024 17:19:06 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpH0R-0000ZC-24;
	Wed, 27 Mar 2024 00:19:03 +0000
Date: Wed, 27 Mar 2024 08:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [usb:usb-testing 9/45] kismet: WARNING: unmet direct dependencies
 detected for DRM_AUX_BRIDGE when selected by TYPEC_MUX_PTN36502
Message-ID: <202403270819.6h8lCV3J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   5e589e59202db9b19b5a4a01c8de78435f86fde1
commit: 9dc28ea21eb40b9d023297ad9d513252260b1d63 [9/45] usb: typec: ptn36502: switch to DRM_AUX_BRIDGE
config: alpha-kismet-CONFIG_DRM_AUX_BRIDGE-CONFIG_TYPEC_MUX_PTN36502-0-0 (https://download.01.org/0day-ci/archive/20240327/202403270819.6h8lCV3J-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240327/202403270819.6h8lCV3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403270819.6h8lCV3J-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE when selected by TYPEC_MUX_PTN36502
   
   WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
     Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
     Selected by [y]:
     - TYPEC_MUX_PTN36502 [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
