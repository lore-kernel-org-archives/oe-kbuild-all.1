Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956B8EA6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 02:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtkeXHXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698029068; x=1729565068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HuwvtB7F55bafq5jamX4D2Pola9+EXOFFvR1ZVYonIs=;
  b=GtkeXHXIJjIGqnG0Ku8dlbrfKdVz/cBhYwpwRgmFF9S4LdN3VzPqYRJG
   tXBdbMN+F3JpcPj3PHm/Wigtmm74qoeWkVyRUApZ0EY8Qo98s7lwJi6vx
   8lAdpucX4SD8xMf4AGyiSicJJImHekdpGa6OweIQwbCeNOEhBUHykVofI
   vICLd4PMui0OMEhuOuAMr/iQqWXPliSUF8yv5FgyCxTpbWNf5+BR+QFWy
   FojWDSBbridEYukZp1mPYn4jMir1o4u3pnatYdQW1YglUmeP/ZHRMC/SJ
   7FRjW0GM5weVCEW/iTyfs3iHt0VELueDsr/iBU+IfYloAFM0YbMpxDAsk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="366980925"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="366980925"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 19:44:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="823828569"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="823828569"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Oct 2023 19:44:26 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qukvY-0006Ur-06;
	Mon, 23 Oct 2023 02:44:24 +0000
Date: Mon, 23 Oct 2023 10:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Baokun Li <libaokun1@huawei.com>, linux-ext4@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/4] ext4: avoid online resizing failures due to
 oversized flex bg
Message-ID: <202310231046.Ctx3aydr-lkp@intel.com>
References: <20231023013057.2117948-4-libaokun1@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023013057.2117948-4-libaokun1@huawei.com>

Hi Baokun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baokun-Li/ext4-unify-the-type-of-flexbg_size-to-unsigned-int/20231023-092711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20231023013057.2117948-4-libaokun1%40huawei.com
patch subject: [PATCH v2 3/4] ext4: avoid online resizing failures due to oversized flex bg
reproduce: (https://download.01.org/0day-ci/archive/20231023/202310231046.Ctx3aydr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310231046.Ctx3aydr-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments use * on subsequent lines
#60: FILE: fs/ext4/resize.c:222:
+	ext4_group_t resize_bg;			/* number of allocated
+						   new_group_data */

WARNING:BLOCK_COMMENT_STYLE: Block comments use a trailing */ on a separate line
#60: FILE: fs/ext4/resize.c:222:
+						   new_group_data */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
