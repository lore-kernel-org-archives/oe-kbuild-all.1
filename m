Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A811C1422D8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714988183; cv=none; b=Wz4NOu3EEIUeEFpZbEvDlyHMaMEiMlpOaxyWOI5DRhJo7OH269BOafFjCEFyNLY8au4plflBA3REdm3/YoxYO8ZmVTeg5rBo2Xt4gwMfx8RQQHq9QnIKKLtqi1XRsJhbd/MdmzhNeVOZ2j/6poREopomwN5SxwfTVunO7uKevFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714988183; c=relaxed/simple;
	bh=oVFkNrmoeakw3JyNmdn/JY6/heoy692YuqFDvCI3O4k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdBCr3+XxmNvgV+HDtq0f4/Y9q6iqtIRW/57vYgyiGxnmT+7ezc9N/Hl7+k7WGhcaXxobaY7QSebrg6V4rB2qEtYntobplK5fkrvjbQnglVY5mxuLJ2kaO/WaQFgNf1m3qMrMzdjYCpoKBYAlRP1m7RZN03wT2PBLCQaQG564Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLGC3fUP; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLGC3fUP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714988182; x=1746524182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oVFkNrmoeakw3JyNmdn/JY6/heoy692YuqFDvCI3O4k=;
  b=dLGC3fUP/VTnX5YHpN04I6oasgftarZ+QydZrXmQttoAjWRbFmQyQ0xq
   TEFWFoTcMYBkpHZO7OwxfaI+/OdMceVQ6va41MFU3grkBjq7AFzcFozFd
   J9FZHtpkde4uKI2N2m0r2UfJRVVRKs7Y/xN8SmbmbkuTGdCPv0ZAR4bGN
   KxA+w9HOgCdj35B1hYagtmiImonQ3BaIfAYRQpt7n2bG4s/WirVQ0xGLP
   i+WwXV02+/wz1YkOca5tp57kV6odT/2PDVwmrc1dyKGw5NHm1BBLLoRaK
   xxiAQN1S3TJSK2zCDhkpuGE8BIBKoWLeKhmBy6Dl1nKt8H8BcV+nRX8DC
   w==;
X-CSE-ConnectionGUID: 7Vfrk2uYR+maNwxCSicgKQ==
X-CSE-MsgGUID: Hq/5p5JLS7CyCE2n2xCt+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="22135928"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="22135928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 02:36:20 -0700
X-CSE-ConnectionGUID: 4qeZH3feTKC/MQ3HLjzhaA==
X-CSE-MsgGUID: L2oxAA7KSpus2mT7j96gJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="32782153"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2024 02:36:18 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3ulb-0000ap-2H;
	Mon, 06 May 2024 09:36:15 +0000
Date: Mon, 6 May 2024 17:35:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 57/147] fs/bcachefs/btree_update.o:
 warning: objtool: bch2_trans_update_get_key_cache() falls through to next
 function need_whiteout_for_snapshot()
Message-ID: <202405061752.cNtcRKHa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   38fd9111b3443597b45a3483bdb6b99a943ac4ae
commit: ea00a54a25fe18869c748f0ffdb32353ee30bae0 [57/147] bcachefs: bch2_trans_verify_not_unlocked()
config: x86_64-randconfig-012-20240506 (https://download.01.org/0day-ci/archive/20240506/202405061752.cNtcRKHa-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405061752.cNtcRKHa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405061752.cNtcRKHa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/btree_update.o: warning: objtool: bch2_trans_update_get_key_cache() falls through to next function need_whiteout_for_snapshot()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
