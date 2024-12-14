Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A733D96A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 03:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734148311; cv=none; b=ek5wuC5jqSOGCHbcOnO3K2Fg/p/SUIDQ5ZoRX+RSXpUO1nUcdphPsqhiJD1PKOkwOu+RHiP9YNWZWrdnauRDS15I9AYSxGN4Vypfoj9xhwxJ50JY5y0w41O/RaQ4VwvOj0Lm+OV4VqmZnVQnlRQRlYNWBCNlwOLTxRF7SCEJTyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734148311; c=relaxed/simple;
	bh=Cpe6bP2bKIHTbGI7wF+1M60Qnhcs63frzi7ZUZaetwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UHHei4TJ3W/s9Ijyybut0Bm1mytVt8sn0qtP6q1dU9/b4byzbau2er7yXPLgb4lUJRZIxyqutIBZvy5ks0saSjKaE3tth5gzuHvTRXIwTgopZIMjag3J4YSRmhvK/hoCcvIuug+pq14TqAhPPoF3Fi5VsyhGcUnFZDt+1GMTeLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NA+fsPAY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NA+fsPAY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734148309; x=1765684309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cpe6bP2bKIHTbGI7wF+1M60Qnhcs63frzi7ZUZaetwg=;
  b=NA+fsPAY8OUec4OZ5cFe2oipkvedEjc1itECtxlrcUCxFyGixsD64IzI
   EvESZPzkTBd45sn11V6NZjB/+yd88wYfN6qykJr/L4PQcaWdtZ/YRJgRA
   Vcda2CIIgQFAdj5GR4F6oSXOB/xb2dSjUr/2FQYcgWcZtYnDDmzgvmitp
   q8yy35oYf3N/AH8oKl9/MYO95ZE87FiO7i7UfbP6hNjJt/kAg7QbN/XEG
   +3hyR4Odz6vnWygoNxWQUsE93CUAzOa3I609dFr9Xmm681KQm0Kf/G8xI
   pl1oDjUWq+R0gvsvHizTsLtUv0P5brjYzDpLZ3IWC5xINby6XYGUzgw91
   w==;
X-CSE-ConnectionGUID: sGJ7SeU6QeyH5WH0DnoBxw==
X-CSE-MsgGUID: KdhbK6CiQouX8lcXqLO8Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="33915170"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="33915170"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 19:51:47 -0800
X-CSE-ConnectionGUID: +Mv+SMHdTYejm9noonFNpw==
X-CSE-MsgGUID: 7pjyyqSPQAigzmkfc/q+qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96566065"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2024 19:51:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMJBw-000Cgp-1M;
	Sat, 14 Dec 2024 03:51:44 +0000
Date: Sat, 14 Dec 2024 11:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 22/28] ./usr/include/cxl/features.h:18:9: error:
 unknown type name 'uuid_t'
Message-ID: <202412141118.YqxXuU25-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   c3c1ca00092765212f4eb49d2aaffb2003beb33b
commit: 1418c57d624b65ffaf45d420545ca853a99f7a6a [22/28] cxl: Move cxl feature command structs to user header
config: i386-buildonly-randconfig-001-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141118.YqxXuU25-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141118.YqxXuU25-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141118.YqxXuU25-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   ./usr/include/cxl/features.h:12:9: error: unknown type name '__le32'
      12 |         __le32 count;
         |         ^~~~~~
   ./usr/include/cxl/features.h:13:9: error: unknown type name '__le16'
      13 |         __le16 start_idx;
         |         ^~~~~~
>> ./usr/include/cxl/features.h:14:9: error: unknown type name 'u8'
      14 |         u8 reserved[2];
         |         ^~
>> ./usr/include/cxl/features.h:18:9: error: unknown type name 'uuid_t'
      18 |         uuid_t uuid;
         |         ^~~~~~
   ./usr/include/cxl/features.h:19:9: error: unknown type name '__le16'
      19 |         __le16 id;
         |         ^~~~~~
   ./usr/include/cxl/features.h:20:9: error: unknown type name '__le16'
      20 |         __le16 get_feat_size;
         |         ^~~~~~
   ./usr/include/cxl/features.h:21:9: error: unknown type name '__le16'
      21 |         __le16 set_feat_size;
         |         ^~~~~~
   ./usr/include/cxl/features.h:22:9: error: unknown type name '__le32'
      22 |         __le32 flags;
         |         ^~~~~~
   ./usr/include/cxl/features.h:23:9: error: unknown type name 'u8'
      23 |         u8 get_feat_ver;
         |         ^~
   ./usr/include/cxl/features.h:24:9: error: unknown type name 'u8'
      24 |         u8 set_feat_ver;
         |         ^~
   ./usr/include/cxl/features.h:25:9: error: unknown type name '__le16'
      25 |         __le16 effects;
         |         ^~~~~~
   ./usr/include/cxl/features.h:26:9: error: unknown type name 'u8'
      26 |         u8 reserved[18];
         |         ^~
   ./usr/include/cxl/features.h:30:9: error: unknown type name '__le16'
      30 |         __le16 num_entries;
         |         ^~~~~~
   ./usr/include/cxl/features.h:31:9: error: unknown type name '__le16'
      31 |         __le16 supported_feats;
         |         ^~~~~~
   ./usr/include/cxl/features.h:32:9: error: unknown type name 'u8'
      32 |         u8 reserved[4];
         |         ^~
   ./usr/include/cxl/features.h:33:38: error: expected ':', ',', ';', '}' or '__attribute__' before '__counted_by_le'
      33 |         struct cxl_feat_entry ents[] __counted_by_le(num_entries);
         |                                      ^~~~~~~~~~~~~~~
   ./usr/include/cxl/features.h:52:9: error: unknown type name 'uuid_t'
      52 |         uuid_t uuid;
         |         ^~~~~~
   ./usr/include/cxl/features.h:53:9: error: unknown type name '__le16'
      53 |         __le16 offset;
         |         ^~~~~~
   ./usr/include/cxl/features.h:54:9: error: unknown type name '__le16'
      54 |         __le16 count;
         |         ^~~~~~
   ./usr/include/cxl/features.h:55:9: error: unknown type name 'u8'
      55 |         u8 selection;
         |         ^~
   ./usr/include/cxl/features.h:80:9: error: unknown type name 'uuid_t'
      80 |         uuid_t uuid;
         |         ^~~~~~
   ./usr/include/cxl/features.h:81:9: error: unknown type name '__le32'
      81 |         __le32 flags;
         |         ^~~~~~
   ./usr/include/cxl/features.h:82:9: error: unknown type name '__le16'
      82 |         __le16 offset;
         |         ^~~~~~
   ./usr/include/cxl/features.h:83:9: error: unknown type name 'u8'
      83 |         u8 version;
         |         ^~
   ./usr/include/cxl/features.h:84:9: error: unknown type name 'u8'
      84 |         u8 rsvd[9];
         |         ^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
