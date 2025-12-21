Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7B027CB04
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 15:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766330670; cv=none; b=ZeXS+eCRcT9TJliA2QpWWpHlcsci6SxSnAcCHuJMFaRMeCFAxhRRM7DzyTA6mMyxsizCv9resFkaaN5HcGGEpsSLJPoum0vpVdygaGO15Vpzvy/tEahuANuiQJJicNdviTt1potq6QoMgyXO0jKso4eqrkoGTyMYZtUV9AJg7yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766330670; c=relaxed/simple;
	bh=UPW61B3GCwlD6pRjhVbIthd4zHwxGoWsmYq8SGqreEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQLyj2HvramYRBoE4h5wjKeteJEsc3ZmqE5denmUjeENizpr9CkvO9HwhIoc+P7zIKy/B9ThS2zutexp5fowQfVZ69sXgFMDijwoa4lfNsP1+eBZLo4BlSSgLhcCtw7XxFEYfTJjBQX/5aOMgd1RUKB9P75g3nGnMBhIeRvrR+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN2pnvg4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN2pnvg4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766330668; x=1797866668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UPW61B3GCwlD6pRjhVbIthd4zHwxGoWsmYq8SGqreEM=;
  b=iN2pnvg4A/SRMp6kiENZU7YXEuaKOp7riQwZ4dRgsE9E3Hp3X8fOifNt
   piOWGNiguNKtz4pQmle7na8yiXSi1svbELaLwGOpsmZ9GJW2pOUxUA7bO
   3VFTX4O794VDwvu4ZySy2XpI6ektmEN057Mu/rlUDEJOvx3FHAoqUQNe+
   8m3yWai5uwvBPEnoz8+XTTsPWxksS6xm/PUsBBpSkwhPrX1pXAhPK0hq9
   bBxp4d1ohEY7RMDazc91cSnCbxqDTvRHhsRA4oJiL7Tim2LQLpp41ukWL
   57cwv/JZY/HiuKQ/+Bcgr5P0wqTJ8CK/bF8IYKKDVGFY0wxQBDSsc8//b
   g==;
X-CSE-ConnectionGUID: AT3ywAT1Qsu5zY1V2dIvTA==
X-CSE-MsgGUID: vnqzkSCMTdWT2opNde2BIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68090343"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68090343"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:24:27 -0800
X-CSE-ConnectionGUID: 1QXVgw98R16pKnFnskNSOQ==
X-CSE-MsgGUID: A4+GiOkUQ6ijLCK6CX4WFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199070358"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Dec 2025 07:24:24 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLIE-000000005mn-0efw;
	Sun, 21 Dec 2025 15:24:22 +0000
Date: Sun, 21 Dec 2025 23:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: mm/hugetlb_cgroup.c:829:44: warning: '%s' directive output may be
 truncated writing up to 1623 bytes into a region of size between 32 and 63
Message-ID: <202512212332.9lFRbgdS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xiu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9094662f6707d1d4b53d18baba459604e8bb0783
commit: 47179fe03588caa13a9bae642b058901709ddc55 mm/hugetlb_cgroup: prepare cftypes based on template
date:   1 year, 6 months ago
config: s390-randconfig-001-20251220 (https://download.01.org/0day-ci/archive/20251221/202512212332.9lFRbgdS-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512212332.9lFRbgdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512212332.9lFRbgdS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/hugetlb_cgroup.c: In function 'hugetlb_cgroup_file_init':
>> mm/hugetlb_cgroup.c:829:44: warning: '%s' directive output may be truncated writing up to 1623 bytes into a region of size between 32 and 63 [-Wformat-truncation=]
     829 |   snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
         |                                            ^~
   mm/hugetlb_cgroup.c:829:3: note: 'snprintf' output between 2 and 1656 bytes into a destination of size 64
     829 |   snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb_cgroup.c:829:44: warning: '%s' directive output may be truncated writing up to 2087 bytes into a region of size between 32 and 63 [-Wformat-truncation=]
     829 |   snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
         |                                            ^~
   mm/hugetlb_cgroup.c:829:3: note: 'snprintf' output between 2 and 2120 bytes into a destination of size 64
     829 |   snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +829 mm/hugetlb_cgroup.c

   815	
   816	static void __init
   817	hugetlb_cgroup_cfttypes_init(struct hstate *h, struct cftype *cft,
   818				     struct cftype *tmpl, int tmpl_size)
   819	{
   820		char buf[32];
   821		int i, idx = hstate_index(h);
   822	
   823		/* format the size */
   824		mem_fmt(buf, sizeof(buf), huge_page_size(h));
   825	
   826		for (i = 0; i < tmpl_size; cft++, tmpl++, i++) {
   827			*cft = *tmpl;
   828			/* rebuild the name */
 > 829			snprintf(cft->name, MAX_CFTYPE_NAME, "%s.%s", buf, tmpl->name);
   830			/* rebuild the private */
   831			cft->private = MEMFILE_PRIVATE(idx, tmpl->private);
   832			/* rebuild the file_offset */
   833			if (tmpl->file_offset) {
   834				unsigned int offset = tmpl->file_offset;
   835	
   836				cft->file_offset = MEMFILE_OFFSET0(offset) +
   837						   MEMFILE_FIELD_SIZE(offset) * idx;
   838			}
   839	
   840			lockdep_register_key(&cft->lockdep_key);
   841		}
   842	}
   843	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
