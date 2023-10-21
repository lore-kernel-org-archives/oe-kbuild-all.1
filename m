Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D80101C8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 17:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HguRBAhi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697908218; x=1729444218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/ojcCpUVYlTp0/G6NxeudwuC8V8KPVAu0cnn2vkYdc=;
  b=HguRBAhi3eQx2QPC4eYU7btKbeKTCtFvThuHtSSfQM//yd2yD7VXtZCb
   QOqN4ZxvwVLJz9Y31ahuBkOsTL2L1Tj3xVfgWQgYHqZPgmNwNlA8rXOOI
   bz6kwNc4dUbm8H02qCP6WwLJa3Zg0vCM7U9JMDUSP1V4zBBTcAO+27MKR
   8UWKT2PqWmzSSzgKdct2IBs/yKX5DjGT9LBOHSQU36lX0Ae+5dg1hkBMI
   whdE/yX3XuzZ2yFwR5VsDXQDPB9tc+JHYE/6Vcm5tlk7K8acbSU+8JpR0
   2TlcrkRZUva1+ERJF5WeJ2+aRFESoCFBXrx00ttxnBekc/OAEGePs+w3v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="386459468"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="386459468"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 10:10:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="931293465"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="931293465"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Oct 2023 10:10:16 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quFUM-00053i-0c;
	Sat, 21 Oct 2023 17:10:14 +0000
Date: Sun, 22 Oct 2023 01:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:sound/speaker-safety 140/209] checkpatch: ERROR: "foo *
 bar" should be "foo *bar"
Message-ID: <202310220117.pJpW9SXI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux sound/speaker-safety
head:   37f4315008c663a55629554adcfcae4e5d88fdc7
commit: 92c36338bc118a7ad941b0234a1dcca538a642b7 [140/209] ALSA: control: Add kcontrol callbacks for lock/unlock
reproduce: (https://download.01.org/0day-ci/archive/20231022/202310220117.pJpW9SXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220117.pJpW9SXI-lkp@intel.com/

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
