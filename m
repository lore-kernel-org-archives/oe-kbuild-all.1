Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D262AD2C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 01:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781399583; cv=none; b=LJ2WIfZ4V8S++dkeuZtnOtTs2RUxDj5Xnx1h/SoZy2cdnLC0ATJMl4AuaM8zhrRqAgs6FLxxkJX2fFacV3Wqno+/zTbUX/CePuLUqRtuYW3M4ZBontYG7iwsYCOoH1H+mXayEvW3y3+OBcHOSdMrKIYSswf7kpS5Uj8Jx2ba1gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781399583; c=relaxed/simple;
	bh=ByJWpT4HXSaHcHjFEs56aDYHClq6EOGNTEYmleS7mr0=;
	h=Date:From:Cc:Subject:Message-ID; b=f8IUhirSlwRzsFCEpXnjrOcr0z2jecFO1YU38Y7x3cgClwOHCEgsisX5oU+j50zEecP0fU7L4ZYda6YeX77C3r4Se3GLeQttQ2BEgOLk7lJh5R9JFev68Q6U8Vv/yG5KsYqSVFAy/a4vd+T6kKhoEn5R8q2i5+J/vNzQiJ6ETR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oETBijTN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oETBijTN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781399581; x=1812935581;
  h=date:from:cc:subject:message-id;
  bh=ByJWpT4HXSaHcHjFEs56aDYHClq6EOGNTEYmleS7mr0=;
  b=oETBijTNzdiQ4nPVctxgiVI29uedD94nN+QKGtX8ycHYxlDSykP/IOus
   kFdCWRuAl7oDxyyCGl0mXEQCHgJlymXhWPbfP8/CAFhkiChK1foMbUlnZ
   MLIEr/rurVu/Uz/sRMOTIPKbKAxor2PUe4Bj4LmOsqoGf19VsWwTUHNSi
   lYv47ZhqMJ6tD5zTwsfyqYT1EDdDwkwCeWwYgIAWaz0IK4QVMMmdfowkZ
   fhd5Iy4RlJ3s69PzUYe6uiL9GqihlxWKFlnwqdud8h0+e02eS9JbONZOH
   1wz+24Jrz9v4aN4bQaIc+HRqaKqrL+XD9t53UjE6xmKeNdNZkB1XY3Zw1
   Q==;
X-CSE-ConnectionGUID: sDFgQnn2SAaqzu4jcE2hVw==
X-CSE-MsgGUID: b7uHj5crSnCJzbAWHzFSPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="92747064"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="92747064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 18:13:00 -0700
X-CSE-ConnectionGUID: x5aefX8EQAGCFCPxoHwRag==
X-CSE-MsgGUID: AWAok2KhSyG6OG8rIstzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="247022519"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jun 2026 18:13:00 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYZPE-00000000QRw-2cBr;
	Sun, 14 Jun 2026 01:12:56 +0000
Date: Sun, 14 Jun 2026 09:12:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: [thesofproject:topic/sof-dev 10/13]
 sound/soc/sof/sof-client-fw-gdb.c:365:22: sparse: sparse: invalid assignment:
 |=
Message-ID: <202606140919.YdfuclV9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   f6602b847ffbd29afc5f74bd2ab40aa002893b03
commit: 7a79ba9a0865c9efc5f5db3f5182ac445db67954 [10/13] ASoC: SOF: sof-client: expose Zephyr GDB stub
config: microblaze-randconfig-r111-20260614 (https://download.01.org/0day-ci/archive/20260614/202606140919.YdfuclV9-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140919.YdfuclV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140919.YdfuclV9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sof/sof-client-fw-gdb.c:365:22: sparse: sparse: invalid assignment: |=
   sound/soc/sof/sof-client-fw-gdb.c:365:22: sparse:    left side has type restricted __poll_t
   sound/soc/sof/sof-client-fw-gdb.c:365:22: sparse:    right side has type int
   sound/soc/sof/sof-client-fw-gdb.c:369:22: sparse: sparse: invalid assignment: |=
   sound/soc/sof/sof-client-fw-gdb.c:369:22: sparse:    left side has type restricted __poll_t
   sound/soc/sof/sof-client-fw-gdb.c:369:22: sparse:    right side has type int

vim +365 sound/soc/sof/sof-client-fw-gdb.c

   351	
   352	static __poll_t sof_fw_gdb_dfs_poll(struct file *file, struct poll_table_struct *wait)
   353	{
   354		struct sof_client_dev *cdev = file->private_data;
   355		struct sof_fw_gdb_priv *priv = cdev->data;
   356		__poll_t mask = 0;
   357	
   358		mutex_lock(&priv->mutex);
   359		u32 head, tail;
   360	
   361		poll_wait(file, &priv->rxq, wait);
   362		poll_wait(file, &priv->txq, wait);
   363	
   364		if (sof_fw_gdb_get_rx_ptrs(cdev, &head, &tail) >= 0 && tail != head)
 > 365			mask |= POLLIN | POLLRDNORM;
   366		/* readable */
   367	
   368		if (sof_fw_gdb_get_tx_ptrs(cdev, &head, &tail) >= 0 && (head + 1) % RING_SIZE != tail)
   369			mask |= POLLOUT | POLLWRNORM;
   370		/* writable */
   371	
   372		mutex_unlock(&priv->mutex);
   373	
   374		return mask;
   375	}
   376	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
