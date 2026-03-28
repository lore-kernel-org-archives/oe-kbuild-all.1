Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9723E1CD1E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 08:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774685521; cv=none; b=MLAq+1Q5chGVgjCGzgfM7jrSL9Vg4QkG7p8P+wfnT6AtXeWpA0vfk/JJShxdRBfiQpwL0/OiebsG08ANWkSSodfUYMDB4ehXDDCHzj91Il7iCwTin+O7OVeU3obfeCyMQNUdm/2gDN6AF7X+Ab2tdOZ+t5UQycJEZgwGnfjt7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774685521; c=relaxed/simple;
	bh=08yN4PM29GDqxMMsstjwlt+IX4akpyahgA8Ee3OdWVA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PXKue/OOxA1J9vhKObbIzjJ/PmANbIiSiQ9SPjxgWuqztEUGs5FqqkWpIdifmhZkKCfJlC8y3ZJ4QQhRYCeyazdDdZlMxiXe8rG15YOuJ+9CKlVgwu2ZYy5Lf0f7XrDNuSwRILUesBhub3H2uI/Ztkm5w1eCkwWb2ssYxg3FcEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dne1wTqD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dne1wTqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774685520; x=1806221520;
  h=date:from:to:cc:subject:message-id;
  bh=08yN4PM29GDqxMMsstjwlt+IX4akpyahgA8Ee3OdWVA=;
  b=Dne1wTqD5mpvp4IX/oicZ3dqMRgzbMgULEClANMHQhFaAOk/UkoTiaka
   qcEJBaj/rTEbClCJ7UV1Z1V1EY9gFKjKRUSrZRjEZwgN9hEUZmZiWm7q+
   I5+lvJJzQUiZbKcaiulpuL4/WAOmAXDtlihewLwl/jBVzXqbcJs3+nlsp
   RxOLwdd7gqZJcOsaGiwdYbtatRqAKkL1PUc1O95DelPWrfCxc6OYptJiy
   GbujScJUmigHgvYtCij5OrV01F7S9BXqJUKilD/ayeoy2hu7sL3uFLAoR
   8WcLUcZreXcmdh5uspnY4LIdKNwIaScHxqId0wKCf7CHZazI4jPpigtEC
   A==;
X-CSE-ConnectionGUID: UOX8G7/4T7S55hxVs3ufXQ==
X-CSE-MsgGUID: 3Mp9X6xTQdme1HssihAcsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75772394"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75772394"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 01:11:59 -0700
X-CSE-ConnectionGUID: stM3gLIwSYGw9SdzNUvmfA==
X-CSE-MsgGUID: jKUinKjNSMeW/EsYuLU4Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230312945"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Mar 2026 01:11:57 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Olv-00000000BDZ-2PWZ;
	Sat, 28 Mar 2026 08:11:55 +0000
Date: Sat, 28 Mar 2026 16:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 7/7]
 drivers/mailbox/pcc.c:295:27: sparse: sparse: incorrect type in argument 1
 (different base types)
Message-ID: <202603281659.lBbVpJSa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d5b66ad86ec150afc5182b585139072bf0a60683
commit: 84c351bc07a99d470dd91696b991a30b39db01f0 [7/7] mailbox: pcc: Check before sending MCTP PCC response ACK
config: x86_64-randconfig-r112-20260324 (https://download.01.org/0day-ci/archive/20260328/202603281659.lBbVpJSa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281659.lBbVpJSa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281659.lBbVpJSa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/pcc.c:295:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __le32 const [usertype] *p @@     got unsigned int * @@
   drivers/mailbox/pcc.c:295:27: sparse:     expected restricted __le32 const [usertype] *p
   drivers/mailbox/pcc.c:295:27: sparse:     got unsigned int *

vim +295 drivers/mailbox/pcc.c

   271	
   272	static void check_and_ack(struct pcc_chan_info *pchan, struct mbox_chan *chan)
   273	{
   274		struct acpi_pcct_ext_pcc_shared_memory pcc_hdr;
   275	
   276		if (pchan->type != ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE)
   277			return;
   278		/* If the memory region has not been mapped, we cannot
   279		 * determine if we need to send the message, but we still
   280		 * need to set the cmd_update flag before returning.
   281		 */
   282		if (pchan->chan.shmem == NULL) {
   283			pcc_chan_reg_read_modify_write(&pchan->cmd_update);
   284			return;
   285		}
   286		memcpy_fromio(&pcc_hdr, pchan->chan.shmem,
   287			      sizeof(struct acpi_pcct_ext_pcc_shared_memory));
   288		/*
   289		 * The PCC slave subspace channel needs to set the command complete bit
   290		 * after processing message. If the PCC_ACK_FLAG is set, it should also
   291		 * ring the doorbell.
   292		 *
   293		 * The PCC master subspace channel clears chan_in_use to free channel.
   294		 */
 > 295		if (le32_to_cpup(&pcc_hdr.flags) & PCC_ACK_FLAG_MASK)
   296			pcc_send_data(chan, NULL);
   297		else
   298			pcc_chan_reg_read_modify_write(&pchan->cmd_update);
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
