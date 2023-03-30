Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A852586
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 13:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680182256; x=1711718256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gjXiSFbLHj6Onw1h54YESVIc7/ZyAzNL297RfS9q8SQ=;
  b=Nw6NaDBZtF7unuDxkWXIQlVZaekV4jb6nCvazsRpelzDa9xLUMRWWBiu
   xCuQTO9P7tmtYj2N17fkM5Gk+lyEyeIG7MdkE8ssgjQm2/UuUWhcLT72y
   WLV64mD+CivD5b4y9pHBEq0UDBcrFLEhxtEOKIQs5v4OL/jLo2QDEE5R3
   3IGoma25TKAf7yqVyNDzIvShnRF2clVXq3WrUbq9AHHLTraygGiYUyPJy
   /y647EgoJTAraSmUWDNEldczEQqabvSOXRYFfYdRjziAo8PG7tAi39quv
   wAPDhifX+o6/Kpk8ltkhPWxXIqbk3XOwd0GEyZcKd4ZyeopqeVLaJQKsN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="343621631"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="343621631"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 06:09:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="753989168"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="753989168"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 06:09:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phs2N-000Ksm-0F;
	Thu, 30 Mar 2023 13:09:55 +0000
Date: Thu, 30 Mar 2023 21:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.4.y 472/975] htmldocs:
 Documentation/filesystems/f2fs.rst: WARNING: document isn't included in any
 toctree
Message-ID: <202303302104.kvZwuRLL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chao,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.4.y
head:   493f9241a6b8df703431ca8204a1dba1ccc05256
commit: b1fdab742a6cb19912b542040c142c1ba6cb8e4d [472/975] f2fs: compress: support compress level
reproduce:
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common upstream-f2fs-stable-linux-5.4.y
        git checkout b1fdab742a6cb19912b542040c142c1ba6cb8e4d
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303302104.kvZwuRLL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/filesystems/f2fs.rst: WARNING: document isn't included in any toctree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
