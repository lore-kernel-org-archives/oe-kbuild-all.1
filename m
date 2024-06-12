Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D816FF27
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718201036; cv=none; b=n27TiWvXYCzgcLr1FL9OgbWaMuTc3/PgKHDEkUftSGcLx/U2QyPngtc9RlKklc6EKl5PK0Qdz1FMx9JITw4xyKw6+5R8xX+LWrs8eTO3joC3CwF3WcnX/CyI1juGryObCchUG3y8AeAaqhmtV2RWDY2K+sWL89F2YQfaiLsKe74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718201036; c=relaxed/simple;
	bh=XeshH9UOWLenz4SCxbqnkwpYESnskdl4pnVQrrzmD1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=PzFnB5BWZLOsDnQZkFM549V9lCJQ90ZR5OciLvTo2Jp52F+Wz6/e0g9MEyEHVbZCT+iMjQ7YmyqPghqb5svc3Eafp9wkUs7dPPj57S9EGM9MpGeX4DsLA0/VnoFuBjttNjVrki1hE+JyEBeyAQjx6JxEHKSK8sujV9U7vxecAbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PimumZGJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PimumZGJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718201035; x=1749737035;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=XeshH9UOWLenz4SCxbqnkwpYESnskdl4pnVQrrzmD1w=;
  b=PimumZGJZ/sFmeYv+MYOvXgP3umY6N/6QN/d0hHPQhSR0lOw3DFKdp6Q
   shIS13gzWuCMbuPZ/TULo6jdPSeXXWBQvkiseUiTrYRyRcbJy5+jr5skJ
   vxlmtqCNGDt57uOgbNORF0S0IXZznuh/alaHf8pzpLlDcM1uAmgKa94h3
   Aafnoda069HX73bEnWAYRra8b1qfchvIOvah1W265F2gIe32D/5+4FTw2
   I2zsOW9J4Bx5RP2NuOZ/hMF0M5raUSbrz0A+6OBi414gk7oKpCYEBHqsf
   j4YswCBHL6xiGrdmkUPQm2rd59t8TsEUF5ncnaNiufIaNEZjeSO2J565X
   g==;
X-CSE-ConnectionGUID: NfEdno3rSQy6CeuBuaoKoA==
X-CSE-MsgGUID: ubmHqSZESx2ppVmH5F/rIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14801133"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="14801133"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 07:03:54 -0700
X-CSE-ConnectionGUID: eGrN/aGCTJCNOeLVMrYeBA==
X-CSE-MsgGUID: eHrJELQ4TYuWQVwydL+AnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="40275832"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 Jun 2024 07:03:52 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHOZq-0001aw-0z;
	Wed, 12 Jun 2024 14:03:50 +0000
Date: Wed, 12 Jun 2024 22:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Ghadi Elie Rahme <ghadi.rahme@canonical.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net] bnx2x: Fix multiple UBSAN array-index-out-of-bounds
Message-ID: <ZmmqpT8x_uW61S4D@67627e7c46f4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612135657.153658-1-ghadi.rahme@canonical.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH net] bnx2x: Fix multiple UBSAN array-index-out-of-bounds
Link: https://lore.kernel.org/stable/20240612135657.153658-1-ghadi.rahme%40canonical.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



