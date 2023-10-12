Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E4F37147
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBQpoPeM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697135808; x=1728671808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M72ZQwr32ML13u7m1wWvH21JVi8O7NNUBGbzIGFdJ7I=;
  b=QBQpoPeM6NSLt2N4TEfPDEo72vkp/91dTOAVae35byffwAiPjGsqnwHx
   OUA6P2thfeyGCmxn22o3uOnMlJ+7BjR9T7GEBT9TOUJVeRQbQKizS86/r
   RksTmdIp/HzwnLsmMP/vbreHkDGn3+gfDKgI7oYRXyS0e9MmTQJs+1Nw7
   TTuIb4lBFrWa81mF8jKnXt50lstsL57PO4X4YnCPs6BweCo0vYn9MKnr4
   HTAEYihIO4mCjcSV0kV6RMS1LJriHZbqdAwN4aS5+LWtMaDkZxX0yQ5/P
   Q4jMUTDhaFgwxUUymURbXet6N9+zITb13Go6GGB6rqpE7n1+eO4fB7GGr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="388877277"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="388877277"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 11:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1085789485"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="1085789485"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2023 11:36:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr0Y1-0003k3-0p;
	Thu, 12 Oct 2023 18:36:41 +0000
Date: Fri, 13 Oct 2023 02:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 140/196] checkpatch: ERROR: "foo *
 bar" should be "foo *bar"
Message-ID: <202310130205.TzKMW5yT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   899711ed1c90b438d31e322d1b0638b328435963
commit: 43d5aaf68fea400cba727cc9ea29a6f06c82d7dd [140/196] ALSA: control: Add kcontrol callbacks for lock/unlock
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130205.TzKMW5yT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130205.TzKMW5yT-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#36: FILE: include/sound/control.h:21:
+typedef int (snd_kcontrol_lock_t) (struct snd_kcontrol * kcontrol, struct snd_ctl_file *owner);

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#37: FILE: include/sound/control.h:22:
+typedef void (snd_kcontrol_unlock_t) (struct snd_kcontrol * kcontrol);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
