Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C58511716
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgwUbYJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699091975; x=1730627975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6FxjdwyExdi16RM7Ztk49wOohxbvua2F9wm5ru/TpL0=;
  b=EgwUbYJtmNAOERxIirRs0CYG8zcWvOq5SDDPDu2NXHVaqRkjwpje9tqm
   z5fJ/qAWg6RpoSHdb2E5zxDg/5hurxqSNQpMpxKJup321N96GXhaYnA9c
   WAUMuiPqJSWFc2PYBMuNFdr0Td20VfGgJYApWwP2cm5kboBJXE9S1X5m3
   akUekEz37/fGcxE6EXT/RZAnahXFOy/7+jD0dz4YFJV3QKDD/1mT+JEry
   YI2vmQ2GzoV81hgIEvitew3b1votpzjSB48ZRjgcO44olLNkNyJ7Fcvss
   0oVEnookQ16P3N/GaE41IXutSjb9Rla4CkVEL6s9dsbnoi53jlMHxAzBt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="455565695"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="455565695"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 02:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1009054240"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1009054240"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 04 Nov 2023 02:59:33 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzDRD-0003l2-0k;
	Sat, 04 Nov 2023 09:59:31 +0000
Date: Sat, 4 Nov 2023 17:58:23 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: [drm-xe:drm-xe-next 1456/1905]
 drivers/gpu/drm/xe/xe_tile_sysfs.c:29:36: warning: format '%llu' expects
 argument of type 'long long unsigned int', but argument 3 has type
 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202311041742.3dzKbpfj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   bfa43da8e1f181fe2f8b84b39cb8a86e54f43731
commit: a8eff4f048bf2238bd686112c64bd6b6c5d99646 [1456/1905] drm/xe: Add sysfs entry to report per tile memory size
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041742.3dzKbpfj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041742.3dzKbpfj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041742.3dzKbpfj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_tile_sysfs.c: In function 'physical_vram_size_bytes_show':
>> drivers/gpu/drm/xe/xe_tile_sysfs.c:29:36: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      29 |         return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
         |                                 ~~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |                   |
         |                                    |                   resource_size_t {aka unsigned int}
         |                                    long long unsigned int
         |                                 %u


vim +29 drivers/gpu/drm/xe/xe_tile_sysfs.c

    22	
    23	static ssize_t
    24	physical_vram_size_bytes_show(struct device *kdev, struct device_attribute *attr,
    25				      char *buf)
    26	{
    27		struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
    28	
  > 29		return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
