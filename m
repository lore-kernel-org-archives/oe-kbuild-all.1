Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC142882D3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 22:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764627102; cv=none; b=udiml72/oJ+5WhG1FdRlyKpy1p8gpI5B0hC9KX/tZD9l3dD+dyUDjVX6e5RXwwvc/CWUupNDF7h41AzW0zcycpw/u10PVC0Tgv4FApqiUD/olk2g7sKwwU/EkWUaxtTl8OuZqCT8EVoJjP3ybFWuM37SaTdzgDqK4oMk9tZH7kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764627102; c=relaxed/simple;
	bh=zM5zL4ZH0X5e+aoYJf0BBh5p2kFeFcfgPBfnzps3Hwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BTJRpskhVY85+ciIQPteBtLqOOv/LjvxOAZvfLA+IlMgbgoNgC0B3hOv+88R/J5Nj19ARpKw2XwthEFUHwtkUTN26LttNofkT/Zr7UJ68xwHFwSs8kC+VT+uzznLrZGxlT55/ra8BgHmTMuPDybqKfNzT4LYofsFYpJyAzPNSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JAqL3g/q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JAqL3g/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764627100; x=1796163100;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=zM5zL4ZH0X5e+aoYJf0BBh5p2kFeFcfgPBfnzps3Hwk=;
  b=JAqL3g/qSyOfr+xE+PDGcEDldB6v4RaLvMDeLmUneYM/pmbpaDLsGeZd
   Ts/V6P26jtk5RMSj1EaZ+7xfov1/vUxM1e+m1OI1HAc2ZNQvuCSeW/TiQ
   urkslGxTNOoIKzG7mXOznDMuQG4nQdHuQfvfyHf5+nKr3hwW+ACrMJC82
   PLBIy7XzEShsfikpmfwhza+Z/1aYyBVa2ShBnYZ0aTgW8qfKLnsJQj2j+
   imh9fUaOSSX0lCJeHMJcG346cq0Zx0KoUnzHvlamgFUswiDfErjhqMvl0
   vA2Tt113z+4sGVJquroIq0pqOFAXuyINw5DDY26VNanhPnveCeHsCAYOu
   Q==;
X-CSE-ConnectionGUID: 2TqKJez3TouE3hnZ/Z5igw==
X-CSE-MsgGUID: 83xuU/nwRJmafrFjo4uvDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66529037"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66529037"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 14:11:39 -0800
X-CSE-ConnectionGUID: jyhZjJBnRPmfFIncZEMQgw==
X-CSE-MsgGUID: BaUbqutOThaaXxeW0aezbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="198568345"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 14:11:38 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQC7M-000000009BJ-0WGY;
	Mon, 01 Dec 2025 22:11:36 +0000
Date: Tue, 2 Dec 2025 06:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Farhan Ali <alifm@linux.ibm.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/9] s390/pci: Add architecture specific resource/bus
 address translation
Message-ID: <aS4SjMrgP4NugXOo@656a63d76ae5>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201220823.3350-3-alifm@linux.ibm.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v6 2/9] s390/pci: Add architecture specific resource/bus address translation
Link: https://lore.kernel.org/stable/20251201220823.3350-3-alifm%40linux.ibm.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



