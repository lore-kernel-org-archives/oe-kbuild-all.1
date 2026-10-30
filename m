Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338527;
	b=rVV/4rP4UPYJMGKbrYB5Ol0vxa9MLcPVwbHNhgqarfXHT8qHGZHV2hqYnBJjDb6zKxaY
	 JjObeVZ5Mw+GDth9FkbyNXNYqIMwDagH0Mcx8iY44CqgD7TJ0kDe71dEC121T42l51HBR
	 bAPgOUFeKgOYfoCaLvKOBnteYmQ7/D8rw1MJqTqxJkh/BxRalRe3MXprFhc/q2ROJxYAx
	 smMpzG1O22xkse49F/y1n5w7bujLOv3uUjnDm9eLruG58FCOfGLSbagot5HyUNI2j8L0v
	 L3QoGmncisWIdF7o4plitmzg7iRXrtVS4Rc+E6IU/XgXxhn7Jij+fPM0NXOR0QJO6SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338527;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=j0kgIQH1dWNr5FG6eI+KmjFBdE5aXSfljtZszR4O2bY=;
	b=pPfEW77jGRGK6gKyO3Pk6tzytGyQvvWr+e5iyYbWKhXn/jQU1EkWJyqV5EFMEwS/ihay
	 SNaq3XYryho9HORWoLoWKveRemWc/6vh4rO1FyJjDzx13As0EQ1k0ffxbSzYnrbLM4mbd
	 tMXHtJCQBXSvCEebmTmR66Sptr7KkF37qVNoqWgHxbNGTbCcM5+9h/kWDL/ZvQYUDVSmS
	 lZHa9megpbxRvPX0/pSuWyeJqwz5RtZoj0MgacC47UoQ5YAJFfzGwo0KQgcYMmZtwnu44
	 s++c9ZTXyG2j0gRQLz7yzJFvx+/wnvKpxcFbE6/Fr8qRgAtYEkAhWEm5oedsWRC9OBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iq9p8Uii;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4554B606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 05:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4554B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iq9p8Uii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793338525; x=1824874525;
  h=date:from:to:cc:subject:message-id;
  bh=ZJDHYpnnrSTT9gGb1l1BqHLJ3FfJ6vmMgSFk++MmlqQ=;
  b=iq9p8UiibedPWpXYqOZgXC1MiQZMY+Ynx1j2h+fVK4kzl26U2VuzXL3W
   RhwY0MbOKUTqrGp9rVyhehKTjaiQQuK5h70ixfTwbIg3T4iJIa34YBGP6
   1BRJEj/KUMeqmsuuNz3QafVTAGhMZxiaJwDxdOLauODG6ThBmNmCGWLi1
   jJdczCahZ7X6IzniL1jMxEazty8GD4RropA8wOZA73VldtB2o0wpgzJNg
   eafcviL5HYq7X0L21ffYnRZsk38kbuc9d/2AzOOdEd5PfKh0TYhXpSv9u
   9klf1QX+awvXAwvHgYRo/KbhOeR5d60M+bnOhQwJ68gHJkvHfjvzWK0gR
   g==;
X-CSE-ConnectionGUID: UXg8U9mURxiYRLo0ecQ1cw==
X-CSE-MsgGUID: Sb5eKHOATam0qFL9BDIzLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1981903"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1981903"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 22:35:24 -0700
X-CSE-ConnectionGUID: jYW7IuGkTAiLm+XZmIDbEw==
X-CSE-MsgGUID: ZO7P1chSQdiXTbM9XX0mXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5685994"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2026 22:35:23 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMfGq-000000005V5-4Axu;
	Fri, 30 Oct 2026 05:35:20 +0000
Date: Fri, 30 Oct 2026 06:34:30 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:master 11/12]
 drivers/char/tpm/tpm_crb.c:464:34: sparse: sparse: cast removes address space
 '__iomem' of expression
Message-ID: <202610300657.PDvHNvHj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
head:   7e8d0278a462f604dd884db39b76d0ac3c1ad652
commit: ed59034d94f5764452a57efb85bb2ae5c3061a5b [11/12] tpm_crb: Implement command and response chunking logic
config: i386-randconfig-2302-20261030 (https://download.01.org/0day-ci/archive/20261030/202610300657.PDvHNvHj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300657.PDvHNvHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300657.PDvHNvHj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/char/tpm/tpm_crb.c:464:34: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +464 drivers/char/tpm/tpm_crb.c

   443	
   444	static int crb_recv(struct tpm_chip *chip, u8 *buf, size_t count)
   445	{
   446		struct crb_priv *priv = dev_get_drvdata(&chip->dev);
   447		unsigned int expected;
   448	
   449		/*
   450		 * A sanity check that the upper layer wants to get at least the header
   451		 * as that is the minimum size for any TPM response.
   452		 */
   453		if (count < TPM_HEADER_SIZE)
   454			return -EIO;
   455	
   456		/*
   457		 * If this bit is set, according to the spec, the TPM is in
   458		 * unrecoverable condition.
   459		 */
   460		if (ioread32(&priv->regs_t->ctrl_sts) & CRB_CTRL_STS_ERROR)
   461			return -EIO;
   462	
   463		/* Peek at the first 8 bytes to determine the response size */
 > 464		expected = be32_to_cpup((__be32 *)&priv->rsp[2]);
   465	
   466		if (expected <= priv->rsp_size)
   467			return tpm_crb_recv_no_chunks(chip, buf, count);
   468		if (!(priv->intf_id & CRB_INTF_CAP_CRB_CHUNK)) {
   469			dev_err(&chip->dev,
   470				"Response larger than MMIO and chunking not supported\n");
   471			return -EIO;
   472		}
   473		return tpm_crb_recv_chunks(chip, buf, count, expected);
   474	}
   475	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
