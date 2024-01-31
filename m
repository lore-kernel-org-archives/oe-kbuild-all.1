Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642DD679E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692238; cv=none; b=W0pp/+Y4oMdOzvOdEAOS+gJr6Q+qlLaB5AlngQMgaBi+k3/oOkK7Z291Sxw/whQSsHu6LCiubKL3eZjBYiCX1GMpQW36P+4xt0RIUwR1XeTbxoU84sUUtSV9IG0h7FM+nzmj7TcBPjp32XmJB5E4LJ6u+/7mZ31paTscGWg0C2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692238; c=relaxed/simple;
	bh=gBFHap0eiMcOMOEsQe36Qy86dublagrIx/fYGz58s/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=T5jAF6qXmnwyMyo0LTmmJcuSZrEQsz/+OWnCwOkDnY2K/XfEVH67dbHKp5FBn6WBGPpc0IHeGPdGcthWsGIKQwdRvdbA5+pYJrN5Jb9MKirz30pZEZVlM5sql4ZEWZ3B/rOA+J5gpDICrCFSwsw5s3280HRNM4SursvBc+Rj18U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWr+3KPM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWr+3KPM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706692238; x=1738228238;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=gBFHap0eiMcOMOEsQe36Qy86dublagrIx/fYGz58s/w=;
  b=VWr+3KPM9q/Q2gNH3WSVkNNdZye6H4C9zLUrxOhqXmgBoR/RdX92EB/5
   UXQeomjZA8cSXchgs7EWPs36SucxgZga9uSPBHbN7ard+U4ksugEiFBkE
   tcrh+ZCyH3vX9K9SP7SSNoo9Ya8spJtmwgXt+EAymayeXN3bq8C6VXGZ2
   0wgk3PTnN39SNicV+FNpizk1Lpsa+tC2+mSPcPJDCcQ3sMc2Kf2krHueT
   kP5yjqNApRa6IJXNdzGNTmDcu95FdROusKLol8pHIFD8T1tUqv0NmPikK
   e8Q7C+xPyovHAJ7O5O9srSZ7sXbao5NMCNdqQxXhq6pjhYF1BGwYvuMJG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2478367"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="2478367"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 01:10:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961554086"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="961554086"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 31 Jan 2024 01:10:35 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rV6bq-0001Ma-2g;
	Wed, 31 Jan 2024 09:10:29 +0000
Date: Wed, 31 Jan 2024 17:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 2/4] lib: move pci_iomap.c to drivers/pci/
Message-ID: <ZboOW14CIrFN-rCA@ad1fec2ed832>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131090023.12331-3-pstanner@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v6 2/4] lib: move pci_iomap.c to drivers/pci/
Link: https://lore.kernel.org/stable/20240131090023.12331-3-pstanner%40redhat.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



