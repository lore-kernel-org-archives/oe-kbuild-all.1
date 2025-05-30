Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44EF4685
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748601030; cv=none; b=d9JMXhWVh6bk0HLRCIY0yD3j7flkUu23iNRTZVpW1rqMsXUwHH9xOwodXv4+L8Ce+WAWM+MneMbarUoBYnuLAgRUYlPDtadawAzvJPUD7S25qE9taAvT+MadceCWjPNYJHzm6sYEpFUKyMXjNXe/Hrmvhr3PO0oJGik9eq+pUrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748601030; c=relaxed/simple;
	bh=dMefXpEq2hSmN/q58ZDrNnJzUprZEEssA61U/xQL5AU=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=uy0TMp6Upkau7WQLeMZaXVNeKs37e0NRojp2Uze6UwdZTE94ahBXwcidruewhaPnW9q09+JWb5JJDY1kmNH4l1JL5MNS+fda7fiz6NnmKIisfbh+UP7Nj8amYXSxi9FNNXdrQnF83LqZziVpNqVsuGu3cHrFo+YxZ67LKUdVNEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=lIrUdD9Z; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="lIrUdD9Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+0udCHNEw7OvM4IEZAwjqcxs57o5zlaQ9essh41ImZ4=;
  b=lIrUdD9ZkbZMpdbqvoarfjSkSMUGMzj8cFmxNjiOI0Vi5d+LpbowIWUl
   oO7MTOdtsyXgXZcRnSw4PT2uaddc/fxG8Jh3Ke7XA9yHVYzD1FMD4nL1r
   J4RFriihnuM3MSVDkir3n7LsqTD2lN5ICHw3eynmqWtcS4MvJXqa2bAnc
   o=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.16,195,1744063200"; 
   d="scan'208";a="224562783"
Received: from unknown (HELO hadrien.lan) ([172.59.114.46])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 12:30:17 +0200
Date: Fri, 30 May 2025 06:30:14 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: oe-kbuild-all@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
cc: lkp@intel.com
Subject: [android-common:android16-6.12-desktop 1/1]
 drivers/platform/chrome/cros_ec_sysfs.c:355:32-49: opportunity for
 str_yes_no(ap_driven_altmode) (fwd)
Message-ID: <5c18a9f2-a647-47-26cc-155b1392db@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Fri, 30 May 2025 11:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android16-6.12-desktop 1/1]
    drivers/platform/chrome/cros_ec_sysfs.c:355:32-49: opportunity for
    str_yes_no(ap_driven_altmode)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   e3e18291d3d62133d3ef23cb34a4eb0919a36a77
commit: dc2136f8c4ed409eb2d06722cc0a3f5a06746095 [1/1] UPSTREAM: platform/chrome: cros_ec_sysfs: Expose AP_MODE_ENTRY feature state
:::::: branch date: 17 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-r053-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301127.lmi3y7q1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505301127.lmi3y7q1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/platform/chrome/cros_ec_sysfs.c:355:32-49: opportunity for str_yes_no(ap_driven_altmode)

vim +355 drivers/platform/chrome/cros_ec_sysfs.c

1f15db8c29906d Andrei Kuchynski 2025-02-03  347
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  348  static ssize_t ap_mode_entry_show(struct device *dev,
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  349  			      struct device_attribute *attr, char *buf)
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  350  {
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  351  	struct cros_ec_dev *ec = to_cros_ec_dev(dev);
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  352  	const bool ap_driven_altmode = cros_ec_check_features(
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  353  		ec, EC_FEATURE_TYPEC_REQUIRE_AP_MODE_ENTRY);
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  354
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03 @355  	return sysfs_emit(buf, "%s\n", ap_driven_altmode ? "yes" : "no");
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  356  }
dc2136f8c4ed40 Andrei Kuchynski 2025-02-03  357

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
