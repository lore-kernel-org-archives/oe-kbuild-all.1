Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D3D7E5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 01:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691112060; x=1722648060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hgge+CBwtoXhakToZ3cYiDf0b0sxbdauPcAOxk4YSf8=;
  b=V/lxQXt9YB/x89onYAkdIuvtoZYHWzntyjlwFbd7zAXp7PcBJpZEOSux
   MYlYUtlgxs3zHmLMSIAW+pWvl64/ume+sQFRHOL+5gWDcOsfdf5nd4sfs
   dJw2BPB08xHjwsQ9HtF995cHgzbVbJEajeLuEvje+i+SKuaLraHD5k6a3
   GRWHakuOEy8WHS6fv7Jt7/3iUUAU828FjTKeAaN0SmTTS9CX2oEaX55RT
   dRATpwTXp4PyIPNkXxRJ3cXXoCaaRg0bsJ12Uwcieoff4w45B6v4jUAQ2
   5pJZKAYmEmgaB1n9mSyk0ZpWWVc9FKayuiXBMh9l0r6D5VWb2ZQC02em7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349628187"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="349628187"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 18:20:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="706788342"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="706788342"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 03 Aug 2023 18:20:58 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRjUv-0002Vf-0z;
	Fri, 04 Aug 2023 01:20:57 +0000
Date: Fri, 4 Aug 2023 09:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: GUO Zihua <guozihua@huawei.com>, airlied@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH -next] agp: Make agp_gatt_table static
Message-ID: <202308040824.jnJY2iI7-lkp@intel.com>
References: <20230803020820.17414-1-guozihua@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803020820.17414-1-guozihua@huawei.com>

Hi GUO,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230803]

url:    https://github.com/intel-lab-lkp/linux/commits/GUO-Zihua/agp-Make-agp_gatt_table-static/20230803-152304
base:   next-20230803
patch link:    https://lore.kernel.org/r/20230803020820.17414-1-guozihua%40huawei.com
patch subject: [PATCH -next] agp: Make agp_gatt_table static
config: x86_64-buildonly-randconfig-r001-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040824.jnJY2iI7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040824.jnJY2iI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040824.jnJY2iI7-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `enable_gart_translations':
>> amd_gart_64.c:(.text+0x57ed5): undefined reference to `agp_gatt_table'
   ld: vmlinux.o: in function `init_amd_gatt':
>> amd_gart_64.c:(.init.text+0x40b96): undefined reference to `agp_gatt_table'
   ld: vmlinux.o: in function `gart_iommu_init':
>> (.init.text+0x411c7): undefined reference to `agp_gatt_table'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
