Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE816AD49
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678206555; x=1709742555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EiKCUqpN1ZA34pPgl8HYeQ6i8aXVV8aVYoX6OXqfWfM=;
  b=GB4Nup3X2m8+2r/W5+mmfNq2GUGaXpVcKXYJwwZqG/RyFs7zAQ5pHntt
   biJemai22bYq+HsBnet6672R4k1Az10e3EWxksPbxibyaBhtFqbEzsQuW
   LbdovRI07WxCsH0/sTv8V2Bur9hKwVvktn+si5wRQ693Q55Obtj69K509
   kvkJzXW6GoAhRLuAwESYkNS0Ef9kyIoAl9Wq+yII8hOoXiF0NOVzoQdzV
   hFboFV7O+mpCJxKNAOK8e940OFiSrFVymUTydSE0nR4grY21sXf6+6AO3
   Ubi1AUfKc9ADISgUchht31iRuaNqAGAhO7EfHGiQ6hgO9UhdFxNXKS6TS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="398476772"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="398476772"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 08:29:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="786754602"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="786754602"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2023 08:29:14 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZaBd-0001TX-1R;
	Tue, 07 Mar 2023 16:29:13 +0000
Date: Wed, 8 Mar 2023 00:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.2 357/821]
 drivers/scsi/qla2xxx/qla_iocb.c:3820:5: warning: no previous prototype for
 function 'qla_get_iocbs_resource'
Message-ID: <202303080018.EJz8CvWo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.2
head:   1083275d5e409ffcd8263efa7f9586ab4248abce
commit: d6bc9d7d4952b6bc72fb7ef1cb6b487251912bfd [357/821] scsi: qla2xxx: Fix exchange oversubscription for management commands
config: i386-randconfig-a012-20230306 (https://download.01.org/0day-ci/archive/20230308/202303080018.EJz8CvWo-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=d6bc9d7d4952b6bc72fb7ef1cb6b487251912bfd
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.2
        git checkout d6bc9d7d4952b6bc72fb7ef1cb6b487251912bfd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/scsi/qla2xxx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080018.EJz8CvWo-lkp@intel.com/

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
