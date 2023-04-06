Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD03AD29
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680805327; x=1712341327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGZ81dd0ZcVOPqH5rAY16aKfjeO+aWCnFPAVqI8VbXI=;
  b=LJmZgW/655a6NNiOPY0d+nCgSzh9IZMsS/cCzGyZkKmt034ZlQGN6pwb
   mH/i5iPJb15r7lZu96WyQfeTOGDW9wzrBK9JBGUQ85WBoqCdDOZCZDPX1
   ZBtUfsWNcti8Cl5rpmrGtV/E1TI9a8mtLYNh/kIbtRCkLFX7eUxnoN0Vf
   bULlLngEPgPEQqweA0r4PIw2gKWO58z1UdkFg8LIVYPqTQ54YTpsWWQI/
   zTp6fQmJEAaKYStfL7hgkOLoBEmyIW6ftuRilfRQN4k5dATvapcF4aV8V
   6vF+o/fRAfyq3jovUlvuv0uvZjw6fK67N0YmMfsfJId4CMaMzYEnbrGeM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="331446673"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="331446673"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 11:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="830856432"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="830856432"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2023 11:22:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkUFI-000RbG-1o;
	Thu, 06 Apr 2023 18:22:04 +0000
Date: Fri, 7 Apr 2023 02:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [linux-next:master 2370/9787]
 drivers/remoteproc/imx_dsp_rproc.c:765:39: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202304070251.LY6c7kgm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e134c93f788fb93fd6a3ec3af9af850a2048c7e6
commit: 408ec1ff0caa340c57eecf4cbd14ef0132036a50 [2370/9787] remoteproc: imx_dsp_rproc: Add custom memory copy implementation for i.MX DSP Cores
config: arm64-randconfig-s053-20230406 (https://download.01.org/0day-ci/archive/20230407/202304070251.LY6c7kgm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=408ec1ff0caa340c57eecf4cbd14ef0132036a50
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 408ec1ff0caa340c57eecf4cbd14ef0132036a50
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/remoteproc/ lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070251.LY6c7kgm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/remoteproc/imx_dsp_rproc.c:765:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/remoteproc/imx_dsp_rproc.c:765:39: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/imx_dsp_rproc.c:765:39: sparse:     got unsigned int [usertype] *
>> drivers/remoteproc/imx_dsp_rproc.c:775:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/remoteproc/imx_dsp_rproc.c:775:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/remoteproc/imx_dsp_rproc.c:775:34: sparse:     got void *
>> drivers/remoteproc/imx_dsp_rproc.c:782:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/remoteproc/imx_dsp_rproc.c:782:34: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/imx_dsp_rproc.c:782:34: sparse:     got void *
   drivers/remoteproc/imx_dsp_rproc.c:813:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/remoteproc/imx_dsp_rproc.c:813:40: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/imx_dsp_rproc.c:813:40: sparse:     got unsigned int [usertype] *
>> drivers/remoteproc/imx_dsp_rproc.c:823:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *[assigned] tmp_dst @@
   drivers/remoteproc/imx_dsp_rproc.c:823:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/remoteproc/imx_dsp_rproc.c:823:29: sparse:     got unsigned int [usertype] *[assigned] tmp_dst
>> drivers/remoteproc/imx_dsp_rproc.c:827:29: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] *[assigned] tmp_dst @@
   drivers/remoteproc/imx_dsp_rproc.c:827:29: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/remoteproc/imx_dsp_rproc.c:827:29: sparse:     got unsigned int [usertype] *[assigned] tmp_dst

vim +765 drivers/remoteproc/imx_dsp_rproc.c

   740	
   741	/*
   742	 * Custom memory copy implementation for i.MX DSP Cores
   743	 *
   744	 * The IRAM is part of the HiFi DSP.
   745	 * According to hw specs only 32-bits writes are allowed.
   746	 */
   747	static int imx_dsp_rproc_memcpy(void *dest, const void *src, size_t size)
   748	{
   749		const u8 *src_byte = src;
   750		const u32 *source = src;
   751		u32 affected_mask;
   752		u32 *dst = dest;
   753		int i, q, r;
   754		u32 tmp;
   755	
   756		/* destination must be 32bit aligned */
   757		if (!IS_ALIGNED((uintptr_t)dest, 4))
   758			return -EINVAL;
   759	
   760		q = size / 4;
   761		r = size % 4;
   762	
   763		/* copy data in units of 32 bits at a time */
   764		for (i = 0; i < q; i++)
 > 765			writel(source[i], &dst[i]);
   766	
   767		if (r) {
   768			affected_mask = GENMASK(8 * r, 0);
   769	
   770			/*
   771			 * first read the 32bit data of dest, then change affected
   772			 * bytes, and write back to dest.
   773			 * For unaffected bytes, it should not be changed
   774			 */
 > 775			tmp = readl(dest + q * 4);
   776			tmp &= ~affected_mask;
   777	
   778			/* avoid reading after end of source */
   779			for (i = 0; i < r; i++)
   780				tmp |= (src_byte[q * 4 + i] << (8 * i));
   781	
 > 782			writel(tmp, dest + q * 4);
   783		}
   784	
   785		return 0;
   786	}
   787	
   788	/*
   789	 * Custom memset implementation for i.MX DSP Cores
   790	 *
   791	 * The IRAM is part of the HiFi DSP.
   792	 * According to hw specs only 32-bits writes are allowed.
   793	 */
   794	static int imx_dsp_rproc_memset(void *addr, u8 value, size_t size)
   795	{
   796		u32 tmp_val = value;
   797		u32 *tmp_dst = addr;
   798		u32 affected_mask;
   799		int q, r;
   800		u32 tmp;
   801	
   802		/* destination must be 32bit aligned */
   803		if (!IS_ALIGNED((uintptr_t)addr, 4))
   804			return -EINVAL;
   805	
   806		tmp_val |= tmp_val << 8;
   807		tmp_val |= tmp_val << 16;
   808	
   809		q = size / 4;
   810		r = size % 4;
   811	
   812		while (q--)
   813			writel(tmp_val, tmp_dst++);
   814	
   815		if (r) {
   816			affected_mask = GENMASK(8 * r, 0);
   817	
   818			/*
   819			 * first read the 32bit data of addr, then change affected
   820			 * bytes, and write back to addr.
   821			 * For unaffected bytes, it should not be changed
   822			 */
 > 823			tmp = readl(tmp_dst);
   824			tmp &= ~affected_mask;
   825	
   826			tmp |= (tmp_val & affected_mask);
 > 827			writel(tmp, tmp_dst);
   828		}
   829	
   830		return 0;
   831	}
   832	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
