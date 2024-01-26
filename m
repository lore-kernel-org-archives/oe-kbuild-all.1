Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211B125C3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 08:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706256281; cv=none; b=moiWHz+j2e4LqA8UVE85PPlRhcUNri7LE/oso92oBuv5075384yuiEBaeMO3zsbh0aWxxKFRKefTKaJiH6Rxv7y6B/kpgNoPvsiHfqWnVp3ks4SUvMdib7UcE3Svj7rmHJt2n9C38eLL5L3hfUIUYJoI4wkTE8SToDbWkSaU0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706256281; c=relaxed/simple;
	bh=bXYA5uGoVp4Qv3jXbMMooZKpR98oZXy+32RsD+KUB58=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LA6vxOaOkcl5s2JUReYcz6lKOjIZ6MYRKlutZuQflQR94tdRj3OfNt0K341FWr4CiNlfFvopF9voH3f+ZJW7tJJ8tYTJMvsVoTORnDtd6MN8Dfp6+sIvzRKVMhcmYThedv3OmZfVnxZr807t8YCMabYOY3gdb5TQ1xWEWZG5NLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/C5mAJ2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/C5mAJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706256280; x=1737792280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bXYA5uGoVp4Qv3jXbMMooZKpR98oZXy+32RsD+KUB58=;
  b=P/C5mAJ21SSD+c3wIbXPZs/VQGSzmVUG15NllJXhWlrHjOu526zV1vne
   9PvJY3mMdn1pxc8enYF8wf7rfUwb6Npl/8qw+uDZvLuqxelmq3nvhDKAm
   xW86yDBjskh0qKC7o/4S9jJKNTdq7SdlFAGe+wCxuPwWQzuzdSq43dxQ8
   Fm/NDIeQzcPTE67KtBvmW/fryUgFITREBA+AbzockDIJuX+kXyo6JKX+P
   nakH5jrEg+vO4a/5URTAKDNt7kq6iKobFoohmutAJWgU0Q6UAKaVhMRaa
   NfLSetSUftqY5vjSF1jx1MjzTQQYLoM2r7HSYjkWXom7CHUtNE6lkzKrQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1342371"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1342371"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 00:04:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="28752027"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jan 2024 00:04:38 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTHCV-0000pU-1w;
	Fri, 26 Jan 2024 08:04:35 +0000
Date: Fri, 26 Jan 2024 16:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Francois Bortolotti <jeff@borto.fr>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/120-spmi 1/3]
 drivers/spmi/spmi-apple-controller.c:215:3-8: No need to set .owner here.
 The core will do it.
Message-ID: <202401261557.Nk8PLZv5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/120-spmi
head:   8254a6e8220a69fb616859e997000cd863adb84d
commit: ac7dcfef39bc8a4a789ebd8bb120df73f1ff35ae [1/3] spmi: add a first basic spmi driver for Apple SoC
config: arm64-randconfig-r051-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261557.Nk8PLZv5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261557.Nk8PLZv5-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spmi/spmi-apple-controller.c:215:3-8: No need to set .owner here. The core will do it.

vim +215 drivers/spmi/spmi-apple-controller.c

   209	
   210	static struct platform_driver spmi_controller_driver = {
   211		.probe		= spmi_controller_probe,
   212		.remove		= spmi_del_controller,
   213		.driver		= {
   214			.name	= "apple-spmi",
 > 215			.owner	= THIS_MODULE,
   216			.of_match_table = spmi_controller_match_table,
   217		},
   218	};
   219	module_platform_driver(spmi_controller_driver);
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
