Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E21FAD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 05:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTh1+XgY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697349043; x=1728885043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QGjY2tzhv/I6qehnWwJX+SNg0gbwEvk3W7vE+nbA3Ro=;
  b=CTh1+XgYtb1SjNldM344zBlm4e93FNcEHncI/o+pGeSD3WjpoRLMivn+
   dDH2Yx/HhFtvlHZYtY6be0dwx5l7JNmyR6qmVwCHvDaKs8yNUfHlvMH2m
   EGUvhe4sGt4tAoGUxRMHmDAoAMeceKvZ1xMz74FCcbh12p8pY3fTaJEyP
   3OPgAfXoUEfdfqJ4Z8Vcd70C+htFaIasYH4F/a8MoEe8g2kLcEUn5RWZT
   TbdCz3GXeoHw1VCLqnNPG3yvObNjg1wL158CgTFx2E+h2tJYCl1eIwpbo
   9Z5KwVL26B7lkmgPzlStB9IE4wqUf/5CNqdFcddyeLpKSECLTJwtVanW8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370438889"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="370438889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 22:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002490971"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1002490971"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 22:50:37 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qru1L-00074n-0K;
	Sun, 15 Oct 2023 05:50:35 +0000
Date: Sun, 15 Oct 2023 13:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2560/30000]
 drivers/soc/fsl/dpio/qbman-portal.c:1309: Error: no such instruction: `dc
 cvac,%edi'
Message-ID: <202310151329.8WpxLcnS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 6a74b3766942efaff185457d8b426f5d007e1ac5 [2560/30000] soc: fsl: dpio: QMAN performance improvement. Function pointer indirection.
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151329.8WpxLcnS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151329.8WpxLcnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151329.8WpxLcnS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/fsl/dpio/qbman-portal.c: Assembler messages:
   drivers/soc/fsl/dpio/qbman-portal.c:962: Error: no such instruction: `dc cvac,%ecx'
>> drivers/soc/fsl/dpio/qbman-portal.c:1309: Error: no such instruction: `dc cvac,%edi'
   drivers/soc/fsl/dpio/qbman-portal.c:622: Error: no such instruction: `dc cvac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
>> drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%esi'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%eax'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%ebx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:167: Error: no such instruction: `dc ivac,%edx'
   drivers/soc/fsl/dpio/qbman-portal.c:423: Error: no such instruction: `dc cvac,%edx'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GPIO_MXC
   Depends on [n]: GPIOLIB [=y] && HAS_IOMEM [=y] && ARCH_MXC
   Selected by [y]:
   - GPIO_MXC_PAD_WAKEUP [=y] && GPIOLIB [=y] && HAS_IOMEM [=y] && IMX_SCU [=y]


vim +1309 drivers/soc/fsl/dpio/qbman-portal.c

321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1270  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1271  /**
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  1272   * qbman_swp_release_direct() - Issue a buffer release command
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1273   * @s:           the software portal object
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1274   * @d:           the release descriptor
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1275   * @buffers:     a pointer pointing to the buffer address to be released
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1276   * @num_buffers: number of buffers to be released,  must be less than 8
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1277   *
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1278   * Return 0 for success, -EBUSY if the release command ring is not ready.
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1279   */
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  1280  int qbman_swp_release_direct(struct qbman_swp *s,
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  1281  			     const struct qbman_release_desc *d,
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1282  			     const u64 *buffers, unsigned int num_buffers)
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1283  {
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1284  	int i;
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1285  	struct qbman_release_desc *p;
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1286  	u32 rar;
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1287  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1288  	if (!num_buffers || (num_buffers > 7))
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1289  		return -EINVAL;
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1290  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1291  	rar = qbman_read_register(s, QBMAN_CINH_SWP_RAR);
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1292  	if (!RAR_SUCCESS(rar))
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1293  		return -EBUSY;
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1294  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1295  	/* Start the release command */
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1296  	p = qbman_get_cmd(s, QBMAN_CENA_SWP_RCR(RAR_IDX(rar)));
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  1297  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1298  	/* Copy the caller's buffer pointers to the command */
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1299  	for (i = 0; i < num_buffers; i++)
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1300  		p->buf[i] = cpu_to_le64(buffers[i]);
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1301  	p->bpid = d->bpid;
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1302  
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1303  	/*
5842efa41f57a9 drivers/soc/fsl/dpio/qbman-portal.c            Roy Pledge   2019-04-05  1304  	 * Set the verb byte, have to substitute in the valid-bit
5842efa41f57a9 drivers/soc/fsl/dpio/qbman-portal.c            Roy Pledge   2019-04-05  1305  	 * and the number of buffers.
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1306  	 */
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1307  	dma_wmb();
321eecb06bfba0 drivers/staging/fsl-mc/bus/dpio/qbman-portal.c Roy Pledge   2017-03-13  1308  	p->verb = d->verb | RAR_VB(rar) | num_buffers;
166290c21079e1 drivers/soc/fsl/dpio/qbman-portal.c            Haiying Wang 2017-04-13 @1309  	dccvac(p);
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  1310  
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  1311  	return 0;
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  1312  }
6a74b3766942ef drivers/soc/fsl/dpio/qbman-portal.c            Youri Querry 2019-11-04  1313  

:::::: The code at line 1309 was first introduced by commit
:::::: 166290c21079e1ae6c20592d3a252df0ece8588e soc: fsl: dpio: enable qbman CENA portal memory access

:::::: TO: Haiying Wang <Haiying.Wang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
