Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE1E29B0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 13:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677764237; x=1709300237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RnTHuZr+ipqQoQUE929iLZAjFtSYJisK/hmMy5yawAA=;
  b=m+SMzAshPqS9Iq2edsRHdBAcTPjwRbrg/UPD8bNhe0RwrvLopXi4kcQr
   A1Cir7xpy7UUTo5SUFmZFn9sK4pMYc9yRIWmJk90YUxxm/QLBUdNuH/kl
   9lgHfOhwjc0preg1Jf3+uqQR8Ak0qnwBZsSkl6RGGihElf8FL33fRIHG4
   h75iMXmWpM3vr9tz1NCxXY6sxQrVj/In1NsS2ToxEm4CYIr8ySIS5Apq6
   WvsY2waUxwbYDF9UHL/phoPpSSvnqj4vgxQv+3fzVB02tuhrHYEBHdlVh
   RQMTGbo/7tNr4reChGjmdgwAZOGNy7Ik4bbiNQilQWK2vImkFzVelIyd9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332202145"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="332202145"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 05:37:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="668230406"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; 
   d="scan'208";a="668230406"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 05:37:14 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXj7S-0000Uk-0v;
	Thu, 02 Mar 2023 13:37:14 +0000
Date: Thu, 2 Mar 2023 21:36:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 543/9999] drivers/gpu/drm/drm_dp_mst_topology.c:1843
 drm_dp_mst_update_dsc_info() warn: inconsistent indenting
Message-ID: <202303022122.bLjTQeQ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   ef8b9b38090e63de841d55b568aa5f60c587f14c
commit: b572376bedc67f334d005dabd7727dd318eeba44 [543/9999] ANDROID: GKI: Add 'dsc_info' to struct drm_dp_mst_port
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230302/202303022122.bLjTQeQ9-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303022122.bLjTQeQ9-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_dp_mst_topology.c:1843 drm_dp_mst_update_dsc_info() warn: inconsistent indenting

vim +1843 drivers/gpu/drm/drm_dp_mst_topology.c

  1830	
  1831	int drm_dp_mst_update_dsc_info(struct drm_dp_mst_topology_mgr *mgr,
  1832			struct drm_dp_mst_port *port,
  1833			struct drm_dp_mst_dsc_info *dsc_info)
  1834	{
  1835		if (!dsc_info)
  1836			return -EINVAL;
  1837	
  1838		port = drm_dp_get_validated_port_ref(mgr, port);
  1839		if (!port)
  1840			return -EINVAL;
  1841	
  1842		memcpy(&port->dsc_info, dsc_info, sizeof(struct drm_dp_mst_dsc_info));
> 1843			drm_dp_put_port(port);
  1844	
  1845		return 0;
  1846	}
  1847	EXPORT_SYMBOL_GPL(drm_dp_mst_update_dsc_info);
  1848	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
