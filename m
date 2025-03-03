Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A3122DF8D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 16:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018109; cv=none; b=HETLgQLzKS2OB+1YnXkMKNe6Mbn9aVLsPJgvA0MoNdw2SsQOKP4iTp4PqgjKPtXhvdxDlCpzqWrTzbLEvvtD9oaORMo+9EVT839XXi9D+mndeqBEZ43WX7ysLAOchkdS3yEIUwMdUrHJK9b37V/FKjXouSplN7IslUpD5KZ4/lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018109; c=relaxed/simple;
	bh=kc4cED8BkpIe6+ORUtgVH1zeDWEgNJCwiCF9QSupIgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ep2Eza8lmY2yAyQcmrC0MQeyAr7/RQvhn9JpaILXylvAfGbW4csb2u9EbG4QAJqPhWLfA8GeYrPvMLzfIGsq/n7+wIZ1Js8BkjIDrBuvOLrUzMNP4eWyOC1Tg2F633kLEwqDRTu8iDlgYFCAKPg88t5AICMDGEULoGRB9vDNAC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7xBYlF4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7xBYlF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741018108; x=1772554108;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=kc4cED8BkpIe6+ORUtgVH1zeDWEgNJCwiCF9QSupIgI=;
  b=E7xBYlF4NbH3hZ+vLKq0Vnv6l252a3XFm/BTA32Qc8YIXeohnLu6BJgo
   Bx4fgeMuAYgMiFcGVL+dbvYJIeF4e16kIkbjLQ56t07XHcHu7Yw+s1aG0
   1UjMjfAMx+1UML+sqU8s8xJZxeQz1RlV3sgy27kMVIp69iHSDHXOG8kn3
   HebVslWAcmX5jVQgjHToSbgxGjxwKdVAU2fHeiEQUVZUi7aHPLTP5KjGO
   MdwOeRutalEoKWl7E8KlM4oohajTF9pcTIoDt4X+P+gYpLYBW3hLisdHU
   grdryH7Lv/2c+i6ZlC0ZFfzmdyrwtUtn79YtH4Fxf1ScliNU1dlA1k1tM
   w==;
X-CSE-ConnectionGUID: rIVX8pLaRBO6/1grplWe1A==
X-CSE-MsgGUID: wtGGOK70RdimnGIOQiMvWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52106642"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="52106642"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 08:08:27 -0800
X-CSE-ConnectionGUID: +fGqiv2xSSS3jadHWaUzIQ==
X-CSE-MsgGUID: 2KET8S0ITiCVLocNvDJ8NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; 
   d="scan'208";a="148884876"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 03 Mar 2025 08:08:27 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp8L0-000IgR-0y;
	Mon, 03 Mar 2025 16:08:20 +0000
Date: Tue, 4 Mar 2025 00:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 01/19] media: i2c: ds90ub953: Fix error prints
Message-ID: <Z8XT7d3Q0dc4ygN9@aca137f0053c>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-b4-ub9xx-err-handling-v3-1-7d178796a2b9@ideasonboard.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v3 01/19] media: i2c: ds90ub953: Fix error prints
Link: https://lore.kernel.org/stable/20250303-b4-ub9xx-err-handling-v3-1-7d178796a2b9%40ideasonboard.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



