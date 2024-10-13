Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0513665A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 06:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728802724; cv=none; b=o893avgtjQToV0P3rDbgcX5cT7FfLq0wtt2J3l6R1GOwc6KjI1p2xQqUOq60XAxWzsiqlo7jX8uZJPhb6VTgMygmG4kD2q/7YkxLCrzOEAdIU2AJTT75foeFMjPkV3WfUCUwot9NqwrcEAHdQPJDKv5Xy+yJRXYpXFnNLV2X/hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728802724; c=relaxed/simple;
	bh=5BsJFH7jKPJyWv0GTYzm8+vDs18t2jHhfsUsKh1yqro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UkdbykBnptX9kPmdG7bAexw9y999xSj1+Naa+9oPo+pcf8TSaXR7efbRnnJwv4YloT+smJs85fq2ZJn99X+enr5eNpBYNK/NQuV+f+w3uQ3x56TqUKc6AkIXADDH1sOO9P4YjRqnPOIIV7D8lLGcTKIuUNBop3qEiSK3Ti3vNU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eObJpOEv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eObJpOEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728802723; x=1760338723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5BsJFH7jKPJyWv0GTYzm8+vDs18t2jHhfsUsKh1yqro=;
  b=eObJpOEvLj07jvdL+VzT0MF0qylXvxwhJ3X4LenHBVUvOO7XJDZ6hIKE
   NuIl+B38DMPAQtRuEg2Bk7D6yDrw+Ufcqx3dqOD3dvBUASJDbRzoQdftR
   hTZRGDTdmL1EXH5KXTn8uPmP0W6/h5Fy7U6d6W4wt3zU4lDmdZ04l4Cam
   a47tAKYVop+5+1yCUgGM7S1LhmhVrF+PbLcql8a6HNcQAWlTtL/UJUI5i
   6ktokhdyDTzyfc8B+kaFofHWj498EdVUOruFKGqg/hgy7TT6f02O7l+DU
   rj/gD349aeq+zi5h1KDExwR51YnjGLLGmwgLAC9r7MgRN4SlTOezY87d1
   g==;
X-CSE-ConnectionGUID: uAJj9tQDR5uMCn/lW8M4NA==
X-CSE-MsgGUID: /HNqDLnkQCGpdN1qqD2t8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27969882"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="27969882"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 23:58:40 -0700
X-CSE-ConnectionGUID: z7Qjfob8S+Gy0G5osNZpYg==
X-CSE-MsgGUID: EzbS+X8yT/+s3LU/xXLJBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="81838060"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2024 23:58:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szsYm-000EA4-1o;
	Sun, 13 Oct 2024 06:58:36 +0000
Date: Sun, 13 Oct 2024 14:58:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Namhyung Kim <namhyung@kernel.org>
Subject: [perf-tools-next:tmp.perf-tools-next 61/65]
 tools/perf/util/tool_pmu.c: api/io.h is included more than once.
Message-ID: <202410131417.ynhvnEJb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   48966a5a48cd48a499e7c431e09465ce0c092e38
commit: 069057239a676a82cce9330a81994129179dc817 [61/65] perf tool_pmu: Move expr literals to tool_pmu
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131417.ynhvnEJb-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/perf/util/tool_pmu.c: api/io.h is included more than once.

vim +13 tools/perf/util/tool_pmu.c

  > 13	#include <api/io.h>
  > 14	#include <api/io.h>
    15	#include <internal/threadmap.h>
    16	#include <perf/threadmap.h>
    17	#include <fcntl.h>
    18	#include <strings.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
