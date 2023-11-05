Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D3310E9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 03:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4vFv67R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699153504; x=1730689504;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=U/IlXEKrVNl3af/3Vpcxo/bfreGi3CYyQ+4rAP8eixc=;
  b=R4vFv67R2ebfUzC8jRna9brH/BzBrjOW2X8GVuTb5fZ2jGjvLzfzusjN
   3Alfldce6pRhtqZmoOeNmgfNINw8zyCATRn49+PZZ79ju9hGuQAj3vFIF
   A2H7N5AwmAgHCVKYsHjrNFRq0Sq/2JvBWUhQ4UkTptnsc6MnitRUxwE6y
   OaoV8ubtcv0eEXuT2i9z+jk0v1mF5LmJiflRvQkQN8ysxrFWfF/FJ4i5j
   Ht8WW9N3mGPR1uV1RjlTO7RvhTBADvy9DuPcdTjoi2HxMrJjBprCj3FQD
   R54d6JMM7dZLQvv1ONgX3kZTY656pXxCVJdWEG17l3ZawmSOLqlEAZqzW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="386297469"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="386297469"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 20:05:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="3118235"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Nov 2023 20:05:02 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzTRc-0004xG-0w;
	Sun, 05 Nov 2023 03:05:00 +0000
Date: Sun, 5 Nov 2023 11:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/030-misc 22/28] error: Found argument
 '--blocklist-type' which wasn't expected, or isn't valid in this context
Message-ID: <202311051048.pq3VFzOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hector,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   9ea48c06ea6fdc6ef16dcde5cf9579f6535df4c3
commit: 2dc7e1e94502d46de601eee15011c47b19883df8 [22/28] rust: Fix for new =
bindgen
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231=
105/202311051048.pq3VFzOs-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8d=
fdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20231105/202311051048.pq3VFzOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051048.pq3VFzOs-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> error: Found argument '--blocklist-type' which wasn't expected, or isn't=
 valid in this context
   Did you mean =1B[32m--=1B[0m=1B[32mblacklist-type=1B[0m?

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
