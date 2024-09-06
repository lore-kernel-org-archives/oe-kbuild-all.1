Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950B158866
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615182; cv=none; b=i7u7vo/fOdMoATYy3YHcQdncVIr/BmnnZXfK8G+qcqevnXbqPOE6tp0sGG23dMRl02UK/Vko61+ydA/XzqH2F+FyN8SFxpIpcYXydreImfPC3qAvtp1f26D74hQmNN/glqYXaA4a+lR+7sfGWFECrGo+3/RWulbdWrHB75U0FFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615182; c=relaxed/simple;
	bh=cDKH4qsh2Z2XOeD9RtZxcSB7tALhAZddtjthkFeNhO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sWJFbp2wAsdxAdLZv3D1eYOFUCvxSuOp+8/Bj6NSTR57fMZPgg6KeAAaLiJ88GqD63zNJtPAT52EY00KZWjhScJ7DFL62UGmFBJF8Jj/bxoRFTZyTDP73L/1MBeRTXLOHkETCPuAzV1vSp8qiCApqQ73pV74MRjLP2hGt3QntvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWpMO56q; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWpMO56q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725615181; x=1757151181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDKH4qsh2Z2XOeD9RtZxcSB7tALhAZddtjthkFeNhO0=;
  b=MWpMO56qxWacy3BPAUQHqNjR9lR+A1HvubiaOR3GjXPVbIEUBUnWNaUU
   c8HshyEwB0Zj41YK1Z5GUJFaujgSEoPr6w1WTQV4kyMgHHgno1M5gpe7J
   eJBtB8dYhQKRrCgV1Gk0l+Gc7Z1cqJYromvbViupdk4kvQnkVpg/7OXEp
   rNlT0TXUKRycHlesZjzxpnF3799YgNp89R/Gjdr5WvV/M4oERIYi0xK78
   SOgi+z3mzQaVogjN50/D14sS7vTNIkqUlCbdfgcqe4FNWV8C9T7CtsiyA
   f90iWLfFhDEVPIZcHEgdN5p8NPKuTsuGSQLDen4yLhO1Eo4Lgk7tts6By
   g==;
X-CSE-ConnectionGUID: O/qziihoQj6vJVOAUOV9Ig==
X-CSE-MsgGUID: 1wjEkaWnQeWCuF+S/GfdQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="49782102"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="49782102"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 02:32:59 -0700
X-CSE-ConnectionGUID: yigBH3LIRPu9CdxWsw5tBA==
X-CSE-MsgGUID: 2BJSsQ1kTeGfPsN1O0vcZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70052930"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Sep 2024 02:32:57 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smVKp-000AvZ-2I;
	Fri, 06 Sep 2024 09:32:55 +0000
Date: Fri, 6 Sep 2024 17:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 21/53] kismet: WARNING: unmet
 direct dependencies detected for ESP32_IPC when selected by MTD_ESP32
Message-ID: <202409061717.WW8tMpvA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: d99ee73f47ff45ddc38967389cccb186f1265eb8 [21/53] drivers/mtd: add esp32 MTD support
config: alpha-kismet-CONFIG_ESP32_IPC-CONFIG_MTD_ESP32-0-0 (https://download.01.org/0day-ci/archive/20240906/202409061717.WW8tMpvA-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240906/202409061717.WW8tMpvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061717.WW8tMpvA-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ESP32_IPC when selected by MTD_ESP32
   WARNING: unmet direct dependencies detected for ESP32_IPC
     Depends on [n]: OF [=n] && HAS_IOMEM [=y]
     Selected by [y]:
     - MTD_ESP32 [=y] && MTD [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
