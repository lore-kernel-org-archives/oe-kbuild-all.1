Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482B02857CC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 03:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783913320; cv=none; b=RmRnqwWj3ld3bGGr89aP8SNjZ1F9hZPSEA0DjkPbhBEpN/FqMxHmaHSmj/0NL7gSbo0WAxtQD+gbguHuDQpoILlI4xkOb/eJqscdI9I+YRYnIAI1IJ3xC3fHCpRxjqHFBTwGqTXve6uSy6Y/RGnYwViO//DamNDPbq+dRjh8k0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783913320; c=relaxed/simple;
	bh=ghunBH07OTxRyANpJXVRycISvQOcnpoxeogRKt4ft+E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m0aRJFDCQZZJErvYCvzUJnQygsEPPtKdAjLEqT5KXUkgaFYD0Fza2j80LftIX97S+pjSEoi+yAMHpvGdlVSPnnQtvDDg0+snQhCVwB8ospVjROd+CvKTss6tZOkm82/jl8BN4OdJe7Qc71XFZ+4O6/z0le4YTPmlpqZrjcoKkuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cirXWcae; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cirXWcae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783913319; x=1815449319;
  h=date:from:to:cc:subject:message-id;
  bh=ghunBH07OTxRyANpJXVRycISvQOcnpoxeogRKt4ft+E=;
  b=cirXWcaeswM7/6RCKspQ44GWyQnaVxSe0eXAzExY96dopOZtCp78eK8c
   ArJiqr00+jWnh23nOnW2R6gsJ3IcWJ0tH1V5XR/lQslOwBDrlL5OuXs4r
   VTdClL5M23LAuRMcThVbTUYID1g+nfDkzZf4GqGGZ7WugJ9O3OeXcZQmX
   /JRijjWFpxE39oCAOmMjvXQTnQPlsstTVmHVqvQgPw382aClFuD8ES19N
   vnEmWAgNrUGMuajSFyZJNuWw+6Q6+Nok5lGyywk1JyPsn8hOl6karQ6Zv
   ovX/2cEDbZxbWjaV8RBCb985Uh6yhQDloR/T2Ho0xW+ii08F1QX/N7F22
   Q==;
X-CSE-ConnectionGUID: ZV7iGiY1RSi8NsaQzCEFGg==
X-CSE-MsgGUID: SJNtKS+RTBWNBRCClDwPjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83635422"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83635422"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 20:28:38 -0700
X-CSE-ConnectionGUID: Fqizz6fJRh6GBEkFZS/RnQ==
X-CSE-MsgGUID: gTFzGWprTzqyU6i7HhJQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="257375274"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jul 2026 20:28:37 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj7LP-00000000LL6-0Cqx;
	Mon, 13 Jul 2026 03:28:35 +0000
Date: Mon, 13 Jul 2026 11:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:ksmbd-for-next-next 80/83] Warning:
 fs/smb/server/oplock.c:1003 function parameter 'sync' not described in
 'smb2_lease_break_noti'
Message-ID: <202607131107.Xpl0DCti-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   240ab60c50a96f0b7ce00d4a299d5e1784bb5888
commit: bcd7ba0f3cba3f6d66b9fa38ecd30142bcab1b03 [80/83] ksmbd: synchronize lease breaks before renaming files
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260713/202607131107.Xpl0DCti-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131107.Xpl0DCti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131107.Xpl0DCti-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/smb/server/oplock.c:1003 function parameter 'sync' not described in 'smb2_lease_break_noti'
>> Warning: fs/smb/server/oplock.c:1003 Excess function parameter 'wait_ack' description in 'smb2_lease_break_noti'
>> Warning: fs/smb/server/oplock.c:1676 function parameter 'sync_lease_break' not described in '__smb_break_all_levII_oplock'
>> Warning: fs/smb/server/oplock.c:1003 function parameter 'sync' not described in 'smb2_lease_break_noti'
>> Warning: fs/smb/server/oplock.c:1003 Excess function parameter 'wait_ack' description in 'smb2_lease_break_noti'
>> Warning: fs/smb/server/oplock.c:1676 function parameter 'sync_lease_break' not described in '__smb_break_all_levII_oplock'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
