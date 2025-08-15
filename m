Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6989C291C2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 03:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755227075; cv=none; b=OBf/Ms7/mhsUz7U5jwgsgSoX8TsrJMrxBT4SqNtRYtw3wpW+TURUfj5xOge2RTEhL135MLgLxyR0889rHmhfXFrmO3BZU+p3N/fhfofvrn8ZCM20O3t2gx3yocVLEQGnOF+WG+fEFZGsY2UFKN/y1zCDgFoqFCiHf8aJ4wtAi4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755227075; c=relaxed/simple;
	bh=Uo/sgQHZcIW/2HRqHOf7v3ObJnYWudaiKSVOTvJTTGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bc/bmrKorwjAI8OzcUgI+Tj3suo0MFniq5LOF1NiIDuKoc6PBQL0OGLttfNXFhIw5SxagReteySjOL/tnYDmDkE1zshLB/3cmBrtmovKEZ4ZrkOWTRh9HyUv04697S+08odMOwi7OcmrWPKx3v/gNhqiApHEY2XupQWfKKSgV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvzL3A39; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvzL3A39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755227073; x=1786763073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uo/sgQHZcIW/2HRqHOf7v3ObJnYWudaiKSVOTvJTTGc=;
  b=CvzL3A39qnCrD9V45StG/5OA81BGxLMNRvLYKgFZMnHZwSJETH7s1Scd
   1R6bTBo2LZ02Dwn8JZn7siiAdR9TuiVFKrhEmvmIBHuhQC4Di/QnufeXg
   GOaa3DwfYFkHmGZWaKStczTIon9fwJerTbDIQCKyOlP+fScDc1D5sj+73
   6Wwggnlqs/Z0QTEnkcwoaSp0KlpEnNwxbXz564MP1hTuMOMJc7LImsae7
   XHSwZYe1PDP/0pN7/iSU7mMb+kElRkNmZb+FSGhaiyUsyvx39zLZncyNa
   aVTwIr1vnDF1zRQdNwuZF5KE8s/p9Wl+xSsYeq+lnUdU49ZZK9QWnuaek
   Q==;
X-CSE-ConnectionGUID: lGsOwl8OT7eIORWhhRQbqg==
X-CSE-MsgGUID: w8Z8fObrRxWXhEoSz35jdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61185177"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61185177"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 20:04:30 -0700
X-CSE-ConnectionGUID: HVt7kVhuRQS3yMiIuvZFqg==
X-CSE-MsgGUID: UIO7qwzUR8KqZWbd6oy7eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="172250628"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 14 Aug 2025 20:04:29 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umkjy-0000PD-2C;
	Fri, 15 Aug 2025 03:04:26 +0000
Date: Fri, 15 Aug 2025 05:04:26 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/1]
 drivers/scsi/qla2xxx/qla_iocb.c:3820:5: warning: no previous prototype for
 'qla_get_iocbs_resource'
Message-ID: <202508150508.YjmTRMVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   7801f8b27aa77497b7759fbac0387747b42485ad
commit: d58b45bbbea8f9516b66e0b494701c369adb0ae8 [0/1] scsi: qla2xxx: Fix exchange oversubscription for management commands
config: i386-buildonly-randconfig-2004-20250815 (https://download.01.org/0day-ci/archive/20250815/202508150508.YjmTRMVn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150508.YjmTRMVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150508.YjmTRMVn-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
