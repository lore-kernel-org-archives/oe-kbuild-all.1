Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575E11C29
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Oct 2023 09:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696151039; x=1727687039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fman+3O4joJsq0vHlSOvzCbXB420YfSvhNLYhSLGoCc=;
  b=Myl3RR492kEuu8DYuTLOtZKCju+XMq4TaUyr3VL1jbJu/FELVxs8prQk
   5W13JDmXFycX0a2Yb/onE9CmodHjDwQ/1FNDaOxLH1F46U+BJ0NUBcJ5W
   jQXgmpwxbHXf+VjU9A4/DDuyZKBvuw2wlx15sDDwaZywgZajnReBR1gyM
   vur7h8sU3ZeZ7n6JTEgichFStKcBx4OyAAOxRuSIkNPFpLfAJYExkT5UQ
   YqW6oWpZGRQZyNn6K//rVwR4GuOP/DvdfEEIGmdpmUyFmsRnpRhqWjyeo
   tFZUOu1HFNujlQ/jrhqEdSYmjDehpHwoX+hZhGh5apsgDmjBESDxpnVk5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="1099139"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="1099139"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2023 02:03:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="820613261"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="820613261"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2023 02:03:55 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmsMj-0004vp-0P;
	Sun, 01 Oct 2023 09:03:53 +0000
Date: Sun, 1 Oct 2023 17:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jiri Kosina <jkosina@suse.cz>
Subject: [linux-next:master 693/8790] drivers/hid/hid-sony.c:2159:2-14:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202310011609.2mhDG4jJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df964ce9ef9fea10cf131bf6bad8658fde7956f6
commit: e1cd4004cde7c9b694bbdd8def0e02288ee58c74 [693/8790] HID: sony: Fix a potential memory leak in sony_probe()
config: x86_64-randconfig-101-20231001 (https://download.01.org/0day-ci/archive/20231001/202310011609.2mhDG4jJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231001/202310011609.2mhDG4jJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011609.2mhDG4jJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hid/hid-sony.c:2159:2-14: WARNING: NULL check before some freeing functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
