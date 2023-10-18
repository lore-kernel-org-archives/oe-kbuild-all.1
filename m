Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE7E335B5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mgN3Hcw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697633031; x=1729169031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qr4SY4Sa9mxMDuz7UiKaIVDbx2D9O+OL+PE1Uss92mo=;
  b=mgN3Hcw6ZghuGr71aS860SU7VMt55LYBIFue8+chTQW0/nmp+izcZJ6K
   uR4d/1SsU2zbR3baUber4NL6V0XpA++ll85JmVuR8gU8D23jGKBKJNyR6
   /QQ/pdVrM/nJVh7oi49H+rVtG6J2YI+mWJjNKOhXW1ogRuLg7OXQSwkxx
   lD8Cm5JnWAe74IhP1cx5b1nXRn/wte0kooAw2CL+atPXXYDJhgoNAajkF
   XeGngLX60cJbbDGlRAYUdDcHOlVhh9FAW0SYoHitlyEdMk3USi6FuDf8F
   SL5POWM9APxFuY8xG4aQNGkG7biida+6OOFom+c9bk/zvDQKBx7sJthaT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366262168"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="366262168"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 05:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="822425793"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="822425793"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Oct 2023 05:43:47 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt5tp-0000Mm-2N;
	Wed, 18 Oct 2023 12:43:45 +0000
Date: Wed, 18 Oct 2023 20:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:exportfs_encode_fid 1/5] checkpatch: WARNING: Possible
 repeated word: 'the'
Message-ID: <202310182040.kbWXikKH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux exportfs_encode_fid
head:   2b6115cf3826b929cad609ea8921eed15214763d
commit: ce820ad825a6bd1e81226ea337edc42c408f1383 [1/5] fanotify: limit reporting of event with non-decodeable file handles
reproduce: (https://download.01.org/0day-ci/archive/20231018/202310182040.kbWXikKH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310182040.kbWXikKH-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#50: FILE: fs/notify/fanotify/fanotify_user.c:1594:
+	 * We need to make sure that the the filesystem supports encoding of

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
