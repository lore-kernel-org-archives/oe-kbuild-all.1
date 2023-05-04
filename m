Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5690C133
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 21:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683237058; x=1714773058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UTH6OAC81MI8z4u+u3+a0FHjMe3lK9NfjD25egPxlr4=;
  b=cpmY6DwE9jk85NRKnkm5EZ6jsFFR4zRPaoulbYhPjPLv/NHSVmeElIl7
   q27HnxlfiN2rAdqRAex4vbph2W05ltDlERycTDRc23eSUc7sxJCXWYSaO
   iAf3vxaLSnWizHB20gkpL658t6AMuRTvUwqBggb29Nnw34NIEn/xlxrVc
   tI+MsKvXcOKb9c+eqDp0q1dfUglwfkIJ4cI62OdTzZIIg0U6AUA551Mnz
   rJaHlFVWZOjfsd9jsfD7EV0WU+95h5i7oail+GQsYynuVzkFqPb6Hs72D
   L4NFTOmm6vavUZDiTLbo20YvZmK88FjuzEuybGHGR0POf2wjK+BM1nuMi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="352092460"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="352092460"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 14:50:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="1027139826"
X-IronPort-AV: E=Sophos;i="5.99,250,1677571200"; 
   d="scan'208";a="1027139826"
Received: from lkp-server01.sh.intel.com (HELO 64cf2984a3fe) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 04 May 2023 14:50:54 -0700
Received: from kbuild by 64cf2984a3fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pugqj-0000A0-0x;
	Thu, 04 May 2023 21:50:53 +0000
Date: Fri, 5 May 2023 05:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 14/28] drivers/cxl/acpi.c:228:18: warning: variable
 'entries' set but not used
Message-ID: <202305050527.V7lRFjZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   c09d294a320a41a687ff2881bc080bf7d9ee5ce2
commit: c858b2d3eecde666304c4dbee7e32bc781971dfd [14/28] cxl: Add support for _DSM Function for retrieving QTG ID
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230505/202305050527.V7lRFjZ7-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=c858b2d3eecde666304c4dbee7e32bc781971dfd
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout c858b2d3eecde666304c4dbee7e32bc781971dfd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/acpi/numa/ drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305050527.V7lRFjZ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cxl/acpi.c: In function 'cxl_acpi_evaluate_qtg_dsm':
>> drivers/cxl/acpi.c:228:18: warning: variable 'entries' set but not used [-Wunused-but-set-variable]
     228 |         int len, entries;
         |                  ^~~~~~~


vim +/entries +228 drivers/cxl/acpi.c

   200	
   201	/**
   202	 * cxl_acpi_evaluate_qtg_dsm - Retrieve QTG ids via ACPI _DSM
   203	 * @handle: ACPI handle
   204	 * @input: bandwidth and latency data
   205	 *
   206	 * Issue QTG _DSM with accompanied bandwidth and latency data in order to get
   207	 * the QTG IDs that are suitable for the performance point in order of most
   208	 * suitable to least suitable. Return first QTG ID.
   209	 */
   210	static int cxl_acpi_evaluate_qtg_dsm(acpi_handle handle,
   211					     struct qtg_dsm_input *input)
   212	{
   213		union acpi_object *out_obj, *out_buf, *pkg;
   214		union acpi_object in_buf = {
   215			.buffer = {
   216				.type = ACPI_TYPE_BUFFER,
   217				.pointer = (u8 *)input,
   218				.length = cpu_to_le32(sizeof(*input)),
   219			},
   220		};
   221		union acpi_object in_obj = {
   222			.package = {
   223				.type = ACPI_TYPE_PACKAGE,
   224				.count = cpu_to_le32(1),
   225				.elements = &in_buf
   226			},
   227		};
 > 228		int len, entries;
   229		u16 max_qtg;
   230		int rc = 0;
   231	
   232		out_obj = acpi_evaluate_dsm(handle, &acpi_cxl_qtg_id_guid, 1, 1, &in_obj);
   233		if (!out_obj)
   234			return -ENXIO;
   235	
   236		if (out_obj->type != ACPI_TYPE_PACKAGE) {
   237			rc = -ENXIO;
   238			goto out;
   239		}
   240	
   241		/* Check Max QTG ID */
   242		pkg = &out_obj->package.elements[0];
   243		if (pkg->type != ACPI_TYPE_BUFFER) {
   244			rc = -ENXIO;
   245			goto out;
   246		}
   247	
   248		if (le32_to_cpu(pkg->buffer.length) != sizeof(u16)) {
   249			rc = -ENXIO;
   250			goto out;
   251		}
   252	
   253		max_qtg = le16_to_cpu(*(__le16 *)pkg->buffer.pointer);
   254	
   255		/* Retrieve QTG IDs package */
   256		pkg = &out_obj->package.elements[1];
   257		if (pkg->type != ACPI_TYPE_PACKAGE) {
   258			rc = -ENXIO;
   259			goto out;
   260		}
   261	
   262		out_buf = &pkg->package.elements[0];
   263		if (out_buf->type != ACPI_TYPE_BUFFER) {
   264			rc = -ENXIO;
   265			goto out;
   266		}
   267	
   268		len = le32_to_cpu(out_buf->buffer.length);
   269	
   270		/* It's legal to have 0 QTG entries */
   271		if (len == 0) {
   272			rc = -EEXIST;
   273			goto out;
   274		}
   275	
   276		/* Malformed package, not multiple of WORD size */
   277		if (len % sizeof(u16)) {
   278			rc = -ENXIO;
   279			goto out;
   280		}
   281	
   282		entries = len / sizeof(u16);
   283		rc = le16_to_cpu(*(__le16 *)out_buf->buffer.pointer);
   284		if (rc > max_qtg) {
   285			rc = -ERANGE;
   286			pr_warn("QTG ID %u greater than MAX %u\n", rc, max_qtg);
   287		}
   288	
   289	out:
   290		ACPI_FREE(out_obj);
   291		return rc;
   292	}
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
