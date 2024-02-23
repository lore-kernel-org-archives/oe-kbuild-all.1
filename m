Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC558AC3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708681639; cv=none; b=pTaTRObXI8h3F74qdpY4Jx2/U/b7lulWC5xKO0CM/HGpCrhdH0rAf2830uqBuPSZhzMgBnPC/hmGmT+VUdp6NuurdTyFtdwtSeCiLwOX0JiSDL9MUOUa7LysLLjkao2JjD6hYm0jZYYNFm1Iav92yZVnf0mCoKJSO58921XLTOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708681639; c=relaxed/simple;
	bh=Rt6ckNSmYobf07owV1oOk3uLlu9BtoPU4Rk0tDifgOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oRnNKOQx08iYboSH4SG0DTN0mcILij0Kkn6j68E7OESJszy+oM2xUNn3VAXlDuOh21/UjbgZGnY9RFpwIho4gp62JLmV7G5zTINchyUJ8YOvKbS9sZmyAOnVaDgt2Bl/kIC4e3eqhEbkrMbAGT56njqPdaCKlf0M9ipU+GCTxt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1nZibiH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1nZibiH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708681638; x=1740217638;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Rt6ckNSmYobf07owV1oOk3uLlu9BtoPU4Rk0tDifgOs=;
  b=I1nZibiH2t5970h+F0f462+tHl0qyqhs/VUOqt8TA4qEVqQ2Kp4rj/EF
   +lhdOUv4ZFlAg7w2eZGPhJhxyq/Zmgv6l6NSf9wWSzdPBMfTiUIfCyrBn
   gCUVB4d3Pfa56HTiGqIuBGL/F2WkR9j7hm8q6WxClzLRcAQTTOgvc8nPr
   hYOiQDgPJ1QyMMl0dq05JKUUuSzm2ZmmVyRBThsTVjHivte2CPJo11z8U
   KyFOdQasfbt3iUYdD2GvcIrnUJ9FX6nr0k8OtkqWMLPhbFl/YXsJCuSZf
   cfYi7qDRDwQQH+q44LP3mCVzSJIQuHDzQ+B0Lm9TR6SHnvWG8sgMINTgS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2837981"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2837981"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 01:47:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5831521"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Feb 2024 01:47:16 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdS8r-0007IE-05;
	Fri, 23 Feb 2024 09:47:04 +0000
Date: Fri, 23 Feb 2024 17:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nikhil V <quic_nprakash@quicinc.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] iommu: Avoid races around default domain allocations
Message-ID: <Zdho6DA_H2a4j2pO@fdb2c0c3c270>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbf1295589bd90083ad6f75a7fbced01f327c047.1708680521.git.quic_nprakash@quicinc.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] iommu: Avoid races around default domain allocations
Link: https://lore.kernel.org/stable/cbf1295589bd90083ad6f75a7fbced01f327c047.1708680521.git.quic_nprakash%40quicinc.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



