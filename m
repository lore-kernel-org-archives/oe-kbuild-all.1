Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5B51C32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 06:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721369350; cv=none; b=lbetf5LvKvZuI2PJdnWLqg5+UGAbwl8Dm3AUnF91DJMEjxrhrkgPspRx6e3w0kVAtk9CLXZ2U9Rru4i9Pwb8EUd9O3H6VleWzsewXTI3YgySjeKX38pwvrHI57G+hV4W3HsBJOpk95wB0hbDvLoF7wTkOZyjMnAXk+cbJb/0dNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721369350; c=relaxed/simple;
	bh=63NgMHtiYe+DD3cy3k/Legvj6DKqNzZn6wBgNuRtgLc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MJ62NFewh6S8Ylw9t/XpDkU6xTNfGYpJi92mzQxH13RquPMrWbY8sdv/FEhEurAwTISCIrlVXHRpCSJTy3NlwSsWLHfADnoWV6xHIyuWOhRzODERkznr+MDsubCNCR9ZqRYAoOtMI1y2HT2XR1qug28nTgs9tl9WeBH73mHb//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X8h91ysv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X8h91ysv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721369349; x=1752905349;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=63NgMHtiYe+DD3cy3k/Legvj6DKqNzZn6wBgNuRtgLc=;
  b=X8h91ysvpfEJbGOTwho9s8gEF0p8pOuOJ3BblDZK1YXo9BVLqAOm32/O
   xDRGYCLEX/1kTIpgnPdfwl6Pz0xpjbWxEucnnExBh+VbdndYySbf3ltAo
   jH+oFbIM/zkFoFEA8lODnXqXeTSNLwOk5Vq1GVyZiikrCr+gMoLDBeT/Y
   PDNRGMDGp2sEVUSCfZ0lmpdW5SR0TbXUQtRNps4EQnvmzXTC2eFYxU1Au
   bqdMGKnwASNto43C0vNcMvkfuUK65lhUWe0C21AJ5KuxTS0tVU4eWPswy
   AuTx33MS/AIsbs8ODvVr/uOd0r9FzIBKOtbxZG+sdAv/JntoqX2bsM3Ed
   g==;
X-CSE-ConnectionGUID: uIR+fvAoQ7K5lXK6FAvNvQ==
X-CSE-MsgGUID: NifHLzZ2RPWGXfzlHbpyzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="29549164"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="29549164"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 23:09:08 -0700
X-CSE-ConnectionGUID: CHNzlxQLSCmuzYwf4nQFeg==
X-CSE-MsgGUID: pp10DCx3TVmAqzQfLhv6XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; 
   d="scan'208";a="55859354"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jul 2024 23:09:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUgnh-000hu6-04;
	Fri, 19 Jul 2024 06:09:05 +0000
Date: Fri, 19 Jul 2024 14:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 4/6] ata: ahci_imx: Add 32bits DMA limit for i.MX8QM
 AHCI SATA
Message-ID: <ZpoC6GpQ2dliYpUT@6724a33121ae>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1721367736-30156-5-git-send-email-hongxing.zhu@nxp.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v4 4/6] ata: ahci_imx: Add 32bits DMA limit for i.MX8QM AHCI SATA
Link: https://lore.kernel.org/stable/1721367736-30156-5-git-send-email-hongxing.zhu%40nxp.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



