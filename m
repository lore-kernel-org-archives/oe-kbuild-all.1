Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFBC3CF680
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504828; cv=none; b=Lvwb3FgPd8cd4FABNvxeSzOEBShgdtAsCgWYJnytQ0FtIx+UBG6fWVnEzZu78rj2NtCz8EXHapE+F70KQiPpWJv38DoCkxzMQU2FOXSsKzsME2yaRTPIpM/3ltxxIu81tgqBhfTIkDbJ4J/+6XA4lzOV7NHRYZAbIEQpdr0KVIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504828; c=relaxed/simple;
	bh=9uFyyfbgNXQQcUT4tL6+En5N2+16uSg0FGbhy48bttE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uyul7SgGD2zpDtUqzKSJQ2dbI0/JuMq5MRxNezpCeJ34K5pkjPiQKWQiEdyhRyCYLOlR14URe03QBFMne8TtVuvI/q9NfH6XvQjaDNPK7XB4n23gnqJZofWCEvyQeTNbyi+9CQTigKGqJhR4z8JFZ0AtJ07oMME293B/+wOKu3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URxJIBQK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URxJIBQK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778504827; x=1810040827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9uFyyfbgNXQQcUT4tL6+En5N2+16uSg0FGbhy48bttE=;
  b=URxJIBQKDC9KgjPDZ6OZU4cm3YoW++yPIFwp12JBo8e9Y/0I9XqY1Eae
   ScfMgR0bGlvdl8nSAuK+AuVzw2FHyzbB0Kej1584BinMuqTwVMX60DLo/
   E8rjJ94Hgn91el1b54ZoCHboJMG/9OU8/kTwpTQ3mjIh/NLZhHap5ZxDY
   Vyhihs2Ne3G2Xdnnfh+AMdEwcAa0OXoSDw+GENDyv3tddBTk1ekSqhRQV
   hJHQ9nDQi+tiJTk+U7Pde4hIVfIWvfX1pej0nhD5B2YdsyJZjxfv9nQTT
   RLoUlO/8WVOgAMRvZ1be1olrCD+js6H2lbAJkCtU0+Z/D2xTVBDFvkz2q
   Q==;
X-CSE-ConnectionGUID: 8GgTpPJeQ6Swb9pAyrlglw==
X-CSE-MsgGUID: sSAir1MnSfeRBRTzchOwHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="89693260"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="89693260"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 06:07:04 -0700
X-CSE-ConnectionGUID: BswCYtuiT1Sq0oIzwwuOvw==
X-CSE-MsgGUID: /FGlMJDKQdWQ5v4mXbApiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="233121520"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 May 2026 06:07:03 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMQLc-000000000bx-38e2;
	Mon, 11 May 2026 13:07:00 +0000
Date: Mon, 11 May 2026 21:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: Re: [PATCH] nvmem: layouts: Add fixed-layout driver
Message-ID: <202605112100.08bk8fTf-lkp@intel.com>
References: <20260505-mathieu-nvmem-fixed-layout-v1-1-7f6ecbce108d@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-mathieu-nvmem-fixed-layout-v1-1-7f6ecbce108d@bootlin.com>

Hi Mathieu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7fd2df204f342fc17d1a0bfcd474b24232fb0f32]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Dubois-Briand/nvmem-layouts-Add-fixed-layout-driver/20260511-170834
base:   7fd2df204f342fc17d1a0bfcd474b24232fb0f32
patch link:    https://lore.kernel.org/r/20260505-mathieu-nvmem-fixed-layout-v1-1-7f6ecbce108d%40bootlin.com
patch subject: [PATCH] nvmem: layouts: Add fixed-layout driver
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260511/202605112100.08bk8fTf-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605112100.08bk8fTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605112100.08bk8fTf-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/nvmem/layouts/fixed-layout.o: in function `fixed_layout_layout_init':
>> fixed-layout.c:(.init.text+0x18): undefined reference to `__nvmem_layout_driver_register'
   sh4-linux-ld: drivers/nvmem/layouts/fixed-layout.o: in function `fixed_layout_layout_exit':
>> fixed-layout.c:(.exit.text+0x14): undefined reference to `nvmem_layout_driver_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
