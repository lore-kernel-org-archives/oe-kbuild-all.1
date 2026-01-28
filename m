Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB34B2FCC04
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 03:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769569876; cv=none; b=dROdPFBWKcBTBPBrQN27M4FKbe9MG7EmFpTX1oW5d7C9m+ubaeIYJq9ARiDnGqRC2Lzyv1tuzw/tXES+0wSld9JriVggpTk4ASOW50F4LUMAnDIfDMzrU0CVd3BnlTimfHQC2EZhRs//WR8CO9b3y/lU4oCymYsQ0k0ZTGCxdY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769569876; c=relaxed/simple;
	bh=yXCRBcETge93zpBApxHAHSNV4b6TP06w1jluH4dC8Io=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BSuHtuMe/XaJdjY5nlXGQn9r05mXHKGXup40WlgREABatXw8GeOMLVtxXvABU8VDDOOyidN7f3vN6/rIsl9mMtPUunPOC7UIYSiAgg/xoWK0ejcLbFg67JlzYKMuDXZCoqgWcIqU4ImataCi10BIMss6nDeDciwD2hXGuon3JEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFTFQIOA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFTFQIOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769569873; x=1801105873;
  h=date:from:to:cc:subject:message-id;
  bh=yXCRBcETge93zpBApxHAHSNV4b6TP06w1jluH4dC8Io=;
  b=LFTFQIOA1t79j2j5u2JSu/F3upBfigr7hrrt07AKK5Bu1vrIlRtVfEXI
   XHL1MLdiQqEUY1vDyMfGBJddSwEyPoEQ2oVR2cjH7tOow8jTPS2YDEUJW
   xichy5lMkExedC6qF8JyEEH5nEe77EdEXOKhLeux9RIisC4Dx+F9CNMSE
   iQO6Z5LUhqMV1wW/CbZjUA4sf1/zKXGusipaCsg3LDkmxoVgo0Ue/8TUH
   D+8pw3zd5Uj0ItvoLTRQAtpfqrI4mqfTK2l97rd+IN+C0OKGK/3nxtQqm
   YYufHu8/7SC1xcl5adKDxRF7XlEsAQ4DEHmjtKFOvxNLv2O3Icl/xlfQv
   A==;
X-CSE-ConnectionGUID: h8Ej2IbiT4aCe1jMckMUPg==
X-CSE-MsgGUID: ZLPqzkpfT2ul79Up7cVB6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="73368861"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="73368861"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 19:11:11 -0800
X-CSE-ConnectionGUID: 6JIKklnHTjOq3mchwfu4lQ==
X-CSE-MsgGUID: u9+iMtafScCRWwS/p3vISA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207386425"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Jan 2026 19:11:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkvxS-00000000ZAy-2Z7k;
	Wed, 28 Jan 2026 03:11:06 +0000
Date: Wed, 28 Jan 2026 11:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:vcam 5/5] drivers/media/vcam.c:1300:45:
 warning: cast to pointer from integer of different size
Message-ID: <202601281125.iPMV7kh1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git vcam
head:   1acde9274dba32a351e6523a21a62a54c76ae849
commit: a6f2cebf897c8a2ef155c23accff8f38a04f633c [5/5] media: Virtual camera driver
config: csky-randconfig-r073-20260128 (https://download.01.org/0day-ci/archive/20260128/202601281125.iPMV7kh1-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281125.iPMV7kh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281125.iPMV7kh1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/vcam.c: In function 'vcam_ioc_vcam_new_validate':
>> drivers/media/vcam.c:1300:45: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    1300 |         len = strncpy_from_user(card_label, (void __user *)config->device_name,
         |                                             ^


vim +1300 drivers/media/vcam.c

  1287	
  1288	static int vcam_ioc_vcam_new_validate(struct vcam_ioc_new *config,
  1289					      char *card_label)
  1290	{
  1291		long len, i;
  1292	
  1293		if (config->device_nr != 0 || config->output_fd != 0)
  1294			return -EINVAL;
  1295	
  1296		if (memchr_inv(config->reserved, 0, sizeof(config->reserved)))
  1297			return -EINVAL;
  1298	
  1299		memset(card_label, 0, VCAM_CARD_LABEL_MAX);
> 1300		len = strncpy_from_user(card_label, (void __user *)config->device_name,
  1301					VCAM_CARD_LABEL_MAX);
  1302		if (len < 0)
  1303			return -EFAULT;
  1304		if (len > VCAM_CARD_LABEL_MAX ||
  1305		    (len == VCAM_CARD_LABEL_MAX &&
  1306		     card_label[VCAM_CARD_LABEL_MAX - 1] != '\0'))
  1307			return -E2BIG;
  1308		if (!len)
  1309			return -EINVAL;
  1310		if (!isalnum((unsigned char)card_label[0]))
  1311			return -EINVAL;
  1312		for (i = 0; i < len; i++) {
  1313			if (!isalnum((unsigned char)card_label[i]) &&
  1314			    !isspace((unsigned char)card_label[i]))
  1315				return -EINVAL;
  1316		}
  1317		if (!isalnum((unsigned char)card_label[len - 1]))
  1318			return -EINVAL;
  1319	
  1320		return len;
  1321	}
  1322	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
