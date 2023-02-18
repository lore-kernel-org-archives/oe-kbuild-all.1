Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9913962D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 02:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676688620; x=1708224620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mCwCBFKM5W10vvViKqJohx198JYrfGaLCfjvdwLgaxo=;
  b=hhAU2dPxf2hFb7Im6PKHb0WdeZhg3Km5fMdEnVayHl4qt4nsPPorE8nK
   AH6KitJAyei179/D1rygMNnfrBpTxuJYnraBo4TblDkTVK3QW3au9Ii8U
   UDegcwlgsH8eEtW6IRQMS4ezFwuaNHrICGEo9hCruSOLMmkK6HKWrpAId
   Pp0uFTeXL+wJzqqBiLSlJB1U1I9WoUnwY2JQh2nvrstlaE+IymEithsmd
   6EJwD7FrL80Hu1SXXmHPjd++TkABM0cyW/bA+kKcZHA1pcOVoG5yNQA0r
   Lpcu+FqRcH6ofeHcNG3uxSzRwk4nunxksGsCop7tWlOXfo0hH2bkyRkhM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="329853828"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="329853828"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 18:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="759600407"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="759600407"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2023 18:48:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTDHI-000C2l-1q;
	Sat, 18 Feb 2023 02:48:44 +0000
Date: Sat, 18 Feb 2023 10:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
	tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
	christian.koenig@amd.com, bskeggs@redhat.com,
	Liam.Howlett@oracle.com, matthew.brost@intel.com,
	boris.brezillon@collabora.com, alexdeucher@gmail.com,
	ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
	jason@jlekstrand.net
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v2 06/16] drm: debugfs: provide infrastructure
 to dump a DRM GPU VA space
Message-ID: <202302181014.L0SHo3S1-lkp@intel.com>
References: <20230217134820.14672-1-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217134820.14672-1-dakr@redhat.com>

Hi Danilo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 48075a66fca613477ac1969b576a93ef5db0164f]

url:    https://github.com/intel-lab-lkp/linux/commits/Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230217-215101
base:   48075a66fca613477ac1969b576a93ef5db0164f
patch link:    https://lore.kernel.org/r/20230217134820.14672-1-dakr%40redhat.com
patch subject: [PATCH drm-next v2 06/16] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230218/202302181014.L0SHo3S1-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e1a1c9659baee305780e1ce50c05e53e1d14b245
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Danilo-Krummrich/drm-execution-context-for-GEM-buffers/20230217-215101
        git checkout e1a1c9659baee305780e1ce50c05e53e1d14b245
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181014.L0SHo3S1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/drm_debugfs.c: In function 'drm_debugfs_gpuva_info':
>> drivers/gpu/drm/drm_debugfs.c:228:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     228 |                            (u64)va->gem.obj, va->gem.offset);
         |                            ^


vim +228 drivers/gpu/drm/drm_debugfs.c

   178	
   179	/**
   180	 * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
   181	 * @m: pointer to the &seq_file to write
   182	 * @mgr: the &drm_gpuva_manager representing the GPU VA space
   183	 *
   184	 * Dumps the GPU VA regions and mappings of a given DRM GPU VA manager.
   185	 *
   186	 * For each DRM GPU VA space drivers should call this function from their
   187	 * &drm_info_list's show callback.
   188	 *
   189	 * Returns: 0 on success, -ENODEV if the &mgr is not initialized
   190	 */
   191	int drm_debugfs_gpuva_info(struct seq_file *m,
   192				   struct drm_gpuva_manager *mgr)
   193	{
   194		DRM_GPUVA_ITER(it, mgr);
   195		DRM_GPUVA_REGION_ITER(__it, mgr);
   196	
   197		if (!mgr->name)
   198			return -ENODEV;
   199	
   200		seq_printf(m, "DRM GPU VA space (%s)\n", mgr->name);
   201		seq_puts  (m, "\n");
   202		seq_puts  (m, " VA regions  | start              | range              | end                | sparse\n");
   203		seq_puts  (m, "------------------------------------------------------------------------------------\n");
   204		seq_printf(m, " VA space    | 0x%016llx | 0x%016llx | 0x%016llx |   -\n",
   205			   mgr->mm_start, mgr->mm_range, mgr->mm_start + mgr->mm_range);
   206		seq_puts  (m, "-----------------------------------------------------------------------------------\n");
   207		drm_gpuva_iter_for_each(__it) {
   208			struct drm_gpuva_region *reg = __it.reg;
   209	
   210			if (reg == &mgr->kernel_alloc_region) {
   211				seq_printf(m, " kernel node | 0x%016llx | 0x%016llx | 0x%016llx |   -\n",
   212					   reg->va.addr, reg->va.range, reg->va.addr + reg->va.range);
   213				continue;
   214			}
   215	
   216			seq_printf(m, "             | 0x%016llx | 0x%016llx | 0x%016llx | %s\n",
   217				   reg->va.addr, reg->va.range, reg->va.addr + reg->va.range,
   218				   reg->sparse ? "true" : "false");
   219		}
   220		seq_puts(m, "\n");
   221		seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
   222		seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
   223		drm_gpuva_iter_for_each(it) {
   224			struct drm_gpuva *va = it.va;
   225	
   226			seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
   227				   va->va.addr, va->va.range, va->va.addr + va->va.range,
 > 228				   (u64)va->gem.obj, va->gem.offset);
   229		}
   230	
   231		return 0;
   232	}
   233	EXPORT_SYMBOL(drm_debugfs_gpuva_info);
   234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
