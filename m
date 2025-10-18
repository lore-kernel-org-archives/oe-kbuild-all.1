Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3591BC4E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Oct 2025 14:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760796048; cv=none; b=eFqmG5mw0K+zNMsnQD/BZq7eo4jzjfNJh9fKiaaW+CnAOvFihZElXEqWWlIcSJBExXc/Dg6f3Ww2LutLEV/zdMnWT64GkDoZt/15l+iFFRzfjIa5m6+6m2z8HD4bD2Ew1Yx1/5L6a1oxnEIo+sFjStvQIfwX1ASstdJ+9rIJSeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760796048; c=relaxed/simple;
	bh=oSoDXMKaiJh6U3sOZycWlWVd/9P9LEi+k5oMSj9QlOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S1DDd2UIJTamkGrMULXZNqE+XQ4rejsD9hZS6//StYJOvKoJiM1mPQrZvse1hvWkCU5cNIAuPubb/vCsG3RqiVrNnk9sKdpGsK+RcBRRT8tu2HwpPMhTi3wpfUrvrm7P8g5Lx/SkUk/Aquv6o2g6gUQ+bkanYvWEjhD/bhJ16h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb5TE7iq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb5TE7iq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760796047; x=1792332047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oSoDXMKaiJh6U3sOZycWlWVd/9P9LEi+k5oMSj9QlOo=;
  b=Lb5TE7iqqWX2x9vjX4qtWXMUvlpHuVkiniwRdmAm40tgBmhsIhzxANs/
   NmzY2iJpsSXa3Uko4tlH3yzVB6kCb83Bb3VHWKcVw5KM9KsJtr8DBVDpu
   /9U/FG1D3pde4jIKlQFN5fOEFvGPMYzBneEPCFV110f5hAHykmfuzFtvw
   CFH9fCZaTjVhvUMOlYR+SYOir20SAL9oK8Ssk2CKuF0PgFCwjkd2jG6JQ
   d4QNGs+YZD+4CRzcHqCmVG2d0kyUFNYboYCRdMI2jw/vKj6EqQcZ2bY4l
   1fR7qJNDoqDdHKCncsu+iZt0XFQCYVOW/22BGiCmX8aPqZY5FlEF2DAJy
   Q==;
X-CSE-ConnectionGUID: LO/4E4CgT+m5yP8bnJQt4Q==
X-CSE-MsgGUID: haH3VNVMQkWUzfOfqbFy2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73664817"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="73664817"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 07:00:46 -0700
X-CSE-ConnectionGUID: mG9hOqC2T9marqWuepY6wA==
X-CSE-MsgGUID: C7SCJWCXSFKW9NlWkhuiGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="182091250"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2025 07:00:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vA7U6-0008Jd-0v;
	Sat, 18 Oct 2025 14:00:40 +0000
Date: Sat, 18 Oct 2025 22:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 3/10] ERROR: modpost:
 "netdev_copy_name" [net/ipv6/ipv6.ko] undefined!
Message-ID: <202510182127.hL23lcmz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   bcb68caaf6c3bd35c33cabdc42764c5d0d5fb7d0
commit: ece314cf9fe4375f3bd05b6b47cc8e771da18322 [3/10] ipv6: icmp: Add RFC 5837 support
config: x86_64-buildonly-randconfig-004-20251018 (https://download.01.org/0day-ci/archive/20251018/202510182127.hL23lcmz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510182127.hL23lcmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510182127.hL23lcmz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
>> ERROR: modpost: "netdev_copy_name" [net/ipv6/ipv6.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
