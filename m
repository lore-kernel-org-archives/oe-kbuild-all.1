Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FFF345736
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 10:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821518; cv=none; b=j76a0ALTFLH4Sh7mHPmANzZuLrgrClwl+zAr55n0dLpWZZfgd2FnFYf3U00C1mDiGeDdf2djKPcTk5ZtMyZdGbOSGgml60dR6qlma7IQPOO2IX8Zm1+YIHMWl5WhoZlhk28ZJbFS5bAdUxZDAlSK7fq5L3TxLKF1BMh9VwhKA/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821518; c=relaxed/simple;
	bh=alXfXWJ6X8w0m9N/tWQ+/ZfXvVfauWcWFtq4KBnlErc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qTLiLtMWf/4LHxw94Vg2pCQf4Yj1tc5IgkAtjShPYJKbCRiSep2/2ilUIVw9VBD1QYp5I7G/NyibL8SEGkKcJ0SMG7XGCwO/Auw0s2fsx97wRYw+8SLiyOxqw++Bhlf5aMQG4QtgfYgFmdkxGjqTVYU0eKTZOVukIPu5DWUuBqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNn6T1S1; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNn6T1S1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761821517; x=1793357517;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=alXfXWJ6X8w0m9N/tWQ+/ZfXvVfauWcWFtq4KBnlErc=;
  b=cNn6T1S1lih2tFOUtJO55LFcy8nBSojRWf7uo5PDiCOiNHrmvsYBeIYR
   dNXkNuNnLU/34m/veb8PMIUKyScZnMqYpoTEcvedUUjns//IWFaK/QUpb
   2VBp3cwbi3MLBTZ5AqQ7VdQMOWghvgPeOayBFnVb67MYtQrUDQikznEXv
   K6CM8flemvFbPYhhdY2dezUfcBOYkKpvcuKD63mJTO5x2UU2E6+F02DQr
   iBi23Ee5GmP0j186ILXETcOsjjeOLXMLOTfxU8ghqXfz5WYGV5pUv5WEc
   272mJwaCX6ZtuxVBNGbYGNf54J82lS+mD2BJpOKvBgvO4FSMpQvgQfMek
   w==;
X-CSE-ConnectionGUID: zriZfQOcRmKJQfA62wxenQ==
X-CSE-MsgGUID: oemzrbcoT0e8DHlapdpz5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="75408814"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="75408814"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 03:51:57 -0700
X-CSE-ConnectionGUID: Gcx246s8QzS1hlSo4QaiYQ==
X-CSE-MsgGUID: LOQAsz+nRp+cPfHvqxY0Eg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Oct 2025 03:51:56 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEQG1-000Lqi-2L;
	Thu, 30 Oct 2025 10:51:53 +0000
Date: Thu, 30 Oct 2025 18:50:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaming Zhang <r772577952@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] net: core: prevent NULL deref in
 generic_hwtstamp_ioctl_lower()
Message-ID: <aQNDDs9GWt73ekNu@fb33b90f3739>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251030104942.18561-1-r772577952@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] net: core: prevent NULL deref in generic_hwtstamp_ioctl_lower()
Link: https://lore.kernel.org/stable/20251030104942.18561-1-r772577952%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



