Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EA323D2B4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 12:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396771; cv=none; b=GDrxm6IDXFZvrGZn8O3l+JczIPNEPvJLgnXFaJqS2b6AMnN8Rpf6hgslD2DyjdS+jlzPedn2FW1CvWA0kMv9VQzPNS5zLUvsRUkloDSuAwrFS5K9lE82Vi5wYJ70sPic/rTtM/XWDQ3RIzyei+5O0y0v7vnZ/58hf5DYniMSYj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396771; c=relaxed/simple;
	bh=qK6sIpoqYxSQQeNSAOHH8aYuvztJD7UBs+VKbjytFPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nAOkpRMfxs/Pn8VMKTfjsxae6gtTNzmAsuVzadGwYtzKF3SB5NqGdElZT1KmvnTeCR1CenKoofDdkCZqZa62TdDbqZxyOAlh+96HXWUG8OXrdkMFoD3nTpirbfNppcT73gp9WftFxJIW1zYFQsB451tICgWZtvQisl504afSXwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJLN+die; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJLN+die"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754396770; x=1785932770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qK6sIpoqYxSQQeNSAOHH8aYuvztJD7UBs+VKbjytFPM=;
  b=ZJLN+died8c81JRSNiu9anp1KGkA2X1IYOrTw4aA7wxS5nVHtndpDfi5
   PLTKMqYhRoxbmt6lL4DL6eddnkiXLxLC2lmgzlKZUAQUj7kaOm4OnehCJ
   u2xdw9rsDy5zswgHOtpB8syCv5O0E5VGgkH1s6CKUHLIlklVx2D3yakxV
   di3uRylgsjGz4479QdsDkEA2VCiGN6Nq1A54HDbJWIT80Y+GyqCaHFRu8
   HRDq1BQ2t3qcAzS0FYRlUWNKyZfz+gqAPZR0BWeBqJEM7OMtBQGCXv4Ml
   ot2j+Pgpr/lTEM/y0nDAYWnjDpLbh9HHyk3WjMAdwWC1+Jf+q8Xex29uq
   w==;
X-CSE-ConnectionGUID: AOhwfE1gRFmZJL9UONSMBg==
X-CSE-MsgGUID: 0ETgz4YnSfS7rXK47Nh9Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="82135923"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="82135923"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 05:26:09 -0700
X-CSE-ConnectionGUID: ozUpIHgfSsGpbIscavdsnA==
X-CSE-MsgGUID: v9W+G4utSKGR3MQwKoZrUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="164798399"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Aug 2025 05:26:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujGjz-0000ak-25;
	Tue, 05 Aug 2025 12:26:04 +0000
Date: Tue, 5 Aug 2025 20:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 26/26] fs/nfsd/nfs4state.c:1054:28: warning:
 'nfsd_refstr_from_qstr' defined but not used
Message-ID: <202508052056.IlwSPofB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   4e05ff4e8e6879032361c40f33178eee80d85dfe
commit: 4e05ff4e8e6879032361c40f33178eee80d85dfe [26/26] nfsd: add data structures for handling CB_NOTIFY to directory delegation
config: i386-buildonly-randconfig-005-20250805 (https://download.01.org/0day-ci/archive/20250805/202508052056.IlwSPofB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508052056.IlwSPofB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508052056.IlwSPofB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/nfs4state.c:1054:28: warning: 'nfsd_refstr_from_qstr' defined but not used [-Wunused-function]
    1054 | static struct nfsd_refstr *nfsd_refstr_from_qstr(struct qstr *q)
         |                            ^~~~~~~~~~~~~~~~~~~~~


vim +/nfsd_refstr_from_qstr +1054 fs/nfsd/nfs4state.c

  1052	
  1053	
> 1054	static struct nfsd_refstr *nfsd_refstr_from_qstr(struct qstr *q)
  1055	{
  1056		struct nfsd_refstr *nr;
  1057	
  1058		nr = kmalloc(sizeof(*nr) + q->len + 1, GFP_KERNEL);
  1059		if (nr) {
  1060			memcpy(&nr->nr_str, q->name, q->len);
  1061			nr->nr_str[q->len + 1] = '\0';
  1062		}
  1063		return nr;
  1064	}
  1065	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
