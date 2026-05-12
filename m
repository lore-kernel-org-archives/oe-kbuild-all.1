Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5448D3C277F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 20:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617952; cv=none; b=Ljn0HHCtXDYuhlAL6dnYMYfWqHmTFMU0Kk3+wnuVkX+naFkBFNLidUrVhs08xbkyaX+LdIoMSxGuIKYhRq6InJooavjwz9lG9vtY5uxvk9JPWztmUmRtDO6zFR43hrRg5ll53zkAxQG0fus/Y+MPK7+hh8H7ucQPa5+Vjh1gtmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617952; c=relaxed/simple;
	bh=2TfJYRSUBWb34dzI1RPJPgUHc/PrTpuumoNXGd8FW6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lV8SgEerD04F7YjwsmTXFdEQ0Y+T7SH1HkA719Wcn6XTgERzhryXZhhysbSgLh413QVnOKYKOItyyRJWrKk8F19UGLAj2c5156mqOsPYlpUoNSFOR9ktFdcYfEVH/+yL9seXg5hEfO80NqSUujASfaCZmIXGL2+7FemYy/mNPj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DM9O9BQM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DM9O9BQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778617951; x=1810153951;
  h=date:from:to:cc:subject:message-id;
  bh=2TfJYRSUBWb34dzI1RPJPgUHc/PrTpuumoNXGd8FW6Q=;
  b=DM9O9BQM/GRROixzJQjjj1TxRcVRf45sV49N9GJJWjPTwtBI6PhU81wf
   l6zCDCw9ARfh5f3zajfTx4soQnsvzcBhefHgiukZMSz8bU5oj8nCJ4hrf
   2HGFs2yPbVQXgNlvIllh47AWEZbCDKLthfEeEp4zWiA9WS5c11nKzoYGX
   3wuVASEwEoyDqEnm9RgO7X9sKffkhGssf6j6noVesGDvYAXGf6XrTDzms
   djtbJ1/d6+Eor87JSCoqHeOklIYpAxi3DNmO2Vm1rpflCliGDNiObXvL+
   AnWpjmxvx7pQ6PBKs3XfH2w/11ByPGugs7MLVCtpL9dfT3iHDIkTkGUOK
   A==;
X-CSE-ConnectionGUID: 5L8AnZ1UStqHoAaCXy7apQ==
X-CSE-MsgGUID: pmMSrosWTZSDXWlttFh1+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79520529"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79520529"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 13:32:31 -0700
X-CSE-ConnectionGUID: XrbsR1+GT+ChTjcpyUTjHA==
X-CSE-MsgGUID: bYCYevTTRwqXta6/ypgDdA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 May 2026 13:32:30 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMtmF-000000008Kv-3Rs5;
	Tue, 12 May 2026 20:32:27 +0000
Date: Tue, 12 May 2026 22:31:55 +0200
From: kernel test robot <lkp@intel.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Documentation/hwmon/d1u74t.rst:4: WARNING: Title
 underline too short.
Message-ID: <202605122253.zInzmUeX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hussain/dt-bindings-hwmon-pmbus-Add-Murata-D1U74T-PSU/20260512-185756
head:   0fa96a515da810b1526b58447f677f4096e601c7
commit: 0fa96a515da810b1526b58447f677f4096e601c7 hwmon: (pmbus/d1u74t) Add Murata D1U74T PSU driver
date:   9 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260512/202605122253.zInzmUeX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122253.zInzmUeX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Runtime Survivability
   ===================== [docutils]
>> Documentation/hwmon/d1u74t.rst:4: WARNING: Title underline too short.


vim +4 Documentation/hwmon/d1u74t.rst

     2	
     3	Kernel driver d1u74t
   > 4	==================
     5	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
