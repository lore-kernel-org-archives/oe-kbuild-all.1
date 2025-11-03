Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188DF86348
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 10:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762164738; cv=none; b=Xl2DvXaTQ4V25fDV8Z44w3cOrXdikt3s/Ywr9Cr3W0c4SnX4fWl/d48klPP/voJz8OWLJ65WN8GXNrl4ElgzFgH6fzSehhcL82HwK34p1IYSAi2imlJb90tdqZhNC4ldKHGlGNAOZY/ZDqO5H2Q16tTa+1HutvJJ7Z92e9Ih47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762164738; c=relaxed/simple;
	bh=Dhrf/ZSPHxNKGbpCK6A2WKJeqci3pmjomvuWHH69ZQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UPWNstXjXnu/M4jtV8NFN5gw5wbGl/EW/UYI9IdixZQhE5dxoCnRfJ00SPY2tR3IeA7KH2YuulLa5DeitiMf6MiYn73vEFH550jsUUIqqAJskUjJZypIT5/1OJyfW22RU3zRyc7CJaaRtlbOd4VTVb2XxbIctPD3uY21sn9uKgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U21rI8ZA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U21rI8ZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762164737; x=1793700737;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Dhrf/ZSPHxNKGbpCK6A2WKJeqci3pmjomvuWHH69ZQc=;
  b=U21rI8ZAxyQfhOxlqlt2PdNrnYrDI+txEidcdEzkpXIuL1FPzNuBInm4
   MmZAccp+tPQzCj/3gCuncTkgvRddO1EJ3RAqHkpnHQOEDQTUbykPUsk/k
   TaIzhY1I0HFCgI1oyrfMBtncy18Td7HLFYMq6ykME9o2XRXzU1T4KIN5a
   tD/ZcMjO5/1EMvhMxQssQXVcBhbZcPWjUaUN6FXvSCvNm33/z8E6eDclc
   FaAz+ubEkn3MOUwfxZuEXGgUY/vfdh3+1NzPSrHj1dqKa/EU2/pkfNAF6
   4bciAp0SWSpEzmjqrEv0lzrJtUoIa9YxFFav6ls25QdkUgGiZkF24TUYW
   Q==;
X-CSE-ConnectionGUID: t3Q28LTnRdCIo3Z16BRT2g==
X-CSE-MsgGUID: 0zrVKbhbTJON2QgxOm1bOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64124539"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="64124539"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 02:12:17 -0800
X-CSE-ConnectionGUID: F2NPJ8zbTQuK9KbUZyCB1A==
X-CSE-MsgGUID: E8fRRqosSwWoHYJH3TUcaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; 
   d="scan'208";a="186782300"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Nov 2025 02:12:16 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFrXp-000Q1U-1a;
	Mon, 03 Nov 2025 10:12:13 +0000
Date: Mon, 3 Nov 2025 18:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V
 regulator voltage
Message-ID: <aQh_znihmYjnrzpR@021eb7b9f88c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9232ae8cc8e7eb4f986734c8820f44b7989b9dae.1762161839.git.xakep.amatop@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] arm64: dts: rockchip: orangepi-5: fix PCIe 3.3V regulator voltage
Link: https://lore.kernel.org/stable/9232ae8cc8e7eb4f986734c8820f44b7989b9dae.1762161839.git.xakep.amatop%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



