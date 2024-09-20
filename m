Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE1714A09A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726828725; cv=none; b=A8rgU/xqcW116Ov2jBe0Zx4c8vHHMgZxwQj9c6A8ky30TdTdMofZe/W5FMOoV/fZ0vSiHumVJ2ynGpyT2H+2fIm+LRsJj9EAE9S3EAJnu/o74DbDeC7oGCTo+JGWih4WVIKbbI+/4ZY5i6vumD7aRrgrcjPikLLZoJkqOOd7qSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726828725; c=relaxed/simple;
	bh=5de8fI+AS3M3u4rHjgWpD8xOMOPH3rzjVq27Mkau6Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JivNoBQRwPT1yI94nTKVPMxEn3cTctmeuG+rtRm47hsZoo0b3/3+BPKuxa35nRat0BcKPTNgXLkieunkxErg9e3JbIJPMqh9e00RP6hSiBgSJaN1sR3gX2XfHac0RyITzG7pCf15WZD2mWOaOJsHTmnNCfKfh/3BKjRpSzHboQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzoHok0n; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzoHok0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726828723; x=1758364723;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=5de8fI+AS3M3u4rHjgWpD8xOMOPH3rzjVq27Mkau6Zo=;
  b=SzoHok0na++gwbsC+ZduLl9gmzl4CMyYo5Asji4h1o8JOpmwOgeDQ+zh
   KsRKY7rQZpoL+hnfCsE2z3rZbeoVBvJMm3w9Z+4rIWNbQspkatgmUne/Z
   J3BSOrnm0xl1fFJnlfOvR95UQfnzJOZZRpWauBoPXnTmsIK+w4HROPl0Y
   3mdEIr58Ibh7HugDildVeZ8zv1itjUad7XXTR4ERuCnk0PJaxeiLC3uti
   zwW4TuH8HhK1GOVEVYfu9FMG2evSuDeh5tOmbAi8RPiV0bm4SvYxctgku
   uiPeMa4XLKyUVXVjCsI+nMZAYh4gJKo8h2uz5BNyWprHH83wpd7dyHj2w
   g==;
X-CSE-ConnectionGUID: EklIESRSTFiB90VwiMCg/g==
X-CSE-MsgGUID: wMKtwQE1Si2NVhp33ghcTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="26015379"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="26015379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 03:38:42 -0700
X-CSE-ConnectionGUID: xFhSJyCnRoOHICgTyaf2Dw==
X-CSE-MsgGUID: mexhLB0ZTDq32Awc94R7aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="74632015"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Sep 2024 03:38:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srb26-000EHp-2j;
	Fri, 20 Sep 2024 10:38:38 +0000
Date: Fri, 20 Sep 2024 18:37:40 +0800
From: kernel test robot <lkp@intel.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 5.10] bpf: Fix mismatch memory accounting for devmap maps
Message-ID: <Zu1QdPBf_QnYCxbS@3bb1e60d1c37>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920103950.3931497-1-pulehui@huaweicloud.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-3

Rule: The upstream commit ID must be specified with a separate line above the commit text.
Subject: [PATCH 5.10] bpf: Fix mismatch memory accounting for devmap maps
Link: https://lore.kernel.org/stable/20240920103950.3931497-1-pulehui%40huaweicloud.com

Please ignore this mail if the patch is not relevant for upstream.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



