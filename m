Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7A54907
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 05:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909448; cv=none; b=GxrIBqEdScKntTroIVQUvABvNa0BV4g4OQerAHyhShgNEX3T4KDZMiqh8EB0n8kidS4UXNGtQ+QN70LKaUUy6oldsUIHhztu5/EWp4TJDNkkXzAnqD77BYGE6YsPl/12Wb9sYOENXZLpZfxeR75XdddFa96dvqhZ/bAvtI+wnuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909448; c=relaxed/simple;
	bh=M6veCLHdITC6DmPjtkoPClf8dMg9R/30JNXdOP6WVoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CH+5zsfNGRbIkTysO8X7QGHuTahFeOL4gvS35xxEoB8HX9lQwG0a9BvnMX7pW9l6IdiOwNWb3rpICQd7kJxaQufm6MRu+0zDlXW69jK5L0VM3gngtZ7IzREOz24ggGgBpmqUTutXZlaNHC4ErbxFrMYEDu4DoSlQ2T27516OLPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LI+ApbAm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LI+ApbAm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724909447; x=1756445447;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=M6veCLHdITC6DmPjtkoPClf8dMg9R/30JNXdOP6WVoo=;
  b=LI+ApbAm/CRgcHoh2AkyZus4wBgNettcwP+aVZUjCxelHw7NWmLBYTSs
   11s5DGsbiNVpSQFjG8WsU4P4xs6bsZlbvxEMRP5Oe3VF63vQldYT/aXBS
   PryTXOW3Hzz9QeqDjKFAld6tu8ynd2Y0SL4WFGlrMxz1JDZqxDwugDe5q
   2VqygXOxFd5A34PTrLl/BX+uzR1biuF3auvKOGkAaDEUDjls+eTJCHM42
   fDt8VRoC+jdRbvTePO4289FDpuBrOhB20+0tPdlDpzbI+c3SHpQdn3MRZ
   vkubz/6BS4Cz9w0tNNwfWwGxtTOFvmvpAbLFzJLkA5OGH5xzFwsVuRgTA
   A==;
X-CSE-ConnectionGUID: jQbwxLhGSymkrpLdWwZbVg==
X-CSE-MsgGUID: bRp0R0lVQ4q9nngVnWK/Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40981755"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="40981755"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 22:30:46 -0700
X-CSE-ConnectionGUID: 0AuK0XlfSiq8sYQSNMbmUg==
X-CSE-MsgGUID: t74m9ER3QvSqBdGkr2+nYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="68124163"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Aug 2024 22:30:47 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjXk3-000LjU-2f;
	Thu, 29 Aug 2024 05:30:43 +0000
Date: Thu, 29 Aug 2024 13:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] clk: rockchip: clk-rk3588: Fix 32k clock name for
 pmu_24m_32k_100m_src_p
Message-ID: <ZtAHa9WKYMSzVZZJ@7c7b91e09edc>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829052820.3604-1-eagle.alexander923@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v2] clk: rockchip: clk-rk3588: Fix 32k clock name for pmu_24m_32k_100m_src_p
Link: https://lore.kernel.org/stable/20240829052820.3604-1-eagle.alexander923%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



