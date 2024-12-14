Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDF1D51C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 01:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734139907; cv=none; b=J0b5jl5QjyNjXRzz80qtlm5ihP6Jh1CXgxAB1RjKQplPIWAbqjGxBqs7ltNp45fclyJNMg9Ak1xpdp/DSU3gT5cn8GFDLENAQySO7g5UsGV4u5aNA6h24/j/J84sAad4o9maBwTDWkGhuOIAdCbZWgbce0p6FmH0KgpcwcOfwVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734139907; c=relaxed/simple;
	bh=Sl9HKxLLGSt+yCzpvHzjdVTcCeu4/W+BOEbJnwxMCrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FOu5LRzbCo8aZA2hzXHyDciGnYPm8N21wVN7nRnJ00i8Ur9Ea9C9jmEsQjeDKzwhgvSwjGqKvPNhP/njH9J/jayCmMPXMC6Z1Vggg42rDSowir62eEMzq2XLjaaT9HYshiqUsZbpDrtfeAOLSDIPCgkW0KgIq/JUfpOehs7VvrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8rKUvUt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8rKUvUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734139906; x=1765675906;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Sl9HKxLLGSt+yCzpvHzjdVTcCeu4/W+BOEbJnwxMCrw=;
  b=K8rKUvUtyiq3RxGyywBepWUTIolb939NoZMrSTgE4Od/dsqcWNXsSmOs
   SRFA2uWRbBoh1tg++V3UUfUfgtRWoM/il2HL3Hed+G50Y+QpEMrxQrl9x
   5mYUVqh0srek5+k8W26jYp8glRZ4+MQsvTaaDGxm2DrXdVfpPOiSxsoej
   zyAJKcqo2+twDYcX5m44sBys3Tr7kInYUjcyH23VFoKVGJeeNQw/i1e68
   HeeffyOqgIUnjyPEjiVFIvSOnF3hzm8P7uwjq/H+VnnwrDOSB6RAplg73
   0ukuAHi6gOZUp/Vgh2EWtOJZ81Mda0BHUE3JXri3DNxJQ1EOhJ3W6sUg/
   A==;
X-CSE-ConnectionGUID: xOKN2zb6SwKzkBbErNiiLA==
X-CSE-MsgGUID: LTowb5FsR3SNE+kt0n3ksQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45089128"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45089128"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 17:31:43 -0800
X-CSE-ConnectionGUID: PHyJELp7SjG3+lhxTb8EEg==
X-CSE-MsgGUID: tWSnpy2ITBOrnpr6CCEQcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; 
   d="scan'208";a="97098030"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2024 17:31:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMH0M-000CcD-2S;
	Sat, 14 Dec 2024 01:31:38 +0000
Date: Sat, 14 Dec 2024 09:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, haodongdong <doubled@leap-io.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1636/1636]
 drivers/scsi/leapioraid/leapioraid_func.c:2040:75: warning: '%u' directive
 output may be truncated writing between 1 and 3 bytes into a region of size
 between 1 and 26
Message-ID: <202412140904.HG96zLGT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d68dc6ee371ec5466be9b2d76bdca0b360940adc
commit: 15ac0de239497e0a3497a106b9c0cc8795f0144a [1636/1636] LeapIOraid： Fix the compilation warnings in LeapIOraid driver in loongarch64
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241214/202412140904.HG96zLGT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412140904.HG96zLGT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412140904.HG96zLGT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/scsi/leapioraid/leapioraid_func.c: In function 'leapioraid_base_request_irq':
>> drivers/scsi/leapioraid/leapioraid_func.c:2040:75: warning: '%u' directive output may be truncated writing between 1 and 3 bytes into a region of size between 1 and 26 [-Wformat-truncation=]
    2040 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%u-msix%u",
         |                                                                           ^~
   drivers/scsi/leapioraid/leapioraid_func.c:2040:65: note: directive argument in the range [0, 254]
    2040 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%u-msix%u",
         |                                                                 ^~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:2040:17: note: 'snprintf' output between 8 and 35 bytes into a destination of size 32
    2040 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%u-msix%u",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2041 |                          ioc->driver_name, ioc->id, index);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:2031:70: warning: '-mq-poll' directive output may be truncated writing 8 bytes into a region of size between 6 and 31 [-Wformat-truncation=]
    2031 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%u-mq-poll%u",
         |                                                                      ^~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:2031:65: note: directive argument in the range [0, 255]
    2031 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%u-mq-poll%u",
         |                                                                 ^~~~~~~~~~~~~~~~
   drivers/scsi/leapioraid/leapioraid_func.c:2031:17: note: 'snprintf' output between 11 and 38 bytes into a destination of size 32
    2031 |                 snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%u-mq-poll%u",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2032 |                          ioc->driver_name, ioc->id, qid);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2040 drivers/scsi/leapioraid/leapioraid_func.c

  2013	
  2014	static int
  2015	leapioraid_base_request_irq(struct LEAPIORAID_ADAPTER *ioc, u8 index)
  2016	{
  2017		struct leapioraid_adapter_reply_queue *reply_q;
  2018		int r;
  2019		u8 qid;
  2020	
  2021		reply_q = kzalloc(sizeof(struct leapioraid_adapter_reply_queue),
  2022			GFP_KERNEL);
  2023		if (!reply_q)
  2024			return -ENOMEM;
  2025	
  2026		reply_q->ioc = ioc;
  2027		reply_q->msix_index = index;
  2028		atomic_set(&reply_q->busy, 0);
  2029		if (index >= ioc->iopoll_q_start_index) {
  2030			qid = index - ioc->iopoll_q_start_index;
  2031			snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%u-mq-poll%u",
  2032				 ioc->driver_name, ioc->id, qid);
  2033			reply_q->is_blk_mq_poll_q = 1;
  2034			ioc->blk_mq_poll_queues[qid].reply_q = reply_q;
  2035			INIT_LIST_HEAD(&reply_q->list);
  2036			list_add_tail(&reply_q->list, &ioc->reply_queue_list);
  2037			return 0;
  2038		}
  2039		if (ioc->msix_enable)
> 2040			snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%u-msix%u",
  2041				 ioc->driver_name, ioc->id, index);
  2042		else
  2043			snprintf(reply_q->name, LEAPIORAID_NAME_LENGTH, "%s%d",
  2044				 ioc->driver_name, ioc->id);
  2045		r = request_irq(pci_irq_vector(ioc->pdev, index), leapioraid_base_interrupt,
  2046				IRQF_SHARED, reply_q->name, reply_q);
  2047		if (r) {
  2048			pr_err("%s unable to allocate interrupt %d!\n", reply_q->name,
  2049			       pci_irq_vector(ioc->pdev, index));
  2050			kfree(reply_q);
  2051			return -EBUSY;
  2052		}
  2053	
  2054		INIT_LIST_HEAD(&reply_q->list);
  2055		list_add_tail(&reply_q->list, &ioc->reply_queue_list);
  2056		return 0;
  2057	}
  2058	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
