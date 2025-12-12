Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994551F0E32
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765544879; cv=none; b=g152+kKnBu2y9YDG9FttozwOjOOwrObwI14rDPzv6LmjI8MS+8ol73chmw9um2a1cJcGZbn+ADO0dJgxsK0Q/euc3OqdBvEtGJ8ndzVIQfMAMrYB4MM6A4KMow+2r6CA60NOgmfHCdM2GTZTXOLfIzVHkLCFMBPU1GitF8RiMQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765544879; c=relaxed/simple;
	bh=zTBv3PjopdEDfpYik4NhpAq7Be/8bpB8wTW48k9muOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=a7w09NQDl8T8LTIacPK8BT1Bbz4KCj1Bj8394xc3pbvHyzQmzJkLekwwbscZlpOJjcUtTeByysPtmnQY9cBtFj6mv76fjxVtEizipOqjfnymNu+ZRlGRrOzQ+Rh2OsEalzOFo5cPL4dULLDNRM24seBlDJ+AVDym8J+hOox9bmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZv0bYw5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZv0bYw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765544877; x=1797080877;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=zTBv3PjopdEDfpYik4NhpAq7Be/8bpB8wTW48k9muOg=;
  b=AZv0bYw5AOKsUQ0aFCl9xHt3Va1pw12D8iB+pNBGzFGL/1tMj25p7Nih
   aSro6l3hd8sc+kGdIEZC7tvs2/eYvmlOHUhjPAhwKiFyC8AL8daSWPvLf
   UrqIg/YZxav9ik3HPiaqjls2FfStBUe5xA2Wj+RIH2PbBbUhuAIo3lyLT
   U4qJCD3jq56Y4XlOj6/XHABPTIxp7BZq5iZliUiUW8GXboJmGv1hZlM34
   BGLLJ532d4q3U7+zTGTq4dFiGU8guq5kr1lST3hLk0v9utJda+kvnxGvL
   HDWHEGgBJcO1xeQ66Kq5THS17xVxXQCtwGMDFythT1p3hIIeuWx5Zg8+T
   w==;
X-CSE-ConnectionGUID: TDK+bHGdRvuUDZH/OhFzGg==
X-CSE-MsgGUID: p1ZQmnSXQF2bQl8XXX5x5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78184742"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78184742"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 05:07:56 -0800
X-CSE-ConnectionGUID: Jk1OtUTPSaWLe2wGeFxSYA==
X-CSE-MsgGUID: pcDB4wKBS/yHlHNoqecHzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="196370611"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2025 05:07:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU2sC-0000000064r-21zO;
	Fri, 12 Dec 2025 13:07:52 +0000
Date: Fri, 12 Dec 2025 21:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: Karol Wachowski <karol.wachowski@linux.intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
Message-ID: <aTwTcDZU9y6c4Jes@7da092942895>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212130238.472833-1-karol.wachowski@linux.intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
Link: https://lore.kernel.org/stable/20251212130238.472833-1-karol.wachowski%40linux.intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



