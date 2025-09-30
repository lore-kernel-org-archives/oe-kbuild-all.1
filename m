Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A5282EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Sep 2025 03:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759201369; cv=none; b=kuKDvRrVqM8/VgnTWco04pC83usLPMNeSwlVBwte/2136M9nHzOb6YCW3U1+pGjiKuX9V2k1kQCDgFPN33Mz1yGyRguoX6LQexI9tWc82Tw5yZdMNUgnVJ/WwSGtaz6o5WwSawpB4f9mW0lxJ1/k/muIQdNFaZH4tpkwbNGTp2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759201369; c=relaxed/simple;
	bh=on5g77PuZQQkoQd3EtOngkMohMT+XU7hI06cwtN2RFE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ibWGXjx9hORoggKZhB8D0zh9uhtnYyBsrIxURrEI0XCLFS8u6JdHKCJU6OP+1efrgKAeF+5j/+j9W9MBRLN2HrIjH5CPKGw5wwBugKtEMwJlcy2AYnI/uZtFAEWL12FdR5GSc5phBHhp1pcy9kc2a70PDn02oMCHt4Z42FiZdyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BynRvaeS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BynRvaeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759201367; x=1790737367;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=on5g77PuZQQkoQd3EtOngkMohMT+XU7hI06cwtN2RFE=;
  b=BynRvaeSRs9RhIWQisyztfFTVudhFsLnSzokJA+LDf+zlyJt8lYPL+JS
   bNcon0zKmJAWJS86aMVE+JKlJNM/mEN9dkBUnoEToYQ2Z06blc/hk/1Nq
   l8OsxLIKM/Xy/07Qy3ySW2p9NqAA5SYHp6gznDqMPQqF/aTVIRHem3dyM
   QNrb7ngBWEt9oGRU9fgWONmeDthGvcoHFozxezi1gNDFQMy/tY8RPZbi2
   iG9KuOPdt/IbzRbuiHNyaUE2StvEQXbN0rUTUeqBtpUbh1xQOe9rCvRnN
   AUdO5mTgubojONovsD+x31XnCmR668DDogcffUpGCmjJEpBSY4tkh9S3y
   Q==;
X-CSE-ConnectionGUID: TdP/PWEPSbSBOhnJ+XuBeg==
X-CSE-MsgGUID: DLs0R/ipRPu4pt9BsDtbsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="84064304"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="84064304"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 20:02:47 -0700
X-CSE-ConnectionGUID: pDp1QkE+TrOCXp9AZYJ0Lw==
X-CSE-MsgGUID: Gu5+VIELS76A4ZxT5ggl0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; 
   d="scan'208";a="182683881"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 29 Sep 2025 20:02:46 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3QdX-0000rj-1G;
	Tue, 30 Sep 2025 03:02:43 +0000
Date: Tue, 30 Sep 2025 11:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: Celeste Liu <uwu@coelacanthus.name>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] net/can/gs_usb: increase max interface to U8_MAX
Message-ID: <aNtIJSwcpQVqRO_x@d6e5159408f2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-gs-usb-max-if-v2-1-2cf9a44e6861@coelacanthus.name>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] net/can/gs_usb: increase max interface to U8_MAX
Link: https://lore.kernel.org/stable/20250930-gs-usb-max-if-v2-1-2cf9a44e6861%40coelacanthus.name

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



