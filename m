Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406BF1C69D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785568240; cv=none; b=LEaPmsxvKLQQRv10YKLcDibu495X85oejAJQDQW8hYlMDALtLiEbqDcsJftBqcmlvwtMHuvSdTLm7OyhyGUGlL68do3E3ceifr/VQ1Nrf4PaqMZ7QDKuWjn9ak3PIlvJbXWiHbA1zw7QzJMuQiscBR+4wQudlNBTNHcCP8K882s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785568240; c=relaxed/simple;
	bh=E+YJNCYiFzFLo3FhqfHjhJ1HWwlaaqOHq1OsrFc/m+k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uZFY3fMCfzuiSWAXUcyA/Ne9PdqV83thV2jhk3wTgGA3gDVAUmNULAw62mZMZMd2FUwhkuyPLFQGSXpfgoIuDWsVKWabnguSgK3Rv9m+bgzGPUnIVfmEKMAuE6B0BpTwuvgw+VR5x/+y4ShE0bAScyOsyNF200VSTZpSExfJJXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENa4ibqO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENa4ibqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785568238; x=1817104238;
  h=date:from:to:cc:subject:message-id;
  bh=E+YJNCYiFzFLo3FhqfHjhJ1HWwlaaqOHq1OsrFc/m+k=;
  b=ENa4ibqOp0iTZElU9vtov1FVB9dKr3RqL8ig6BnO2MLHJ7PnZ47kJRYz
   tYMtDvD+7bDpO9JBlxU5xG7E8k4Ljrim8p70+jjbub6UgT6qRGTQ9Cx3+
   5B+8dqZ//puFOFb+fHPU9rcunJA6JCj1//IyeJhg0Z3+b8/smqKZQx6X8
   o7rOD4y98/H3r67c0NHgl7ihtcx16zNRl4ZEWsVvCQGTsWbH1x+IiQ4Wo
   9mUTOdMehjzaUNW1VPp6nJfGj7LOh7tGex3YSIgICIsywpcdXhqBa6w38
   L4jh9LWtLXUVR0c5b7IezuL4shYZL7hEI04DIXZ7YKaUxhrc7uNN093Ua
   w==;
X-CSE-ConnectionGUID: VQu4yQlVRKCGPsyhMr2RDA==
X-CSE-MsgGUID: 0o9xoNz/R766RAiAuSii+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="73721574"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="73721574"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 00:10:37 -0700
X-CSE-ConnectionGUID: eR9uqv7ESYO1SEjlpbKtzQ==
X-CSE-MsgGUID: BW+I276LQ/2xsPW1ANAhKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="265028415"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 01 Aug 2026 00:10:36 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq3re-000000003Py-0OVw;
	Sat, 01 Aug 2026 07:10:34 +0000
Date: Sat, 01 Aug 2026 09:10:14 +0200
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 1/93] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <202608010932.BQ8qB9PL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   7dd9571ed4664ad741e8519b4a4369a2d84523f6
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/93] rpdfs: initial commit
reproduce: (https://download.01.org/0day-ci/archive/20260801/202608010932.BQ8qB9PL-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#5989: FILE: fs/rpdfs/net.c:470:
+	switch (nerrno) {
+		case -EIO: return RPDFS_MSG_ERR_EIO;
+		case -ENOMEM: default: return RPDFS_MSG_ERR_EIO;

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
