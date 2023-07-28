Received: from mgamail.intel.com (unknown [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E794E168B3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690567685; x=1722103685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NulXN+ROxffC2iCyg6Lgw79l/zCrBShlqR6llwtxQzw=;
  b=W27B1b30N18O4pQ/N3NN8jAw7zNvrX4J1o/O8PvYnvmDJDSZg/88jpra
   hq4A1ZbJ4Q9BpL0kSXjJBUSnh0UVGNpuPMIW3XOkyIXGJaOq988wlymS3
   5Kn3y47c5M4H+RyyIK93bliQ1DF4D9HlS03xp3+Hw00cSKAdxmO7jfzEx
   KQ1/G6ha9Zp4Aucbj+ytXVukV+XA6AC3VJzevJKWjFXy82tslT3P6fFRa
   XEgGIZ/Kvx+BvyBb8YUWIImDja0DZSJCTzBi77W2uti8ojY4cSMtLbvNn
   60rAMVh/XXB+HprUCigaLS2DqU9AzRoamHtqL9zExw9mNsFXZwm2QavQa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368666825"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="368666825"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 11:08:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="797515986"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="797515986"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2023 11:08:01 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPRsf-0003T7-0N;
	Fri, 28 Jul 2023 18:08:01 +0000
Date: Sat, 29 Jul 2023 02:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Rohan McLure <rmclure@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: drivers/bus/fsl-mc/dprc.c:494:9: warning: 'strncpy' specified bound
 16 equals destination size
Message-ID: <202307290251.hKiztLyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rohan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   57012c57536f8814dec92e74197ee96c3498d24e
commit: 95567f46b4d20c047750a5e3029461afcdc67697 powerpc/{32,book3e}: kcsan: Extend KCSAN Support
date:   7 weeks ago
config: powerpc-randconfig-r032-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290251.hKiztLyo-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290251.hKiztLyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290251.hKiztLyo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bus/fsl-mc/dprc.c: In function 'dprc_get_obj':
   drivers/bus/fsl-mc/dprc.c:453:9: warning: 'strncpy' output may be truncated copying 15 bytes from a string of length 15 [-Wstringop-truncation]
     453 |         strncpy(obj_desc->type, rsp_params->type, 16);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/dprc.c:455:9: warning: 'strncpy' output may be truncated copying 15 bytes from a string of length 15 [-Wstringop-truncation]
     455 |         strncpy(obj_desc->label, rsp_params->label, 16);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/dprc.c: In function 'dprc_set_obj_irq':
>> drivers/bus/fsl-mc/dprc.c:494:9: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
     494 |         strncpy(cmd_params->obj_type, obj_type, 16);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/dprc.c: In function 'dprc_get_obj_region':
   drivers/bus/fsl-mc/dprc.c:567:9: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
     567 |         strncpy(cmd_params->obj_type, obj_type, 16);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +494 drivers/bus/fsl-mc/dprc.c

31c889653c10dd drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-03-05  460  
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  461  /**
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  462   * dprc_set_obj_irq() - Set IRQ information for object to trigger an interrupt.
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  463   * @mc_io:	Pointer to MC portal's I/O object
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  464   * @cmd_flags:	Command flags; one or more of 'MC_CMD_FLAG_'
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  465   * @token:	Token of DPRC object
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  466   * @obj_type:	Type of the object to set its IRQ
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  467   * @obj_id:	ID of the object to set its IRQ
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  468   * @irq_index:	The interrupt index to configure
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  469   * @irq_cfg:	IRQ configuration
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  470   *
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  471   * Return:	'0' on Success; Error code otherwise.
e9bf3f206bd5e6 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-24  472   */
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  473  int dprc_set_obj_irq(struct fsl_mc_io *mc_io,
ba72f25b2588e1 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-25  474  		     u32 cmd_flags,
ba72f25b2588e1 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-25  475  		     u16 token,
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  476  		     char *obj_type,
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  477  		     int obj_id,
ba72f25b2588e1 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-25  478  		     u8 irq_index,
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  479  		     struct dprc_irq_cfg *irq_cfg)
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  480  {
5b04cedeca1888 drivers/bus/fsl-mc/dprc.c         Ioana Ciornei    2018-03-15  481  	struct fsl_mc_command cmd = { 0 };
9989b59961a8ad drivers/staging/fsl-mc/bus/dprc.c Ioana Radulescu  2016-06-22  482  	struct dprc_cmd_set_obj_irq *cmd_params;
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  483  
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  484  	/* prepare command */
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  485  	cmd.header = mc_encode_cmd_header(DPRC_CMDID_SET_OBJ_IRQ,
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  486  					  cmd_flags,
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  487  					  token);
9989b59961a8ad drivers/staging/fsl-mc/bus/dprc.c Ioana Radulescu  2016-06-22  488  	cmd_params = (struct dprc_cmd_set_obj_irq *)cmd.params;
9989b59961a8ad drivers/staging/fsl-mc/bus/dprc.c Ioana Radulescu  2016-06-22  489  	cmd_params->irq_val = cpu_to_le32(irq_cfg->val);
9989b59961a8ad drivers/staging/fsl-mc/bus/dprc.c Ioana Radulescu  2016-06-22  490  	cmd_params->irq_index = irq_index;
9989b59961a8ad drivers/staging/fsl-mc/bus/dprc.c Ioana Radulescu  2016-06-22  491  	cmd_params->irq_addr = cpu_to_le64(irq_cfg->paddr);
9989b59961a8ad drivers/staging/fsl-mc/bus/dprc.c Ioana Radulescu  2016-06-22  492  	cmd_params->irq_num = cpu_to_le32(irq_cfg->irq_num);
9989b59961a8ad drivers/staging/fsl-mc/bus/dprc.c Ioana Radulescu  2016-06-22  493  	cmd_params->obj_id = cpu_to_le32(obj_id);
9989b59961a8ad drivers/staging/fsl-mc/bus/dprc.c Ioana Radulescu  2016-06-22 @494  	strncpy(cmd_params->obj_type, obj_type, 16);
9989b59961a8ad drivers/staging/fsl-mc/bus/dprc.c Ioana Radulescu  2016-06-22  495  	cmd_params->obj_type[15] = '\0';
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  496  
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  497  	/* send command to mc*/
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  498  	return mc_send_command(mc_io, &cmd);
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  499  }
c9d57ea0b6fb0b drivers/staging/fsl-mc/bus/dprc.c Laurentiu Tudor  2017-11-17  500  EXPORT_SYMBOL_GPL(dprc_set_obj_irq);
1ee695fab32e25 drivers/staging/fsl-mc/bus/dprc.c J. German Rivera 2015-09-23  501  

:::::: The code at line 494 was first introduced by commit
:::::: 9989b59961a8ad55d92df4588b556f0c6c838ec7 staging: fsl-mc: convert mc command build/parse to use C structs

:::::: TO: Ioana Radulescu <ruxandra.radulescu@nxp.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
