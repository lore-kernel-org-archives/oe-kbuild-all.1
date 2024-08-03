Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51321CF9A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Aug 2024 20:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722716672; cv=none; b=dQMCuDE90aF8w3Y4S19EcOH6SLYjS+ArZh2OBb/oc1fB6f7v/+cJc60NAyBJVI4LQw9yIwbTP+tXMPCQIpWuQO4kZD2B9pIKdKmeTiFSDdI7Vhn68mMugLzYfhIlppjFw3Q7N41c1uq7VODWlS6spU0f/hqJMLjWfil7ZQXFKMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722716672; c=relaxed/simple;
	bh=9cweCagXAOymV8Ca+jd8nWyAdZ6qxqaVfd64iLOrp6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TveeOKqu0lPB6dBYVgjc439NI4LUStvMYKdAukiwwtRkQIY9BeObPhRMk3lG9aEQ9Qr76uxmm/3p7gmNZYrexyu3gI+X9H5H6PqzF5nCGB80U1dTNyJsxZTFFTFvdDJQH59ivKkRQ5xS/apXyEwi6YDaibqvCDBz4zUZR6XJ0EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bN0UWEM+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bN0UWEM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722716670; x=1754252670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9cweCagXAOymV8Ca+jd8nWyAdZ6qxqaVfd64iLOrp6c=;
  b=bN0UWEM+E0CNWw6V7X2MyMJ660qK3//db2Ou7plYLxMBKkC7OnzPAIrc
   3Wu8KFwXlUbMnLwSQsa6Vxyq65lbs9xS72BBJVQfGdHc6peywAG8REkVn
   swx+gcioA31YACLviCZFkBjuwrin9wxdLdQOkQ1vC4AGCHjJrl/bmSXan
   CIClziKl5YLPP/1sHTrHYosLeR/FNOiWr24zoTm08V76jXatLVBECevVI
   Fs1ExZ/e4JtqccX0aUDLI+PYCXOJP5/lrRT7ansOQk8yStGFrDnHW2mCS
   Cv5+OAFNSfUDF7NNcg/ihD3CTR5C5HrH8dtvTPY4lo5WdvIwjWi0cMofS
   Q==;
X-CSE-ConnectionGUID: eWu/gCxtTn61c205o8yPyA==
X-CSE-MsgGUID: 4bHxc0j1SNiMvj8E/eGlWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="24506686"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="24506686"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 13:24:29 -0700
X-CSE-ConnectionGUID: Or/h+5WYTySNeFE2K/jDqw==
X-CSE-MsgGUID: gaGeeocNQuila982L8zBtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="79038445"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Aug 2024 13:24:28 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saLIf-0000tS-31;
	Sat, 03 Aug 2024 20:24:25 +0000
Date: Sun, 4 Aug 2024 04:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hongzhen Luo <hongzhen@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v2 1/2] erofs: introduce page cache share feature
Message-ID: <202408040441.qhZ5cZiv-lkp@intel.com>
References: <20240731080704.678259-2-hongzhen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731080704.678259-2-hongzhen@linux.alibaba.com>

Hi Hongzhen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongzhen-Luo/erofs-introduce-page-cache-share-feature/20240802-014238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20240731080704.678259-2-hongzhen%40linux.alibaba.com
patch subject: [PATCH RFC v2 1/2] erofs: introduce page cache share feature
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240804/202408040441.qhZ5cZiv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040441.qhZ5cZiv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040441.qhZ5cZiv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/erofs/pagecache_share.c: In function 'erofs_pcs_fill_inode':
>> fs/erofs/pagecache_share.c:39:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
      39 | }
         | ^


vim +39 fs/erofs/pagecache_share.c

    22	
    23	void erofs_pcs_fill_inode(struct inode *inode)
    24	{
    25		struct erofs_inode *vi = EROFS_I(inode);
    26		char fprt[PCS_FPRT_MAXLEN];
    27	
    28		vi->fprt_len = erofs_getxattr(inode, PCS_FPRT_IDX, PCS_FPRT_NAME, fprt,
    29					      PCS_FPRT_MAXLEN);
    30		if (vi->fprt_len > 0 && vi->fprt_len <= PCS_FPRT_MAXLEN) {
    31			vi->fprt = kmalloc(vi->fprt_len, GFP_KERNEL);
    32			if (IS_ERR(vi->fprt)) {
    33				vi->fprt_len = -1;
    34				return;
    35			}
    36			memcpy(vi->fprt, fprt, vi->fprt_len);
    37			vi->fprt_hash = xxh32(vi->fprt, vi->fprt_len, 0);
    38		}
  > 39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
