Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E95B1DE891
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745154108; cv=none; b=aQPoxmqZXt75IXVkQcjiAankdr3ftPJfL8FdZDsb9Op44Xi2TvyWWBK2Px/QZpyFw10JQdt2U5EcBZ1N6Jm0JBPHWl9G3UiH5pzjd6/wWinHf8XVk4hYHZMAGAxy6iweT4vuBHKANobA+OIG/JjcZmBLK1Q8VI8Dxj6jKC0n/kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745154108; c=relaxed/simple;
	bh=lYCMW1NDJrfcWBsD3nTJp1mQtxlBXg27xZvHSe9QBvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFMlpjp0LLAd5OQ0UUioYqZ4ph45MMQfYnsBsMdDvYOX15WQpLd2rl1fdTGPnplPwfNd6D1UO+Iae2VXK4FrjVTkE1o7qG1VKkKef1bWnD9QQxLtXFBwYdwk8enRG6Pv6AbagqmLp3xMH17YBORuSduW5Azui3ZiaPjz6bDjBdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jzt13Mm4; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jzt13Mm4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745154107; x=1776690107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lYCMW1NDJrfcWBsD3nTJp1mQtxlBXg27xZvHSe9QBvg=;
  b=Jzt13Mm47PnEamzxAMSMk9jntxC2DhSyTCehfgGA9wJgsapSEYi9OeaE
   1ElZW2zGFoEkajDYMOTXvlF6csGuUWrLa+jjAiqq3zG3cjlB9t2yfvrL/
   e9UwD6r6qZWgnRKn++XP2mcerfJrtET7ko6OIszTOFPx79rlh0kuC2Hs8
   lcmLODlM9GpplKxVPIKUVNOdRmSugSMnJHE6XcdszsCJpcX1XF8zCowU2
   FILm9LokuG/JD1gY39jeJMgm1nt7YJ1WT4nAAkn7GZOOYKVHIBs2wZQPy
   +QawbKBsmi7JiDdHhQEfjJ3KETOzqrNv+1IIHi87lLouJGjzYKOVdTijG
   A==;
X-CSE-ConnectionGUID: hUcmoZLGQeWg6HL0tRuV0g==
X-CSE-MsgGUID: tQAeqgoeRpSbdL54O+3XDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46600104"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="46600104"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 06:01:44 -0700
X-CSE-ConnectionGUID: O0V10+CSTn+I9WQp330M1g==
X-CSE-MsgGUID: 7ckloNcdRLuJgvPTl+4wZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136660636"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Apr 2025 06:01:43 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6UIn-0004eL-1T;
	Sun, 20 Apr 2025 13:01:41 +0000
Date: Sun, 20 Apr 2025 21:01:15 +0800
From: kernel test robot <lkp@intel.com>
To: Raj Sahu <rjsu26@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 3/4] bpf: Generating a stubbed version of BPF
 program for termination
Message-ID: <202504202030.GWeTh6bX-lkp@intel.com>
References: <20250420105524.2115690-4-rjsu26@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420105524.2115690-4-rjsu26@gmail.com>

Hi Raj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Raj-Sahu/bpf-Introduce-new-structs-and-struct-fields/20250420-185825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250420105524.2115690-4-rjsu26%40gmail.com
patch subject: [RFC bpf-next 3/4] bpf: Generating a stubbed version of BPF program for termination
config: sh-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504202030.GWeTh6bX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202030.GWeTh6bX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504202030.GWeTh6bX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/syscall.c:39:10: fatal error: asm/unwind.h: No such file or directory
      39 | #include <asm/unwind.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.
--
>> kernel/bpf/bpf_iter.c:9:10: fatal error: asm/unwind.h: No such file or directory
       9 | #include <asm/unwind.h>
         |          ^~~~~~~~~~~~~~
   compilation terminated.


vim +39 kernel/bpf/syscall.c

  > 39	#include <asm/unwind.h>
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
