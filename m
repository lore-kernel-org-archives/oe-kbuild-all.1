Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6E1192598
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732985108; cv=none; b=SjlZci7oZ/KAXH05/fJklzKVilguyZJpB7lEZefD4tVGdbSnd3Dbt+noibP+VmULvtv6LKJQolzufplgOaJusTA7zTvki/SCsHOSaI+j5QVCfDXUuJX4jCZtXLdcnE8wGEblUEinIVXILnpvTz/qEJH+ZP9eMHUqICGCLbyTeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732985108; c=relaxed/simple;
	bh=jksZm/E5ivYQT9RYlU9nW61+t7TQIIwJ+ak8HMv4ofg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VNdOczlK/ka4Oyo7aq+KUj7G7HvRu2D719EXEAKK17xLV67mzLQXuG0kowx8xKlvHolK/RnUKB3RODklp8WRqIvxI9EEl7qMypI3KmFBgCvt+TG0Wr0+RY+ZNM+60iPwUQCFwnjVjTasQe4xeNhYauZthLh7UEtn14rRPJBjUtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyaSiajK; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyaSiajK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732985106; x=1764521106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jksZm/E5ivYQT9RYlU9nW61+t7TQIIwJ+ak8HMv4ofg=;
  b=iyaSiajK8ifUqa+NtDFVkLofhMN2KSXwUliDdpxmnTWwP8b3fErTivKt
   AZwv0cYZqohsEYMVg+xlj3ytJRZXUKVi3sBrzbR9noNuiSfB1SjeMAh36
   I2P+BdSIcMwQ9tjgkTC3ny0SJp4DSdi/aoD7ODVk9QMWYe8zpFOrtqJnQ
   Dtb+zqncqoVWMihU9O2c9jNVWDQenAAT60fa1iVc63sYtqhoztVQ+ovZz
   PK60v6pU+//eooA+gcujFp45Zlv8BgLs96hURksoorynCWe9Tt4/rm9Eh
   x2eelnaSxb7kUdflDNEUaoWWtNWAbfrRPM0HQmoXK7QD2aqVERJybidqX
   g==;
X-CSE-ConnectionGUID: xKmxyuuBSty0TiAovaVD9A==
X-CSE-MsgGUID: CUlr3m6nRsW3AtGN7Xsbqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="43802039"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="43802039"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 08:45:04 -0800
X-CSE-ConnectionGUID: v9NZg/A4Q9G4vzMWOLkbiQ==
X-CSE-MsgGUID: To520NGWQLeKDozu1Cz3Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92879305"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Nov 2024 08:45:03 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHQaF-0000p8-28;
	Sat, 30 Nov 2024 16:44:46 +0000
Date: Sun, 1 Dec 2024 00:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v2 28/31] net/compat.o: warning: objtool:
 __do_compat_sys_socketcall+0x353: can't find switch jump table
Message-ID: <202412010055.fhUV3Lv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v2
head:   1295be6d1a5cb6a30132ee8b01c79018794d0c3e
commit: c5a8bf8bcd7fe8f90221ba108c20650617c16fa2 [28/31] x86: Use PIE codegen for the core kernel
config: x86_64-randconfig-071-20241004 (https://download.01.org/0day-ci/archive/20241201/202412010055.fhUV3Lv2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412010055.fhUV3Lv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412010055.fhUV3Lv2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/compat.o: warning: objtool: __do_compat_sys_socketcall+0x353: can't find switch jump table
--
>> kernel/auditfilter.o: warning: objtool: audit_compare_rule+0x27a: can't find switch jump table
--
>> security/apparmor/apparmorfs.o: warning: objtool: jhash+0x13d: can't find switch jump table
--
>> security/apparmor/policy_unpack.o: warning: objtool: jhash+0x1c6: can't find switch jump table
--
>> security/tomoyo/util.o: warning: objtool: tomoyo_file_matches_pattern2+0x158: can't find switch jump table
--
>> security/tomoyo/gc.o: warning: objtool: tomoyo_del_acl+0xcf: can't find switch jump table
--
>> net/wireless/wext-compat.o: warning: objtool: cfg80211_wext_giwmode+0x8b: can't find switch jump table
--
>> sound/soc/intel/atom/sst-mfld-platform-compress.o: warning: objtool: sst_platform_compr_trigger+0x75: can't find switch jump table
--
>> net/ipv4/ipmr.o: warning: objtool: jhash+0x1c6: can't find switch jump table
--
>> net/ipv4/ipmr_base.o: warning: objtool: jhash+0x1c6: can't find switch jump table
--
>> sound/hda/hdac_device.o: warning: objtool: snd_hdac_stream_format+0x128: can't find switch jump table
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
