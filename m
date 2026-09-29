Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A050306768
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 14:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790691313; cv=none; b=SZ4t1NL67Of7zaLYJAXhK82gqWXhnSeMeUdq/unCuspZBCg9IjqilnF8gO8pm4Yp2UxGgOJc+QgF9/PCrcwdIY9kPuXNQvFH4PXq2TPNfd7xGi9+5Xny2luxJTBaK/QXMTJMOzJnlkjc1BwA4MBiI23me+5iFSz7YocsmW6RkLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790691313; c=relaxed/simple;
	bh=Tt8x7HmCkTdQitkc4pgJLswQGBTe6bUu83ijQT/xkys=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mDLV7MT1yLr5mwdAxuTocSM+nwZDxTY0YdtIVq3U6RXa7JASL2womJEYLL8S7K82qn5zjtEgoJD98XgbK0xqtXwf3I9IW22mbbg83UnObfENpietvxdUu3fN5mcVmx2RZ1iH6CK+j9JQDMblUYqWlX8Ugalc8RKQutVoL6jx+qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GmXEfKbx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmXEfKbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790691311; x=1822227311;
  h=date:from:to:cc:subject:message-id;
  bh=Tt8x7HmCkTdQitkc4pgJLswQGBTe6bUu83ijQT/xkys=;
  b=GmXEfKbxPLt+s8Xb2fiXJSkZvdXbPl5aai9xD3XntrZ8jcnZ3ut9ZheW
   enj8RAuSypwVGUByy30OmkOP/oHO2VqeJPvjNrAMQK79KzlAataQbbLbx
   0Kt33exp9EPLysbQBySyl2xIkBi8Qhi1JAMBFJkUW/KIq3OCLSejfk3Nq
   I7cKM6Lshiy9BvrUsGwhc+jNf0qRLT9on1Wy1ls4QHy05IB18ufXkIzGW
   6/2wBCxtYsE+uDu1ZDJOwMrYV1SiUDaOlJKk/kEYNv0fGlgbuiu5ogg1q
   dIXGhhc6HRFtIHWCCjIY2tW5HheCgaudS/6DSFr4iCGHh31Ul1xrRfcID
   w==;
X-CSE-ConnectionGUID: 7eC25CJ+QgqBB+90YyckBw==
X-CSE-MsgGUID: wnpa0LTiT2u2OVcntEqRMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90453496"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90453496"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 07:15:10 -0700
X-CSE-ConnectionGUID: Y+tEBZ+xQVKyVDILG7UNTQ==
X-CSE-MsgGUID: DPXhdd1PTqqdlDlLoqtLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="273986098"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2026 07:15:07 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBYbo-000000001RH-3oqt;
	Tue, 29 Sep 2026 14:15:04 +0000
Date: Tue, 29 Sep 2026 16:14:56 +0200
From: kernel test robot <lkp@intel.com>
To: Alex Markuze <amarkuze@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [linux-review:Alex-Markuze/ceph-add-BLOG-private-headers/20260924-153031
 2/14] checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align
 the * on each line
Message-ID: <202609291605.N2rqHYI0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Markuze/ceph-add-BLOG-private-headers/20260924-153031
head:   17d943530fa3cd6c580a77e01a46b9eb59efa59e
commit: 18e34c1ac72f6c97971ad6686d7fa7a30728e817 [2/14] ceph: add BLOG deserialization support
reproduce: (https://download.01.org/0day-ci/archive/20260929/202609291605.N2rqHYI0-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#318: FILE: fs/ceph/blog_des.c:297:
+			 * Skip kernel %p sub-specifiers (U, I, d, D, etc.).
+				 * boutc does not support %p extensions; call sites

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#319: FILE: fs/ceph/blog_des.c:298:
+				 * boutc does not support %p extensions; call sites
+			 * must pre-format them with snprintf and pass %s.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
