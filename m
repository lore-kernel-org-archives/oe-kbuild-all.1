Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358BF3E00A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 23:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785367551; cv=none; b=k5aZ/vJHQSPOpy0TlvMJPOnpTyfsSbMLYMnrDN0jSLqqJJnpvSds/T36DOSkEetOYtj+iqj9GAGNhgqxTfI+iDP6y3vsguPohOeGwW4YaAvErMzMdv7g2CjuQgZdqxLFnWpsSSg/7czs1O/QGAMQn+eRwvtS776mjLfMUY+0wnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785367551; c=relaxed/simple;
	bh=TjE3Tef9DpqJL9RPjLElt5pz2mGv7JZ8+oWgY0n8FdE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vF8NAfISLLgfTC3iNpcQhhIMwH4V0ogSlaPT9YTcdqSEsiE4tGmhnJC1kYR8sZ9DS7EHuiD2l6IYBhQaB1NT8oXsjOxeojp9/SKvVw5lsNN6LPO+l4BMlXLeMVBJCa7u+xVeDZzSRBWjS2w5aDzVcEBnD/ez9TxyV3uK0yjWZig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRyhiWAr; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRyhiWAr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785367546; x=1816903546;
  h=date:from:to:cc:subject:message-id;
  bh=TjE3Tef9DpqJL9RPjLElt5pz2mGv7JZ8+oWgY0n8FdE=;
  b=fRyhiWAr2zrL3HI1zyOe+b0JmyYRTX+W6k49gULGS4JOTKaEMuVvZpx0
   Iszj2ywWSFo02E2KN3df46Og9S3TWGfNjVgR+xKzGF3gTymMzmYuMmnCp
   ETiWTIkSDlEKl+za6n1V8eQS7tjc0vlOuI+YwnTOSmQHqpM9VGajRI5LM
   g7BfMZ4kyNWg3GSKfkMWMrhWZOe/gN/kPAXqTikIV/j51/qMXvT+eOD/T
   UQYgXC4m07oe/4riTv29pgpi0NwhX7NhQxTKmmeqhiUXlZaqdd5EXIP3z
   pMecGJHna7DjYeU3t9EheXfNqZBno2H0BA04WfJDeFEj60gCZQjG/83nw
   w==;
X-CSE-ConnectionGUID: tCST6jdRQyemAM/LfybjXg==
X-CSE-MsgGUID: yo3DGhoyTxeUwAy/AHJWRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="97357605"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="97357605"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 16:25:45 -0700
X-CSE-ConnectionGUID: SQeUO9MvQKWHiFFnlOPATA==
X-CSE-MsgGUID: m5SjvnXORZKOww8t9GCYdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="258360057"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2026 16:25:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpDeg-000000002Es-1CBr;
	Wed, 29 Jul 2026 23:25:42 +0000
Date: Thu, 30 Jul 2026 01:25:41 +0200
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream-20260729-1835 14/28]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202607300117.hieUhIt5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream-20260729-1835
head:   6f6c34aac5803ceed885cea516a1bfb4837a3520
commit: 3820eddd238edbae77ab9f8e3af51f256ff4efbc [14/28] RDMA/hfi2: Add PIO send infrastructure
reproduce: (https://download.01.org/0day-ci/archive/20260730/202607300117.hieUhIt5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#191: FILE: drivers/infiniband/hw/hfi2/pio.c:155:
+	int centipercent; /*
+				 * 100th of 1% of memory to use, -1 if blocks

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
