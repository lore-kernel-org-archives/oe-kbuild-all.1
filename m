Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5409454
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 03:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730257368; cv=none; b=tpJu25uffrWF8E+BPxL8gpGtVVs49M/xir6o1gtGM1R5GGy+yprgjUUhEctZ/Q9Y3tQyk39Z6w3I/Wrjjfw+bdpq7cNhAb5xX6L1dZjIaxbqWv3vLlPuvvSWrnzssJRvTQVeGR+lxsFAJg6tkQAgnZnGINpCPpMIG5SyEZZ1zqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730257368; c=relaxed/simple;
	bh=H52Js68gJpj0VbW1XPCHmaz35JKgV3UWxTdIySForcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=g74Q42zFCrvRN8HJhS7QQ3uU98ox1MVJ0pZWh3ck3YgOIlaO75AGr5iXvnw+RK3Vw1nAeKwstYQSf5HiqsyZdRw6nHPybFTSBntarc8LgMOvKyP15tJBLnK7mARJ9WQc0WWfSO3beK9GTMYo8uIDKb5SahDHJzhiPkjAlDJCP1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MK4RY6vQ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MK4RY6vQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730257366; x=1761793366;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=H52Js68gJpj0VbW1XPCHmaz35JKgV3UWxTdIySForcc=;
  b=MK4RY6vQVtFCnVF+zkowyEWqnIQFdYasCPQV1FW7CQiNgSy/5FiIMsXS
   qgC42/PpV6O5VXCb4BWBFCQ4iAhhmv8hELqDcebwI4DWSmenhhyt8+R4K
   bUVNi2yalB1qBU7uaJTEJ3rv/MxFmy2izuZ4C6FeADCTkTiXJwc3tzsEH
   cIuLMkbLyrQ6HMjaZIJpt5tKXhOcs0CA8w/PQCUp01aRqCNIQS3iycfqa
   gf7QX37M9d/CC6DkXBwNf4NtNrppsZPjeYUVleX0JPU6MQSFIg8VZpedB
   jUl7Pjd+Jqhcyelz3FIM9Hh40Xadla5IzDjb0+iMeMsw7rk3rg2AmQvfk
   Q==;
X-CSE-ConnectionGUID: RFleRvdLRRCJk2Smu54i/Q==
X-CSE-MsgGUID: pC4A21QIRkmXhMyNtF8mEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="47420036"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="47420036"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 20:02:46 -0700
X-CSE-ConnectionGUID: qyicl1/NRVC7VjYeaptybw==
X-CSE-MsgGUID: 4sfjVRObSLGloh7iSozT2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82338032"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2024 20:02:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5yyo-000eRs-1C;
	Wed, 30 Oct 2024 03:02:42 +0000
Date: Wed, 30 Oct 2024 11:02:32 +0800
From: kernel test robot <lkp@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm/gup: restore the ability to pin more than 2GB at a
 time
Message-ID: <ZyGhyDiXV1lIvIEe@433b1ac7a1a4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030030116.670307-1-jhubbard@nvidia.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] mm/gup: restore the ability to pin more than 2GB at a time
Link: https://lore.kernel.org/stable/20241030030116.670307-1-jhubbard%40nvidia.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



