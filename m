Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D048C28379
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 03:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725592383; cv=none; b=VZvf6tPI9ANnrFzNYpFVSL4ZvURM9FdKRo+NFalZ4BaWxvR7bLh/kGUhuJh6/R2NB29PWGgHXXwrpZ42kkvpD9UT7ToXYNBP8aQp2dJrHBxHdwG7YSZJKeb109M68Mtf4BUMmzQ3Yw07XpHNGEmB9N1iRfoCPwSqBQUnb2shduY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725592383; c=relaxed/simple;
	bh=+3AVPNseLN/NUWarLdE0SJEUh6AoKSdK+5OExmOgsKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G+PW+YPhZePqKuU8evIrvn76COajx3vCrBxSvI5fu+OVfpyB8krFMUEz7D7eWN+hZlbaGccphYZNszDWIptAN61D1mMm+48Kxp5/LzdBk4q1rfFAmltROQ6XZti6+f6Ycjaohdqk/AYRaocn9T8hWCVXqnlV6A0IeZ7kbrXOJyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qs0fpObH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qs0fpObH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725592382; x=1757128382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+3AVPNseLN/NUWarLdE0SJEUh6AoKSdK+5OExmOgsKE=;
  b=Qs0fpObHLXyYgYdQ8KYNENdLQoZlZzMUlzZWaCSTOcJM93weq3+mjxv8
   8CffXhI1DFdDscU/ZBtv7JBN3AwlKMHzSskpHQJZg1Co7bX/6iIi2pxt6
   yLng1rkSVd3mEOZFgyGj0ZG2B9I5dmPHS023wk7Cktj6iP2h9ugVSSRRM
   rjD+MCJkamfAaS/QMD+aIe+0Sv4czkij9+l9AQWWQxE7MU8vMyP6fGfHB
   vKA6dXgSPQMyGovKBDkWN3RlpFljiHGhbnaKRhi65IHl9n7cxVpYfGw7j
   U3WlVVUjOPDe+Z945n2GnZhqagipqs0ejDnZFvr58xmNijlil+bQugO5F
   A==;
X-CSE-ConnectionGUID: bE8EmonqS1ijgTfY1sQ3gw==
X-CSE-MsgGUID: IOa3Mu+gQVGrUNtUwM/xOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35490065"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="35490065"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 20:13:01 -0700
X-CSE-ConnectionGUID: 2jTWJMKVSCOz7zxQIfKp3A==
X-CSE-MsgGUID: tvbf+4CCTMSq9gCVZd2RqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="70254074"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Sep 2024 20:13:00 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smPP8-000AYH-0z;
	Fri, 06 Sep 2024 03:12:58 +0000
Date: Fri, 6 Sep 2024 11:12:41 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 9594/9692] parallel-display.c:undefined reference
 to `drm_bridge_connector_init'
Message-ID: <202409061126.6YxmqWKV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad40aff1edffeccc412cde93894196dca7bc739e
commit: 98b20ebb0ca8b62a9d0ee4bfe00a13887046b618 [9594/9692] Merge branch 'for-linux-next' of https://gitlab.freedesktop.org/drm/misc/kernel.git
config: openrisc-randconfig-r005-20220428 (https://download.01.org/0day-ci/archive/20240906/202409061126.6YxmqWKV-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061126.6YxmqWKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061126.6YxmqWKV-lkp@intel.com/

All errors (new ones prefixed by >>):

   or1k-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_bind':
>> parallel-display.c:(.text+0x288): undefined reference to `drm_bridge_connector_init'
>> parallel-display.c:(.text+0x288): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `drm_bridge_connector_init'
   or1k-linux-ld: drivers/gpu/drm/imx/ipuv3/parallel-display.o: in function `imx_pd_probe':
   parallel-display.c:(.text+0x3fc): undefined reference to `devm_imx_drm_legacy_bridge'
   parallel-display.c:(.text+0x3fc): relocation truncated to fit: R_OR1K_INSN_REL_26 against undefined symbol `devm_imx_drm_legacy_bridge'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
