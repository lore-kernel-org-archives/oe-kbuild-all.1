Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18131824AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721428972; cv=none; b=KW2yGDx7S+tWMmijOtysIn5HLD8FZgnGoRF01ac0nD7mTVlOfznOpKn1Jo0dRjs9WykL4P8tIfgkaISMAH8N4in175MjLm6Y9mubtLo+uBCKVFVYAGKjcABYYTTkaOY0G4nrrf9p0RP4+zDAPvyrveGtobcrW41zV/05v1zPqKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721428972; c=relaxed/simple;
	bh=1aapoaxdmtBKCI6MnkJJcHpJW64FMBSjhrpUZf6w3DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bjEFWKAuWTcS8SrPlCYDkUoEI/hQHix8Cfcq3ZD0dv1EcUPHwPjIJRYanzS9waXFUAcU7sry/EaYTmBJHPWWJwtZ0o+3kpDsLnNmVN8mU6co0hNxAmsHI7Td0eJzHn2C4nDmtLw45GYk0Ek9u4NfHN4owzXigc85D7I8XLBq2Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JURo4q+y; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JURo4q+y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721428970; x=1752964970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1aapoaxdmtBKCI6MnkJJcHpJW64FMBSjhrpUZf6w3DQ=;
  b=JURo4q+yT32pLS/x+gOr4SHQp+4r30QCjJd6hJPtLULnbqs7j6a65gmM
   rR6pVW6hyEkTR52LQy+NRTptpgB19WjUu0yKOBd4Kn3leZwiov/64TuqB
   gQKEf39bAiTqQ5mxcVFxRYRFDVrl+pjw22pRR9WRYopHhcd+VSqiENRK6
   n9p3qWqQbazA0414vIsh41XTX5nlJYpgKcpuheq/0NjorhrXCykqMeODJ
   glxf3cVoVuKbeOAFcmjNXAarn0G3H3wZV1a6JzsdSmW+2enyN6XgvY02c
   1iyE3Ks3NgJk7ODecceFvN5EAl9PUNtF7EVoLpqdKy0lKU7u8CGJyBVhA
   w==;
X-CSE-ConnectionGUID: tzvfxnbuQ4OnrlLLTNvw0w==
X-CSE-MsgGUID: oG524dVaQlGba5oofcBTkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19022907"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="19022907"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 15:42:49 -0700
X-CSE-ConnectionGUID: llNCksBFSayhZ56ORxos4A==
X-CSE-MsgGUID: EMUmjF5aSQOqscI24Qno1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="88727648"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Jul 2024 15:42:48 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUwJJ-000idu-2i;
	Fri, 19 Jul 2024 22:42:45 +0000
Date: Sat, 20 Jul 2024 06:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 41/68] drivers/media/i2c/imx390.c:866:34:
 warning: 'imx390_dt_id' defined but not used
Message-ID: <202407200608.0KKGpLye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   2d6facf7f6b24b2e7a9b921b57ec6b50fc810637
commit: d65865518449ba125e440b4336b4f0ca651536ff [41/68] media: i2c: add Sony IMX390 driver
config: s390-randconfig-001-20240720 (https://download.01.org/0day-ci/archive/20240720/202407200608.0KKGpLye-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200608.0KKGpLye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200608.0KKGpLye-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx390.c:866:34: warning: 'imx390_dt_id' defined but not used [-Wunused-const-variable=]
     866 | static const struct of_device_id imx390_dt_id[] = {
         |                                  ^~~~~~~~~~~~


vim +/imx390_dt_id +866 drivers/media/i2c/imx390.c

   865	
 > 866	static const struct of_device_id imx390_dt_id[] = {
   867		{ .compatible = "sony,imx390" },
   868		{ /* sentinel */ }
   869	};
   870	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
