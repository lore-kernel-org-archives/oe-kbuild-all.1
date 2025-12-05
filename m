Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A4B1E376C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 01:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764897050; cv=none; b=tmhWtB3STcy4rs93KrnyK/5Jbb8Xfb8eqOw21NrIG3Tlba0Giob7uUhfcvkFP94Xqs+1jYfuF4T1xEkBX72bgBQjFucvHc1zuENhvVAHu9bh1/229/RWg8VuBObVXShllvXIQyECIcqBSGzqHvNUBhm6V/gA20YOMQWEbfabbDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764897050; c=relaxed/simple;
	bh=V/pZ0+5j8GI1XB73UqPXU5q8OD7ftU6yoPkvSqd0YPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=StvIVaB/2gPEU6Sprye1znuXaXIhVvLkYFr24prqtjd7lQv+6nDkA7wqN4u7FcAtWwpdrdVNsJdLGolS6UbsxyZQGKQLrCa6y03pEgCQ6ofW4bclTOhe30FxbW+UAzP8pDTomeSmptiH3ce1Abw6sGmcxFbSHRbXKhjAOVOIu9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQGdicrM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQGdicrM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764897048; x=1796433048;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=V/pZ0+5j8GI1XB73UqPXU5q8OD7ftU6yoPkvSqd0YPM=;
  b=KQGdicrMqIoxhcaOkLz0TlVX7c+FxjIs6M+GBOQrZ+pCvJRLplbGBM5H
   Vq3HtLcgIJrfzgh9A/lJkyVUjhuh2Ukt52fpdKxnX+/C+KI79GL4W0/LE
   +gwLVEg2e7vTIshuqpGxCw7dA8SQU9CPYUMSs5Jr+tkCwirO222UP/Scg
   NvnRPf2L/bYbXStSnVpJL6EjcckkX5yuYhirgj/X1d2zwdckK0nOUIfFA
   DxDH5nDsNv5o4F2FxIpVwCc0M1KrnEx4zflQ71z0T3Kcp5CqUE+RbFljD
   KmZqHbsgOKKpu8mRp/xCIbssEGFAIeklZy7R9Hv4oEWGNVMMBA9LhSDyw
   w==;
X-CSE-ConnectionGUID: +IizzRj+TIO1pIYz2pjZsA==
X-CSE-MsgGUID: 3ah00OLsRW6HhJEiMrNb3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="54480057"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="54480057"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 17:10:48 -0800
X-CSE-ConnectionGUID: jsbnRCBHRNOaJ5XhO1U9BA==
X-CSE-MsgGUID: Q1xHz3WrSxKuQUniWsylBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="199317573"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 04 Dec 2025 17:10:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRKLM-00000000EQn-1XVh;
	Fri, 05 Dec 2025 01:10:44 +0000
Date: Fri, 5 Dec 2025 09:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [6.19 PATCH] nfs/localio: fix regression due to out-of-order
 __put_cred [was: Re: linux-next: manual merge of the nfs tree with Linus'
 tree]
Message-ID: <aTIw2nOEhZa6YF-w@0bc2809ec63a>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTIwhhOF847CcQGl@kernel.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [6.19 PATCH] nfs/localio: fix regression due to out-of-order __put_cred [was: Re: linux-next: manual merge of the nfs tree with Linus' tree]
Link: https://lore.kernel.org/stable/aTIwhhOF847CcQGl%40kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



