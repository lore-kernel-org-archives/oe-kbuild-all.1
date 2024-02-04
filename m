Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031B4225D0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707061209; cv=none; b=fBhhXaygG/+TGgGLLgsCRYB7wUmmfrJRWfac2D54H6L5wMkxmWx3ziSrA9qvq990ibw187dAWCww3KaaIosJGX5DZE7V4Ak4WVo2MoX3tqzbVjfY3P5uNAX0iskW8Zv9X5at+dNBdLB8q9jXIBmXhIc6qrSKTY6LsIfSuX6Ca4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707061209; c=relaxed/simple;
	bh=JCr1pCGlVgKqUk1zF1gcqAf9POPZ9MYR2KUNzXr/Q9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dZOHuTEREDrIC7LAkDlHE5qlEXyGRCnRez1FWiCjh5oFA1IqWuuGfAGQUlaenQobEr7fIVAfxZ0qIXa7rCwrep5DBBDyTe4YLBwjuWo3izbq4MFAujrGb1fz853em1NjgwAeg2aTYbreDHvEYbIkReBm7ciygJhzyKG2u2aFedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFkYU9CR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFkYU9CR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707061207; x=1738597207;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=JCr1pCGlVgKqUk1zF1gcqAf9POPZ9MYR2KUNzXr/Q9g=;
  b=KFkYU9CR2GCoUWqc2EVHwP5TE0CV1o3+/K2PLeqy3/f5QVv4SQCCC1vJ
   swMNUS0vUutVQE+5ZBHV0mOVtfZpvUTHs5RTfqkh5U8py6K2jPyRgyPKf
   CDjlAksFsTYKXEAJBIWpzUkVt1xi49vLc5VF9ns0Zqi1I2uvvZwGIup+H
   kmbgW1MRKblnmuvuBrw0KjBI62W4CSkYZXyxXcKuxSetVJKyAJBJ5/efW
   s4cKDS2ZX85NVR5xj5YVWOJuOccdJvOnkLyJwhMOLfOdxDE6DTfWXW/r6
   sgsTmlErK2eAPuUjIfDF1bCLRybn7PmTxvhkZ54uavWdAokvfl95jyRht
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="11759051"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11759051"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 07:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="823653889"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="823653889"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2024 07:40:05 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWebC-0006Sa-3B;
	Sun, 04 Feb 2024 15:40:02 +0000
Date: Sun, 4 Feb 2024 23:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jozsef Kadlecsik <kadlec@netfilter.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] netfilter: ipset: Missing gc cancellations fixed
Message-ID: <Zb-vtyrh3Q7FzJ_1@a2a592e9b9e1>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204152642.1394588-1-kadlec@netfilter.org>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 1/1] netfilter: ipset: Missing gc cancellations fixed
Link: https://lore.kernel.org/stable/20240204152642.1394588-1-kadlec%40netfilter.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



