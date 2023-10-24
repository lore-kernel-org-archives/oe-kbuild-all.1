Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D486723BB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYaZctns"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698118359; x=1729654359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWu1iKIWe0i+d+e5ZV5mPhEU937DlG4E14kVE9hx5Zg=;
  b=OYaZctnsWNt+3QjFpXNZJ71cYBLvXrWjSdCJoPsFGjll1280vy8VzuZi
   qgZic/Lfit+PJBTkeGWTsabtqsuaQuccEZgBGGsHMtXj5nfB36h4jPOlF
   ftR4I4CMA67WsVNpQ8Y2efdEJ4SXH41aX1//onjoRc69FdOu7aaN2Fcsb
   lvXITzouEz7bCwWfo4OuVAWH9JkB/RX78kwlcDmHHvT+d6vOPFKrVVBk2
   uUgUNMm8wFczfmm9c4oseU84112xX4z0TYPIkOOeWOEXkCy00PtLiOeF2
   sFVwtL50OTkj7nM5eTHp9TUE56wkixc6nRnhjnF3d36Rqg7Y7eABPuVEU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="377356786"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="377356786"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 20:32:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="902026141"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="902026141"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2023 20:30:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qv89j-0007X7-1g;
	Tue, 24 Oct 2023 03:32:35 +0000
Date: Tue, 24 Oct 2023 11:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm_buf 6/10] drivers/char/tpm/tpm-interface.c:362:
 warning: Function parameter or member 'length' not described in 'tpm_send'
Message-ID: <202310241115.Tvad5ImA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm_buf
head:   19f6e9fedbf68841c13485638dae42d3026b134f
commit: 4e5479df563c5931f1e39f552922901f2891dee5 [6/10] tpm: Store TPM buffer length
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231024/202310241115.Tvad5ImA-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231024/202310241115.Tvad5ImA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310241115.Tvad5ImA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm-interface.c:362: warning: Function parameter or member 'length' not described in 'tpm_send'
>> drivers/char/tpm/tpm-interface.c:362: warning: Excess function parameter 'cmdlen' description in 'tpm_send'


vim +362 drivers/char/tpm/tpm-interface.c

659aaf2bb5496a drivers/char/tpm/tpm.c           Rajiv Andrade   2009-02-02  352  
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  353  /**
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  354   * tpm_send - send a TPM command
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  355   * @chip:	a &struct tpm_chip instance, %NULL for the default chip
4e5479df563c59 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  356   * @data:	command blob
4e5479df563c59 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  357   * @cmdlen:	length of the command
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  358   *
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  359   * Return: same as with tpm_transmit_cmd()
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  360   */
4e5479df563c59 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  361  int tpm_send(struct tpm_chip *chip, void *data, size_t length)
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23 @362  {
412eb585587a1d drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2018-10-26  363  	struct tpm_buf buf;
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  364  	int rc;
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  365  
fc1d52b745bae6 drivers/char/tpm/tpm-interface.c Stefan Berger   2018-06-26  366  	chip = tpm_find_get_ops(chip);
aad887f6641145 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2017-11-05  367  	if (!chip)
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  368  		return -ENODEV;
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  369  
4e5479df563c59 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  370  	buf.flags = 0;
4e5479df563c59 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  371  	buf.length = length;
4e5479df563c59 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2023-08-11  372  	buf.data = data;
47a6c28b6861b1 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2018-11-05  373  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting to a send a command");
e13cd21ffd50a0 drivers/char/tpm/tpm-interface.c Jarkko Sakkinen 2019-09-16  374  
4e26195f240d73 drivers/char/tpm/tpm-interface.c Jason Gunthorpe 2016-02-12  375  	tpm_put_ops(chip);
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  376  	return rc;
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  377  }
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  378  EXPORT_SYMBOL_GPL(tpm_send);
c749ba912e87cc drivers/char/tpm/tpm.c           Mimi Zohar      2010-11-23  379  

:::::: The code at line 362 was first introduced by commit
:::::: c749ba912e87ccebd674ae24b97462176c63732e key: add tpm_send command

:::::: TO: Mimi Zohar <zohar@linux.vnet.ibm.com>
:::::: CC: James Morris <jmorris@namei.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
