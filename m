Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6692FE057
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Nov 2025 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762597847; cv=none; b=H38MWpxFOB5SOgHVNll2xI0Q20+jdT8hPbxUr3FcP0P1s+pe2hD5LNNLjbdJlgmtPeqFhN0z2uXc6WJRS8MlYFh2wEZAXg7LhlZIBMXm5T2pWSzY7/IovsLS7kiLafk0o6Y+yx97HQP97CbzNdW+DttVLq672nSfZVRHX+Oiayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762597847; c=relaxed/simple;
	bh=LOp7+1xHeEJw+JjnPlgdnNmS7G/YDjM8CxHGShflGVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E40Wk008jek/QKqMTwwg8sXNN5EwJjge+J4dTFCihEgL6vCGN570VWxWmubpZtLD4huTEI9CHA88GunjCREOv9iMg//nk1r32iDWbyEo6pl/G/H2zKO7KsJ4b6mECH96WZPJl2tp1lZ5is9AZzB8hQq0qAZwon5rEslTjnpVDUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tpuftg3Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tpuftg3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762597840; x=1794133840;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LOp7+1xHeEJw+JjnPlgdnNmS7G/YDjM8CxHGShflGVY=;
  b=Tpuftg3Y/k8E9HkHJ53K3K2VvaZqwxRLAXiRaQLZ/mnspaRS5Uu7vbNO
   QghAtkRzjyyHazMb0zSMdzN/p4Lde2trpRnxzxzqnyNT2OT82qUNT05EE
   JrFyo0nG9aJcjcSevPejf1f5NtpJfSh0rfVPRShXsk+0iwoMzkV5tvmjU
   kvuOv7jhqJAy35zFHBy4Mog0sLut2OvORCzz4gn7X1cwFbd7+IDLIU5+D
   gU512iamgXFbZptjbmvZgfUjv+sxIIVs9zblaJ8Je7GuCaSM9JJpzKaQS
   1bzmSxF0AlRFVcgoyHIAwh5hBpyAIb8nEypXlZzxUIWFA6UPOl6xQjo8B
   g==;
X-CSE-ConnectionGUID: wt6GaWf1QwGmWCzxympv2g==
X-CSE-MsgGUID: dTE8npbARS6semFY6ljPOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="64429983"
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="64429983"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 02:30:37 -0800
X-CSE-ConnectionGUID: 9VUpAf/DTqe/4b7uG6gVKQ==
X-CSE-MsgGUID: GiQ+D4zXRxihgj+df/E8cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,289,1754982000"; 
   d="scan'208";a="218910182"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Nov 2025 02:30:37 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHgDJ-0000t5-2w;
	Sat, 08 Nov 2025 10:30:33 +0000
Date: Sat, 8 Nov 2025 18:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan Mu <mufengyan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3124/3124] drivers/ub/ubase/ubase_ctrlq.c:875:6:
 warning: no previous prototype for function 'ubase_ctrlq_crq_handler'
Message-ID: <202511081833.oncKY6Q3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: d7ce08663cc5bc33993af7b046eb09e98640c404 [3124/3124] ub: ubase: Supports for ctrl queue management.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251108/202511081833.oncKY6Q3-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251108/202511081833.oncKY6Q3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511081833.oncKY6Q3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubase/ubase_ctrlq.c:875:6: warning: no previous prototype for function 'ubase_ctrlq_crq_handler' [-Wmissing-prototypes]
     875 | void ubase_ctrlq_crq_handler(struct ubase_dev *udev)
         |      ^
   drivers/ub/ubase/ubase_ctrlq.c:875:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     875 | void ubase_ctrlq_crq_handler(struct ubase_dev *udev)
         | ^
         | static 
   1 warning generated.


vim +/ubase_ctrlq_crq_handler +875 drivers/ub/ubase/ubase_ctrlq.c

   874	
 > 875	void ubase_ctrlq_crq_handler(struct ubase_dev *udev)
   876	{
   877		struct ubase_ctrlq_ring *crq = &udev->ctrlq.crq;
   878		struct ub_entity *ue = to_ub_entity(udev->dev);
   879		struct ubase_ctrlq_base_block head = {0};
   880		u8 bb_num;
   881		u8 *addr;
   882		u16 seq;
   883	
   884		while (!ubase_ctrlq_crq_is_empty(udev, &udev->hw)) {
   885			if (!test_bit(UBASE_CTRLQ_STATE_ENABLE, &udev->ctrlq.state)) {
   886				ubase_warn(udev, "ctrlq is disabled in crq.\n");
   887				return;
   888			}
   889	
   890			addr = crq->base_addr + crq->ci * UBASE_CTRLQ_BB_LEN;
   891			memcpy_fromio(&head, addr, UBASE_CTRLQ_HDR_LEN);
   892			seq = le16_to_cpu(head.seq);
   893			bb_num = head.bb_num;
   894	
   895			if (unlikely(!bb_num || bb_num > UBASE_CTRLQ_MAX_BB)) {
   896				ubase_err(udev, "ctrlq crq bb_num(%u) is invalid.\n",
   897					  bb_num);
   898				ubase_ctrlq_reset_crq_ci(udev);
   899				return;
   900			}
   901	
   902			if (!ubase_ctrlq_check_seq(udev, seq)) {
   903				ubase_warn(udev,
   904					   "ctrlq recv invalid seq, seq = %u.\n", seq);
   905				ubase_ctrlq_update_crq_ci(udev, bb_num);
   906				continue;
   907			}
   908	
   909			if (le16_to_cpu(head.bus_ue_id) == ue->entity_idx)
   910				ubase_ctrlq_handle_self_msg(udev, &head);
   911			else
   912				ubase_ctrlq_handle_other_msg(udev, &head);
   913	
   914			ubase_ctrlq_update_crq_ci(udev, bb_num);
   915		}
   916	}
   917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
