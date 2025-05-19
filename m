Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E55226C3BA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 09:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647851; cv=none; b=pBHNxHpMD9FihLYifOOYkjiGbH6XH/7jry/5yjqLWgU2hbYspNxVnBL3oUzBUCBdLwWtvnTaulENTE9mRg1iG2EqgJBTUiZQb3T4SD6wiWAwgnYaKbn/ZugEYrethA42d2cbbXj8Mb4/CCp3GGG6SSvWT/oJprmrlJ4Vkeu59vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647851; c=relaxed/simple;
	bh=xmowSHAKkgDQsr48md0ADlsdlIb4bxNDr9BRZ6Ne6d8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=K86z+E85f7S2Mn+H5rj27Fd/5Q1si3eqFF97xVLWdAkB0CFdXJw1jlDOYejlXq1NzQXp1bkEt89baZQRSH2Cbua2ajW2Bvne1ORjpYMlg1NPTRLfkvr0uR3I5jrJlKTmaJcP8830C/GfiQity9xHToztcggorZyfwCF7CM0MD1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e25HOZW6; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e25HOZW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747647849; x=1779183849;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=xmowSHAKkgDQsr48md0ADlsdlIb4bxNDr9BRZ6Ne6d8=;
  b=e25HOZW6EOOtNI02Z9HqpIU1CHGF9OFrRJ+U9exjgsOTcUqn8tNDoqkr
   fgx2xnpoNbT48L+2mFUclLwc3MyEAOQjDrjd5pRskoTly/1PWQIChGtMQ
   CRofK94SLzSBn40m+PalfmJ20iA5Ba7Flwh/yvbL9AuQNLhLDxrX7cv4v
   ReLrUtd1G5bTpxbNxtFCFiT8o8wAwjKhmNe/B0fG4rq65cjqQbDLCPnNO
   6MxLwocQxUzUVAV3Edve5p046F8TflR9GJVH8l3Or6ZqrqFvnvWtwPnpJ
   KrXiFxjU0+C4G6Hc38BkfxM+s+w1xeG6dpKSgfLS0HhC50GUQg/1nm5yl
   A==;
X-CSE-ConnectionGUID: 0tiMbk7TRpidS/hlMgA4UA==
X-CSE-MsgGUID: iWSaFh5iTIy6A5SfzqsaDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60193627"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="60193627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 02:44:08 -0700
X-CSE-ConnectionGUID: kKi34RhgSFa9Y+3WyWREFA==
X-CSE-MsgGUID: xK9lag/lSQmIrM+2cY98Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="162611989"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2025 02:44:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGx2T-000LKN-23;
	Mon, 19 May 2025 09:44:05 +0000
Date: Mon, 19 May 2025 17:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: limingming3 <limingming890315@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] sched/eevdf: avoid pick_eevdf() returns NULL
Message-ID: <aCr9Tikn_k8rayoR@8c81029db2be>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519092540.3932826-1-limingming3@lixiang.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] sched/eevdf: avoid pick_eevdf() returns NULL
Link: https://lore.kernel.org/stable/20250519092540.3932826-1-limingming3%40lixiang.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



