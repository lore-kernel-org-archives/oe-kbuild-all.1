Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA5C1CA88
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfAh1HEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700656966; x=1732192966;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5hLJrOV+mAip0x+2PM8ZuUHmD9zS7dhAzUTqBe3VWrg=;
  b=QfAh1HEK6UgIKFR0A96k1Edkf1xewU55R5a2wZhe8hglq7tJSz9DG4C8
   E/NmzZ/a292JuR68s9Ckfy1KbkvlVhR82O7jyISshvY6susw3N+vtmxUL
   7g0V/s/F+XtUbGY8SE2cAxoAOSuaujBcOc2/nNmoqWAV1cWNPSdW8E6QG
   F5955AXwPM3lzoG3BzMoGQiqYGLVGuXScY+OpSWgdbHA7Ff2Y8UCc5QjF
   vzl/oCuY02p8SvmVC6bDvc91zb/arFKLQSyYVmVtN/cNHHIN6w7c875ay
   HG9LS6vkhJDZ84DEgsLzYgpbZj9ZCQlJhpIWjj1J4Izv/iwkSjWEyKEdJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5186792"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="5186792"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 04:42:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1014221335"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="1014221335"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2023 04:42:38 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5mYt-0000Sy-1t;
	Wed, 22 Nov 2023 12:42:35 +0000
Date: Wed, 22 Nov 2023 20:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: shiju.jose@huawei.com, linux-cxl@vger.kernel.org, linux-mm@kvack.org,
	dave@stgolabs.net, jonathan.cameron@huawei.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	vishal.l.verma@intel.com, ira.weiny@intel.com,
	dan.j.williams@intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, david@redhat.com,
	Vilas.Sridharan@amd.com, leo.duran@amd.com, Yazen.Ghannam@amd.com,
	rientjes@google.com, jiaqiyan@google.com, tony.luck@intel.com,
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, rafael@kernel.org,
	lenb@kernel.org, naoya.horiguchi@nec.com, james.morse@arm.com,
	jthoughton@google.com, somasundaram.a@hpe.com,
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com,
	mike.malvestuto@intel.com
Subject: Re: [PATCH v2 04/10] cxl/memscrub: Add CXL device patrol scrub
 control feature
Message-ID: <202311221736.XNNZPX0U-lkp@intel.com>
References: <20231121101844.1161-5-shiju.jose@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121101844.1161-5-shiju.jose@huawei.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/shiju-jose-huawei-com/cxl-mbox-Add-GET_SUPPORTED_FEATURES-mailbox-command/20231121-182247
base:   linus/master
patch link:    https://lore.kernel.org/r/20231121101844.1161-5-shiju.jose%40huawei.com
patch subject: [PATCH v2 04/10] cxl/memscrub: Add CXL device patrol scrub control feature
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311221736.XNNZPX0U-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221736.XNNZPX0U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221736.XNNZPX0U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/memscrub.c:241:5: error: redefinition of 'cxl_mem_patrol_scrub_init'
     241 | int cxl_mem_patrol_scrub_init(struct cxl_memdev *cxlmd)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/cxl/core/memscrub.c:13:
   drivers/cxl/cxlmem.h:990:19: note: previous definition of 'cxl_mem_patrol_scrub_init' with type 'int(struct cxl_memdev *)'
     990 | static inline int cxl_mem_patrol_scrub_init(struct cxl_memdev *cxlmd)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/cxl/core/memscrub.c:169:12: warning: 'cxl_mem_ps_set_attrbs' defined but not used [-Wunused-function]
     169 | static int cxl_mem_ps_set_attrbs(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +/cxl_mem_patrol_scrub_init +241 drivers/cxl/core/memscrub.c

   240	
 > 241	int cxl_mem_patrol_scrub_init(struct cxl_memdev *cxlmd)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
