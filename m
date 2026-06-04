Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF923B9949
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590891; cv=none; b=FKeDyWVVvGGG6Q28o/2aTz9RgoVUTk+0oAxPDfQbGnCYDwwly97F1/jq7BHTnRv8Y+oguxokWtfMy+7qKCntNYHOjKUnP9m6LYtTIODGhDKDvGqv1OsC+FTQTvcdARfWPrSGVY9AIkSioQJo86zPk3OMiff0z1QPsXzecKybXL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590891; c=relaxed/simple;
	bh=iZjYydhC/a1KFl4RhYSbRst4xzQPki8O3LbTDe/UyM4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sxs2GvrTkFszwyGSgxE5l5jLkHMMrCSG6pBih2ZgEgZ7/sIHpC9jV3RVDgSxLrZX0X2Enj7627J3WtE+HR3onTXxze9CpC6grTG70CTjzU3b1WysZRd4ZlxODNi8gZK5h5MNOehkGDXTqKWWLL0kInsZQzQaZIXRWR2t74205QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KOAG/C4C; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KOAG/C4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780590890; x=1812126890;
  h=date:from:to:cc:subject:message-id;
  bh=iZjYydhC/a1KFl4RhYSbRst4xzQPki8O3LbTDe/UyM4=;
  b=KOAG/C4CdR8yRWvdn8A5GSiyjHIZ8rgJotR0RZmPbotldwyyW1l/YPbc
   2Q32M+dphAbgttMNjjCE4gL6+brTE+EdT0dGUucVvvG/IvrJp4qBsAKev
   SEMgfZOfyT6XKt1EX/8koLSTLxVU2K+2PvJkQ4Tg0dffyVYuGGOoSjW9i
   xzz8qYEBE7sr4I/NQbKNJ3iWF1KWQyz0p1kQfnVHkCeFCxxiXzV6b+PA1
   b8egTjoHfFpS3m9nC9pL4eVEyNT/VY0iE/5mSFNFVHQz46EAGYsdv7LQr
   l6SIh1tnyVW4qEqX3ExSOoF33pBzbudRJwEYq7o24TmB0Ip/s/J/zUgQw
   g==;
X-CSE-ConnectionGUID: 0Zylj1KuTX+Ky8idtRBVQg==
X-CSE-MsgGUID: vrLl1vY+Tzu0KCTiCPtoQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="83998655"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="83998655"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 09:34:50 -0700
X-CSE-ConnectionGUID: 3UmBcaV6Rx2v+cujvaTn3A==
X-CSE-MsgGUID: 8CDk49WARVSJ1xKkzNAXuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="246425179"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jun 2026 09:34:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVB1q-00000000Exi-1n4T;
	Thu, 04 Jun 2026 16:34:46 +0000
Date: Fri, 05 Jun 2026 00:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 164/164]
 utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the
 .gitignore files
Message-ID: <202606050044.vgOmq4L9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   ebfa00052eb2eb7ab8e1e7afe14dfe29a9ca2c4f
commit: e1aa273de4f39265881e17581e904480e4dda89a [164/164] firmware: add aeonsemi firmware
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260605/202606050044.vgOmq4L9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050044.vgOmq4L9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050044.vgOmq4L9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw.bin: warning: ignored by one of the .gitignore files
>> utils/firmware/aeonsemi/as21x1x_fw_1.8.5.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.1.bin: warning: ignored by one of the .gitignore files
   utils/firmware/aeonsemi/as21x1x_fw_1.9.2.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.DSP.bin: warning: ignored by one of the .gitignore files
   utils/firmware/airoha/EthMD32.dm.bin: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
