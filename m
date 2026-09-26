Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A833A2E0A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 06:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790403699; cv=none; b=djyuwGcnarQ2uO0nT0bYabbTMDzg37FiebbBILgwc4Ggbj60fnJ+6HRrYdJbu/hR90KwfRe2GjFDXmdYjrDHB2SGWh/RkvJxE9JCE746TRorlU73j5CbWrRmb/gFXD7yBwEqNTtfh5xUQEll4LniP3z5NkkoOlMM96KQS+htNtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790403699; c=relaxed/simple;
	bh=shTec4Tb9lUZdfXMXDGHSp66qNoTP4jhTIv91Rkuf8o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qknlldGhKKLgFdTFn54k9pDcnScrCbN3ekdw88wOioSFDRvmkqFdlbbHn9A+lDlWNxyW1kHxlLNXFo4S3KQFMQpddyHpL26EQm61rc8e2QoqMLPEeEoI0wp7swhC89X9KEyKrIePQsUGBOVEB47kkPtuvkQ7gknaahI1FdJsTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnUoJxp1; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnUoJxp1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790403697; x=1821939697;
  h=date:from:to:cc:subject:message-id;
  bh=shTec4Tb9lUZdfXMXDGHSp66qNoTP4jhTIv91Rkuf8o=;
  b=jnUoJxp1E0kASuhIuuSzSfzladkX7b485k+ZBpG5ZuhvEjwdgCFBsaPI
   6bn3gFt7OdzOhjOJolNzhvmfKhSolDmCZRMTkh7rd1UQseOkv1/MM5XjA
   3fXK9Q0Q0+qQf9MXx3C8B/qK/N748U1nYITtFWKf6evf6MBWmpVqy+AKO
   EP/od5+4GpYuhsgu/qCfhAVtPPecUUDggdjwUsBq4TLum3lkFILNyTKwf
   fOGfmcf8+gMpo1E8t3qaES7INc6Si+Kczs8JZ1v+WK9rwMIFmRqVOhITA
   eJsE56PahdnSPuFRem49qmF3Km+VIKRmFFWojDV4n+xaJNj7Hh8Gr/9oi
   A==;
X-CSE-ConnectionGUID: Dchnwq8mRyWNUWPBakyOjQ==
X-CSE-MsgGUID: 9XGCxq+rTumiz6jL4mNTsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102549740"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="102549740"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 23:21:31 -0700
X-CSE-ConnectionGUID: vO8E0HkdRFerkIDgrqdgJQ==
X-CSE-MsgGUID: n5ZrDHJOQzCnLrqmzs5aFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="272306672"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2026 23:21:28 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xALmk-000000000Pb-3lEn;
	Sat, 26 Sep 2026 06:21:22 +0000
Date: Sat, 26 Sep 2026 08:20:41 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:randconfig-7.3-next 551/673] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202609260859.nRVfk0UP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 3cac53e41a6b335dbdc7b0d0340a2781ed551e06 [551/673] initial uapi check success with -Wpadded on arm32
reproduce: (https://download.01.org/0day-ci/archive/20260926/202609260859.nRVfk0UP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#5046: FILE: include/uapi/linux/mptcp.h:139:
+	__u16 :16;				 /* sizeof(mptcp_full_info) needs to be padded to
+						 * 64 bits, but the mptcp_info member on m68k is

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
