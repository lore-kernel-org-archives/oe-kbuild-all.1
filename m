Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A8779FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726835452; cv=none; b=GTebiwSFnEx68ccQQ69fFOamT+RHQDyiuQeVCCfNYyQcWbCEc8so0pAOmA6HuR+YqQ7aFRagmE1vC7pCDBfZhTF9ymMeEpb6AvuJPvWtdMnJq+1L7TMYY7HY/jQSROQup6c9wt8A6HVwVCQ3yoR6b1RUxw5tN6tVZubbZIxHSi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726835452; c=relaxed/simple;
	bh=jnEUeVtfOZOIT1IMk/BasFNOEoxebd5+xbBcGPr4DI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=m0USZob5XfZa5jmjOdfxBAmyhc+Qsw+pLFST3H0YY6mR0Lus9YUvuhBQaKnBbhAJPnZc82sT2chAxlGeSYvKuuM1sMIybP/eeFEjIjyWH3bm9vmmWxVPAY2sVjEKgWkNezYBr7qMq3Qq3Q+cTs78Fcv8Po+k45SepzjIPPlFfcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VXjK3MiV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VXjK3MiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726835449; x=1758371449;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=jnEUeVtfOZOIT1IMk/BasFNOEoxebd5+xbBcGPr4DI8=;
  b=VXjK3MiVIIfJyITbKjb522fXAWRU8sE5kgQeYWQB1K8Si88N+NPZAKtE
   HpzLCp6n4XgEEwED6DYWslIYmHfthtnUVGHBKNe9eXnv+Bw+GbetsTES1
   0WV1aqysHy/quvL61zEWnVXDzzFqYAyKmQI9jwUSSWoK4U8K2BNQMVJGu
   yRHNSuPiSRawuzJD39HP5BynxT2pgI2MAfhbqt/efcTARolsVwMQUsa5y
   Jg48Isln/dU6VKw74VgTvTUk6UFG3U7W48ulR+F8Nd6ou9tuExWoJ6svr
   vrz3rXM67S0OaEZDBFYMfwxcw2NWlnJwLqZZ7RecnRh49Z+sj7M2dRaxx
   Q==;
X-CSE-ConnectionGUID: 6sjFkb9DQH6LFcSjdWsRWA==
X-CSE-MsgGUID: WVmHJhfoQzqSTMKuggC/9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25783059"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25783059"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 05:30:49 -0700
X-CSE-ConnectionGUID: 4yl44i5LTJamPcVwi9BwyA==
X-CSE-MsgGUID: Gq6tNk/nSS6WLaUJVlzmMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="101117334"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Sep 2024 05:30:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srcmb-000EOL-3C;
	Fri, 20 Sep 2024 12:30:46 +0000
Date: Fri, 20 Sep 2024 20:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Sun <sunjunchao2870@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] vfs: Fix implicit conversion problem when testing
 overflow case
Message-ID: <Zu1qyk7bJYUaxMf7@483fc80b4b15>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920122851.215641-1-sunjunchao2870@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 2/3] vfs: Fix implicit conversion problem when testing overflow case
Link: https://lore.kernel.org/stable/20240920122851.215641-1-sunjunchao2870%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



