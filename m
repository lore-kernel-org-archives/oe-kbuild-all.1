Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0B21F4261
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217496; cv=none; b=ZZke0zb3TgfsX5jHtneOJhmDuMLwMEZIk0g7BzB6MZpWbCGpKaUD9+lrE7IDHd+bvDwtpNWr1tRL8/SggCiB8c9ANWOS5yoHyvhfyth5oTMmpnQJWsTUhYmyCJoS/gzs7T9/AqYcgrPQQZAsbvX83fAx4rYWK666cMrr5HisfRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217496; c=relaxed/simple;
	bh=4Vtds0hwI3LDmk/86DMFZX5cXzxYcMtpjbPruMi9Z0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ugPvjB/cHWydK6HekVa+US0/L69nq47DUh7paVHClNx/oVO0t889f39o6i0r3wBlNfIqYzMKlO8aOtprdRQvOh14NtZrff90Bejn4Rd75r3DxZeSQI45eE7Shy2tAR0f89MJYDId+8feaRIRQuU45Jl08P92sFUwHihP3uEvrSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9lDXXfB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9lDXXfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747217495; x=1778753495;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=4Vtds0hwI3LDmk/86DMFZX5cXzxYcMtpjbPruMi9Z0Q=;
  b=E9lDXXfBG5+d5RQY3B/CfTfqret1qSYd7CrSvijvoY31D7qZsM4bQqHK
   ASj1DM0eY8/aCWocvu/QCzk21f6z+K7zSIIn7W9M0uhgXTIix1XEvvUAx
   fG7TpT/GgpvarjVGLUwfPqChZwEU1Fz7UaCRs+y6pXmGBxx3VVLe6xKNc
   bqSLza5q8GWckhwkEWojahUxlIP9W/XTn75LeCcC4Mk5HzKhXwBkmmGOE
   WYRCciOVg0q7OnInedfv9CPLrjrLlYABRZ/uE9/4NltH7fd9/FYM5vxic
   j00i6cWOek2brfs3m4f2NgV/IK2JQtZrrfT2gcaSeq5GF1Ys7Yg+BeJjr
   A==;
X-CSE-ConnectionGUID: Zx9R2kvESCGdV1mx3Egp2A==
X-CSE-MsgGUID: ghzAHWVwQYKtuX116hRAMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60117527"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="60117527"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 03:11:07 -0700
X-CSE-ConnectionGUID: 1FCfArSySdmL73ocm+Ek/g==
X-CSE-MsgGUID: mnFUl/6WRv+AgI27p0/bhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="142028148"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2025 03:11:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF94p-000GxX-33;
	Wed, 14 May 2025 10:11:03 +0000
Date: Wed, 14 May 2025 18:10:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Kriulin <kitotavrik.s@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] fs: minix: Fix handling of corrupted directories
Message-ID: <aCRsHqG0ewwRUIt8@3b2125c66474>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514100536.23262-1-kitotavrik.s@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2 2/2] fs: minix: Fix handling of corrupted directories
Link: https://lore.kernel.org/stable/20250514100536.23262-1-kitotavrik.s%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



