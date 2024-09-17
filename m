Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87967A31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Sep 2024 03:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726544570; cv=none; b=CUDifd7X55QMUsUjsaSns7mkTpfdcRuKLteSM1CbGdOsGAjzNozlE5UpnP4DXhPb0+51/LZL46XE3yhJ9ewnmn5mnP3YWfa6ub22Tras+VSL0oiwmjBTY6mS8GpHBYQx5+V1shk81PS8o0M/4oEvHJvgRI1p37iJCNGFebLPIw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726544570; c=relaxed/simple;
	bh=l5XQljP0LJ1d+GOe8ilhuR7mE9kZVw228mR7/m8dXis=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dWK57blUT4TUHoxRoE1GKgOjSL+XMUuNPF0LZmpPHukVTuMLsd9gPZ97ZKnGukiU4Wq/nB07s4/aISQF+n3Cp9YcUVHlBG35sdGn6nePzmQFnygVt1pAeaXF0haU2LYPjdxmTBQSlhXlhqZ/FXU1IrOnQrlmAewC85n/wVuqTRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hnq+cBAz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hnq+cBAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726544567; x=1758080567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l5XQljP0LJ1d+GOe8ilhuR7mE9kZVw228mR7/m8dXis=;
  b=Hnq+cBAzAnXw8aSIbQFAkM0At6zQGipraJISHZeQGZPWqCZ1nuGfPHek
   eKJIZTkxsebTmgxJKWsitYD+jRtF2TINMgK2PoQhcCP317cV7l6/wC33p
   viFWcr+LMXxosDGS9uS3WB0C9Y36r7/4zubgUaZcm90LDRPYv8xkOHf2m
   CgCLlw5rU9ffl0tjBuAoyehXhzRfer3Boz/TkunPpC6sbIzA8fjYKk28Q
   3VgpXxYkM9JewRzIc/Tyok/n6zQcR4QX5etkNUBh3/P1OdYX62jKZQ1tW
   g1qc5Z2wKRRLNju5bZ5s2VrhpjiLLa1N2B7Sd8zmo7tgXvTjrzquaZHnm
   Q==;
X-CSE-ConnectionGUID: zeWddLd+Qj6C8+jO5HNqNw==
X-CSE-MsgGUID: 8bmQnMAPRrWAp0lu9Uia7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="47899160"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="47899160"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 20:42:47 -0700
X-CSE-ConnectionGUID: uQ38+QGsTTW5wZXXEkxbXg==
X-CSE-MsgGUID: thftB2x/Twub7dbqcTSBfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="68733382"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 20:42:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqP6w-000Ako-0e;
	Tue, 17 Sep 2024 03:42:42 +0000
Date: Tue, 17 Sep 2024 11:41:59 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 20/48] ls2k500sfb.c:undefined reference to
 `fg_console'
Message-ID: <202409171155.ruB5bjER-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   df2c80fc64e69be0095e3315c470353b01ce0c31
commit: 3a50da023fae0cfab612bffb333d4b1343299208 [20/48] fbdev: add ls2k500sfb driver for ls2k500 bmc.
config: loongarch-randconfig-r064-20240916 (https://download.01.org/0day-ci/archive/20240917/202409171155.ruB5bjER-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171155.ruB5bjER-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171155.ruB5bjER-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/cgroup/cpuset.o: in function `cpuset_cgroup_stat_show_comm.constprop.0.isra.0':
   cpuset.c:(.text+0xe74): undefined reference to `get_idle_time'
   loongarch64-linux-ld: kernel/cgroup/cpuset.o: in function `.L141':
   cpuset.c:(.text+0x1270): undefined reference to `get_idle_time'
   loongarch64-linux-ld: drivers/video/fbdev/ls2k500sfb.o: in function `.L152':
>> ls2k500sfb.c:(.text+0xf9c): undefined reference to `fg_console'
>> loongarch64-linux-ld: ls2k500sfb.c:(.text+0xfa0): undefined reference to `fg_console'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
