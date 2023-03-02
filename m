Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA854EA1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 02:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677723777; x=1709259777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AugiYgNvjNAfxp545I5PA2WosEytyoqjEVqIoQOMTe0=;
  b=oJIBQQ84uii23qMCg7XsAF/1zF6OK4v0SAZ7I0jrn1j/uuIum5X8IRGy
   idbUm/2QuPE8hEv5dPygU7OKNeIz1rvXxr6Qb9bqFqMfYny17DNtiwQmW
   GSVVBQkcLPKz4q/imhrwLxjCp0ZdFWkGwvbJwz1mvK0A2pX2AFWIZNQvp
   TgTvL3a6IIinLo/m1GrGXgrsQi7X7aDvuzhrgJhBY/jBUfE+lrCTb7R+z
   Wxy+J2men6z3ar9mYZrlR/I3tcttEwFT1+4rxbR+sED+nzBMjPjyRlEOf
   fOH9uNAhdQyfXk+XLeuUAW8mGQGGTmPZ2xlvUUHLwUJoBz7E8Gw0jhZdL
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="332071509"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="332071509"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 18:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="705078325"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="705078325"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Mar 2023 18:22:56 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXYat-00005F-0u;
	Thu, 02 Mar 2023 02:22:55 +0000
Date: Thu, 2 Mar 2023 10:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 326/689]
 drivers/scsi/qla2xxx/qla_iocb.c:3820:5: warning: no previous prototype for
 'qla_get_iocbs_resource'
Message-ID: <202303021026.XS1e569V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   80441c75a39f1387a818b01ddfbda89ec92c01e0
commit: 4da9abb962636f67cb626c97110d6d4060c4bd53 [326/689] scsi: qla2xxx: Fix exchange oversubscription for management commands
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230302/202303021026.XS1e569V-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=4da9abb962636f67cb626c97110d6d4060c4bd53
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.1
        git checkout 4da9abb962636f67cb626c97110d6d4060c4bd53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/scsi/qla2xxx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021026.XS1e569V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_iocb.c:3820:5: warning: no previous prototype for 'qla_get_iocbs_resource' [-Wmissing-prototypes]
    3820 | int qla_get_iocbs_resource(struct srb *sp)
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/qla_get_iocbs_resource +3820 drivers/scsi/qla2xxx/qla_iocb.c

  3819	
> 3820	int qla_get_iocbs_resource(struct srb *sp)
  3821	{
  3822		bool get_exch;
  3823		bool push_it_through = false;
  3824	
  3825		if (!ql2xenforce_iocb_limit) {
  3826			sp->iores.res_type = RESOURCE_NONE;
  3827			return 0;
  3828		}
  3829		sp->iores.res_type = RESOURCE_NONE;
  3830	
  3831		switch (sp->type) {
  3832		case SRB_TM_CMD:
  3833		case SRB_PRLI_CMD:
  3834		case SRB_ADISC_CMD:
  3835			push_it_through = true;
  3836			fallthrough;
  3837		case SRB_LOGIN_CMD:
  3838		case SRB_ELS_CMD_RPT:
  3839		case SRB_ELS_CMD_HST:
  3840		case SRB_ELS_CMD_HST_NOLOGIN:
  3841		case SRB_CT_CMD:
  3842		case SRB_NVME_LS:
  3843		case SRB_ELS_DCMD:
  3844			get_exch = true;
  3845			break;
  3846	
  3847		case SRB_FXIOCB_DCMD:
  3848		case SRB_FXIOCB_BCMD:
  3849			sp->iores.res_type = RESOURCE_NONE;
  3850			return 0;
  3851	
  3852		case SRB_SA_UPDATE:
  3853		case SRB_SA_REPLACE:
  3854		case SRB_MB_IOCB:
  3855		case SRB_ABT_CMD:
  3856		case SRB_NACK_PLOGI:
  3857		case SRB_NACK_PRLI:
  3858		case SRB_NACK_LOGO:
  3859		case SRB_LOGOUT_CMD:
  3860		case SRB_CTRL_VP:
  3861			push_it_through = true;
  3862			fallthrough;
  3863		default:
  3864			get_exch = false;
  3865		}
  3866	
  3867		sp->iores.res_type |= RESOURCE_IOCB;
  3868		sp->iores.iocb_cnt = 1;
  3869		if (get_exch) {
  3870			sp->iores.res_type |= RESOURCE_EXCH;
  3871			sp->iores.exch_cnt = 1;
  3872		}
  3873		if (push_it_through)
  3874			sp->iores.res_type |= RESOURCE_FORCE;
  3875	
  3876		return qla_get_fw_resources(sp->qpair, &sp->iores);
  3877	}
  3878	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
