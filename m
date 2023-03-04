Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE73D23BC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Mar 2023 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677931193; x=1709467193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xelb5zkFKp3r+UZDDVOeVUO7nxKP7Ku8LuqmW7ZWCjg=;
  b=DSVeWNh33shdU8C66pyD0INEGRlFmDDyNr9ub6rghe/rt4YtpsQfRYJf
   XmOO1q1a1/3wsx1e+u1GaPgisH/0qic8iHCjLlytXiyG99jYR7clIaUgl
   EDICwcYZzeDak0Odp1vm96kJ3kRLO7gn55IveaAousyjo81xeUNNpKgJC
   /2AOk7wgQUwDjiVd5Ll8ElPlRhywqb9TNfouO5ElLghkLyaZ/yy86b+oy
   oCTtX8Gme+Ol1wn7dnlE4xtsXYrs8+bx54/NP2jiwVv3/ZKn46CTBRKYh
   lQ9baNWZrFc/TExY5wpxTNwlGqfcabCou0zs2OdXOX2h7umjeXftpjbRk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="400071953"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="400071953"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 03:59:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="653079032"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="653079032"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Mar 2023 03:59:52 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYQYJ-000286-29;
	Sat, 04 Mar 2023 11:59:51 +0000
Date: Sat, 4 Mar 2023 19:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 186/429]
 drivers/scsi/qla2xxx/qla_iocb.c:3820:5: warning: no previous prototype for
 function 'qla_get_iocbs_resource'
Message-ID: <202303041923.ceyKqbEI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   7306e5782e166a6d4168af6b32b5878186a69bd3
commit: 52e4ba844503aa7833b8949f5edcf6753f63df99 [186/429] scsi: qla2xxx: Fix exchange oversubscription for management commands
config: arm-randconfig-r032-20230302 (https://download.01.org/0day-ci/archive/20230304/202303041923.ceyKqbEI-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=52e4ba844503aa7833b8949f5edcf6753f63df99
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 52e4ba844503aa7833b8949f5edcf6753f63df99
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/scsi/qla2xxx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041923.ceyKqbEI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_iocb.c:3820:5: warning: no previous prototype for function 'qla_get_iocbs_resource' [-Wmissing-prototypes]
   int qla_get_iocbs_resource(struct srb *sp)
       ^
   drivers/scsi/qla2xxx/qla_iocb.c:3820:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int qla_get_iocbs_resource(struct srb *sp)
   ^
   static 
   1 warning generated.


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
