Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F6E1E515
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 02:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785205294; cv=none; b=Gi2pxAaebdGYPFCYcvSz+aVEnVHkY1eAVs+/ysFP7VBmdH7v6xOCqB5KaTHnMgQMQsofC1lzE8vNoeoEc3X+J4EEtV8+X39T3VVmOA7r/pTodGWlszIo/LfvWEk3fktmQVG6Hr6hvuFJpdTereC2Ejaa98BJtXzdn7d51ZIZ7us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785205294; c=relaxed/simple;
	bh=BvF+ltIw9LuB2iOcQ2b3FWQ/YwBU/r/Iby/mO+b/U6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YYIy9cWznKtfKG4LRdH0CMo341tu6QHEutHkHDg2Tv4wf/6UA6x+BJW3JUx+GKDiTSzYSdmo3yCVUeHdr1Kv/IBOced73lOLS+0X2w4qI1Emd36KLDlZ+KnSpdkgljyRZPZtNAl/aaUaYasPqpah/jn+Vr/oZ8UZPZCsQ1/8xcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/5uTlh9; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/5uTlh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785205292; x=1816741292;
  h=date:from:to:cc:subject:message-id;
  bh=BvF+ltIw9LuB2iOcQ2b3FWQ/YwBU/r/Iby/mO+b/U6c=;
  b=C/5uTlh9kshC9x2HQ3VU4xMDYo6iUIAmFkdudKaKR/4TyiGict8dF/U8
   L51FxFBGR0xptEqWLGflxuBXIzRlq7pxEW1yHyJ48dWASWy1Q/eNtbvq/
   BKDQnRxhn4uSdkkFQvUwiSmHCG5tYKxfiLQtuyvA6VvlN7k5Nnyl+/Yfr
   N20ifgc434swVC6t8W4mTclD5RG9x+SCzObR2lpDKTiRcVBVdNrbtradk
   CSGWvRT0t4H7XzaNzm2jM1kblU405Mn9iENhaEJ1oklvUrrn/Wk4TAezz
   d1hipkCZQojzivGuTqs66u4StLRFLV14aEizcRCuQRDWbNQ4q4gRMdU7x
   g==;
X-CSE-ConnectionGUID: OD42IvbcT6CDgjbtuz4mFg==
X-CSE-MsgGUID: +DTvQzBsS0+Dqzq7ItrqAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103324428"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="103324428"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 19:21:31 -0700
X-CSE-ConnectionGUID: hcmkHi/vRAiTG1hWDM4GGQ==
X-CSE-MsgGUID: R10oou8BSNGx0qqWxGqDpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="284109885"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Jul 2026 19:21:31 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woXRg-000000001pa-1gr7;
	Tue, 28 Jul 2026 02:21:28 +0000
Date: Tue, 28 Jul 2026 04:20:43 +0200
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:rw-dmabuf-v4-tmp 12/16] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202607280416.7iTUJdgd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/isilence/linux rw-dmabuf-v4-tmp
head:   4ad753ea35094c0e41d48f8abbf2a42105b8f58a
commit: ba6aecec59d506a41309c0536745bc56e6350eb2 [12/16] block: forward init_dma_buf_io_ctx to drivers
reproduce: (https://download.01.org/0day-ci/archive/20260728/202607280416.7iTUJdgd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#56: FILE: include/linux/blkdev.h:1684:
+	/**
+	  * @init_dma_buf_io_ctx: Create a dma I/O ctx, which will be used to

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
