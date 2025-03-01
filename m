Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B27E1C5F09
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 21:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740863666; cv=none; b=c2iuue+0nnVINsZN/StA+a7zjyH3anxG8w9IcYEflpiLtpZF0IZNxA3lGnyWYeUXYesACrDWC0eJiO3Y87LkOr6shbWCHRoIq8s7Ksn9FdHux+tEyat4HUZzgCAm/UiJZm1U1USQDJcz+zd+TRxyFvbOvbnFGY/CasnFInVkySM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740863666; c=relaxed/simple;
	bh=f92cvIhM2cgbHSNba5dGfF4NDKfU1HMUUiXMhp4RjYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlHSGrzhsyeiYSODyaQKxpaTzs91G+fFa46vWRtuN6sWqLbnGDkv2bYSYfxLXLKaeVMwDf30EzXiit82vgPcN28Iye2AnkNcmeq0hFtvbY7V7rh2Vwwfx1sOV3lf9i0NuM96mVfN6OVmqFIFo5EtoeiP31KseDr6HKubARKXYi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IUdyK4bl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IUdyK4bl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740863665; x=1772399665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f92cvIhM2cgbHSNba5dGfF4NDKfU1HMUUiXMhp4RjYM=;
  b=IUdyK4blVM4Z8iJiO9347ykBXV1J7D/h/iloS965zwOPfBdRNqTO3A6S
   SFyXJSJNK1L9xFHSBXhFMBOO2FWXCI54thX6XXflmlczYEknDYLtNZoFQ
   EA3JcWa53J2PVM2R6aHJXlsP+o0g046mQO3QMvoGNrPdbretvfd8hg/yH
   nCeqjGXTdo0FVa/5b7J4ZKgQv4fITqUG+mblm3QBsRam7XyOUUEc4xlWa
   YnFudyM0lRcfmTU5UeRXj0l5qohAHbgCqbwLLJavJmQIsC/oxGgfMkRwW
   5XVAeNU7N9Fo9RHVOCwLGJCqoSvaTofghukEAYWHsO1Etb4VLJN29U95b
   Q==;
X-CSE-ConnectionGUID: /Oi2fZ5iRH6lRVnseGRKig==
X-CSE-MsgGUID: fAGO001dSZeiLx/6D1v3kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="52755901"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="52755901"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 13:14:24 -0800
X-CSE-ConnectionGUID: eJFlyGa5QaCpKBtF3h+RCw==
X-CSE-MsgGUID: 9WstY6oRSz22Qe6VZXdUVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="148449841"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Mar 2025 13:14:23 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toUA8-000GiY-1u;
	Sat, 01 Mar 2025 21:14:20 +0000
Date: Sun, 2 Mar 2025 05:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 1/2] rbd: convert timeouts to secs_to_jiffies()
Message-ID: <202503020539.Xvl1yz5v-lkp@intel.com>
References: <20250301-converge-secs-to-jiffies-part-two-v4-1-c9226df9e4ed@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301-converge-secs-to-jiffies-part-two-v4-1-c9226df9e4ed@linux.microsoft.com>

Hi Easwar,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0226d0ce98a477937ed295fb7df4cc30b46fc304]

url:    https://github.com/intel-lab-lkp/linux/commits/Easwar-Hariharan/rbd-convert-timeouts-to-secs_to_jiffies/20250301-122529
base:   0226d0ce98a477937ed295fb7df4cc30b46fc304
patch link:    https://lore.kernel.org/r/20250301-converge-secs-to-jiffies-part-two-v4-1-c9226df9e4ed%40linux.microsoft.com
patch subject: [PATCH v4 1/2] rbd: convert timeouts to secs_to_jiffies()
config: i386-buildonly-randconfig-004-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020539.Xvl1yz5v-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020539.Xvl1yz5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020539.Xvl1yz5v-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/block/rbd.c: In function 'rbd_parse_param':
>> drivers/block/rbd.c:6286:28: error: 'struct fs_parse_result' has no member named 'uint32'; did you mean 'uint_32'?
    6286 |                 if (result.uint32 > INT_MAX / HZ)
         |                            ^~~~~~
         |                            uint_32


vim +6286 drivers/block/rbd.c

  6249	
  6250	static int rbd_parse_param(struct fs_parameter *param,
  6251				    struct rbd_parse_opts_ctx *pctx)
  6252	{
  6253		struct rbd_options *opt = pctx->opts;
  6254		struct fs_parse_result result;
  6255		struct p_log log = {.prefix = "rbd"};
  6256		int token, ret;
  6257	
  6258		ret = ceph_parse_param(param, pctx->copts, NULL);
  6259		if (ret != -ENOPARAM)
  6260			return ret;
  6261	
  6262		token = __fs_parse(&log, rbd_parameters, param, &result);
  6263		dout("%s fs_parse '%s' token %d\n", __func__, param->key, token);
  6264		if (token < 0) {
  6265			if (token == -ENOPARAM)
  6266				return inval_plog(&log, "Unknown parameter '%s'",
  6267						  param->key);
  6268			return token;
  6269		}
  6270	
  6271		switch (token) {
  6272		case Opt_queue_depth:
  6273			if (result.uint_32 < 1)
  6274				goto out_of_range;
  6275			opt->queue_depth = result.uint_32;
  6276			break;
  6277		case Opt_alloc_size:
  6278			if (result.uint_32 < SECTOR_SIZE)
  6279				goto out_of_range;
  6280			if (!is_power_of_2(result.uint_32))
  6281				return inval_plog(&log, "alloc_size must be a power of 2");
  6282			opt->alloc_size = result.uint_32;
  6283			break;
  6284		case Opt_lock_timeout:
  6285			/* 0 is "wait forever" (i.e. infinite timeout) */
> 6286			if (result.uint32 > INT_MAX / HZ)
  6287				goto out_of_range;
  6288			opt->lock_timeout = secs_to_jiffies(result.uint_32);
  6289			break;
  6290		case Opt_pool_ns:
  6291			kfree(pctx->spec->pool_ns);
  6292			pctx->spec->pool_ns = param->string;
  6293			param->string = NULL;
  6294			break;
  6295		case Opt_compression_hint:
  6296			switch (result.uint_32) {
  6297			case Opt_compression_hint_none:
  6298				opt->alloc_hint_flags &=
  6299				    ~(CEPH_OSD_ALLOC_HINT_FLAG_COMPRESSIBLE |
  6300				      CEPH_OSD_ALLOC_HINT_FLAG_INCOMPRESSIBLE);
  6301				break;
  6302			case Opt_compression_hint_compressible:
  6303				opt->alloc_hint_flags |=
  6304				    CEPH_OSD_ALLOC_HINT_FLAG_COMPRESSIBLE;
  6305				opt->alloc_hint_flags &=
  6306				    ~CEPH_OSD_ALLOC_HINT_FLAG_INCOMPRESSIBLE;
  6307				break;
  6308			case Opt_compression_hint_incompressible:
  6309				opt->alloc_hint_flags |=
  6310				    CEPH_OSD_ALLOC_HINT_FLAG_INCOMPRESSIBLE;
  6311				opt->alloc_hint_flags &=
  6312				    ~CEPH_OSD_ALLOC_HINT_FLAG_COMPRESSIBLE;
  6313				break;
  6314			default:
  6315				BUG();
  6316			}
  6317			break;
  6318		case Opt_read_only:
  6319			opt->read_only = true;
  6320			break;
  6321		case Opt_read_write:
  6322			opt->read_only = false;
  6323			break;
  6324		case Opt_lock_on_read:
  6325			opt->lock_on_read = true;
  6326			break;
  6327		case Opt_exclusive:
  6328			opt->exclusive = true;
  6329			break;
  6330		case Opt_notrim:
  6331			opt->trim = false;
  6332			break;
  6333		default:
  6334			BUG();
  6335		}
  6336	
  6337		return 0;
  6338	
  6339	out_of_range:
  6340		return inval_plog(&log, "%s out of range", param->key);
  6341	}
  6342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
