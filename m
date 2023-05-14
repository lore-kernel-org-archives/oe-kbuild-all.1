Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A01B1101
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 May 2023 04:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684039222; x=1715575222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LfPkslqWJV4+I/Dy2lcy02b+bP1SXw2cqj3UP4P2HvQ=;
  b=eFJaWqH9APzjPs5O3SDsYK18pBRR8z1NKQ7JS8KCg6CPSFN8uofyxfIo
   IWLJ5I6Bw5KadRWryWAyFBLuEaC9e0QRaW8P/xBomF6SfZ5bN6GKw/dmQ
   c95DyM3wOZUFUexVPs960Q9gUrG39/m9oPQcdTzKRpO+MbmVzbBUZ2DXt
   OufVwyCbdqH/bmNBLX7fJhsPrpcmcfCdNosI6IcdshWF5ZnrTRUPzloPu
   pt20PTdf3ogZSEeeolBSCBroarmP7u0p9h+qgl2mroJBJYMxfhISqyTBO
   hQDYnks2q2ysUYQKMH/R5gRGTYlxmDmQtqNuVn0PvdB8t5TInb1OoeBy3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="335538021"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="335538021"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 21:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="790257668"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="790257668"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 13 May 2023 21:40:21 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1py3Wu-0005pU-1i;
	Sun, 14 May 2023 04:40:20 +0000
Date: Sun, 14 May 2023 12:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 20/30] drivers/cxl/acpi.c:218:35: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202305141247.H047U8Nx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   39202ea9232fbee1624395c38cadcc5749b2319e
commit: 8beff35ad5bc016125a9bcb0651ab97713fcc141 [20/30] cxl: Add support for _DSM Function for retrieving QTG ID
config: loongarch-randconfig-s042-20230514 (https://download.01.org/0day-ci/archive/20230514/202305141247.H047U8Nx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git/commit/?id=8beff35ad5bc016125a9bcb0651ab97713fcc141
        git remote add djiang https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git
        git fetch --no-tags djiang cxl-qtg
        git checkout 8beff35ad5bc016125a9bcb0651ab97713fcc141
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305141247.H047U8Nx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/acpi.c:218:35: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] length @@     got restricted __le32 [usertype] @@
   drivers/cxl/acpi.c:218:35: sparse:     expected unsigned int [usertype] length
   drivers/cxl/acpi.c:218:35: sparse:     got restricted __le32 [usertype]
>> drivers/cxl/acpi.c:224:34: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] count @@     got restricted __le32 [usertype] @@
   drivers/cxl/acpi.c:224:34: sparse:     expected unsigned int [usertype] count
   drivers/cxl/acpi.c:224:34: sparse:     got restricted __le32 [usertype]
>> drivers/cxl/acpi.c:248:13: sparse: sparse: cast to restricted __le32
   drivers/cxl/acpi.c:268:15: sparse: sparse: cast to restricted __le32

vim +218 drivers/cxl/acpi.c

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
 > 218				.length = cpu_to_le32(sizeof(*input)),
   219			},
   220		};
   221		union acpi_object in_obj = {
   222			.package = {
   223				.type = ACPI_TYPE_PACKAGE,
 > 224				.count = cpu_to_le32(1),
   225				.elements = &in_buf
   226			},
   227		};
   228		u16 max_qtg;
   229		int rc = 0;
   230		int len;
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
 > 248		if (le32_to_cpu(pkg->buffer.length) != sizeof(u16)) {
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
   282		rc = le16_to_cpu(*(__le16 *)out_buf->buffer.pointer);
   283		if (rc > max_qtg) {
   284			rc = -ERANGE;
   285			pr_warn("QTG ID %u greater than MAX %u\n", rc, max_qtg);
   286		}
   287	
   288	out:
   289		ACPI_FREE(out_obj);
   290		return rc;
   291	}
   292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
