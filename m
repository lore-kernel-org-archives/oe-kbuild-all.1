Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A13E10E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 00:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730333566; cv=none; b=r1z9+Sq9VNPRfzUOGp6hUAzBOUVH6WGLgLjLgdwTjj5URMncpUf0h8FBhv8PoC62WTcUSvmWfylGA33djPhDbxXs9bSb0rQ7P2Eg/NFW81YO0hVox25JHjKEMsl0Vj0pNklsXew5499ZChtMAh1suE+74zAsrbKMOcj38WLHqyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730333566; c=relaxed/simple;
	bh=JcE4tqVRCeWaLGsoUMgb6FwkVGGDU4/rXKLTmzFObu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cc6mkDYEHzke2toOw8d8WCI3meuL7V+kB/Qfte7ch4kOd95rJ31rpOnq1xjAQig4QwxVLdfteErQqlVaBswPQc4qyfWyIx3SjZf4wZ4h5TzeGWH0NCSBRchpH9rczt4iGXJJpqNnuxijnYS5DT1y0LPM4lprdnFDgc9si/YSKbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnmpcGcn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnmpcGcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730333564; x=1761869564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JcE4tqVRCeWaLGsoUMgb6FwkVGGDU4/rXKLTmzFObu8=;
  b=CnmpcGcng5HOMQFoReKl3Pp1PcnOH6qPvfYG827g+GLBIhFo7QQs00w3
   yuqOwo0jXyrJLV35VuYshORv0QwQl7o9Q6wL9iTWfOTZwahcJRacarIF/
   qd1ra76jDfNngi7R4/oRX077bmNQ6XwFSeJ+x5XKDgwoBM23xjrhMm+kp
   ugoIOU5Lk/S1MwiyS1dDujr2/HuOIBvZB2tE4XHTI1T3guvLRO1IyyYaU
   OJrlXP6851gszBBi+1heX5RFrhsIRVX7llC8i5bUCQiw1xNKfGBqUyfez
   IVsIRMI/m0hQ/sybOzgowi4jP5/1xRyoYCi0ffKR6ondCy//lyKrpbvXe
   w==;
X-CSE-ConnectionGUID: JsdmCm+/Q2KE8PUdZEDQWQ==
X-CSE-MsgGUID: bp7ggY+kSmaDA3aek20gwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="17705827"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="17705827"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 17:12:44 -0700
X-CSE-ConnectionGUID: fvx24+o2RjOFMqpd+3uz6g==
X-CSE-MsgGUID: BQA1ZlAQQtWUSOJE7hekEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="82389002"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Oct 2024 17:12:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6Ino-000fS0-07;
	Thu, 31 Oct 2024 00:12:40 +0000
Date: Thu, 31 Oct 2024 08:12:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 9/11] vmlinux.o: warning: objtool:
 relocate_restore_code+0xb7: relocation to !ENDBR: report_bug+0x188
Message-ID: <202410310830.mQsvvKbz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   19b68814b1cd60c40546f31f7cc5b7895c0b013b
commit: 1bec2dd52eabfd5c2908353ab7f3c2f324131da9 [9/11] FROMGIT: maple_tree: update check_forking() and bench_forking()
config: x86_64-randconfig-075-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310830.mQsvvKbz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310830.mQsvvKbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310830.mQsvvKbz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0x11: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: srso_untrain_ret+0xd: call without frame pointer save/setup
   vmlinux.o: warning: objtool: ibt_selftest+0x1e: return with modified stack frame
>> vmlinux.o: warning: objtool: relocate_restore_code+0xb7: relocation to !ENDBR: report_bug+0x188

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
