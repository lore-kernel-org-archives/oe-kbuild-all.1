Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526E51CF284
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875642; cv=none; b=iOGrPbEZkMhnQDPl6rWNT+3dVOXwVuEfPFr4TeN/kDDPxq1ocud+oxpJNMztLs4ApyopRW1xZzcvZFjF4TltmB/k7fLg4VNZTGJqEcsH77GVGrVJdrZok5n1eh+uY8ZDpG8LWGaA6VkEZJiwv3a7w26uaY+rQI1UrJgBh/GJKc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875642; c=relaxed/simple;
	bh=Mn9B6l9bRzL90ieh4PbtqaQCYwsvd+KT32io3NF9Z5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=C9yYoMMgwa5vEltGqeQJslVAlOlsRkfRaFt3+xKV17dcK5DNJMKtP3lgQaI63iQVlOSemMv0Jmberx0iknC8tKJMeCLT0DxBrnJn1Tvn7z1dTdosTdFtDy+99h/YQftNbKecqLgkH3FFbU9t2zU87RZ3ojwKKVmx3E7eV09fiHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i8dqggLY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i8dqggLY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727875641; x=1759411641;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=Mn9B6l9bRzL90ieh4PbtqaQCYwsvd+KT32io3NF9Z5Q=;
  b=i8dqggLYc4lBQAm7EraTIYFT10HR5v2RwvpOd1gP9TfPcZxoEW/v/e+l
   USTrR2DykFWotuGn0a6qfL1wvxc9RM9st+GLi39Vn6eGBizgfinKhd77j
   074a3gn1rVj1F7rdAzwdMJxzVUFkoCPfkp8rWYvCkUlb4wHjMz4GzF+D0
   P10hsRy/AOWrBcVvIh7ioOZoH7dYdstzaCcoYKGiTJYCCkAD26xlzQ5Ax
   vpIIzkzkSew4+U3+d2U/S8VoO5fDQVWXA8aJy8yda/THLAoVGUoD6HKTP
   qIJ60h7XJVrIs4xvSayFjxtknkuHu46T1rApDasOG8PwiuqNtbSw2V29a
   A==;
X-CSE-ConnectionGUID: S7uTx4STT++Yrs5H5EU8/Q==
X-CSE-MsgGUID: fXOpetNHR52JWd47nGrPOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26928015"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="26928015"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 06:27:20 -0700
X-CSE-ConnectionGUID: 8DwRQJJ1QFSFwOBiLkjDqg==
X-CSE-MsgGUID: 7yBEJjhhSeqx69Dng9JdvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="78535734"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Oct 2024 06:27:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svzNt-000S7g-2l;
	Wed, 02 Oct 2024 13:27:17 +0000
Date: Wed, 2 Oct 2024 21:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] USB: chaoskey: fail open after removal
Message-ID: <Zv1KAqAP8o4L3buz@5b378fdd06de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002132201.552578-1-oneukum@suse.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] USB: chaoskey: fail open after removal
Link: https://lore.kernel.org/stable/20241002132201.552578-1-oneukum%40suse.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



