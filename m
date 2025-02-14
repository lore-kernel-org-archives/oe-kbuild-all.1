Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74D1714D0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 05:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739510722; cv=none; b=X76UPk7nx/0hawKYoZ0Ysc1WOExRvikfmsWH4v3rKSUX/AoQPErAr1U2aGcavtVnnUn0SkEEVhsA8sSxHCerGU8lXGfDPiKNjB47apK4/Ceykw8CcgIzju3kqbNgWn/NkKbHjCUJDiFg8VO7aOqS8h1ubiK9rNKsNvy36WQ2LU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739510722; c=relaxed/simple;
	bh=BloUHm0QbZUJqUfdecSvQYh1ZwR6YrbMAWPISwQucuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7PDFBCS4x3kOBgtHTfBVXhD4DbkfdPFS69YVZ43+0oUirWb1QnKzoDiclKnGe5IdUCJxnD7R69C/Jx3Ze/Q/U8AxbcxsBYwBO/g1sNY7xVNx+da7HSHAgXfMz+P2y/ASLc0acESI5BF4hDJ3Bq1Cq0n5b46+fgRBDWjiEpXblA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUnFZ734; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUnFZ734"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739510721; x=1771046721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BloUHm0QbZUJqUfdecSvQYh1ZwR6YrbMAWPISwQucuk=;
  b=eUnFZ734FjTqoB/agOfCuU/qECmuY0fvwFYzwwwzERNxzALsCTV05aoU
   /K/m4t9+93hfFCZQVuxh8L5jtLR2shpfe/GJ2gj5P3iOyn4rBFwRXw63/
   XRl6NThPQJvlqJ7WBMaDAamyMmU/sv1mm+oF9PHp4b3y5YADKVHYAmP7g
   iUgiDH+HL6yhDS/Ts4ItrQRTI2+bNtISmdZuUrktH0VixPsq/Q9YZbfmh
   L98LIY2buf2IsiJpMIYUewXlAjcWPgNg2n8ebMKN+D4qY30dJefWCc51g
   WC/nhgERQZ8B8IKRvcjI/rMpUIRYwYTa+DutRE9o75gLhUoPMlU83xC6C
   Q==;
X-CSE-ConnectionGUID: kX+6q94TTwK3vfNC35V89g==
X-CSE-MsgGUID: N9MLDyHTQHieHofrR12xbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40365239"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40365239"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 21:25:20 -0800
X-CSE-ConnectionGUID: KvF9yRMlTd26yQ0EpUktIQ==
X-CSE-MsgGUID: 1qnzig6uRhOFD6NmDEmn4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117498479"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2025 21:25:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tioCS-00196S-2b;
	Fri, 14 Feb 2025 05:25:16 +0000
Date: Fri, 14 Feb 2025 13:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [djiang:cxl/fwctl 20/25] ./usr/include/fwctl/cxl.h:33:50: error:
 field 'get_sup_feats_in' has incomplete type
Message-ID: <202502141305.1Yu7eCCE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   368060188b78ad57197303bbffb78081837a7481
commit: 43f78e702825a9d67bd762d83e72d7eec9b7f34e [20/25] cxl: Add support for fwctl RPC command to enable CXL feature commands
config: i386-buildonly-randconfig-002-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141305.1Yu7eCCE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141305.1Yu7eCCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141305.1Yu7eCCE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/fwctl/cxl.h:33:50: error: field 'get_sup_feats_in' has incomplete type
      33 |                 struct cxl_mbox_get_sup_feats_in get_sup_feats_in;
         |                                                  ^~~~~~~~~~~~~~~~
>> ./usr/include/fwctl/cxl.h:50:51: error: field 'get_feats_out' has incomplete type
      50 |                 struct cxl_mbox_get_sup_feats_out get_feats_out;
         |                                                   ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
