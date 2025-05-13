Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB8E204C00
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 08:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125336; cv=none; b=Y/zuLwgdh+t2WMvmhKvCstQs6chCqHA71wWaoX3sWKW6wc8ptgEejxPZ0DF5xSZ1b+zPH3IRR0sSyLsL43WEx+YacZb8vAP3tntkXAH9mf775d1vv6d+tpn3mHxkik8kMASzwQpHKR1BtG7kdFIApu640dm7nSO1FC/TRO9dfxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125336; c=relaxed/simple;
	bh=sbHxW2MmE5x+Xp3TuOMyLQOpn01xhvKijJIBA3jJrro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mzCxgtaNx8xGuR/vcXqS4QBo22udIAyeOYgkjQxXJ2uXblL1Evbgfvbkw6ZCTJ2+Yy6byoKus4hyD0kE0tEtH8nqEvlQ+y7WrtCGfY4tdZXboK8sdBofk90IHKa/IZavnGryL8cU72ooKgKrgrrFnBK70S8ogcspfkVG6u2T11U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E156WOYj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E156WOYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747125335; x=1778661335;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=sbHxW2MmE5x+Xp3TuOMyLQOpn01xhvKijJIBA3jJrro=;
  b=E156WOYjikpxLjMAp7LHlE2IbgPVLVvqIwlFyktbYqKxTm4HhI2Mrvwm
   5rdcWeXtUNWYXRpAszaVySo/04dUzlb93fOK3TRIBgmaHvdQMWYWfuLT3
   McYSyNBvGLBhSkU5Rc8wTvEzSDXmVbBvhEBldyAyDj4uuzzMKg0Xtypz3
   8MFuNXrVe3jaAYcq2JNIxsdT01HrjI4JKl16ZmRb7act30C0iIa8HzUFn
   ZHASbfB3aW/UfR341PB+ca8yipOT6aPpYH/81e5iGkW8BEpjBAlhKCbxN
   A1s5AmKvzcTDAZy54GYu+4BITdT+UKY5bDPWQpNnQlTlbkb17D8l8Ohsq
   w==;
X-CSE-ConnectionGUID: bkAqXC1/QSOTmOu6sSmPbg==
X-CSE-MsgGUID: 2fdCHW6ZRn+GjsWba1XrYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49074230"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="49074230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 01:35:32 -0700
X-CSE-ConnectionGUID: UU0IxkNjRcWp4uk4s4Be3Q==
X-CSE-MsgGUID: ZMNSQQNkS/6IWMjkLXop0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="142399638"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 May 2025 01:35:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEl6n-000Fsd-0Q;
	Tue, 13 May 2025 08:35:29 +0000
Date: Tue, 13 May 2025 16:35:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Tsygunka <aitsygunka@yandex.ru>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] misc: sram: Fix NULL pointer dereference in sram_probe
Message-ID: <aCMETRbtPF1b8f-h@75fa4dc5d8b3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513082757.1323953-1-aitsygunka@yandex.ru>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3] misc: sram: Fix NULL pointer dereference in sram_probe
Link: https://lore.kernel.org/stable/20250513082757.1323953-1-aitsygunka%40yandex.ru

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



