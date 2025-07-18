Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650AD29CB40
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Jul 2025 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752841755; cv=none; b=ZxaNn7t/FzcX/IEOZ9asHieq5EvWqQ/CfSvoxZaF88/WmXUcNav2/630s32TQ231jbOXwAcEVRwVOfEE2PdzRJx2ZcSP/5UmKNi0scMDWVr8HeMWt+VrBLGrGTtFnUqT2iFoQLveBqFuDZN/0d+hkG4yOWAuEiWBPQx3cs/MY1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752841755; c=relaxed/simple;
	bh=o6BrM6NBt03U3A7hWGQxsg2XlKWBkq2PSVhLExMTXaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RSUxVN1gYVlyIJDxsDbLJ0+VPYs9P3yOlrRsPCdsgPcv9NUsvhH8HkR/bUAnXzPv293V9ZDhL8BTizE0En17i9b6lynG3a0DCk49nGjD87zO7R2IgCVPVp32HgSSDEdmm2O1vQIQUmRUsQwoaZ8qImulLTO4OqT0llJKHTiA0hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1P6lrUx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1P6lrUx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752841753; x=1784377753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o6BrM6NBt03U3A7hWGQxsg2XlKWBkq2PSVhLExMTXaA=;
  b=e1P6lrUxFPcfNQyOVis06+cmCflih7B1DeXe29nd1ibV4UvaIRJ47nmI
   sE1dV3WC9xCVFopHIvBrXta8/WMROABTpNSymX2JtJ3+Nl7DC5tktUn41
   xM4CTakwv0iRWtdsX3P6W1VvUNFlhaWm7r0IoHbzVJk9UcH0BQe1P3MAf
   yLGoKzBXIDMC6COAlUupA9rhPe8ei1w7BZe16+By2UplQLErVnLtbZhu4
   dDR61xPUsu3iSOhTDuDPr5EaVrWZP/GrlMlXJg+iBMA8gUPgOn+vdSVzQ
   feyVP45mmcsZsE1Te7Xtave/LhN1f10reUc0SpNZJsqiBhuwqXQuLceAL
   g==;
X-CSE-ConnectionGUID: TvG+2fvwS2qDugf1XumXvA==
X-CSE-MsgGUID: hPN0lxMvRz+PLt+gPJiXHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54347757"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="54347757"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 05:29:13 -0700
X-CSE-ConnectionGUID: RdJr1u5mRV2Ny6wJeai0qw==
X-CSE-MsgGUID: tWl4jjKJQAuuINwiFbFINA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; 
   d="scan'208";a="158526912"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 18 Jul 2025 05:29:12 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uckD7-0000u1-04;
	Fri, 18 Jul 2025 12:29:09 +0000
Date: Fri, 18 Jul 2025 14:29:05 +0200
From: kernel test robot <lkp@intel.com>
To: "Ewan D. Milne" <emilne@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Hannes Reinecke <hare@suse.de>
Subject: [linux-next:master 9252/10823] Warning:
 drivers/scsi/scsi_transport_fc.c:2818 function parameter 'rport' not
 described in 'fc_queue_devloss_work'
Message-ID: <202507181446.aAoFiDm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 25236d4844ad8631a3ff12f1b33aaa27ac74172d [9252/10823] scsi: scsi_transport_fc: Change to use per-rport devloss_work_q
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250718/202507181446.aAoFiDm5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507181446.aAoFiDm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507181446.aAoFiDm5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/scsi/scsi_transport_fc.c:2818 function parameter 'rport' not described in 'fc_queue_devloss_work'
>> Warning: drivers/scsi/scsi_transport_fc.c:2837 function parameter 'rport' not described in 'fc_flush_devloss'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
