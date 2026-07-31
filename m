Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF320361DBF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 06:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785478680; cv=none; b=Bv0QWC9AbfIfq3NvViZM4q4IYDoQLNn1FMMSIr/FfTAXippASHKdJtCChk9w/kIRyN3VmXJ1TtAOgpmtu5yPPU8iyiPy300saLfDKAV1gY23LrD0fo9MuwRZP3QaeUP0fVo8rFUxt0rXFvoknJLcXEQ7lB9UDeipF3moC//IATw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785478680; c=relaxed/simple;
	bh=l3ovaiTHFKXSKDfHjYM3EkbYDIejAQtujx+3k6WNlRU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M66uqDbLfXsK8uWaav6gTjzrsTrSrBf63J/rqwNr6TdvcvQnJgxdpomK7LxI0JyznezgefIAIIMMgwaHI992uKWdYLaWla2XkJWGNb1PZW2g4GhUqT6iv9GclD6u0OspfO5LBTUn743itK5rcgXShCG0RomcbDMaOqRMwoK/Q/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3kZBAky; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3kZBAky"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785478678; x=1817014678;
  h=date:from:to:cc:subject:message-id;
  bh=l3ovaiTHFKXSKDfHjYM3EkbYDIejAQtujx+3k6WNlRU=;
  b=X3kZBAkyN4TcrkZTH+MZ23St0I8ExSsCRfvqaab3TaQAV/qy2Z1PC5H6
   6uEtBEP6VwqMUTJwlfHiFNvO+5B3iSOpgBpKL6j6QOfXgsM7uKT2PLgrH
   zt2kK9+KO9vUavX60qIVv2rYi/h8qBzW1YyqJiwSPpydzMbIEplgCZ7FU
   cq+j4hawpN/4G/3mKpSYg8drARxrTkezxipQ0jXY0LksKpcydVIaGbd4L
   4obDCeQR++NUQ3RYOvWlpzzVuu3tL7JbJuYQ2grnrl64FMwQn8r9QDON2
   SWBVrNMpZ1tEEgkExXQOExmF3M8O0a65jjrV5ybKuWUyqOsftLGdEgJva
   g==;
X-CSE-ConnectionGUID: 7eGnVNRcT/+hHnNDPD2qOQ==
X-CSE-MsgGUID: ECCIjOC/Q+OpcHpK0flLAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86181772"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86181772"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 23:17:58 -0700
X-CSE-ConnectionGUID: agG+O5cpTSuwxF8QhgaMiA==
X-CSE-MsgGUID: /A2DlxvySNSHnC3/bXcYZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="285098129"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jul 2026 23:17:57 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpgZ8-000000002XA-1yay;
	Fri, 31 Jul 2026 06:17:54 +0000
Date: Fri, 31 Jul 2026 08:17:28 +0200
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [gourryinverse:djhacks 5/38] htmldocs:
 Documentation/core-api/mm-api:102: ./mm/mempolicy.c:1101: WARNING: Inline
 strong start-string without end-string. [docutils]
Message-ID: <202607310849.uRWi9E2G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux djhacks
head:   09de2580129cf36e7ed3de65282a91fe3cc29e24
commit: 0d092fc9475c8714f7b235ef04a0f86c04406f7f [5/38] mm/mempolicy: add mempolicy_create() and build do_set_mempolicy() on it
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260731/202607310849.uRWi9E2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310849.uRWi9E2G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   1             automatic adjustment of input current limit
   0             no adjustment of input current limit. This
   helps for more unusual power sources like
   solar modules. [docutils]
   WARNING: ./block/blk-map.c:366 Excess function parameter 'op' description in 'bio_copy_kern'
>> Documentation/core-api/mm-api:102: ./mm/mempolicy.c:1101: WARNING: Inline strong start-string without end-string. [docutils]
>> Documentation/core-api/mm-api:102: ./mm/mempolicy.c:1101: WARNING: Inline strong start-string without end-string. [docutils]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   WARNING: ./include/linux/device.h:117 struct member 'show_const' not described in 'device_attribute'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
