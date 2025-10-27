Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5ED30C35E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Oct 2025 23:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761607728; cv=none; b=MUSNIbK7RI2Tn5fvAxod/CAmGx6gUo0rh4831UYN3ax9atQQMDnHoCto0Y1oPvUoI1ATy4hAnP9fYCodXLzQYJvM5IgP7k8PpahO41kTsYgx0DM1o8oL13zPazlEF82ImRX5TLNI3LdEInGhCXc/8mH4NV/cgzP2c2OE5yiBTqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761607728; c=relaxed/simple;
	bh=OtuSsErLL0CzwBJFr41jS0iUIamZOAPW5rtpImvk3Us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=V70X5N6Gik1yOe9gjJFTWFqb+quEtmCmBk7X6w4fQLcw1xqCWw0Aomv3Fbs5wwP5GEyZ+ifjCkBOH5B8cUB6CJUcRKFd1eE34HeaEiuU/PTsLt9IZUtjkW+AOj5pIjppHGd7t2JmdTuxoRLfzVIsPIs+yluI7UmELc38fA2Tpnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J15BArGa; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J15BArGa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761607727; x=1793143727;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=OtuSsErLL0CzwBJFr41jS0iUIamZOAPW5rtpImvk3Us=;
  b=J15BArGaTldZ6BONo+rrT9gBmRkxoUdLhL55BxIDrHqsq4jXUmW9eDOF
   du5e3HT/qfZdW45hxUosg6EadvnGEtftH7W1Rf/RYKa3o+HioI02sMHSG
   iknZTDJX3fkB2OkEIU6iBjoZke7U/TZOHvQ68oAhgKX2iR/WbPtP4bgHo
   usLwtpsoVwp4gn3+E3NU6BQA0sUaXq9casCpFo6C4nzq22luSltc/dUW+
   iLxVwt3DGucbdf12krVGKWkUHiP6NC/vRP8Be1l8XXDjailBBi8LInDGw
   uEA85MhYU7pKPXOY1+61GxBW8q3egLTsSj454RVyv1G5U/1gLCnkma4pk
   Q==;
X-CSE-ConnectionGUID: iplVzJ4FTYeiesIpUmgAhw==
X-CSE-MsgGUID: bV1rSZ38T3GyrYGRiVsC3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62731208"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="62731208"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 16:28:46 -0700
X-CSE-ConnectionGUID: QO3+Eri6SMSfld9y+KuABA==
X-CSE-MsgGUID: XSbQ8PeHT1a+zZTP157A0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185271075"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Oct 2025 16:28:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDWdm-000IZR-31;
	Mon, 27 Oct 2025 23:28:42 +0000
Date: Tue, 28 Oct 2025 07:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Vasilevsky via B4 Relay <devnull+dave.vasilevsky.ca@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] powerpc: Fix mprotect on book3s32
Message-ID: <aQAAB56SHIng8CGt@fb33b90f3739>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027-vasi-mprotect-g3-v1-1-3c5187085f9a@vasilevsky.ca>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] powerpc: Fix mprotect on book3s32
Link: https://lore.kernel.org/stable/20251027-vasi-mprotect-g3-v1-1-3c5187085f9a%40vasilevsky.ca

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



