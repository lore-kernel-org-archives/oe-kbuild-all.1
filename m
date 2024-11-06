Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33552EAE0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 15:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730908327; cv=none; b=A5HJtx4QoffU9dJUxdNGuLJP7ZG1pdwiyIZcsQjBRv3K3tX6Dnxkp+EqL9t361cNYtvAgmdzC5CMJQtzpMxWUXaUZ25WbmlMWb3GYKH/FMcbKFMBDTrXqVHECwHpfHFEiDsO9ovKLOWj9r1dDMIT7Xj5EHfmiXPnctGQcdv5trM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730908327; c=relaxed/simple;
	bh=sOQKraW66ddRUMKdY1tWwA4HbJHXV+S5hai7mdThO5M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FiRklVLbSP+1jkSVKHLyXftDv1b7PDJUkZB/nwlmadJfEFPGbiJGX4E+wf6MvjdauyPI+nYp3RIFCQIbZh8Sj+275PYq/m3j8AYevBprvH4AhFcXdsPOfbAImNYFuVHTx3+CombQ+2+8BPFEHKZk9CClMVTBjWMjjkadUWqaLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgVfTYn4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgVfTYn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730908324; x=1762444324;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=sOQKraW66ddRUMKdY1tWwA4HbJHXV+S5hai7mdThO5M=;
  b=AgVfTYn4lOL8ZkUTxtAY+CzDgHJJpmhoznXnsT/iQopJDC2FPOZvOcWL
   blX3WgzYmLHAZOPJhHdwm2sTvsUhbtHIQA5xhGc2Xg08C71H7saHc+HXW
   32nC0DhV9NZ9FVKxmArbgFkn1Z9wVpiPnVj0FZ+plRIuRfftxIybsXewf
   sMn3zJbELUuhvBZTP7QWu4Ny6oQlMutY2vTAzqYUz6DjYq/BbAeY4bHf8
   EsbItYHhhBQt9/xqep7DF3YmZBbwpc7cBL7RmSUgReoISvHvL/UPca6ed
   7nfmPeinFJQH/QstMkVnCE7u3xlgyRUVfPh5jvy05KfJq1TwR9ZibZ5fa
   g==;
X-CSE-ConnectionGUID: nnv01POWQ2eFyoGV84FIVA==
X-CSE-MsgGUID: 3upgfaU/T762nWRGT3lX2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42111787"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="42111787"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 07:52:04 -0800
X-CSE-ConnectionGUID: QiLs28etTdSzT79vRhPQXw==
X-CSE-MsgGUID: aCScR5mPQ3WPeMIHGVax5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84569563"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Nov 2024 07:50:21 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8iIU-000p5I-2I;
	Wed, 06 Nov 2024 15:50:18 +0000
Date: Wed, 6 Nov 2024 23:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] wifi: rtlwifi: rtl8821ae: phy: restore removed code to
 fix infinite loop
Message-ID: <ZyuQORM_Z6ocJPd0@a6d8444ee0cf>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106154642.1627886-1-colin.i.king@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] wifi: rtlwifi: rtl8821ae: phy: restore removed code to fix infinite loop
Link: https://lore.kernel.org/stable/20241106154642.1627886-1-colin.i.king%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



