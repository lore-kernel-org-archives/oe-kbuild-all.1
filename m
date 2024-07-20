Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70776168A8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721491050; cv=none; b=SZtGyCpV8m+xG+hgIzv5ALfCn5n2/1YiwUyv2uOnWqvIYkh1BeEa1wZWjXeZUJdjvA51KIYLJebwVfZRdmtE8I0PXVs0GUEghgpCB51wXavVUBxV/f87atTxjhytQvUh5Ty3JLsPxYSyUC+HM53GSDcXHcqEVMr3pwMwFhrIWUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721491050; c=relaxed/simple;
	bh=0bMUhfnq/tKixytlqQ1ZegoWnOFKYuLm0H9/pkch7+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CIwdqPz+UulG+wrw0LJ3+A+lAJRPycuN04hFZfXT2pjFjggaqzTyyeiwe6DZ7jeOUvuEhzjIcv3GU9WrvQxc2H7Cgy1BFUp4/Lz+kZq54b8tZ9OR0cJe1sz41bxnIEhFSm7QvLT3phMPRC/s7jhbXaJMfHL+pcbLIfCM1iTw4mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1O+vd3t; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1O+vd3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721491050; x=1753027050;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=0bMUhfnq/tKixytlqQ1ZegoWnOFKYuLm0H9/pkch7+I=;
  b=k1O+vd3t7G/NnFhvrRMRaUmZEV1o//CkPAmTN92xUbDrCb85VlXKHWw6
   UhMjRTYr2ZzDNzVwQnQ9c+ww0cr+WEjLveyHbSnq4kbWT8i1NVnpsxY1W
   XSI1OBGiBipqowJsjOmvl/xydNjqD+E6EXte4caTkjCNqLr+fdtPnuTfy
   +2kh4FmrSVrJyfvJ7TfRU4mMyJUXwZ7duEji9A2rNCYsYzl5sGuDpfXbY
   7Y8fSqH4ZA+LqGCrZiZ3e6pPsovpjedAVKWNpgGpQdyGlihlY6QRcguYf
   +UFUTpl/816de7o80V4fOfVBb6p40gOXywWK5aFu6bOnGgexASTREltgH
   w==;
X-CSE-ConnectionGUID: aRT4TtesQJ67gzufY3UcrQ==
X-CSE-MsgGUID: 2m6zXpbVQdSyg15iRBnK2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="18722297"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="18722297"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:57:29 -0700
X-CSE-ConnectionGUID: zYpwGgL1T/Opm4ZjeeD2RQ==
X-CSE-MsgGUID: EEY2vrxBRy2N1Tj03uTJmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="55583391"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Jul 2024 08:57:28 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVCSb-000jMI-2V;
	Sat, 20 Jul 2024 15:57:25 +0000
Date: Sat, 20 Jul 2024 23:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/4] ext4: check and update i_disksize properly
Message-ID: <ZpveXzpfhlPiVSYR@6724a33121ae>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71FF15A91ED5C348+20240720155234.573790-2-wangyuli@uniontech.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/4] ext4: check and update i_disksize properly
Link: https://lore.kernel.org/stable/71FF15A91ED5C348%2B20240720155234.573790-2-wangyuli%40uniontech.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



