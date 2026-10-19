Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF29C49482D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397984; cv=none; b=exahFKr46ZAwCcmQHyyAI/RhbZrtxkNpgO+gC94M9yPs7BZiMCB9YijKPnjs2F9HMdscIPBAht03A9ZhKAfAYFE6Ycr9zuCyIqcmCSxhHTCjLRDJ5RTVkaU0oh7Z3SA9J+EQ4Dl295QQgIqPm824a8RfEMmXK8HDTGkI356+P34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397984; c=relaxed/simple;
	bh=BBymbZldouqPejYkjvDioF+EvglEY2Q82acwV2HIeQU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FNj+lMYgJPU05SXWTLZzdQA8QvtSTVx8XvUhbsQ0eY3PwomCvnizZ8xzSKMJYfohkc+Rgdmlcbugc/xqNW0u3hElnLvqz1hDFb0byqqjd3A8KbVTUPWYrkBPNybTQTWeeFbl4nlC1+Kn71M9GjrZcl/hnSRZwf/tDZJjb5MDlDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbJrEXw2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbJrEXw2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792397983; x=1823933983;
  h=date:from:to:cc:subject:message-id;
  bh=BBymbZldouqPejYkjvDioF+EvglEY2Q82acwV2HIeQU=;
  b=KbJrEXw2c/Ekd8NMuY5/iG5MpLv0V/XE/zaLPygPVWKH6ZCPM79SpYHN
   /ZGkRv6GCT0Djd2rUehNm+OEftuEuKvySni0pAA4SYWSy1IHYi3dXm1oc
   +IPzC10my/x2QOz2UYiCTUVmvMJt0PlveOn/qQc6TJdpTyFXoe8sL7Z5R
   qJuZQdvVtRHo1481NdpWGlUYZ6V6DF/kfhRqhx3CiMLEgQ5SWvq7IT4IR
   kjzhubi05WVGGRnLP+akbE6I1UMRGfgcdSyPTexxVqk5Q52jhx6RMDHSF
   JG4ZCT/UHFtjWYff+sJWhNYzT6Y7fZFsBjV9wQ52Sqpi4c9eilG3uqQNV
   Q==;
X-CSE-ConnectionGUID: EcpAk+zfR9G/mUmfDmooaA==
X-CSE-MsgGUID: q/pbmft6Rmul6l1sCIGw9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1177050"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1177050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 01:19:42 -0700
X-CSE-ConnectionGUID: 57rh8OPIRtihktwOvXKJ+g==
X-CSE-MsgGUID: lQvdcKlcQs6pykySprsCBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2478395"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 19 Oct 2026 01:19:40 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIiao-000000005Xz-1iAp;
	Mon, 19 Oct 2026 08:19:38 +0000
Date: Mon, 19 Oct 2026 10:19:02 +0200
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcain:hexagon 6/82]
 drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.c:66:12: error: redefinition of
 'poweroff' as different kind of symbol
Message-ID: <202610191058.qlATPZlg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git hexagon
head:   35ab1dadb94646b74469738c1741f68e8c6aac3d
commit: f2844889af9d4974f59e9eabdc9b5148b6650a49 [6/82] hexagon: add H2 hypervisor interface support
config: hexagon-randconfig-r2303-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191058.qlATPZlg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337446dacd2a713010f1c9856c21eb8d899b5613)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191058.qlATPZlg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191058.qlATPZlg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.c:66:12: error: redefinition of 'poweroff' as different kind of symbol
      66 | static u16 poweroff[] = {
         |            ^
   arch/hexagon/include/asm/hexagon_vm.h:79:2: note: previous definition is here
      79 |         poweroff,
         |         ^
>> drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.c:87:30: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'const void *' [-Wint-conversion]
      87 |                 ret = spi_write(plat->spi, poweroff, sizeof(poweroff));
         |                                            ^~~~~~~~
   include/linux/spi/spi.h:1533:47: note: passing argument to parameter 'buf' here
    1533 | spi_write(struct spi_device *spi, const void *buf, size_t len)
         |                                               ^
   2 errors generated.


vim +/poweroff +66 drivers/video/fbdev/mmp/panel/tpo_tj032md01bw.c

3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  65  
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21 @66  static u16 poweroff[] = {
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  67  	0x07d9,
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  68  };
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  69  
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  70  struct tpohvga_plat_data {
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  71  	void (*plat_onoff)(int status);
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  72  	struct spi_device *spi;
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  73  };
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  74  
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  75  static void tpohvga_onoff(struct mmp_panel *panel, int status)
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  76  {
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  77  	struct tpohvga_plat_data *plat = panel->plat_data;
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  78  	int ret;
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  79  
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  80  	if (status) {
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  81  		plat->plat_onoff(1);
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  82  
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  83  		ret = spi_write(plat->spi, init, sizeof(init));
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  84  		if (ret < 0)
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  85  			dev_warn(panel->dev, "init cmd failed(%d)\n", ret);
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  86  	} else {
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21 @87  		ret = spi_write(plat->spi, poweroff, sizeof(poweroff));
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  88  		if (ret < 0)
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  89  			dev_warn(panel->dev, "poweroff cmd failed(%d)\n", ret);
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  90  
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  91  		plat->plat_onoff(0);
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  92  	}
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  93  }
3c76f15fd50274 drivers/video/mmp/panel/tpo_tj032md01bw.c Lisa Du 2013-02-21  94  

:::::: The code at line 66 was first introduced by commit
:::::: 3c76f15fd5027474bf738e0a145337370d9c7a8c video: mmp: add tpo hvga panel supported

:::::: TO: Lisa Du <cldu@marvell.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
