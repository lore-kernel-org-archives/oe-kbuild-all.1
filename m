Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CD83398B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 01:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744593568; cv=none; b=G0IZcO0E6W46ZY5KnFc0UxIXaV/NRQSNEEDBD/jA0hnIm+pJDRr3qBPKp63JZSlwuKHiky4mSgfennQmEGioKyw9YzaywY2eLpQSo6gLZy1jwmdwyeRVDYM/94Fwjkg5dKu2V/S2V5Rwwp4rtB6RmD3G95//37DVQsW36xpAsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744593568; c=relaxed/simple;
	bh=AEPduV/LHCbc3zEY/wypc/eoqJDBMmVWOqlkp+0ektI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=U10uqRsgMRPRM4AtVxZECjal6c9AhVXihf/8eHA0rYm8rm1uwiXszLXmCHEQ5UTvHoNFza0UVVAQSL8VyFDBwCoK/nFvzAV8DZgqOMPjQ/FfEPVDZChjrK6JHM/58bs25bsIShd8tV6RtN5nEbXNKS0lKJMFd+OXTdFP5FCXsr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RikvhosS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RikvhosS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744593567; x=1776129567;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=AEPduV/LHCbc3zEY/wypc/eoqJDBMmVWOqlkp+0ektI=;
  b=RikvhosS6DkCY6kTWMllmJd+h06ekyY4aIpSrkAkrtSqdYN/IvRlAZKB
   p+EDtNtla8OgsS5PIw3M1pSiq4UGTXk7Mu67EKmdYZVvwSD4Q5mZbd63Z
   xDhqda4mq9hCfoeEPFQOkHuyNsCVMDHPQVpWSP5kLXQk0pL8I8HTwgKhY
   BXtDdUsTs7XleorfHV1eiXnDjBvPXxtTc3zgozl235sAp+BVTG+f8FFRu
   YrrIqB5KOLMxczc2KKh3CXAGDefmfNBrb8Mt3vNsfi/VlyWWSbtLqVeJK
   9mjLloVFWka/jflIs97TGmneaS21IbyZTrM/T3c+UtrJiTIpGpNgEmKcb
   g==;
X-CSE-ConnectionGUID: d6jhyirqQXi6o6KhsMhcRQ==
X-CSE-MsgGUID: EBIXexyNQliI76JyffgJbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56697718"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="56697718"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 18:19:26 -0700
X-CSE-ConnectionGUID: pwPkqWTrRSOXNsnxTn1zbg==
X-CSE-MsgGUID: 2sRdcrLeSf2CVSApmKSjDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134656739"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Apr 2025 18:19:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u48Tq-000D26-0d;
	Mon, 14 Apr 2025 01:19:22 +0000
Date: Mon, 14 Apr 2025 09:18:37 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
Message-ID: <Z_xibVzEiiL7HSbJ@6bf5cb62fcc2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411082357.392713-1-dongcheng.yan@intel.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v1 1/2] platform/x86: int3472: add hpd pin support
Link: https://lore.kernel.org/stable/20250411082357.392713-1-dongcheng.yan%40intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



