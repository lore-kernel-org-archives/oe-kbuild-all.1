Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941F9DF42
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 03:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744599664; cv=none; b=Ao2kuLMlm3Pq/uk1qqa0RbGulQxROoW9gGbWiM4wYBhwR3qbp3K18ZSW4oTnCUzLmkheZ9y2aRVTCAhXVteJk1o3cPEaViAhsraxa5ttUa5YjNMc2leg2sG1p29YdQvLXe4Z/IjROYLv/j5P5GAKBltQYOuGJSrBJys/2dAjgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744599664; c=relaxed/simple;
	bh=bvfWSha/lqaZKIGxSuvk1g5T1BiWKc9sAkLuijlTDqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Q5lNHiYazSyu4jVg3/ki7EbPNO2EPzTH0vcijmustB9GY/7lpu4OtaPHxpniEmuiNoml5DTN4I2sLPK44AQOjsuji8SApPD2/tsjQCn0suK94lHvNpZri6cElYK5h5pqwBYi1LJ3sLAzc2M8qD5l/FbCdeWEAUiEMjliQFjZeV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KfPE89yV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KfPE89yV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744599663; x=1776135663;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=bvfWSha/lqaZKIGxSuvk1g5T1BiWKc9sAkLuijlTDqc=;
  b=KfPE89yV7ZjUEGbB8s77lg6fAkoKgeL6/CTZfvyGhuphHiGZBR5xTXc3
   7LG+fQ9GR2HHf6U81YOHLeG4nf/geSr6D9C/+JpfqcKcxQta9BJLRWuRe
   OPRhwnTr5xjtwhS+nWs+BOC1tCtfn4AZ4r0ZggsnSm5iJl5+55SgDcYa4
   5wgkw01yIdakzMj6Z47a99uSHg6BhVFAsZzSjpLItjx0xNTRJJKd+fO+B
   y+jib8UNMil/VNVOZheTC+8DL19chxDWIULRzftqhQ1FOBEHWHOsBL2IW
   RrYtsGLoCyKX18V1pp8jyNzzc30vdQUxzMpNQG1FbsqwTClLKx5FUrIc9
   w==;
X-CSE-ConnectionGUID: n/UC4+sTRMO80rHh59fOJw==
X-CSE-MsgGUID: wAsYrZ1eSn+iTtDahM5vrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56716261"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="56716261"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 20:01:02 -0700
X-CSE-ConnectionGUID: KxGE4ZKHQv+sQ+NoxEBbdA==
X-CSE-MsgGUID: Y1dUyUALTaOeNj+l1eV4UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="129663287"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Apr 2025 20:01:01 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4A4A-000DKo-1L;
	Mon, 14 Apr 2025 03:00:58 +0000
Date: Mon, 14 Apr 2025 11:00:23 +0800
From: kernel test robot <lkp@intel.com>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/5] net: ch9200: remove extraneous return that prevents
 error propagation
Message-ID: <Z_x6R_oaCR2Cs5CQ@6bf5cb62fcc2>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412183829.41342-3-qasdev00@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH 2/5] net: ch9200: remove extraneous return that prevents error propagation
Link: https://lore.kernel.org/stable/20250412183829.41342-3-qasdev00%40gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



